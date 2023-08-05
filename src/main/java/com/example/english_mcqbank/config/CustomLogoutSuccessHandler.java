package com.example.english_mcqbank.config;

import com.example.english_mcqbank.service.LoggedInUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class CustomLogoutSuccessHandler implements LogoutSuccessHandler {
    @Autowired
    LoggedInUserService loggedInUserService;

    @Override
    public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
//        System.out.println("Logout success");
        request.getSession().setAttribute("logoutMessage", "You have been logged out successfully");
//        request.getSession().setAttribute("errorMessage2", null);
        loggedInUserService.setLoggedInUser(null);
        response.sendRedirect("/login-page?logout");
//        System.out.println("logout success");
//        System.out.println("request.getRequestURL(): " + request.getRequestURL());
//        System.out.println("request.getRequestURI(): " + request.getRequestURI());
//        System.out.println("request.getContextPath(): " + request.getContextPath());
//        System.out.println("request.getServletPath(): " + request.getServletPath());
//        String url = request.getRequestURL().toString().substring(0, request.getRequestURL().toString().length() - request.getRequestURI().length()) + request.getContextPath();

//        request.getRequestDispatcher("/login-page?logout").forward(request, response);
    }
}
