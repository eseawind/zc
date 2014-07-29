/**********************************************
 * 杭州枭雄网络科技有限公司 @2014 版权所有
 * 项目：设计者服务平台
 * 作者:xiaoymin@foxmail.com 萧玉民
 * 时间：2014年7月29日 下午9:46:51
 * 说明：
 **********************************************/
package com.zcnation.zc.common;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

/***
 * 返回结果类
 * @author xym
 *
 */
public class Result {
	/***
	 * 是否成功
	 */
	private boolean success=false;
	/***
	 * 错误信息
	 */
	private List<String> errorMsgs=new ArrayList<String>();
	/***
	 * 返回对象
	 */
	private Object returnValue;
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public List<String> getErrorMsgs() {
		return errorMsgs;
	}
	public void setErrorMsgs(List<String> errorMsgs) {
		this.errorMsgs = errorMsgs;
	}
	public Object getReturnValue() {
		return returnValue;
	}
	public void setReturnValue(Object returnValue) {
		this.returnValue = returnValue;
	}
	
	public String toJson(){
		Gson g=new Gson();
		String json= g.toJson(this);
		if (returnValue instanceof JsonElement) {
			JsonObject jo=new JsonObject();
			jo.addProperty("success", success);
			jo.add("returnValue", (JsonElement)returnValue);
			json=jo.toString();
		}
		return json;
	}
	
	
}
