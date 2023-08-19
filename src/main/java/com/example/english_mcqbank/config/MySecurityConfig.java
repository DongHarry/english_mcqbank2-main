package com.example.english_mcqbank.config;

import com.example.english_mcqbank.service.UserDetailsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

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
                .authorizeRequests(
                        (auth) -> auth
                                .requestMatchers(new AntPathRequestMatcher("/user/**")).hasAnyRole("USER","ADMIN")
                                .requestMatchers(new AntPathRequestMatcher("/questions/**")).hasRole("USER")
                                .requestMatchers(new AntPathRequestMatcher("/admin/**"), new AntPathRequestMatcher("/api/**")).hasRole("ADMIN")
                                //.requestMatchers("/", "/home", "/index", "/login", "/register", "/forgot-password", "/reset-password", "/test/**").permitAll()
                                .requestMatchers(new AntPathRequestMatcher("/")).permitAll()
                                .requestMatchers(new AntPathRequestMatcher("/home")).permitAll()
                                .requestMatchers(new AntPathRequestMatcher("/index")).permitAll()
                                .requestMatchers(new AntPathRequestMatcher("/login")).permitAll()
                                .requestMatchers(new AntPathRequestMatcher("/register")).permitAll()
                                .requestMatchers(new AntPathRequestMatcher("/forgot-password")).permitAll()
                                .requestMatchers(new AntPathRequestMatcher("/reset-password")).permitAll()
                                .requestMatchers(new AntPathRequestMatcher("/test/**")).permitAll()
                                .requestMatchers(new AntPathRequestMatcher("/test1")).permitAll()
                                .requestMatchers(new AntPathRequestMatcher("/test2")).permitAll()
                                //.requestMatchers("/test/upload", "/css/**", "/images/**", "/font-awesome/**", "/fonts/**", "/js/**", "/abc", "/lib/**", "/resource/**", "/sendContactMail/**", "/send-email").permitAll()
                                .requestMatchers(new AntPathRequestMatcher("/test/upload")).permitAll()
                                .requestMatchers(new AntPathRequestMatcher("/css/**")).permitAll()
                                .requestMatchers(new AntPathRequestMatcher("/images/**")).permitAll()
                                .requestMatchers(new AntPathRequestMatcher("/font-awesome/**")).permitAll()
                                .requestMatchers(new AntPathRequestMatcher("/fonts/**")).permitAll()
                                .requestMatchers(new AntPathRequestMatcher("/js/**")).permitAll()
                                .requestMatchers(new AntPathRequestMatcher("/abc")).permitAll()
                                .requestMatchers(new AntPathRequestMatcher("/lib/**")).permitAll()
                                .requestMatchers(new AntPathRequestMatcher("/resource/**")).permitAll()
                                .requestMatchers(new AntPathRequestMatcher("/sendContactMail")).permitAll()
                                .requestMatchers(new AntPathRequestMatcher("/send-email")).permitAll()
                                .requestMatchers(new AntPathRequestMatcher("/test/upload")).permitAll()
                        //.anyRequest().authenticated()
                        //.requestMatchers("/awsa").authenticated()
                )
                .formLogin(
                        (formLogin) -> formLogin
                                .loginPage("/login-page")
                                .loginProcessingUrl("/login-processing")
                                .successHandler(authenticationSuccessHandler)
                                .failureHandler(authenticationFailureHandler)
                                //.defaultSuccessUrl("/main")
                                .permitAll()
                )
                // Cho phép người dùng xác thực bằng form login/ Tất cả đều được truy cập vào địa chỉ này
                .logout(
                        (logout) -> logout
                                .logoutUrl("/logout")
                                .invalidateHttpSession(true)
                                .deleteCookies("JSESSIONID")
                ) // Cho phép logout
                .httpBasic(
                        (httpBasic) -> httpBasic
                                //.realmName("my-basic-realm")
                                .authenticationEntryPoint(basicAuthenticationEntryPoint)
                );
        // make user cant access to /css, /js by spring security but web app still can access


        return http.build();
    }

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }


}

