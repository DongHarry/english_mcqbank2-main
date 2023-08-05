package com.example.english_mcqbank.config;

import com.example.english_mcqbank.model.Log;
import com.example.english_mcqbank.model.UserEntity;
import com.example.english_mcqbank.model.test.Child1;
import com.example.english_mcqbank.model.test.Parent;
import com.example.english_mcqbank.service.LogService;
import com.example.english_mcqbank.service.UserDetailsServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
@RequiredArgsConstructor
public class CustomAuthenticationFailureHandler implements AuthenticationFailureHandler {
    final
    LogService logService;
    final
    UserDetailsServiceImpl userDetailsService;
    private final RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException, IOException {
        String username = request.getParameter("username");
        Log log = new Log();

        log.setDatetime(new java.util.Date());
        log.setStatus(0);
        UserEntity user = userDetailsService.getUserByUsername(username);

        if (user != null) {
            log.setUser(user);
            log.setName("UNAUTHORIZED: " + user.getUsername() + " tried to log in ");
            logService.saveLog(log);
        } else {
            log.setName("NOT FOUND: " + username + " tried to log in ");
            logService.saveLog(log);
        }
//        System.out.println("Authentication failed for username: " + username);
//        request.getSession().setAttribute("errorMessage2", "Invalid Username or Password");
        request.getSession().setAttribute("logoutMessage", null);
        //redirectStrategy.sendRedirect(request, response, "/login-page?error");


        // Redirect to the URL with both query parameters
        //response.sendRedirect(request.getContextPath() + "/login-page?error");
//        System.out.println("login failed");
//        System.out.println("request.getRequestURL(): " + request.getRequestURL());
//        System.out.println("request.getRequestURI(): " + request.getRequestURI());
//        System.out.println("request.getContextPath(): " + request.getContextPath());
//        System.out.println("request.getServletPath(): " + request.getServletPath());
//        String url = request.getRequestURL().toString().substring(0, request.getRequestURL().toString().length() - request.getRequestURI().length()) + request.getContextPath();
        //System.out.println("url: " + url);

        request.getRequestDispatcher("/login-page?error").forward(request, response);
    }

}

