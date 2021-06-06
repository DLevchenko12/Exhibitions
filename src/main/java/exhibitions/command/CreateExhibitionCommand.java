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
import java.util.Map;

public class CreateExhibitionCommand implements Command {
    private static final Logger LOGGER = LogManager.getLogger(CreateExhibitionCommand.class.getName());

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getSession().removeAttribute("occupiedHallsByExhId");

        String[] hallsID = request.getParameterValues("hall_id");
        Exhibition exhibition = getExhibition(request);
        DBManager dbManager = DBManager.getInstance();
        Map<String, Integer> occupiedHallsByExhId = dbManager.getOccupiedHallMap(exhibition, hallsID);
        LOGGER.info("occupiedHalls: " + occupiedHallsByExhId);

        if (!occupiedHallsByExhId.isEmpty()) {
            request.getSession().setAttribute("occupiedHallsByExhId", occupiedHallsByExhId);
        } else {
            dbManager.addExhibition(exhibition, hallsID);
        }
        return PathManager.getPath("admin.exhibitions.redirect");
    }

    private Exhibition getExhibition(HttpServletRequest request) {
        Exhibition exhibition = new Exhibition();
        int categoryID = Integer.parseInt(request.getParameter("categoryID"));
        String topic = request.getParameter("topic");
        String startDate = request.getParameter("exh-start");
        String endDate = request.getParameter("exh-end");
        String startTime = request.getParameter("time-start");
        String endTime = request.getParameter("time-end");
        int price = Integer.parseInt(request.getParameter("price"));
        int places = Integer.parseInt(request.getParameter("places"));

        Exhibition.Category category = new Exhibition.Category();
        exhibition.setCategory(category);
        category.setId(categoryID);

        exhibition.setTopic(topic);
        exhibition.setStartDate(startDate);
        exhibition.setEndDate(endDate);
        exhibition.setStartTime(startTime);
        exhibition.setEndTime(endTime);
        exhibition.setPrice(price);
        exhibition.setCapacity(places);
        exhibition.setRemainingSeats(places);
        exhibition.setStatus(Exhibition.STATUS.active);

        return exhibition;
    }
}
