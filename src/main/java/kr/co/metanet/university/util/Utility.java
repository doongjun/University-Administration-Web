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
		if(month >=3 && month <=6) return "1학기";
		if(month == 1) return "겨울학기";
		if(month == 8) return "여름학기";
		
		return "해당없음";
	}
}
