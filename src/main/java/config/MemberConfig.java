package config;

import static config.DbConfig.*;
import org.apache.tomcat.jdbc.pool.*;
import org.springframework.context.annotation.*;
import org.springframework.jdbc.datasource.*;		// 트랜잭션 추가
import org.springframework.transaction.*;			// 트랜잭션 추가
import org.springframework.transaction.annotation.*;// 트랜잭션 추가
import dao.*;
import svc.*;

@Configuration
@EnableTransactionManagement
// @@Transactional 애노테이션이 붙은 메소드를 트랜잭션 범위에서 실행하는 기능으로 활성화시킴
// 등록한 PlatformTransactionManager 빈을 사용하여 트랜잭션을 적용함
public class MemberConfig {
// 회원 관련 작업 설정 클래스
	/*
	@Bean(destroyMethod = "close")
	public DataSource dataSource() {
		DataSource ds = new DataSource();
		ds.setDriverClassName("com.mysql.jdbc.Driver");
		ds.setUrl("jdbc:mysql://localhost/mall?characterEncoding=utf8");
		ds.setUsername("root");
		ds.setPassword("1234");
		ds.setInitialSize(2);
		ds.setMaxActive(10);
		ds.setTestWhileIdle(true);
		ds.setMinEvictableIdleTimeMillis(60000 * 3);
		ds.setTimeBetweenEvictionRunsMillis(10 * 1000);
		return ds;
	}*/

	@Bean
	public PlatformTransactionManager transactionManager() {
		DataSourceTransactionManager tm = 
			new DataSourceTransactionManager();
		tm.setDataSource(dataSource());
		return tm;
	}

	@Bean
	public LoginDaoSpr loginDaoSpr() {
		return new LoginDaoSpr(dataSource());
	}

	@Bean
	public LoginSvcSpr loginSvcSpr() {
		LoginSvcSpr loginSvcSpr = new LoginSvcSpr();
		loginSvcSpr.setLoginDaoSpr(loginDaoSpr());
		return loginSvcSpr;
	}

	@Bean
	public MemberDao memberDao() {
		return new MemberDao(dataSource());
	}

	@Bean
	public MemberSvc memberSvc() {
		MemberSvc memberSvc = new MemberSvc();
		memberSvc.setMemberDao(memberDao());
		return memberSvc;
	}
}
