package cn.oj.csc.core;
import java.io.*;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;

public class CompileAndRunCPP {

    private static final String WORK_DIR = "E://File//";
    //编译后产生的 exe
    private static final String COMPILE = WORK_DIR + "Solution";
    private static final String GCCPATH =  "E:\\Tool\\MinGW64\\winlibs-x86_64-posix-seh-gcc-12.0.1-snapshot20220123-mingw-w64-9.0.0-r1\\mingw64\\bin\\g++";
    //要编译的 cpp
    private static final String CODE = WORK_DIR + "Solution.cpp";
    //要编译的 exe
    private static final String EXE = WORK_DIR + "Solution.exe";

    public static void main(String[] args) throws IOException, InterruptedException {

        String compileCmd = "%s -o %s %s";
        // 编译 C++ 程序
        String compileFormat = String.format(compileCmd, GCCPATH, COMPILE, CODE);
        Process compileProcess = Runtime.getRuntime().exec(compileFormat);
        compileProcess.waitFor();


        // 运行可执行文件
        String runFormat = String.format(EXE);
        //String[] args = {"1","2"};
        Process runProcess = Runtime.getRuntime().exec("E:\\File\\Solution.exe");

        // 程序的输入
//        //往外部程序输入，感觉怎么名字刚好倒过来了，getOutputStream()
//        BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(runProcess.getOutputStream()));
//
//        String fileName = " E://File//input.txt";
//        //将文件名传给外部程序
//        //“\n”是回车
//        writer.write(fileName + "\n");
//        //这句也很重要，推给外部程序
//        writer.flush();

        // 读取程序的输出
        BufferedReader reader = new BufferedReader(new InputStreamReader(runProcess.getInputStream()));
        String line;
        while ((line = reader.readLine()) != null) {
            System.out.println(line);
        }
        // 检查程序是否正常退出
        int exitCode = runProcess.waitFor();
        System.out.println(exitCode);
        if (exitCode != 0) {
            System.err.println("程序可能出现了问题！");
        }
    }

}