package exhibitions.command;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.HashMap;
import java.util.Map;

public class CommandFactory {
    private static Map<String, Command> map;
    private static final Logger LOGGER = LogManager.getLogger(CommandFactory.class.getName());


    private CommandFactory() {
    }

    static {
        map = new HashMap<>();
        map.put("main-page", new GetMainPageCommand());
        map.put("registration", new GetRegistrationPageCommand());
        map.put("register-user", new RegisterNewUserCommand());
        map.put("login", new GetLoginPageCommand());
        map.put("logout", new LogoutCommand());
        map.put("home", new LoginIntoSystemCommand());

        map.put("user/home", new GetUserHomeCommand());
        map.put("user/buy-ticket", new GetBuyTicketPageCommand());
        map.put("user/get-tickets", new GetTicketsCommand());

        map.put("admin/users", new GetUsersPageCommand());
        map.put("admin/home", new GetAdminHomeCommand());
        map.put("admin/exhibitions", new GetExhibitionsPageCommand());
        map.put("admin/create-exhibition", new CreateExhibitionCommand());
        map.put("admin/delete-exhibition", new DeleteExhibitionCommand());
        map.put("admin/deactivate-exhibition", new CancelExhibitionCommand());
        map.put("admin/activate-exhibition", new ActivateExhibitionCommand());
        map.put("admin/make-user-admin", new MakeUserAdminCommand());
        map.put("admin/make-admin-user", new MakeAdminUserCommand());
    }

    public static Command getCommand(String commandStr) {
        LOGGER.info("commandStr: " + commandStr);
        Command command = map.getOrDefault(commandStr, new Error404Command());
        LOGGER.info("command: " + command.getClass().getSimpleName());
        return command;
    }
}
