package cn.oj.csc.core;

import cn.oj.common.utils.file.FileUtil;
import cn.oj.common.utils.file.FileUtils;
import cn.oj.csc.util.CompareUtil;

import java.io.*;

//让Java执行一个具体的指令如 ：javac
public class Command {
    public static int[] RunAndStr(String cmd,String stdinString,String stdoutFile,String stderrFile,String stdoutString) throws IOException, InterruptedException {
//            OutputStream stdinFrom = process.getOutputStream();
//            OutputStreamWriter stdinTo = new OutputStreamWriter(stdinFrom);
        String stinStr[] = stdinString.split("#");
        String stoutStr[] = stdoutString.split("#");
        int exitCode[]=new int[stinStr.length];
        for(int i=0;i<stinStr.length;i++){
            System.out.println(stinStr[i]);
            exitCode[i] = run(cmd,stinStr[i],stdoutFile,stderrFile,stoutStr[i].replace("\n","").replace("\r",""));
            if (exitCode[i] == -422)break;
            // 清空文件
//            FileUtils.clearFile(stderrFile);
        }
        return exitCode;
    }
    //cmd表示要执行的命令
    //stdoutFile 表示输出结果重定向到那个文件中,如果为null表示不需要重定向
    //stderrFile 表示标准错误结果重定向到哪个文件中
    public static int run(String cmd,String stdinString,String stdoutFile,String stderrFile,String stdoutString) throws IOException, InterruptedException {
        //1. 获取Runtime对象，它是一个单例对象
        Runtime runtime = Runtime.getRuntime();
        //2. 通过exec方法返回一个进程进行操作
        //相当于直接在命令行中执行cmd
        //该方法返回一个新的 Process 对象，用于管理子流程
        Process process = runtime.exec(cmd);
        if(stdinString!=null){
            OutputStream stdinFrom = process.getOutputStream();
            OutputStreamWriter stdinTo = new OutputStreamWriter(stdinFrom);
            stdinTo.write(stdinString);
            stdinTo.flush();
            stdinTo.close();
        }
        //4. 针对标准错误进行重定向
        if (stderrFile != null) {
            InputStream stderrFrom = process.getErrorStream();
            OutputStream stderrTo = new FileOutputStream(stderrFile);
            int ch = -1;
            while ((ch = stderrFrom.read()) != -1) {
                stderrTo.write(ch);
            }
            stderrFrom.close();
            stderrTo.close();
        }
        //3. 针对标准输出重定向

        if(stdoutFile!=null)
        {
            //获取到进程标准输出结果
            InputStream stdoutFrom = process.getInputStream();//此方法返回连接到子流程的正常输出的输入流。
            OutputStream stdoutTo = new FileOutputStream(stdoutFile,true);
            int ch = -1;
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(stdoutFrom));
            String userAnswer = "";
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                userAnswer += line;

            }
            FileUtils.writeFileStr(stdoutFile,userAnswer);
            stdoutFrom.close();
            stdoutTo.close();
            bufferedReader.close();
            System.out.println(userAnswer);
            System.out.println(stdoutString);
            boolean isRight = CompareUtil.Compare(userAnswer, stdoutString);
            if(!isRight){
                System.out.println("用例未完全通过");
                FileUtils.writeFileStr(stderrFile,"用例未完全通过");
                return -422;
            }
        }


        //5. 为了确保子进程先执行完，需要加上等待
        //父进程会在waitFor阻塞等待，直到子进程执行结束在执行
        int exitCode = process.waitFor();
        return exitCode;
    }

    public static void main(String[] args) throws IOException, InterruptedException {
       // run("javac","f:/stdoutFile","f:/stderrFile");
    }
}
