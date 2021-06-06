package exhibitions.command;

import exhibitions.db.DBManager;
import exhibitions.util.PathManager;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MakeUserAdminCommand implements Command {
    private static final Logger LOGGER = LogManager.getLogger(MakeUserAdminCommand.class.getName());

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        LOGGER.info("execute");
        int userID = Integer.parseInt(request.getParameter("id"));
        DBManager dbManager = DBManager.getInstance();
        boolean changed = dbManager.makeUserAdmin(userID);
        LOGGER.info("Role for user with id " + userID + " is changed " + changed);
        return PathManager.getPath("admin.users.redirect");
    }
}
