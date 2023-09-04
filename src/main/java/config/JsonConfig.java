package config;

import static config.DbConfig.*;
import org.apache.tomcat.jdbc.pool.*;
import org.springframework.context.annotation.*;
import dao.*;
import svc.*;

@Configuration
public class JsonConfig {
	@Bean
	public JsonDao jsonDao() {
		return new JsonDao(dataSource());
	}

	@Bean
	public JsonSvc jsonSvc() {
		JsonSvc jsonSvc = new JsonSvc();
		jsonSvc.setJsonDao(jsonDao());
		return jsonSvc;
	}
}
