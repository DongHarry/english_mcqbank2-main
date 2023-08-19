package com.example.english_mcqbank.config;

import com.example.english_mcqbank.model.Log;
import com.example.english_mcqbank.model.UserEntity;
import com.example.english_mcqbank.model.test.Child1;
import com.example.english_mcqbank.model.test.Parent;
import com.example.english_mcqbank.service.ILogService;
import com.example.english_mcqbank.service.UserDetailsServiceImpl;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;


import java.io.IOException;
import java.util.Date;
import java.util.Set;

@Component
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
    @Autowired
    ILogService logService;
    @Autowired
    UserDetailsServiceImpl userDetailsService;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, FilterChain chain, Authentication authentication) throws IOException, ServletException {
        HttpSession session = request.getSession();
        session.setAttribute("loggedInUser", userDetailsService.getUserByUsername(authentication.getName()));

        Set<String> roles = AuthorityUtils.authorityListToSet(authentication.getAuthorities());
        Log log = new Log();
        UserEntity user = userDetailsService.getUserByUsername(authentication.getName());
        //loggedInUserService.setLoggedInUser(user);
        log.setUser(user);
        log.setDatetime(new Date());


        if (roles.contains("ROLE_ADMIN")) {
            log.setStatus(1);
            log.setName("ADMIN: " + user.getUsername() + " logged in");
            logService.saveLog(log);
            response.sendRedirect(request.getContextPath() + "/admin");
        } else if (roles.contains("ROLE_USER")) {
            log.setStatus(1);
            log.setName("USER: " + user.getUsername() + " logged in");
            logService.saveLog(log);
            response.sendRedirect(request.getContextPath() + "/user");
        } else {
            log.setStatus(0);
            log.setName("UNAUTHORIZED: " + authentication.getName() + " tried to log in");
            logService.saveLog(log);
            response.sendRedirect("/main");
        }
    }

    @Bean
    public Parent myBean() {
        return new Child1();
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        HttpSession session = request.getSession();
        session.setAttribute("loggedInUser", userDetailsService.getUserByUsername(authentication.getName()));

        Set<String> roles = AuthorityUtils.authorityListToSet(authentication.getAuthorities());
        Log log = new Log();
        UserEntity user = userDetailsService.getUserByUsername(authentication.getName());
        //loggedInUserService.setLoggedInUser(user);
        log.setUser(user);
        log.setDatetime(new Date());


        if (roles.contains("ROLE_ADMIN")) {
            log.setStatus(1);
            log.setName("ADMIN: " + user.getUsername() + " logged in");
            logService.saveLog(log);
            response.sendRedirect(request.getContextPath() + "/admin");
        } else if (roles.contains("ROLE_USER")) {
            log.setStatus(1);
            log.setName("USER: " + user.getUsername() + " logged in");
            logService.saveLog(log);
            response.sendRedirect(request.getContextPath() + "/user");
        } else {
            log.setStatus(0);
            log.setName("UNAUTHORIZED: " + authentication.getName() + " tried to log in");
            logService.saveLog(log);
            response.sendRedirect("/main");
        }
    }
}

