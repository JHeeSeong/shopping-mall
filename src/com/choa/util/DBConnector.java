package com.choa.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBConnector {
	public static Connection getConnect() throws Exception{
		//1.�α������� 4����
		String user = "user01";
		String password = "user01";
		String url = "jdbc:oracle:thin:@192.168.20.4:1521:xe";
		String driver = "oracle.jdbc.driver.OracleDriver";

		//2.����̹��� �޸𸮿� �ε�
		Class.forName(driver);
		//3.�α��� Connection
		Connection con = DriverManager.getConnection(url, user, password);
		
		return con;
	}
	public static void disConnect(ResultSet rs, PreparedStatement st, Connection con) throws Exception{
		rs.close();
		st.close();
		con.close();
	}
	
	public static void disConnect(PreparedStatement st, Connection con) throws Exception{
		st.close();
		con.close();
	}
}
