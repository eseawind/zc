<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/WEB-INF/jsp/include.jsp"%>
<%@include file="/WEB-INF/jsp/index_title.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>设计详细</title>
 <style type="text/css">
 #detail .entity-img {
display: table-cell;
width: 580px;
height: 580px;
text-align: center;
vertical-align: middle;
}
 #detail .main {
float: left;
width: 630px;
margin-bottom: 45px;
}
#detail .breadcrumb {
font-size: 16px;
color: #898989;
}
#detail .aside .price {
display: inline-block;
margin-bottom: 20px;
padding: 6px 15px;
border-radius: 3px;
font-size: 16px;
color: #fff;
background-color: #427ec0;
text-decoration: none;
}
#detail .share .weibo_icon {
width: 30px;
height: 30px;
display: inline-block;
background: url(images/toolkit.png);
background-position: -18px -8px;
position: relative;
top: 5px;
}
user agent stylesheetdiv {
display: block;
}
#detail .breadcrumb ul {
padding: 0;
list-style: none;
}
menu, ol, ul {
padding: 0 0 0 40px;
}
dl, menu, ol, ul {
margin: 1em 0;
}
#detail .entity-img {
display: table-cell;
width: 580px;
height: 580px;
text-align: center;
vertical-align: middle;
}
a:active, a:hover {
outline: 0;
}
#detail .recommend img {
max-width: 100%;
max-height: 100%;
}
#detail .entity {
padding: 25px;
border: 1px solid #eee;
}
a {
text-decoration: none;
color: inherit;
}
user agent stylesheeta:-webkit-any-link {
color: -webkit-link;
text-decoration: underline;
cursor: auto;
}
#detail .breadcrumb li {
display: inline-block;
margin: 0 5px 0 5px;
}
user agent stylesheetli {
display: list-item;
text-align: -webkit-match-parent;
}
#detail .main {
float: left;
width: 630px;
margin-bottom: 45px;
}
#detail .entity {
padding: 25px;
border: 1px solid #eee;
}
#detail .entity-img {
display: table-cell;
width: 580px;
height: 580px;
text-align: center;
vertical-align: middle;
}
a:active, a:hover {
outline: 0;
}
a {
text-decoration: none;
color: inherit;
}
.note-item .selection-icon {
display: inline-block;
float: right;
width: 19px;
height: 19px;
background: url(images/toolkit.png) no-repeat;
background-position: -155px -141px;
margin: 2px 5px 0 0;
}
Inherited from div.note-item
.note-item {
position: relative;
font-size: 14px;
color: #666;
}
user agent stylesheeta:-webkit-any-link {
color: -webkit-link;
text-decoration: underline;
cursor: auto;
}
#detail h2 {
margin: 30px 0;
color: #333;
font-weight: 400;
font-size: 18px;
}
h2 {
font-size: 1.5em;
margin: .83em 0;
}
user agent stylesheeth2 {
display: block;
font-size: 1.5em;
-webkit-margin-before: 0.83em;
-webkit-margin-after: 0.83em;
-webkit-margin-start: 0px;
-webkit-margin-end: 0px;
font-weight: bold;
}
#detail .like {
display: inline-block;
padding: 8px 15px;
border: 1px solid #eee;
border-radius: 5px;
text-decoration: none;
}
.like {
text-decoration: none;
}
#detail .selection-note {
margin-top: 30px;
padding-top: 20px;
border-top: 1px solid #eee;
}
.note-item {
position: relative;
font-size: 14px;
color: #666;
}
.note-item .avatar {
float: left;
}
a {
text-decoration: none;
color: inherit;
}
.note-item .note-detail {
overflow: hidden;
}
.note-item .nickname {
margin-right: 10px;
color: #333;
}
.note-item .bio {
color: #999;
}
small {
font-size: 80%;
}
.note-item .note-content {
margin: 10px 0 15px;
line-height: 1.5;
}
p, pre {
margin: 1em 0;
}
user agent stylesheetp {
display: block;
-webkit-margin-before: 1em;
-webkit-margin-after: 1em;
-webkit-margin-start: 0px;
-webkit-margin-end: 0px;
}
.note-item .note-operate {
position: relative;
}
#detail .breadcrumb .home {
display: inline-block;
height: 14px;
width: 14px;
background: url(images/toolkit.png);
background-position: -19px -144px;
}
.note-item .poke {
display: inline-block;
padding-right: 15px;
border-right: 1px solid #eee;
}
.note-item .poke, .note-item .poke, .note-item .create-time, .note-item .my-note, .note-item .update-note, .note-item .add-comment {
color: #999;
font-size: 12px;
}
.note-item .poke, .note-item .poke, .note-item .create-time, .note-item .my-note, .note-item .update-note, .note-item .add-comment {
color: #999;
font-size: 12px;
}
.note-item .poke span {
display: inline-block;
vertical-align: middle;
width: 19px;
height: 19px;
margin-right: 5px;
background: url(images/toolkit.png) no-repeat;
background-position: -50px -141px;
}
.note-item .add-comment {
display: inline-block;
margin: 0 15px;
}
.note-item .create-time {
margin-top: 5px;
float: right;
}
.note-item .selection-icon {
display: inline-block;
float: right;
width: 19px;
height: 19px;
background: url(images/toolkit.png) no-repeat;
background-position: -155px -141px;
margin: 2px 5px 0 0;
}
.like .icon {
display: inline-block;
position: relative;
top: 3px;
width: 20px;
height: 18px;
margin-right: 5px;
background: url(images/toolkit.png) no-repeat;
background-position: -19px -102px;
}
.like .count {
margin-right: 5px;
}
#detail .aside {
float: right;
width: 285px;
}
#detail .aside .entity-info {
border: 1px solid #eee;
padding: 25px 20px;
}
#detail .likes {
padding: 25px 20px;
border: 1px solid #eee;
border-top: 0;
}
#detail .aside h3 {
margin: 0;
font-size: 16px;
font-weight: 400;
color: #666;
}
h3 {
font-size: 1.17em;
margin: 1em 0;
}
user agent stylesheeth3 {
display: block;
font-size: 1.17em;
-webkit-margin-before: 1em;
-webkit-margin-after: 1em;
-webkit-margin-start: 0px;
-webkit-margin-end: 0px;
font-weight: bold;
}
#detail .likes div {
margin-top: 10px;
}
#detail .category {
height: 50px;
margin: 0;
line-height: 50px;
padding: 0 20px;
border: 1px solid #eee;
border-top: 0;
color: #427ec0;
background-color: #fbfbfb;
}
p, pre {
margin: 1em 0;
}
user agent stylesheetp {
display: block;
-webkit-margin-before: 1em;
-webkit-margin-after: 1em;
-webkit-margin-start: 0px;
-webkit-margin-end: 0px;
}
#detail .share {
padding: 25px 20px;
border: 1px solid #eee;
border-top: 0;
font-size: 14px;
}
#detail .download {
padding: 25px 20px;
border: 1px solid #eee;
border-top: 0;
}
#detail .aside h3 {
margin: 0;
font-size: 16px;
font-weight: 400;
color: #666;
}
#detail .download div {
margin-top: 10px;
}
#detail .recommend {
clear: both;
width: 630px;
}
#detail .recommend h2 {
margin: 0 0 10px;
}
#detail h2 {
margin: 30px 0;
color: #333;
font-weight: 400;
font-size: 18px;
}
#detail .recommend div {
margin-right: -15px;
font-size: 0;
}
#detail .recommend a {
display: inline-block;
width: 146px;
height: 146px;
margin-right: 15px;
margin-bottom: 15px;
}
 </style>

