package exhibitions.command;

import exhibitions.db.DBManager;
import exhibitions.model.Exhibition;
import exhibitions.util.PathManager;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class GetExhibitionsPageCommand implements Command {
    private static final Logger LOGGER = LogManager.getLogger(GetExhibitionsPageCommand.class.getName());

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        LOGGER.info("inside execute()");
        int page = 1;
        int recordsPerPage = 2;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
            LOGGER.info("request parameter 'page' is not null and equals " + page);
        }
        DBManager dbManager = DBManager.getInstance();
        List<Exhibition> exhibitions = dbManager.getAllExhibitions((page - 1) * recordsPerPage,
                recordsPerPage);
        int noOfRecords = dbManager.getNoOfExhibitions();

        if (noOfRecords < 1) {
            request.setAttribute("noOneExhibition", true);
        } else {
            int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
            request.setAttribute("noOfPages", noOfPages);
            request.setAttribute("currentPage", page);
            List<Exhibition.Category> categories = dbManager.getCategoryList();
            List<Exhibition.Hall> halls = dbManager.getHallList();
            int maxSeatAmount = DBManager.getInstance().getMaxSeatAmount();
            request.setAttribute("exhibitions", exhibitions);
            request.setAttribute("categories", categories);
            request.setAttribute("maxSeatAmount", maxSeatAmount);
            request.setAttribute("halls", halls);
        }
        return PathManager.getPath("admin.exhibitions");
    }
}
