package com.zcnation.zc.common.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class IsSameDay {
	 public static int isSameDay(Date day1, Date day2) { 
		   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
		   String ds1 = sdf.format(day1); 
		   String ds2 = sdf.format(day2); 
		   if (ds1.equals(ds2)) { 
		   return 1; 
		   } else { 
		   return 0; 
		   } 
		  } 

}
