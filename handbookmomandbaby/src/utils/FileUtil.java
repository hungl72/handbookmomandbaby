package utils;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import constants.GlobalConstant;

public class FileUtil {

	public static String rename(String fileName) {
		String nameFile = "";
		if (!fileName.isEmpty()) {
			String[] arrImg = fileName.split("\\.");
			String duoiFileImg = arrImg[arrImg.length - 1];

			for (int i = 0; i < (arrImg.length - 1); i++) {
				if (i == 0) {
					nameFile = arrImg[i];
				} else {
					nameFile += "-" + arrImg[i];
				}
			}
			nameFile = nameFile + "-" + System.nanoTime() + "." + duoiFileImg;
		}
		return nameFile;
	}

	public static String getName(final Part part) {
		for (String content : part.getHeader("content-disposition").split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}

	// method upload file
	public static String upload(String nameInput, HttpServletRequest request) throws ServletException, IOException {
		Part part = request.getPart(nameInput);
		String fileName = rename(part.getSubmittedFileName());// ten file
		if (!"".equals(fileName)) {
			String dirPath = request.getServletContext().getRealPath("") + GlobalConstant.DIR_UPLOAD;
			// System.out.println(dirPath); Ä‘á»‹a chá»‰ Ä‘Æ°á»�ng dáº«n Ä‘áº¿n file
			File saveDir = new File(dirPath);// java.io
			if (!saveDir.exists()) {
				saveDir.mkdirs();
			}
			String filePath = dirPath + File.separator + fileName;System.out.println(filePath);
			part.write(filePath);
		}
		return fileName;
	}
	public static String uploadAdmin(String nameInput, HttpServletRequest request) throws ServletException, IOException {
		Part part = request.getPart(nameInput);
		String fileName = rename(part.getSubmittedFileName());// ten file
		if (!"".equals(fileName)) {
			String dirPath = request.getServletContext().getRealPath("") + GlobalConstant.DIR_UPLOAD;
			// System.out.println(dirPath); Ä‘á»‹a chá»‰ Ä‘Æ°á»�ng dáº«n Ä‘áº¿n file
			File saveDir = new File(dirPath);// java.io
			if (!saveDir.exists()) {
				saveDir.mkdirs();
			}
			String filePath = dirPath + File.separator + fileName;System.out.println(filePath);
			part.write(filePath);
		}
		return fileName;
	}
	public static boolean delFile(String fileName, HttpServletRequest request) {
		if (!"".equals(fileName)) {
			String filePath = request.getServletContext().getRealPath("") + GlobalConstant.DIR_UPLOAD +File.separator+ fileName;
			System.out.println(filePath);
			File file = new File(filePath);
			return file.delete();
		}
		return false;
	}
}
