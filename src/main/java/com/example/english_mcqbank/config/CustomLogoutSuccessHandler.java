package com.example.english_mcqbank.config;

import com.example.english_mcqbank.model.Log;
import com.example.english_mcqbank.model.UserEntity;
import com.example.english_mcqbank.service.ILogService;
import com.example.english_mcqbank.service.ISessionService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.stereotype.Component;


import java.io.IOException;

@Component
@RequiredArgsConstructor
public class CustomLogoutSuccessHandler implements LogoutSuccessHandler {
    private final ISessionService sessionService;
    private final ILogService logService;


    @Override
    public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
//        System.out.println("Logout success");
        request.getSession().setAttribute("logoutMessage", "You have been logged out successfully");
        //sessionService.removeAttribute("loggedInUser");
        RedirectStrategy redirectStrategy = new RedirectStrategy() {
            @Override
            public void sendRedirect(HttpServletRequest request, HttpServletResponse response, String url) throws IOException {
                response.sendRedirect(url);
            }
        };

        Log log = new Log();
        UserEntity user = sessionService.getLoggedInUser();
        log.setUser(user);
        log.setStatus(1);
        log.setName(user.getUsername() + " logged out");
        logService.saveLog(log);

        sessionService.removeAttribute("loggedInUser");


        redirectStrategy.sendRedirect(request, response, "/login-page?logout");

//        request.getSession().setAttribute("errorMessage2", null);
//        response.sendRedirect("/login-page?logout");
//        System.out.println("logout success");
//        System.out.println("request.getRequestURL(): " + request.getRequestURL());
//        System.out.println("request.getRequestURI(): " + request.getRequestURI());
//        System.out.println("request.getContextPath(): " + request.getContextPath());
//        System.out.println("request.getServletPath(): " + request.getServletPath());
//        String url = request.getRequestURL().toString().substring(0, request.getRequestURL().toString().length() - request.getRequestURI().length()) + request.getContextPath();

//        request.getRequestDispatcher("/login-page?logout").forward(request, response);
    }
}
