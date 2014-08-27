package com.zcnation.zc.common.util;

public class Getpagenum {
	/**
	 * 判断需要分几页
	 * 
	 * @param count
	 * @param pageSize
	 * @return
	 */
	public static long getpagenum(long count, int pageSize) {
		if (count == 0L)
			return 1L;
		if (count % pageSize != 0L) {
			return count / pageSize + 1L;
		}
		return count / pageSize;
	}

}
