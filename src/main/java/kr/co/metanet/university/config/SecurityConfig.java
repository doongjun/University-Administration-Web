package kr.co.metanet.university.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import kr.co.metanet.university.service.security.CustomUserDetailsService;


@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	@Autowired
	CustomUserDetailsService customUserDetailsService;
	
	@Override
	public void configure(WebSecurity web) throws Exception{
		web.ignoring().antMatchers("/webjars/**", "/resources/**");
	}
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception{
		auth.userDetailsService(customUserDetailsService);
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception{
		http.csrf().disable()
		.authorizeRequests()
		.antMatchers("/main","/members/loginerror","/members/joinform","/members/join","/members/welcome").permitAll()
		.antMatchers("/securepage", "/members/**").hasAnyRole("USER","ADMIN","PROF")
		.anyRequest().authenticated()
		.and()
			.formLogin()
			.loginPage("/members/loginform")
			.usernameParameter("code")
			.passwordParameter("password")
			.loginProcessingUrl("/authenticate")
			.failureForwardUrl("/members/loginerror?login_error=1")
			.defaultSuccessUrl("/", true)
			.permitAll()
		.and()
			.logout()
			.logoutUrl("/logout")
			.logoutSuccessUrl("/");
	}

	@Bean
	public PasswordEncoder endcoder() {
		return new BCryptPasswordEncoder();
	}
}
