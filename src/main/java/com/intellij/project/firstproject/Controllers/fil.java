package com.intellij.project.firstproject.Controllers;


import org.springframework.stereotype.Component;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;
@Component
public class fil implements Filter {
    private int hitCount;
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {



    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        hitCount++;

        // Print the counter.
        System.out.println("Site visits count :" + hitCount);
        request.setAttribute("counter", hitCount);
        // pass the request along the filter chain
        chain.doFilter(request, response);


    }

    @Override
    public void destroy() {
        Filter.super.destroy();
       hitCount=0;
    }
}
