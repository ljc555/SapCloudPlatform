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
		//1.������ݿ�����
		Connection conn=getMysqlConnection();
		//3.ͨ�����ݿ�����Ӳ������ݿ⣬ʵ����ɾ�Ĳ飨ʹ��Statement�ࣩ
		Statement st=conn.createStatement();
		ResultSet rs=st.executeQuery("SELECT * FROM system_user");
		//4.�������ݿ�ķ��ؽ��(ʹ��ResultSet��)
		StringBuffer sb = new StringBuffer();
		while(rs.next()) {
			sb.append("userid:" + rs.getString("userid") +",");
			sb.append("userName:" + rs.getString("userName") +",");
			sb.append("opeTime:" + rs.getString("opeTime") +",");
			sb.append("delFlag:" + rs.getString("delFlag") +",");
			sb.append("\n");
		}
		//�ر���Դ
		rs.close();
		st.close();
		conn.close();
		return sb.toString();
	}
}