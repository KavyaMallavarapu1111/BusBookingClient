package com.techwave.busbookingclient;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.client.RestTemplate;

@SpringBootApplication
public class BusBookingClientApplication {

	public static void main(String[] args) {
		SpringApplication.run(BusBookingClientApplication.class, args);
	}	
	@Bean
	public RestTemplate restTemplate()
	{
		return new RestTemplate();
	}
}
