package exhibitions.command;

import exhibitions.db.DBManager;
import exhibitions.model.Order;
import exhibitions.util.PathManager;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class GetUserHomeCommand implements Command {
    private static final Logger LOGGER = LogManager.getLogger(GetUserHomeCommand.class.getName());

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        int userID = (int) request.getSession().getAttribute("userID");
        LOGGER.info("userID: " + userID);
        int page = 1;
        int recordsPerPage = 5;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
            LOGGER.info("request parameter 'page' is not null and equals " + page);
        }
        DBManager dbManager = DBManager.getInstance();
        List<Order> orders = dbManager.getAllOrders(userID,
                recordsPerPage, (page - 1) * recordsPerPage);
        int noOfRecords = dbManager.getNoOfOrders();

        LOGGER.info("orders size: " + orders.size());

        if (noOfRecords < 1) {
            request.setAttribute("noOneExhibition", true);
        } else {
            int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
            request.setAttribute("ordersList", orders);
            request.setAttribute("noOfPages", noOfPages);
            request.setAttribute("currentPage", page);
        }
        String path = PathManager.getPath("user.homepage");
        LOGGER.info("will be returned: " + path);
        return path;
    }
}
