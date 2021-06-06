package exhibitions.util;

import java.util.ResourceBundle;

public class TextResourcesManager {
    private static ResourceBundle res = ResourceBundle.getBundle("text");

    private TextResourcesManager() {
    }

    public static String getPropertyByName(String value) {
        return res.getString(value);
    }
}
