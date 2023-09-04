package config;

import static config.DbConfig.*;
import org.apache.tomcat.jdbc.pool.*;
import org.springframework.context.annotation.*;
import kakaoApi.*;

@Configuration
public class KakaoConfig {
	@Bean
	public KakaoSvc kakaoSvc() {
		KakaoSvc kakaoSvc = new KakaoSvc();
		return kakaoSvc;
	}
}
