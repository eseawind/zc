/**********************************************
 * 杭州枭雄网络科技有限公司 @2014 版权所有
 * 项目：设计者服务平台
 * 作者:xiaoymin@foxmail.com 萧玉民
 * 时间：2014年8月10日 下午3:37:03
 * 说明：
 **********************************************/
package com.zcnation.zc.domain;

import java.awt.CardLayout;

import org.apache.commons.lang.ObjectUtils;
import org.apache.commons.lang.StringUtils;

/***
 * 购物车
 * @author xym
 *
 */
public class CartInfo {

	/***
	 * 下单用户
	 */
	private int userCode;
	/***
	 * 下单产品
	 */
	private int proCode;
	
	/***
	 * 购买数量
	 */
	private int cartNumber;
	/**
	 * 规格大小
	 */
	private String tshirtShort;
	
	/***
	 * 商品图片
	 */
	private String imageUrl;
	
	/***
	 * 商品名称
	 */
	private String proName;
	
	/**
	 * 商品单价
	 */
	private double proUnit;
	
	
	
	public double getProUnit() {
		return proUnit;
	}
	public void setProUnit(double proUnit) {
		this.proUnit = proUnit;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public int getUserCode() {
		return userCode;
	}
	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}
	public int getProCode() {
		return proCode;
	}
	public void setProCode(int proCode) {
		this.proCode = proCode;
	}
	public int getCartNumber() {
		return cartNumber;
	}
	public void setCartNumber(int cartNumber) {
		this.cartNumber = cartNumber;
	}
	public String getTshirtShort() {
		return tshirtShort;
	}
	public void setTshirtShort(String tshirtShort) {
		this.tshirtShort = tshirtShort;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (obj instanceof CartInfo) {
			CartInfo ci=(CartInfo)obj;
			if(StringUtils.equals(ObjectUtils.toString(this.getProCode()), ObjectUtils.toString(ci.getProCode()))){
				if (StringUtils.equals(this.tshirtShort, ci.getTshirtShort())) {
					System.out.println("产品类型相同，大小相同");
					return true;
				}
			}
		}
		return false;
	}
}
