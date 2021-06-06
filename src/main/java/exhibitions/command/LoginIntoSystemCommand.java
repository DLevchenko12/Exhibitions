package exhibitions.command;

import exhibitions.db.DBManager;
import exhibitions.model.User;
import exhibitions.util.PasswordManager;
import exhibitions.util.PathManager;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import static java.util.Objects.nonNull;

public class LoginIntoSystemCommand implements Command {
    private static final Logger LOGGER = LogManager.getLogger(LoginIntoSystemCommand.class.getName());

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        if (request.getSession() != null &&
                request.getSession().getAttribute("role") != null) {
            User.ROLE role = (User.ROLE) request.getSession().getAttribute("role");
            if (role == User.ROLE.ADMIN) {
                return PathManager.getPath("admin.home.redirect");
            } else if (role == User.ROLE.USER) {
                return PathManager.getPath("user.home.redirect");
            }
        }

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();

        session.removeAttribute("incorrectInput");

        LOGGER.info("E-mail: " + email);

        if (nonNull(email) && nonNull(password)) {
            User user = DBManager.getInstance().getUserByEmail(email);

            if (user != null) {
                String hash = PasswordManager.getPasswordHash(password);
                if (hash.equals(user.getPassword())) {
                    User.ROLE role = user.getRole();
                    LOGGER.info("role: " + role);
                    int id = user.getId();
                    session.setAttribute("userID", id);
                    LOGGER.info("userID: " + id);
                    if (role == User.ROLE.ADMIN) {
                        session.setAttribute("role", role);
                        return PathManager.getPath("admin.home.redirect");
                    } else if (role == User.ROLE.USER) {
                        session.setAttribute("role", role);
                        return PathManager.getPath("user.home.redirect");
                    }
                }
            }
        }
        LOGGER.info("Input is incorrect");
        session.setAttribute("incorrectInput", "inputIsIncorrect");
        return PathManager.getPath("login.redirect");
    }
}
