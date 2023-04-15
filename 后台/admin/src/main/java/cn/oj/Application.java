package cn.oj;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;

/**
 * 启动程序
 * 
 * @author zbz
 */
@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
@ComponentScan({ "cn.oj.*", "cn.oj.csc.*" })
@MapperScan(basePackages = "cn.oj.csc.**.mapper")
public class Application {
    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}
