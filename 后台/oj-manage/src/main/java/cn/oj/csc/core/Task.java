package cn.oj.csc.core;


import cn.oj.common.utils.file.FileUtil;
import cn.oj.common.utils.spring.SpringUtils;
import cn.oj.csc.domain.Answer;
import cn.oj.csc.domain.UserAnswer;
import cn.oj.csc.service.IQuestionService;

import java.io.*;

//借助这个类来描述一次编译运行的过程

public class Task {
    private IQuestionService questionService = SpringUtils.getBean(IQuestionService.class);
    //编译运行过程中依赖了一些临时文件，需要约定一下这些临时文件的名字
    //所有文件都放在tmp中
    private static final String WORK_DIR = "E://File//";

    //要编译代码的类名
    private static final String CLASS = "Solution";

    //要编译代码对应的文件名，和类名一致
    private static final String CODE = WORK_DIR + "Solution.java";

    //标准输入
    //private static final String STDIN = WORK_DIR + "stdin.txt";
    private static String sdin =null;
    //标准输出
    private static String sdout =null;
    //标准输出对应的文件（被编译执行的代码的结果保存到这个文件中）
    private static final String STDOUT = WORK_DIR + "stdout.txt";

    //标准错误对应的文件（被编译执行的代码的结果保存到这个文件中）
    private static final String STDERR = WORK_DIR + "stderr.txt";

    //编译错误对应的文件（编译出错时的具体原因）
    private static final String COMPILE_ERROR = WORK_DIR + "compile_error.txt";


    public Answer compileAndRun(UserAnswer useranswer) throws IOException, InterruptedException {

        Answer answer = new Answer();

        //0. 先创建好存放临时文件的目录
        File workDir = new File(WORK_DIR);
        if (!workDir.exists()) {
            workDir.mkdirs();
        }
        //1. 根据Question对象构造需要的临时文件
        FileUtil.writeFile(CODE,useranswer.getCode()); //CODE是文件名
        // 根据题号获取该题的输入与输出
        // ...
        Long qid = useranswer.getQid();
        sdin = questionService.selectQuestionById(qid).getStandardInput();
        sdout = questionService.selectQuestionById(qid).getStandardOutput();
        //2.构造编译命令，并执行   javac -encoding utf8 ./tmp/Solution.java -d ./tmp/
        String cmd = String.format( "javac -encoding utf8 %s -d %s",CODE,WORK_DIR);
        System.out.println("编译命令" + cmd);
        Command.run(cmd,null,null,COMPILE_ERROR,null);//执行编译命令
        //判断编译是否出错，如果出错就不需要继续运行，如果COMPILE_ERROR文件为空表示编译顺利
        String conpileError = FileUtil.readFile(COMPILE_ERROR);
        if (!"".equals(conpileError)){
            System.out.println("编译出错");
            answer.setError(1);
            answer.setReason(conpileError);
            return answer;
        }

        //3.构造运行命令，并执行 java -classpath ./tmp/ Solution
        //为了能正确找到类对应的.class文件，需要指定加载路径，通过 -classpath 选项来指导
        cmd = String.format("java -classpath %s %s",WORK_DIR,CLASS);
        System.out.println("运行命令" + cmd);
        Command.RunAndStr(cmd,sdin,STDOUT,STDERR,sdout);//运行命令
        //判定运行是否出错，查看STDERR是否为空
        String stdErr = FileUtil.readFile(STDERR);
        if (!"".equals(stdErr)) {
            System.out.println("运行出错");
            answer.setError(2);
            answer.setReason(stdErr);
            return answer;
        }
        //4.将最终结构包装到Answer中
        answer.setError(0);
        answer.setStdout(FileUtil.readFile(STDOUT));
        return answer;
    }

    public static void main(String[] args) throws IOException, InterruptedException {
        UserAnswer useranswer = new UserAnswer();
        useranswer.setQid(1L);
        useranswer.setCode(
                "import java.io.*;\n" +
                        "import java.util.*;\n" +
                        "\n" +
                        "public class Main {\n" +
                        "    public static void main(String args[]) throws Exception {\n" +
                        "        Scanner cin=new Scanner(System.in);\n" +
                        "        var a = cin.nextInt();\n" +
                        "        var b = cin.nextInt();\n" +
                        "        System.out.println(a + b);\n" +
                        "    }\n" +
                        "}"
        );
        Task task = new Task();
        Answer answer = task.compileAndRun(useranswer);
        System.out.println(answer);
    }
}
