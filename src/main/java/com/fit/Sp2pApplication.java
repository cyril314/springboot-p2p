package com.fit;

import lombok.extern.slf4j.Slf4j;
import org.apache.logging.log4j.util.Strings;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;

import java.net.InetAddress;
import java.net.UnknownHostException;

@Slf4j
@SpringBootApplication
public class Sp2pApplication {

    public static void main(String[] args) throws UnknownHostException {
        ConfigurableApplicationContext run = SpringApplication.run(Sp2pApplication.class, args);
        String ip = InetAddress.getLocalHost().getHostAddress();
        String port = System.getenv("POST");
        if (Strings.isEmpty(port)) {
            port = run.getEnvironment().getProperty("server.port");
        }
        log.info("\n---------------------------------------------------------\n" +
                "Application SP2P is running! Access URLs:\n\t" +
                "Local: \t\thttp://localhost:{}/\n\tExternal:\t{}://{}:{}/" +
                "\n-----------------页面请部署 admin-web----------------------", port, "http", ip, port);
    }

}
