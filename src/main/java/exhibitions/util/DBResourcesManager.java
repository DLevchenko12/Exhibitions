package exhibitions.util;

import java.util.ResourceBundle;

public class DBResourcesManager {
    private static ResourceBundle res = ResourceBundle.getBundle("db");

    private DBResourcesManager() {
    }

    public static String getPropertyByName(String value) {
        return res.getString(value);
    }

}
