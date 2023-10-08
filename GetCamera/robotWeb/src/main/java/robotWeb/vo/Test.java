package robotWeb.vo;

import java.sql.Time;

public class Test {

	public static void main(String[] args) {
		String str = "09:12:22";
		Time time = Time.valueOf(str);
		System.out.println(time);
	}
}
