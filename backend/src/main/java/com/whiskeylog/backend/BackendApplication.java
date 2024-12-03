package com.whiskeylog.backend;

// import io.github.cdimascio.dotenv.Dotenv;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class BackendApplication {

	public static void main(String[] args) {
		// // .envの読み込み
		// Dotenv dotenv = Dotenv.configure().load();
		// System.setProperty("POSTGRES_URL",dotenv.get("POSTGRES_URL"));
		// System.setProperty("POSTGRES_USER",dotenv.get("POSTGRES_USER"));
		// System.setProperty("POSTGRES_PASSWORD",dotenv.get("POSTGRES_PASSWORD"));

		SpringApplication.run(BackendApplication.class, args);
	}

}
