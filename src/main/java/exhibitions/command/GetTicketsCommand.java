package exhibitions.command;

import exhibitions.db.DBManager;
import exhibitions.util.PathManager;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class GetTicketsCommand implements Command {
    private static final Logger LOGGER = LogManager.getLogger(GetTicketsCommand.class.getName());

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int exhID = Integer.parseInt(request.getParameter("exh_id"));
        int amount = Integer.parseInt(request.getParameter("amount"));

        DBManager dbManager = DBManager.getInstance();
        int userID = (int) request.getSession().getAttribute("userID");
        LOGGER.info("userID: " + userID);
        LOGGER.info("exhID: " + exhID);
        LOGGER.info("amount: " + amount);
        boolean done = dbManager.setTicketsForUserID(userID, exhID, amount);
        if (!done) {
            request.getSession().setAttribute("incorrectTicket", true);
            response.sendRedirect(PathManager.getPath("user.home.buy-ticket.redirect"));
        }
        return PathManager.getPath("user.home.redirect");
    }
}
