package exhibitions.command;

import exhibitions.db.DBManager;
import exhibitions.model.User;
import exhibitions.util.PathManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class GetUsersPageCommand implements Command {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        List<User> users = DBManager.getInstance().getAllUsers();
        request.setAttribute("users", users);
        return PathManager.getPath("admin.users");
    }

}
