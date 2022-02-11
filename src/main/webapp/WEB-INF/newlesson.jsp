A login Example using Filters
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
HttpServletResponse res= (HttpServletResponse) response;
request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request,response);
}
}

@Override
public void destroy() {
Filter.super.destroy();

}
}
............................................................................

index.jsp

<%session.setAttribute("u","Kulesh");%>
<x:choose>
    <x:when test="${sessionScope.u ne null}">
        <x:import url="process.jsp"/>
    </x:when>

    <x:otherwise>
        <h1>Login</h1>
        <form action="index.jsp">
            <input name="name" type="text">
            <input name="pass" type="password">
            <input type="submit" value="Login">
        </form>
    </x:otherwise>
</x:choose>

..............................................................................
Multiple Filter Mapping

@WebFilter(filterName = "FilterOne",urlPatterns = {"/","/process.jsp","/new.jsp"})

In  XML

<filter>
    <filter-name>FilterOne</filter-name>
    <filter-class>com.intellij.project.firstproject.Controllers.FilterOne</filter-class>
</filter>
<filter-mapping>
    <filter-name>FilterOne</filter-name>
    <url-pattern>/</url-pattern>
    <url-pattern>/new.jsp</url-pattern>
    <url-pattern>/process.jsp</url-pattern>
</filter-mapping>

.....................................................................................

Ways in which a servlet or jsp executes
1.HttpRequest coming from client side.
2.a servlet forward
3.a servlet include
These methods let us know how a filter is executed.This method is called dispatcher type

If by any chance we never map a filter with dispatcher the default disptacher is done in client.
REQUEST:::::
<filter-mapping>
    <filter-name>FilterOne</filter-name>
    <url-pattern>/</url-pattern>
    <dispatcher>REQUEST</dispatcher>
</filter-mapping>
FORAWRD::::::
<filter-mapping>
    <filter-name>FilterOne</filter-name>
    <url-pattern>/</url-pattern>
    <dispatcher>FORWARD</dispatcher>
</filter-mapping>
filter works when jsp is forwarded.
<%request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request,response);%>
INCLUDE::::::::
<filter-mapping>
    <filter-name>FilterOne</filter-name>
    <url-pattern>/</url-pattern>
    <dispatcher>INCLUDE</dispatcher>
</filter-mapping>

does not work for include directive because it is done at translation time.
filter works at include but not when request is sent or forwarded.
.............................................................................
<filter-mapping>
    <filter-name>FilterOne</filter-name>
    <url-pattern>/</url-pattern>
    <dispatcher>REQUEST</dispatcher>
    <dispatcher>FORWARD</dispatcher>
</filter-mapping>
both can be used at one time.
............................................................................
Annotating dispatcher
@WebFilter(filterName = "FilterOne",urlPatterns = "/*",dispatcherTypes = DispatcherType.FORWARD)
@WebFilter(filterName = "FilterOne",urlPatterns = "/*",dispatcherTypes = {DispatcherType.FORWARD, DispatcherType.REQUEST})
for all jsps:::::::
@WebFilter(filterName = "FilterOne",urlPatterns = *.jsp",dispatcherTypes = {DispatcherType.FORWARD, DispatcherType.REQUEST})
for all Urls
@WebFilter(filterName = "FilterOne",urlPatterns = "/*",dispatcherTypes = {DispatcherType.FORWARD, DispatcherType.REQUEST})
