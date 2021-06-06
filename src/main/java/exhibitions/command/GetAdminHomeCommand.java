package exhibitions.command;

import exhibitions.util.PathManager;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class GetAdminHomeCommand implements Command {
    private static final Logger LOGGER = LogManager.getLogger(GetAdminHomeCommand.class.getName());

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        LOGGER.warn("returning admin.homepage ");
        return PathManager.getPath("admin.homepage");
    }
}
