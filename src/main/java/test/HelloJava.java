package test;

import java.sql.Connection;
import java.sql.DriverManager;

public class HelloJava {
	public static int myFn() {
		int sum = 0;
		for(int i=1; i<=10;i++) {
			sum +=i;
		}
		return sum;
	}

	public static int myFn(int s, int e) {
		int sum = 0;
		for(int i=s; i<=e;i++) {
			sum +=i;
		}
		return sum;
	}
public static void connect() {
	String ORACLE_DRIVER = "oracle.jdbc.OracleDriver";
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	try {
		Class.forName(ORACLE_DRIVER);
		Connection con = DriverManager.getConnection(url, "study", "1234");
		if(con!=null) {
			System.out.println("오라클연결성공");
		}
	}catch(Exception e) {
		System.out.println("오라클연결 익셉션");
		e.printStackTrace();
		
	}
}
	

	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("Hello Java....");
		System.out.println(myFn());
		connect() ;
	
		
	}

}
