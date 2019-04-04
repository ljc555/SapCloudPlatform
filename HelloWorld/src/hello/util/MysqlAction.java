package hello.util;

import java.sql.Connection;
import java.sql.DriverManager;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MysqlAction {

    private final static String db_url = "jdbc:mysql://193.112.22.138:3306/arch1";
    private final static String db_schema = "root";
    private final static String db_pass = "18.Kulit";
   
    
	public static Connection getMysqlConnection()
    {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(db_url, db_schema, db_pass);
            if (conn == null) {
            	System.out.println("can not connect to mysql.");
                System.exit(0);
            }
            return conn;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
	
	public static String getEmps() throws ClassNotFoundException,SQLException{
		//1.获得数据库链接
		Connection conn=getMysqlConnection();
		//3.通过数据库的连接操作数据库，实现增删改查（使用Statement类）
		Statement st=conn.createStatement();
		ResultSet rs=st.executeQuery("SELECT * FROM system_user");
		//4.处理数据库的返回结果(使用ResultSet类)
		StringBuffer sb = new StringBuffer();
		while(rs.next()) {
			sb.append("userid:" + rs.getString("userid") +",");
			sb.append("userName:" + rs.getString("userName") +",");
			sb.append("opeTime:" + rs.getString("opeTime") +",");
			sb.append("delFlag:" + rs.getString("delFlag") +",");
			sb.append("\n");
		}
		//关闭资源
		rs.close();
		st.close();
		conn.close();
		return sb.toString();
	}
}
