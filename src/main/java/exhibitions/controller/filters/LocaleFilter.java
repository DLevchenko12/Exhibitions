package exhibitions.controller.filters;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Locale;

@WebFilter("/exhibitions/language/*")
public class LocaleFilter implements Filter {
    private static final Logger LOGGER = LogManager.getLogger(LocaleFilter.class.getName());

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        LOGGER.info("inside");
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession();

        String path = request.getRequestURI();
        String page = request.getHeader("referer");

        if (path.contains("/language/")) {
            LOGGER.info("locale processing");
            String language = path.replaceAll(".*/language/", "");
            session.setAttribute("language", new Locale(language));
            response.sendRedirect(request.getContextPath() + page);
        } else {
            filterChain.doFilter(request, response);
        }
    }
}
