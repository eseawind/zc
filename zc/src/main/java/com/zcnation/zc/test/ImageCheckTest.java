package com.zcnation.zc.test;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

public class ImageCheckTest {

	public static void main(String[] args) {
		// 验证码
		String basePath = "F:\\test";
		File baseFile = new File(basePath);
		System.out.println(baseFile.getAbsolutePath());
		//加法验证码,简单的 20以内的加法
		//获取画笔
		//图片 长 宽
		int width=100,height=40;
		BufferedImage br=new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		br.setRGB(20, 2, 233);
		Graphics g=br.getGraphics();
		g.setColor(Color.WHITE);
		g.fillRect(0, 0, width, height);
		
		String painText="2 + 3 =?";
		g.setColor(Color.BLACK);
		g.setFont(new Font("宋体", Font.BOLD, 16));
		g.drawString(painText, 3, 24);
		g.dispose();
		try {
			ImageIO.write(br, "jpg", new File(baseFile.getAbsolutePath()+File.separatorChar+"imagecheck01.jpg"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	/**
     * 获取字符长度，一个汉字作为 1 个字符, 一个英文字母作为 0.5 个字符
     * @param text
     * @return 字符长度，如：text="中国",返回 2；text="test",返回 2；text="中国ABC",返回 4.
*/
    public static int getLength(String text) {
        int textLength = text.length();
        int length = textLength;
        for (int i = 0; i < textLength; i++) {
            if (String.valueOf(text.charAt(i)).getBytes().length > 1) {
                length++;
            }
        }
        return (length % 2 == 0) ? length / 2 : length / 2 + 1;
    }

}
