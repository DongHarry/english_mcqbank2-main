package com.example.english_mcqbank.config;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.www.BasicAuthenticationEntryPoint;
import org.springframework.stereotype.Component;


import java.io.IOException;
import java.io.PrintWriter;

@Component
public class AppBasicAuthenticationEntryPoint extends BasicAuthenticationEntryPoint {

    @Override
    public void commence(HttpServletRequest request,
                         HttpServletResponse response,
                         AuthenticationException authEx) throws IOException {

        response.addHeader("WWW-Authenticate", "Basic realm=" + getRealmName());
        response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        PrintWriter writer = response.getWriter();
        /*ErrorResponse errorResponse = new ErrorResponse();
        errorResponse.setStatusCode(HttpStatus.UNAUTHORIZED.value());
        errorResponse.setMessage("HTTP Status 401 - Bad credentials");
        errorResponse.setTimestamp(System.currentTimeMillis());
        writer.println(errorResponse);*/
        writer.println("HTTP Status 401 - " + authEx.getMessage());
    }

    @Override
    public void afterPropertiesSet() {
        setRealmName("howtodoinjava");
        super.afterPropertiesSet();
    }
}
