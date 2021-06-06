package exhibitions.command;

import exhibitions.db.DBManager;
import exhibitions.model.Exhibition;
import exhibitions.util.PathManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class GetBuyTicketPageCommand implements Command {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        int exhibitionId = Integer.parseInt(request.getParameter("id"));
        DBManager dbManager = DBManager.getInstance();
        Exhibition exhibition = dbManager.getExhibition(exhibitionId);
        request.setAttribute("exhibition", exhibition);
        return PathManager.getPath("user.home.buy-ticket");
    }
}
