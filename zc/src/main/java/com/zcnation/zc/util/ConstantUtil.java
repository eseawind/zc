/**********************************************
 * 杭州枭雄网络科技有限公司 @2014 版权所有
 * 项目：设计者服务平台
 * 作者:xiaoymin@foxmail.com 萧玉民
 * 时间：2014年7月30日 上午10:42:09
 * 说明：
 **********************************************/
package com.zcnation.zc.util;

import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStream;
import java.net.JarURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.Enumeration;
import java.util.Properties;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.io.IOUtils;

/***
 * 配置文件读取操作类
 * @author xym
 *
 */
public class ConstantUtil {
	private ConstantUtil(){}
	private static Properties p=new Properties();
	private  static final String URL_PROTOCOL_VFS = "vfs";//暂时不被支持
	private static final String JAR_URL_SEPARATOR = "!/";
	public static final String URL_PROTOCOL_JAR = "jar";
	
	private static final String URL_PROTOCOL_ZIP = "zip";

	private static final String URL_PROTOCOL_WSJAR = "wsjar";
	private static final String URL_PROTOCOL_CODE_SOURCE = "code-source";
	static{
		URL resURL=getDefaultClassLoader().getResource("config");
		if(isJarURL(resURL)){
			try {
				resloveJarURL(resURL);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else if(resURL.getProtocol().startsWith(URL_PROTOCOL_VFS)){
			throw new RuntimeException("暂时不被支持");
		}else{
			String p = resURL.getPath();
			File file= new File(p);
			//init("config/default.properties");
			if(file!=null&&file.isDirectory()){
				System.out.println(file.getAbsolutePath());
				 String[] fs=file.list(new FilenameFilter() {
					public boolean accept(File dir, String name) {
						return name.endsWith(".properties");
					}
				});
				 for (String string : fs) {
					 init("config/"+string);
				}
			}
		}
		parse();
	}
	
	private static  void init (String path){
		
		InputStream in=null;
		try {
			in =getDefaultClassLoader().getResourceAsStream(path);
			p.load(in);
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			IOUtils.closeQuietly(in);
		}
	}
	
	private static void parse(){
		Pattern pattern = Pattern.compile("\\$\\{(.*?)\\}");
		Matcher m;
		String tmp,result;
		int start=0;
		for (Object	obj : p.keySet()) {
			result="";
			tmp=p.getProperty(obj+"");
			if(tmp.indexOf("${") > -1){
				m=pattern.matcher(tmp);
				while(m.find()){
					//System.out.println(m.group(1));
					result+=tmp.substring(start,m.start());
					result+=p.getProperty(m.group(1));
					start=m.end();
				}
				result+=tmp.substring(start);
				p.put(obj,result) ;
				start=0;
			}
		}
	}
	public static String attr(String key){
		return p.getProperty(key);
	}
	
	public static ClassLoader getDefaultClassLoader() {
		ClassLoader cl = null;
		try {
			cl = Thread.currentThread().getContextClassLoader();
		}
		catch (Throwable ex) {
		}
		if (cl == null) {
			cl = ConstantUtil.class.getClassLoader();
		}
		return cl;
	}
	public static void main(String[] args) { 
		System.out.println("333");
		System.out.println(ConstantUtil.attr("zc.Email.port"));
		
	}
	
	protected  static boolean isJarURL(URL url) {
		String protocol = url.getProtocol();
		return (URL_PROTOCOL_JAR.equals(protocol) ||
				URL_PROTOCOL_ZIP.equals(protocol) ||
				URL_PROTOCOL_WSJAR.equals(protocol) ||
				(URL_PROTOCOL_CODE_SOURCE.equals(protocol) && url.getPath().contains(JAR_URL_SEPARATOR)));
	}
	
	private static void	resloveJarURL(URL resURL) throws IOException{
		URLConnection con = resURL.openConnection();
		JarFile jarFile;
		String jarFileUrl;
		String rootEntryPath;
		boolean newJarFile = false;

		if (con instanceof JarURLConnection) {
			// Should usually be the case for traditional JAR files.
			JarURLConnection jarCon = (JarURLConnection) con;
			jarCon.setUseCaches(false);
			jarFile = jarCon.getJarFile();
			jarFileUrl = jarCon.getJarFileURL().toExternalForm();
			JarEntry jarEntry = jarCon.getJarEntry();
			rootEntryPath = (jarEntry != null ? jarEntry.getName() : "");
		}
		else {
			throw new RuntimeException("为什么不是JarURLConnection");
		}

		try {
			if (!"".equals(rootEntryPath) && !rootEntryPath.endsWith("/")) {
				// Root entry path must end with slash to allow for proper matching.
				// The Sun JRE does not return a slash here, but BEA JRockit does.
				rootEntryPath = rootEntryPath + "/";
			}
			for (Enumeration entries = jarFile.entries(); entries.hasMoreElements();) {
				JarEntry entry = (JarEntry) entries.nextElement();
				String entryPath = entry.getName();
				if (entryPath.startsWith(rootEntryPath)) {
					String relativePath = entryPath.substring(rootEntryPath.length());
					
					if(!"".equals(relativePath)&&relativePath.endsWith(".properties")){
						init(rootEntryPath+relativePath);
					}
					
				}
			}
		}
		finally {
			if (newJarFile) {
				jarFile.close();
			}
		}
	}
}
