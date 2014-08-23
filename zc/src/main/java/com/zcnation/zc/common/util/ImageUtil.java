package com.zcnation.zc.common.util;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

/***
 * 图片处理类
 * @author xym
 *
 */
public class ImageUtil {
	public static final String IMAGE_FORMAT_JPG="jpg";
	
	public static final int IMAGE_TARGET_WIDTH=128;
	public static final int IMAGE_TARGET_HEIGHT=128;

	/***
	 * 水印图片
	 * @param targetFile 目标文件
	 * @param writerImage 水印文件
	 * @param outFilePath 输出文件路径
	 */
	public static boolean pressImage(String targetFile,String writerFile,String outFilePath){
		boolean isSuccess=false;
		File srcFile=new File(targetFile);
		File wrtFile=new File(writerFile);
		try {
			Image srcImage=ImageIO.read(srcFile);
			int width=srcImage.getWidth(null);
			int height=srcImage.getHeight(null);
			BufferedImage br=new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
			//画笔
			Graphics g=br.getGraphics();
			g.drawImage(srcImage,0,0,width,height,null);
			//目标文件
			Image wriImage=ImageIO.read(wrtFile);
			int tarWidth=wriImage.getWidth(null);
			int tarHeight=wriImage.getHeight(null);
			g.drawImage(wriImage, (width-IMAGE_TARGET_WIDTH)/2,(height-IMAGE_TARGET_HEIGHT)/2, IMAGE_TARGET_WIDTH, IMAGE_TARGET_HEIGHT, null);
			
			g.dispose();
			File outFile=new File(outFilePath);
			ImageIO.write(br, IMAGE_FORMAT_JPG, outFile);
			isSuccess=true;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	public static void main(String[] args) {
		File srcImag=new File("F:\\test\\11.gif");
		File targetImg=new File("F:\\test\\1.bmp");
		pressImage(srcImag.getAbsolutePath(), targetImg.getAbsolutePath(), "F:\\test\\bbb.jpg");
		System.out.println(srcImag.getAbsolutePath());
	}
}
