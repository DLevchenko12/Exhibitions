package exhibitions.util;

import org.apache.commons.codec.digest.DigestUtils;

public class PasswordManager {
    private PasswordManager() {
    }

    public static String getPasswordHash(String password) {
        return DigestUtils.sha256Hex(password);
    }
}
