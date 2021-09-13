package com.majon.sns_copy;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication

public class SnsCopyApplication {

	public static void main(String[] args) {
		SpringApplication.run(SnsCopyApplication.class, args);
	}

}
