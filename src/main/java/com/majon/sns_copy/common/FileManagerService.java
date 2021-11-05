package com.majon.sns_copy.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.web.multipart.MultipartFile;

public class FileManagerService {

	// public final static String FILE_UPLOAD_PATH = "D:\\Dev_Joey\\springTest\\upload\\images/";
	public final static String FILE_UPLOAD_PATH = "/home/ec2-user/uploads";
	
	public static String saveFile(int userId, MultipartFile file) {
		
		String directoryName = userId + "_" + System.currentTimeMillis() + "/";
		
		String filePath = FILE_UPLOAD_PATH + directoryName;
		
		File directory = new File(filePath);
		
		if(directory.mkdir() == false) {
			return null;
		}
		
		try {
			byte[] bytes = file.getBytes();
			
			Path path = Paths.get(filePath + file.getOriginalFilename());
			
			Files.write(path, bytes);
		} catch (IOException e) {
//			
			e.printStackTrace();
			return null;
		}
		return "/images/" + directoryName + file.getOriginalFilename();
	}
	
	
	public static void removeFile(String filePath) {
		
		String realFilePath = FILE_UPLOAD_PATH + filePath.replace("/images/", "");
		Path path = Paths.get(realFilePath);
		if(Files.exists(path)) {
			try {
				Files.delete(path);
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		}
		
		path = path.getParent();
		if(Files.exists(path)) {
			try {
				Files.delete(path);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
}
