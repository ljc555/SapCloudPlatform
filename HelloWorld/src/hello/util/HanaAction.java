package hello.util;

import java.sql.Connection;
import java.sql.DriverManager;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class HanaAction {

    private final static String hana_url = "jdbc:sap://vadbj0g.nwtrial.od.sap.biz:30380/";
    private final static String hana_schema = "ljc555db";
    private final static String hana_pass = "Ljh123456789000";
    
	public static Connection getHanaConnection()
    {
        try {
            Class.forName("com.sap.db.jdbc.Driver");
            Connection conn = DriverManager.getConnection(hana_url, hana_schema, hana_pass);
            if (conn == null) {
            	System.out.println("can not connect to hana.");
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
		Connection conn=getHanaConnection();
		//3.通过数据库的连接操作数据库，实现增删改查（使用Statement类）
		Statement st=conn.createStatement();
		ResultSet rs=st.executeQuery("SELECT * FROM emp");
		//4.处理数据库的返回结果(使用ResultSet类)
		StringBuffer sb = new StringBuffer();
		while(rs.next()) {
			sb.append("EMPNO:" + rs.getString("EMPNO") +",");
			sb.append("ENAME:" + rs.getString("ENAME") +",");
			sb.append("JOB:" + rs.getString("JOB") +",");
			sb.append("MGR:" + rs.getString("MGR") +",");
			sb.append("\n");
		}
		//关闭资源
		rs.close();
		st.close();
		conn.close();
		return sb.toString();
	}
}
