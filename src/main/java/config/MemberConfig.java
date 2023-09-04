package config;

import static config.DbConfig.*;
import org.apache.tomcat.jdbc.pool.*;
import org.springframework.context.annotation.*;
import org.springframework.jdbc.datasource.*;		// Ʈ����� �߰�
import org.springframework.transaction.*;			// Ʈ����� �߰�
import org.springframework.transaction.annotation.*;// Ʈ����� �߰�
import dao.*;
import svc.*;

@Configuration
@EnableTransactionManagement
// @@Transactional �ֳ����̼��� ���� �޼ҵ带 Ʈ����� �������� �����ϴ� ������� Ȱ��ȭ��Ŵ
// ����� PlatformTransactionManager ���� ����Ͽ� Ʈ������� ������
public class MemberConfig {
// ȸ�� ���� �۾� ���� Ŭ����
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
