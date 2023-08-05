package com.example.english_mcqbank.config;

import com.example.english_mcqbank.model.UserEntity;
import com.example.english_mcqbank.service.UserDetailsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class MySecurityConfig {
    @Autowired
    private UserDetailsServiceImpl userDetailsService;
    @Autowired
    private AppBasicAuthenticationEntryPoint basicAuthenticationEntryPoint;
    @Autowired
    private CustomAuthenticationSuccessHandler authenticationSuccessHandler;
    @Autowired
    private CustomAuthenticationFailureHandler authenticationFailureHandler;
    //@Autowired
    //private CustomLogoutSuccessHandler logoutSuccessHandler;

    @Bean
    public DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
        provider.setUserDetailsService(userDetailsService); // Cung cáp userservice cho spring security
        provider.setPasswordEncoder(passwordEncoder()); // cung cấp password encoder
        return provider;
    }

    @Bean
    protected SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                .antMatchers("/user/**").hasAnyRole("USER", "ADMIN")
                .antMatchers("/questions/**").hasRole("USER")
                .antMatchers("/admin/**", "/api/**").hasRole("ADMIN")
                .antMatchers("/", "/home", "/login", "/register","/test/**").permitAll() // Cho phép tất cả mọi người truy cập vào 2 địa chỉ này
                .antMatchers("/css/**","/images/**","/font-awesome/**","/fonts/**","/js/**", "/abc", "/lib/**").permitAll() // make user cant access to /css, /js by spring security but web app still can access
                .anyRequest().authenticated() // Tất cả các request khác đều cần phải xác thực mới được truy cập
                .and()
                .formLogin() // Cho phép người dùng xác thực bằng form login
                .loginPage("/login-page")
                .loginProcessingUrl("/login-processing")
                .successHandler(authenticationSuccessHandler)
                .failureHandler(authenticationFailureHandler)
                //.defaultSuccessUrl("/main")
                .permitAll() // Tất cả đều được truy cập vào địa chỉ này
                .and()
                .logout() // Cho phép logout
                //.logoutSuccessHandler(logoutSuccessHandler)
                //.logoutSuccessUrl("/login-page")
                .invalidateHttpSession(true)
                .deleteCookies("JSESSIONID")
                .permitAll()
                .and()
                .exceptionHandling().accessDeniedPage("/access-denied")
                .and()
                .httpBasic()
                .authenticationEntryPoint(basicAuthenticationEntryPoint);
        // make user cant access to /css, /js by spring security but web app still can access



        return http.build();
    }

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }


}

