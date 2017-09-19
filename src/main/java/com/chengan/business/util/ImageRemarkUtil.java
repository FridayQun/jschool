package com.chengan.business.util;

import java.awt.AlphaComposite;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.imageio.ImageIO;
import javax.swing.ImageIcon;

/*******************************************************************************
 * Description: 图片水印工具类
 * @author zengshunyao
 * @version 1.0
 * 水印工具类
 */
public class ImageRemarkUtil {

	// 水印透明度
	private static float alpha = 0.5f;
	// 水印横向位置
	private static double positionWidth = 0.85;
	// 水印纵向位置
	private static double positionHeight = 0.85;

	/**
	 * @param alpha
	 *			水印透明度
	 * @param positionWidth
	 *			水印横向位置
	 * @param positionHeight
	 *			水印纵向位置
	 * @param font
	 *			水印文字字体
	 * @param color
	 *			水印文字颜色
	 */
	public static void setImageMarkOptions(float alpha, double positionWidth,
										   double positionHeight, Font font, Color color) {
		if (alpha != 0.0f)
			ImageRemarkUtil.alpha = alpha;
//		if (positionWidth != 0)
//			ImageRemarkUtil.positionWidth = positionWidth;
//		if (positionHeight != 0)
//			ImageRemarkUtil.positionHeight = positionHeight;
	}

	/**
	 * 给图片添加水印图片
	 *
	 * @param iconPath
	 *			水印图片路径
	 * @param srcImgPath
	 *			源图片路径
	 * @param targerPath
	 *			目标图片路径
	 */
	public static void markImageByIcon(String iconPath, String srcImgPath,
									   String targerPath) {
		markImageByIcon(iconPath, srcImgPath, targerPath, null);
	}

	/**
	 * 给图片添加水印图片、可设置水印图片旋转角度
	 *
	 * @param iconPath
	 *			水印图片路径
	 * @param srcImgPath
	 *			源图片路径
	 * @param targerPath
	 *			目标图片路径
	 * @param degree
	 *			水印图片旋转角度
	 */
	public static void markImageByIcon(String iconPath, String srcImgPath,
									   String targerPath, Integer degree) {
		OutputStream os = null;
		try {

			Image srcImg = ImageIO.read(new File(srcImgPath));

			BufferedImage buffImg = new BufferedImage(srcImg.getWidth(null),
					srcImg.getHeight(null), BufferedImage.TYPE_INT_RGB);

			// 1、得到画笔对象
			Graphics2D g = buffImg.createGraphics();

			// 2、设置对线段的锯齿状边缘处理
			g.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BILINEAR);

			g.drawImage(srcImg.getScaledInstance(srcImg.getWidth(null), srcImg.getHeight(null), Image.SCALE_SMOOTH), 0, 0, null);
			// 3、设置水印旋转
			if (null != degree) {
				g.rotate(Math.toRadians(degree), (double) buffImg.getWidth() / 2, (double) buffImg.getHeight() / 2);
			}

			// 4、水印图片的路径 水印图片一般为gif或者png的，这样可设置透明度
			ImageIcon imgIcon = new ImageIcon(iconPath);

			// 5、得到Image对象。
			Image img = imgIcon.getImage();

			g.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP, alpha));

			// 6、水印图片的位置
//			g.drawImage(img, (int) (buffImg.getWidth()*positionWidth), (int) (buffImg.getHeight()*positionHeight), (int) (buffImg.getWidth()*(1-positionWidth-0.05)), (int) (buffImg.getHeight()*(1-positionHeight-0.05)), null);
//			g.drawImage(img, positionWidth, positionHeight, null);
			g.drawImage(img, (int) (buffImg.getWidth()*positionWidth), (int) (buffImg.getHeight()*positionHeight), (int) (buffImg.getWidth()*(1-positionWidth-0.05)), (int) (buffImg.getHeight()*(1-positionHeight-0.05)), null);
			g.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_OVER));
			// 7、释放资源
			g.dispose();

			// 8、生成图片
			os = new FileOutputStream(targerPath);
			ImageIO.write(buffImg, "JPG", os);

			System.out.println("图片完成添加水印图片");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (null != os)
					os.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public static void main(String[] args) {
		String srcImgPath = "1.jpg";
		String iconPath = "2.png";

		String targerIconPath = "qie_icon.jpg";
		String targerIconPath2 = "qie_icon_rotate.jpg";

		System.out.println("给图片添加水印图片开始...");
		setImageMarkOptions(0.2f, 1, 1, null, null);
		// 给图片添加水印图片
		markImageByIcon(iconPath, srcImgPath, targerIconPath);
		// 给图片添加水印图片,水印图片旋转-45
		markImageByIcon(iconPath, srcImgPath, targerIconPath2, -45);
		System.out.println("给图片添加水印图片结束...");

	}

	public static File getFile(InputStream is, String fileName) throws IOException {
		String tmpdir = System.getProperty("java.io.tmpdir");
		if(tmpdir.endsWith(System.getProperty("file.separator")) == false) {
			tmpdir += System.getProperty("file.separator");
		}
		File file = new File(tmpdir, System.currentTimeMillis()+fileName);
		FileOutputStream fos = new FileOutputStream(file);
		int next = -1;
		while((next=is.read()) != -1) {
			fos.write(next);
		}
		fos.flush();
		fos.close();
		return file;
	}
}
