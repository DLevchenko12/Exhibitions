package exhibitions.controller;

import exhibitions.command.CommandFactory;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ServletController extends HttpServlet {
    private static final Logger LOGGER = LogManager.getLogger(ServletController.class.getName());

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        LOGGER.info("doGet: " + req.getRequestURI());
        processRequest(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        LOGGER.info("doPost" + req.getRequestURI());
        processRequest(req, resp);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String command = request.getParameter("command");
        if (command == null) {
            command = cleanPath(request.getRequestURI());
            LOGGER.info("command: " + command);
        }
        String page = CommandFactory.getCommand(command).execute(request, response);
        if (page == null) {
            response.sendError(404);
        } else if (page.contains("redirect:")) {
            LOGGER.info("redirect to page: " + page);
            response.sendRedirect(page.replace("redirect:", ""));
        } else {
            LOGGER.info("forward to page: " + page);
            request.getRequestDispatcher(page).forward(request, response);
        }
    }

    private String cleanPath(String path) {
        return path.replaceAll(".*/exhibitions/", "");
    }
}