<script type="text/javascript">
	
</script>
</head>
<body>

<div id="main" class="clearfix">
<div id="detail" style="" itemscope="" itemtype="http://data-vocabulary.org/Product">
        <div class="breadcrumb">
        <ul>
            <li><span class="home"></span></li>
            
            <li><a href="index.html">精选</a></li>
            <li>⁄</li>
            
            <li><a href="index.html">壁饰</a></li>
            <li>⁄</li>
            <li>马头墙面装饰挂钩</li>
        </ul>
        </div>
        <div class="main">
            <div class="entity">
                
                    <a href="#" class="like" style="float: right">
                
                    <span class="icon"></span>
                    <span class="count">278</span>喜爱
                   
                </a>
                    
                    <a class="entity-img" href="#" data-itemid="21154095832" data-unid="" target="_blank" bi="btn_taobao" onclick="logClick('53d5e429a2128a7d46463dc9');">
                    
                
                    <img itemprop="image" src="images/ts.png" alt="马头墙面装饰挂钩">
                </a>
                <h2><span itemprop="">鹅鹅鹅鹅鹅鹅饿</span></h2>

                
                
                    <div class="selection-note">
                        

<div class="note-item"><a href="/u/173660/" class="avatar" target="_blank"><img src="http://imgcdn.guoku.com/avatar/small_173660_ba16ab03382aaa2f4e8827f5975f9e0c.jpg" width="50" height="50"></a><div class="note-detail"><a class="nickname" href="/u/173660/" target="_blank">
          设计师  ：  胡阿尤
            </a><small class="bio">黛丝开逮</small><p class="with-tag note-content">华国锋好几个擐甲挥戈价格价格将规划局规划局</p><div class="note-operate"><a href="javascript:;" class="poke" data-note="509560" data-target-status="1"><span></span></a><a href="javascript:;" class="add-comment" data-note="509560"><span></span></a><span class="create-time">2014 年 7 月 28 日</span><span class="selection-icon"></span></div></div></div>

                    </div>
                
            </div>

            
             

        </div>
        

        <div class="aside">
            <div class="entity-info" itemprop="offerDetails" itemscope="" itemtype="http://data-vocabulary.org/Offer">
                
                    
                    <a class="price" href="#" data-unid="" target="_blank" bi="btn_taobao" onclick="logClick('53d5e429a2128a7d46463dc9');">
                    
                
                    <meta itemprop="currency" content="RMB">
                    购买<span itemprop="price">￥49.00</span>
                </a>


                
            </div>

            <div class="likes">
                <h3>278人喜爱</h3>
                <div>
                    
                    <a href="/u/135412/liked/" target="_blank">
                        <img alt="iwantamonetbag" src="images/ts.png" height="25" width="25">
                    </a>
                    
                    <a href="/u/109767/liked/" target="_blank">
                        <img alt="幽幽" src="images/ts.png" height="25" width="25">
                    </a>
                    
                   
                </div>
            </div>

            <p class="category">
                <a href="index.html">壁饰</a>
            </p>

            
            
            
            

            <div class="share">
                <a href="javascript:;"><span class="weibo_icon"></span>分享到微博</a>
            </div>
        
          
            
        </div>

        <div class="recommend">
            <h2>相似推荐</h2>
            <div>
                
                    <a href="/detail/16699172/" target="_blank">
                        <img src="images/ts.png" alt="">
                    </a>
                
                    <a href="/detail/7ce4c692/" target="_blank">
                        <img src="images/ts.png" alt="">
                    </a>
                
                    <a href="/detail/82f2dd2d/" target="_blank">
                        <img src="images/ts.png" alt="">
                    </a>
                
                    <a href="/detail/74d0ccdb/" target="_blank">
                        <img src="images/ts.png" alt="">
                    </a>
                
            </div>
        </div>




