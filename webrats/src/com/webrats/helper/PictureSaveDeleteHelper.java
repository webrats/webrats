package com.webrats.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class PictureSaveDeleteHelper {
	
	
	public static boolean deletePicture(String path) {
		boolean f=false;
		
		try {
			
			File file = new File(path);
			file.delete();
			f=true;
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		return f;
	}
	
	
	public static boolean savePicture (InputStream is , String path) {
		boolean f = false;
		
		try {
			
			byte b[] = new byte[is.available()];
			
			is.read(b);
			
			FileOutputStream fos = new FileOutputStream(path);
			
			fos.write(b);
			
			fos.flush();
			fos.close();
			
			f=true;
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return f ;
	}

}
