//package com.example.english_mcqbank.config;
//
//import com.example.english_mcqbank.service.UserDetailsServiceImpl;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.http.HttpMethod;
//import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.builders.WebSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//
//@Configuration
//@EnableWebSecurity
//public class CustomSecurityConfig extends WebSecurityConfigurerAdapter {
//    @Autowired
//    private UserDetailsServiceImpl userDetailsService;
//    @Autowired
//    private AppBasicAuthenticationEntryPoint basicAuthenticationEntryPoint;
//    @Autowired
//    private CustomAuthenticationSuccessHandler authenticationSuccessHandler;
//    @Autowired
//    private CustomAuthenticationFailureHandler authenticationFailureHandler;
//    @Autowired
//    private CustomLogoutSuccessHandler logoutSuccessHandler;
//    @Override
//    public void configure(WebSecurity web) throws Exception {
//        web.ignoring().antMatchers("/css/**","/js/**");
//    }
//
//    @Override
//    protected void configure(HttpSecurity http) throws Exception {
//        http
//                .authorizeRequests()
//                .antMatchers("/user/**").hasAnyRole("USER", "ADMIN")
//                .antMatchers("/questions/**").hasRole("USER")
//                .antMatchers("/admin/**", "/api/**").hasRole("ADMIN")
//                .antMatchers("/", "/home", "/login", "/register","/test/**").permitAll() // Cho phép tất cả mọi người truy cập vào 2 địa chỉ này
//                //.antMatchers(HttpMethod.GET, "/css/**","/js/**").denyAll() // make user cant access to /css, /js by spring security but web app still can access
//
//                .anyRequest().authenticated() // Tất cả các request khác đều cần phải xác thực mới được truy cập
//                .and()
//                .formLogin() // Cho phép người dùng xác thực bằng form login
//                .loginPage("/login-page")
//                .loginProcessingUrl("/login-processing")
//                .successHandler(authenticationSuccessHandler)
//                .failureHandler(authenticationFailureHandler)
//                //.defaultSuccessUrl("/main")
//                .permitAll() // Tất cả đều được truy cập vào địa chỉ này
//                .and()
//                .logout() // Cho phép logout
//                .logoutSuccessHandler(logoutSuccessHandler)
//                //.logoutSuccessUrl("/login-page")
//                .invalidateHttpSession(true)
//                .deleteCookies("JSESSIONID")
//                .permitAll()
//                .and()
//                .exceptionHandling().accessDeniedPage("/access-denied")
//                .and()
//                .httpBasic()
//                .authenticationEntryPoint(basicAuthenticationEntryPoint);
//    }
//
//    @Override
//    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//        auth.userDetailsService(userDetailsService) // Cung cáp userservice cho spring security
//                .passwordEncoder(passwordEncoder()); // cung cấp password encoder
//    }
//
//    @Bean
//    public BCryptPasswordEncoder passwordEncoder() {
//        return new BCryptPasswordEncoder();
//    }
//}
