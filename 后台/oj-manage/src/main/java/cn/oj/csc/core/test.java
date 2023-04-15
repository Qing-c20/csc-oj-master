package cn.oj.csc.core;

import java.io.*;
import java.util.Map;

public class test {
    private static final String WORK_DIR = "E://File//";
    //编译后产生的 exe
    private static final String COMPILE = WORK_DIR + "Solution";
    private static final String GCCPATH =  "E:\\Tool\\MinGW64\\winlibs-x86_64-posix-seh-gcc-12.0.1-snapshot20220123-mingw-w64-9.0.0-r1\\mingw64\\bin\\g++";
    //要编译的 cpp
    private static final String CODE = WORK_DIR + "Solution.cpp";
    //要编译的 exe
    private static final String EXE = WORK_DIR + "Solution.exe";
    public static void main(String[] args) {
        try {
            // 创建ProcessBuilder并设置要执行的命令
            //g++ -DONLINE_JUDGE -O2 -w -fmax-errors=1 -std=c++14 {src_path} -lm -o {exe_path}
           // ProcessBuilder pb = new ProcessBuilder(GCCPATH, "-o", COMPILE, CODE);
            ProcessBuilder pb = new ProcessBuilder(GCCPATH," -w -fmax-errors=1 -std=c++14 {",CODE,"} -lm -o {",CODE,"}");
            // 设置工作目录
            pb.directory(new File(WORK_DIR));

            // 启动进程
            Process p = pb.start();

            // 获取进程的输出流和错误流
            BufferedReader stdout = new BufferedReader(new InputStreamReader(p.getInputStream()));
            BufferedReader stderr = new BufferedReader(new InputStreamReader(p.getErrorStream()));

            // 输出进程的输出信息
            String line = "";
            while ((line = stdout.readLine()) != null) {
                System.out.println(line);
            }

            // 如果进程返回非0状态码，则说明编译失败
            int exitValue = p.waitFor();
            if (exitValue != 0) {
                // 输出错误信息
                while ((line = stderr.readLine()) != null) {
                    System.err.println(line);
                }
                throw new Exception("Compile failed with error code " + exitValue);
            }

            // 执行程序
            pb = new ProcessBuilder(EXE);
            pb.directory(new File(WORK_DIR));
            p = pb.start();

            // 处理输出信息和错误信息
            stdout = new BufferedReader(new InputStreamReader(p.getInputStream()));
            stderr = new BufferedReader(new InputStreamReader(p.getErrorStream()));
            while ((line = stdout.readLine()) != null) {
                System.out.println(line);
            }
            while ((line = stderr.readLine()) != null) {
                System.err.println(line);
            }
            // 等待程序执行完毕
            exitValue = p.waitFor();
            if (exitValue != 0) {
                throw new Exception("Program exited with error code " + exitValue);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
