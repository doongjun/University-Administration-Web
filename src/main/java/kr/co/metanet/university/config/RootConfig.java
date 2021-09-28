package kr.co.metanet.university.config;

import java.nio.charset.Charset;
import java.sql.SQLException;
import java.util.Arrays;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import oracle.ucp.jdbc.PoolDataSource;
import oracle.ucp.jdbc.PoolDataSourceFactory;

@EnableAspectJAutoProxy // aop
@EnableTransactionManagement // tx
@MapperScan("kr.co.metanet.university.mapper")
@ComponentScan("kr.co.metanet.university.service")
@Configuration
@PropertySource("classpath:application.properties")
public class RootConfig {
	@Value("${spring.datasource.connection-factory-class-name}")
    private String connectionFactoryClassName;
    
    @Value("${spring.datasource.url}")
    private String url;
    
    @Value("${spring.datasource.username}")
    private String username;
    
    @Value("${spring.datasource.password}")    
    private String password;
    
    @Bean
	public DataSource dataSource() throws SQLException {		
		PoolDataSource pool  = PoolDataSourceFactory.getPoolDataSource();
		
		pool.setConnectionFactoryClassName(connectionFactoryClassName);
		pool.setURL(url);
		pool.setUser(username);
		pool.setPassword(password);
		pool.setMaxPoolSize(20);
		pool.setInitialPoolSize(5);
		
		return pool;
	}
    
	//mybatis
	@Bean
	public SqlSessionFactory sqlSessionFactory() throws Exception{
		SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
		sqlSessionFactoryBean.setDataSource(dataSource());
		return sqlSessionFactoryBean.getObject();
	}
	
	//transaction
	@Bean
	public DataSourceTransactionManager txManager() throws SQLException {
		return new DataSourceTransactionManager(dataSource());
	}
	
	@Bean
	public HttpMessageConverter<String> responseBodyConverter() {
	    StringHttpMessageConverter converter = new StringHttpMessageConverter();
	    converter.setSupportedMediaTypes(Arrays.asList(new MediaType("text", "plain", Charset.forName("UTF-8"))));
	    return converter;
	}
}
