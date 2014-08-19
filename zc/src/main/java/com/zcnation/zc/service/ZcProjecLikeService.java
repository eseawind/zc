/**********************************************
 * 杭州枭雄网络科技有限公司 @2014 版权所有
 * 项目：zc
 * 时间：2014年7月28日 下午11:32:27
 * 作者:xiaoymin@foxmail.com 萧玉民
 * 说明：
 **********************************************/
package com.zcnation.zc.service;


import java.util.List;

import com.zcnation.zc.domain.ZcProjectInfo;
import com.zcnation.zc.domain.ZcProjectLike;



public interface ZcProjecLikeService {
	

	 public List<ZcProjectLike> queryByUserCode(Integer userCode);
	
	 public void deleteByLikeCode(int likeCode);
	 
	 public void delete(ZcProjectLike zcProjectLike);
	 
	 public ZcProjectLike queryOne(int likeCode);
	 
	 public String save(ZcProjectLike zcProjectLike);
}
