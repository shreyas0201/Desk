package desk.classes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connect_TO_Server {
    static Connection c = null;
    public static void connect() throws ClassNotFoundException, SQLException{
        Class.forName("oracle.jdbc.driver.OracleDriver");
        c = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "SYSTEM", "vinay");     
        System.out.println("\n connected to sever");
    }
    
    public static Connection getConnection() throws ClassNotFoundException, SQLException{
        if(c == null)
            connect();
        return c;
    }
    
}
