package exhibitions.db;

import com.mysql.cj.jdbc.MysqlDataSource;
import exhibitions.util.DBResourcesManager;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.sql.Connection;
import java.sql.SQLException;

public class ConnectionManager {
    public static final Logger LOGGER = LogManager.getLogger(ConnectionManager.class.getName());

    private static MysqlDataSource dataSource;

    private ConnectionManager() {

    }

    public static synchronized Connection getConnection() throws SQLException {
        if (dataSource == null) {
            initializeDataSource();
        }
        Connection connection = dataSource.getConnection();
        connection.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE);
        return connection;
    }

    private static void initializeDataSource() {
        dataSource = new MysqlDataSource();

        String user = DBResourcesManager.getPropertyByName("jdbc.user");
        String password = DBResourcesManager.getPropertyByName("jdbc.password");
        String serverName = DBResourcesManager.getPropertyByName("jdbc.serverName");
        String dbName = DBResourcesManager.getPropertyByName("jdbc.dbName");
        String timezone = DBResourcesManager.getPropertyByName("jdbc.timezone");
        String encoding = DBResourcesManager.getPropertyByName("jdbc.encoding");

        dataSource.setUser(user);
        dataSource.setPassword(password);
        dataSource.setServerName(serverName);
        dataSource.setDatabaseName(dbName);
        try {
            dataSource.setCharacterEncoding(encoding);
            dataSource.setServerTimezone(timezone);
        } catch (SQLException e) {
            LOGGER.warn(e.getMessage());
            e.printStackTrace();
        }
    }
}
