package exhibitions.util;

import java.util.ResourceBundle;

public class PathManager {
    private static ResourceBundle res = ResourceBundle.getBundle("path");

    private PathManager() {
    }

    public static String getPath(String page) {
        return res.getString(page);
    }
}
