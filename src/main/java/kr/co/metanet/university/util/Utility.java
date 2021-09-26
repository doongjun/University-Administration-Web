package kr.co.metanet.university.util;

import java.util.Calendar;

public class Utility {
	
	public static int getYear() {
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		return year;
	}
	
	public static String getSemester() {
		Calendar cal = Calendar.getInstance();
		int month = cal.get(Calendar.MONTH)+1;
		if (month >= 9 && month<=12) return "2학기";
		else if(month >=3 && month <=6) return "1학기";
		else if(month >=1 && month <=3) return "겨울계절학기";
		else return "여름계절학기";
	}
}
