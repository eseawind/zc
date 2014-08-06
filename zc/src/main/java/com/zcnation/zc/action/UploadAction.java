/**********************************************
 * 杭州枭雄网络科技有限公司 @2014 版权所有
 * 项目：设计者服务平台
 * 作者:xiaoymin@foxmail.com 萧玉民
 * 时间：2014年8月6日 下午3:03:09
 * 说明：
 **********************************************/
package com.zcnation.zc.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.zcnation.zc.common.exception.NotValidateCorrectException;
import com.zcnation.zc.common.util.RootLogger;

@Controller
public class UploadAction {
	private static final String IMAGE_DIR = "/uploadImg";

	@RequestMapping("/upload.html")
	public String toUpload(HttpServletRequest request){
		System.out.println("测试上传");
		MultipartResolver rs=new CommonsMultipartResolver(request.getSession().getServletContext());
		MultipartHttpServletRequest reqFile=rs.resolveMultipart(request);
		MultipartFile file= reqFile.getFile("files");
		System.out.println(file==null);
		if (file!=null) {
			System.out.println("名称："+file.getOriginalFilename());
			RootLogger.info("上传文件名称：" + file.getOriginalFilename()+" 文件大小:"+file.getSize());
			String fileName = file.getOriginalFilename();
			String realPath = request.getSession().getServletContext().getRealPath(IMAGE_DIR);
			File realFile = new File(realPath);
			if (!realFile.exists()) {
				realFile.mkdirs();
			}
			// 上传文件
			File targetFile = new File(realFile, fileName);
			FileOutputStream fos = null;
			InputStream ins = null;
			try {
				if (!file.isEmpty()) {
					ins = file.getInputStream();
					fos=new FileOutputStream(targetFile);
					byte[] b=new byte[1024*1024];
					int flag;
					while ((flag=ins.read(b))!=-1) {
						fos.write(b,0,flag);
						fos.flush();
					}
				}
				System.out.println("上传成功");
			} catch (IOException e) {
				RootLogger.error("上传图片出错.");
				RootLogger.error(e);
				throw new NotValidateCorrectException("上传图片出错");
			}finally{
				IOUtils.closeQuietly(ins);
				IOUtils.closeQuietly(fos);
			}
		}
		System.out.println(file);
		/*for (MultipartFile fil : files) {
			System.out.println("文件名称："+fil.getOriginalFilename());
		}*/
		return "";
	}
}
