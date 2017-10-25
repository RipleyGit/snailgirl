package com.sod.bean;

import com.sod.pojo.UserAdmin;
import org.apache.catalina.Session;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "BackLoginFilter",urlPatterns="/admin/*")
public class BackLoginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        System.out.println("过滤器进行");
        HttpServletRequest httpRequest = (HttpServletRequest) req;
        HttpServletResponse httpResponse = (HttpServletResponse) resp;
        HttpSession session = httpRequest.getSession();
        UserAdmin userAdmin = (UserAdmin) session.getAttribute("userAdmin");
        if (userAdmin == null){
            httpResponse.sendRedirect("/backed/login");
        }
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
