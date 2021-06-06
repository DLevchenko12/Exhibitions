package exhibitions.command;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public interface Command {
    /**
     * Method should be overridden to implement particular Command logic.
     * Mainly method works with HTTP-request to get parameters, session, cookies
     * and etc.
     *
     * @param request  http-request from client
     * @param response http-response from server
     * @throws IOException
     * @throws ServletException
     */
    String execute(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException;
}
