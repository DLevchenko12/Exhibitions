package exhibitions.util;

import java.util.ResourceBundle;

public class QueryManager {
    private static ResourceBundle res = ResourceBundle.getBundle("queries");

    private QueryManager() {
    }

    public static String getQuery(String query) {
        return res.getString(query);
    }
}
