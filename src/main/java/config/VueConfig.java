package config;

import org.apache.tomcat.jdbc.pool.*;
import org.springframework.context.annotation.*;
import dao.*;
import svc.*;

@Configuration
public class VueConfig {

	@Bean
	public VueDao vueDao() {
		return new VueDao(DbConfig.dataSource());
	}

	@Bean
	public VueSvc vueSvc() {
		VueSvc vueSvc = new VueSvc();
		vueSvc.setVueDao(vueDao());
		return vueSvc;
	}

}
