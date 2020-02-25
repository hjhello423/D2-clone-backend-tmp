package com.clonestudy.d2clone;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class D2CloneApplication {

    public static void main(String[] args) {
        SpringApplication app = new SpringApplication(D2CloneApplication.class);
        app.run(args);
    }

}