</div>
</div>


<div class="nipic-footer align-center mt40">
    <div class="layout-width layout-width990">
        <a hidefocus="true" title="关于众筹" href="#">关于众筹</a><span class="sepline">|</span><a hidefocus="true" title="网站公约" href="#">网站公约</a><span class="sepline">|</span><a hidefocus="true" title="网站声明" href="#">网站声明</a><span class="sepline">|</span><a hidefocus="true" title="帮助中心" href="#">帮助中心</a><span class="sepline">|</span><a hidefocus="true" title="联系我们" href="http://service.nipic.com/site/contact.html">联系我们</a><span class="sepline">|</span><a hidefocus="true" title="常见问题" href="#">常见问题</a><span class="sepline">
        <p class="gray mt10"><span class="font-tahoma">Copyright © 2014 NiPic.com All Rights Reserved</span>　版权所有·众筹网　增值电信业务经营许可证 ：浙B2-20140130  </p>
        <p class="gray mt10">众筹网是网络服务平台方，若您发现您的权利被侵害，请发起知识产权投诉，<span class="font-tahoma">xhymmc@163.com</span></p>
        <p class="mt10"><img height="52" ondragstart="return false;" src="images/ppaa.gif" /></p>
    </div>
</div>  

<DIV id=RightMenu><A href="projectinfo/project_show.html#top"><IMG 
src="images/right1.png" width=47 height=56></A><A title=产品反馈 
onclick=User.show(this); href="javascript:void(0);" rel=Dialog_Alert 
url="/Feedback/" mode="iframe" showbg="true" showborder="false" 
showtitle="false" height="500" width="750"><IMG 
src="images/right2.png" width=47 height=56></A><A title=在线客服 
href="http://wpa.qq.com/msgrd?v=3&amp;uin=2787064043&amp;site=qq&amp;menu=yes" 
target=_blank><IMG src="images/right3.png" width=47 
height=56></A><A id=code class=ewm href="javascript:void(0);"><SPAN 
style="DISPLAY: none" id=code_img></SPAN><IMG 
src="images/right4.png" width=47 height=56></A></DIV>
<DIV style="DISPLAY: none" class=ui_btn_min></DIV>



</body>
</html>