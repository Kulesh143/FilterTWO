package com.intellij.project.firstproject.Controllers;

import org.springframework.stereotype.Component;


import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import java.io.IOException;
//@WebFilter(filterName = "FilterOne",urlPatterns = "/")
@Component
public class FilterOne implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
 HttpServletRequest r= (HttpServletRequest) request;
 if(r.getSession().getAttribute("u")!=null){
     chain.doFilter(request,response);
 }else{
     request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request,response);
 }
    }

    @Override
    public void destroy() {
        Filter.super.destroy();

    }
}
