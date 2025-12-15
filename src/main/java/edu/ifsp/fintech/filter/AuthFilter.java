package edu.ifsp.fintech.filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebFilter("/*")
public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

        String url = request.getRequestURI();

        boolean publicPage =
                url.endsWith("Login.jsp") ||
                url.endsWith("CriarConta.jsp") ||
                url.contains("login") ||
                url.contains("cadastrar") ||
                url.contains("css") ||
                url.contains("js") ||
                url.contains("png") ||
                url.contains("jpg") ||
                url.contains("gif");

        boolean logged = request.getSession().getAttribute("usuarioLogado") != null;

        if (!publicPage && !logged) {
            response.sendRedirect("paginas/Login.jsp");
            return;
        }

        chain.doFilter(req, resp);
    }
}

