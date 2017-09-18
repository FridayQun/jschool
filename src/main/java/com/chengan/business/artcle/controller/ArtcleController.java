package com.chengan.business.artcle.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.chengan.business.artcle.service.ArtcleService;
import com.chengan.business.base.BaseController;
import com.chengan.business.login.service.UserService;
import com.chengan.business.repo.model.JkNews;
import com.chengan.business.repo.model.JkUser;
import com.chengan.business.score.service.ScoreExchangeService;
import com.chengan.business.util.ImageRemarkUtil;
import com.chengan.business.util.OSSClientUtil;
import com.chengan.business.util.URLUtil;
import com.github.pagehelper.Page;
import com.mysql.jdbc.StringUtils;

import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping("/artcle")
public class ArtcleController extends BaseController {

	@Autowired
	ArtcleService artcleService;
	@Autowired
	UserService userService;
	@Autowired
	OSSClientUtil ossUtil;
	@Autowired
	ScoreExchangeService scoreExchangeService;

	/**
	 * 获取资讯详情
	 *
	 * @param
	 * @param
	 * @param
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value = "getNewsById", method = RequestMethod.GET)
	public ModelAndView getNewsById(Integer id) throws UnsupportedEncodingException {
		ModelAndView mv = new ModelAndView();
		JkNews jkNews = artcleService.getNewsById(id);
		mv.addObject("jkNews", jkNews);
		mv.setViewName("views/article.jsp");
		return mv;
	}

	@RequestMapping(value = "deleteNewsById", method = RequestMethod.GET)
	@ResponseBody
	public Map<Object, Object> deleteNewsById(@RequestParam(required = true) Integer id) throws UnsupportedEncodingException {
		if(id != null) {
			artcleService.delete(id);
		}
		return getResult("success", true);
	}

	/**
	 * 获取资讯列表
	 *
	 * @param request
	 * @param page
	 * @param pageSize
	 * @param title
	 *            标题
	 * @param type
	 *            类型
	 * @return
	 */
	@RequestMapping(value = "getNewsList", method = RequestMethod.GET)
	@ResponseBody
	public Map<Object, Object> getNewsList(HttpServletRequest request,
										   @RequestParam(required = false, defaultValue = "1") Integer page,
										   @RequestParam(required = false, defaultValue = "20") Integer pageSize,
										   @RequestParam(required = false) Integer uid, @RequestParam(required = false) String title,
										   @RequestParam(required = false) Integer type, @RequestParam(required = false) Long dateFrom,
										   @RequestParam(required = false, defaultValue = "1") Integer status,
										   @RequestParam(required = false, defaultValue = "istop desc,create_time desc") String orderStr) {
		if(dateFrom != null) {
			dateFrom *= 1000*3600*24;
			dateFrom = new Date().getTime() - dateFrom;
		}
		// 1.根据参数获取资讯列表
		List<JkNews> list = artcleService.getArtcleList(title, null, type, uid, status, dateFrom, orderStr, page, pageSize);
		// 2.转成page对象
		Page<JkNews> pageList = (Page<JkNews>) list;

		Map<Object, Object> map = getResult("newsList", list);
		// 分页总页数
		map.put("pages", pageList.getPages());
		// 分页总条数
		map.put("total", pageList.getTotal());
		return map;
	}

	@RequestMapping(value = "getNewsListallstauts", method = RequestMethod.GET)
	@ResponseBody
	public Map<Object, Object> getNewsListallstauts(HttpServletRequest request,
													@RequestParam(required = false, defaultValue = "1") Integer page,
													@RequestParam(required = false, defaultValue = "20") Integer pageSize,
													@RequestParam(required = false) Integer uid, @RequestParam(required = false) String title,
													@RequestParam(required = false) Integer type, @RequestParam(required = false) Integer status,
													@RequestParam(required = false, defaultValue = "istop desc,create_time desc") String orderStr) {
		// 1.根据参数获取资讯列表
		List<JkNews> list = artcleService.getArtcleList(title, null, type, uid, status, orderStr, page, pageSize);
		// 2.转成page对象
		Page<JkNews> pageList = (Page<JkNews>) list;

		Map<Object, Object> map = getResult("newsList", list);
		// 分页总页数
		map.put("pages", pageList.getPages());
		// 分页总条数
		map.put("total", pageList.getTotal());
		return map;
	}

	// 有cate
	@RequestMapping(value = "getNewsListallstauts", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> getNewsListallstautsWithCate(HttpServletRequest request,
															@RequestParam(required = false, defaultValue = "1") Integer page,
															@RequestParam(required = false, defaultValue = "20") Integer pageSize,
															@RequestParam(required = false) Integer uid, @RequestParam(required = false) String title,
															@RequestParam(required = false) Integer type, @RequestParam(required = false) Integer status,
															@RequestParam(required = false, defaultValue = "istop desc,create_time desc") String orderStr) {
		// 1.根据参数获取资讯列表
		List<Map<String, Object>> list = artcleService.getArtcleListWithCate(title, null, type, uid, status, orderStr, page, pageSize);
		// 2.转成page对象
		Page<Map<String, Object>> pageList = (Page<Map<String, Object>>) list;

		Map<Object, Object> map = getResult("newsList", list);
		// 分页总页数
		map.put("pages", pageList.getPages());
		// 分页总条数
		map.put("total", pageList.getTotal());
		return map;
	}

	/**
	 * 发布头条

	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value = "publishNews", method = RequestMethod.POST)
	public String publishNews(HttpServletRequest request, Model model, @RequestParam(required = true) String title,
							  @RequestParam(required = true) String source, @RequestParam(required = true) Integer sourceType,
							  @RequestParam(required = true) String type, @RequestParam(required = true) String content,
							  @RequestParam(required = false) String newsPicPath, @RequestParam(required = false) List<Integer> tags
			, @RequestParam(required = false) String from) throws UnsupportedEncodingException {
		URLUtil urlUtil = null;
		if(StringUtils.isNullOrEmpty(from)) {
			urlUtil = new URLUtil("/login/toHeadline");
		} else {
			urlUtil = new URLUtil(URLDecoder.decode(from, "utf-8"));
		}
		// 验证数据书否符合要求
		if (StringUtils.isNullOrEmpty(title) || StringUtils.isNullOrEmpty(source) || sourceType == null || type == null
				|| newsPicPath == null) {
			return "redirect:"+urlUtil.addParam("msgTip", "数据有问题").encodeParams();
		}
		// 获取当前登录用户(既操作者)
		HttpSession session = request.getSession();
		Object login_userId = session.getAttribute("login_userId");
		// 如果不为null，则说明用户已登录
		JkUser user = null;
		if (login_userId != null)
			user = userService.getUserById(Integer.valueOf(login_userId.toString()));
		// 若用户未登录，则返回主页
		if (user == null) {
			return "redirect:"+urlUtil.addParam("msgTip", "用户未登录").encodeParams();
		}
		// 2.保存
		artcleService.saveArtcle(title, source, sourceType, type, content, newsPicPath, tags, user);

		model.addAttribute("isPublish", "1");

		return "redirect:"+urlUtil.addParam("msgTip", "您发布的校园头条已提交审核，请您耐心等待。").encodeParams();
	}

	//加水印的上传
	@RequestMapping(value = "/Copyupload", method = RequestMethod.POST)
	public void Copyupload(@RequestParam(value = "upload", required = false) CommonsMultipartFile file,
						   @RequestParam(required = false, defaultValue = "0") Integer type,
						   @RequestParam(required = false, defaultValue = "0") Integer isCover,
						   HttpServletRequest request,
						   HttpServletResponse response) {
		try {
			PrintWriter out = response.getWriter();
			String CKEditorFuncNum = request.getParameter("CKEditorFuncNum");
			String uploadContentType = file.getContentType();
			if (uploadContentType.equals("image/pjpeg") || uploadContentType.equals("image/jpeg")) {
				// IE6上传jpg图片的headimageContentType是image/pjpeg，而IE9以及火狐上传的jpg图片是image/jpeg
			} else if (uploadContentType.equals("image/png") || uploadContentType.equals("image/x-png")) {
				// IE6上传的png图片的headimageContentType是"image/x-png"
			} else if (uploadContentType.equals("image/gif")) {
			} else if (uploadContentType.equals("image/bmp")) {
			} else {
				out.println("<script type=\"text/javascript\">");
				out.println("window.parent.CKEDITOR.tools.callFunction(" + CKEditorFuncNum + ",'',"
						+ "'文件格式不正确（必须为.jpg/.gif/.bmp/.png文件）');");
				out.println("</script>");
				return;
			}
			if (file.getSize() > 1024 * 1024 * 2) {
				out.println("<script type=\"text/javascript\">");
				out.println("window.parent.CKEDITOR.tools.callFunction(" + CKEditorFuncNum + ",''," + "'&#x5927;&#x5C0F;&#x4E0D;&#x80FD;&#x8D85;&#x8FC7;2M&#xFF01;');");
				out.println("</script>");
				return;
			}

			String name = getFileName(file);
			// 给图片添加水印
			ImageRemarkUtil.setImageMarkOptions(0.5f, 0.85, 0.85, null, null);

			File localFile = ImageRemarkUtil.getFile(file.getInputStream(), file.getOriginalFilename());
			// FIXME
			if(true) {
				String path = request.getSession().getServletContext().getRealPath(File.separator);
				if(path.endsWith(System.getProperty("file.separator")) == false) {
					path += System.getProperty("file.separator");
				}
				path += "resources"+System.getProperty("file.separator")+"artcle"+System.getProperty("file.separator")+"images"+System.getProperty("file.separator")+"watermark.jpg";
				ImageRemarkUtil.markImageByIcon(path, localFile.getAbsolutePath(), localFile.getAbsolutePath());
				System.out.println("IMAGE WATER MARKER SUCCESS!");
			}

			file.getInputStream().close();
			FileInputStream fis = new FileInputStream(localFile);
			ossUtil.uploadFile2OSS(fis, name);
			String url = ossUtil.getImgUrl(name);
			fis.close();

			// artcleService.saveFile(null,baseController.getUser(request).getId(),name,
			// url, 1, null);
			artcleService.saveFile(null, 5, name, url, 1, null);
			// 返回"图像"选项卡并显示图片 request.getContextPath()为web项目名
			out.println("<script type=\"text/javascript\">");
			out.println("window.parent.CKEDITOR.tools.callFunction(" + CKEditorFuncNum + ",'" + url + "','')");
			out.println("</script>");
			return;
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	/**
	 * 上传图片(富文本框)
	 *

	 *            文件列表
	 * @param type
	 *            上传方式，为1则产生缩略图
	 * @param isCover
	 *            是否覆盖
	 * @return
	 */
	@RequestMapping(value = "/upload1", method = RequestMethod.POST)
	public void uploadFile1(@RequestParam(value = "upload", required = false) CommonsMultipartFile file,
							@RequestParam(required = false, defaultValue = "0") Integer type,
							@RequestParam(required = false, defaultValue = "0") Integer isCover,
							HttpServletRequest request,
							HttpServletResponse response) {
		try {
			PrintWriter out = response.getWriter();
			String CKEditorFuncNum = request.getParameter("CKEditorFuncNum");
			String uploadContentType = file.getContentType();
			if (uploadContentType.equals("image/pjpeg") || uploadContentType.equals("image/jpeg")) {
				// IE6上传jpg图片的headimageContentType是image/pjpeg，而IE9以及火狐上传的jpg图片是image/jpeg
			} else if (uploadContentType.equals("image/png") || uploadContentType.equals("image/x-png")) {
				// IE6上传的png图片的headimageContentType是"image/x-png"
			} else if (uploadContentType.equals("image/gif")) {
			} else if (uploadContentType.equals("image/bmp")) {
			} else {
				out.println("<script type=\"text/javascript\">");
				out.println("window.parent.CKEDITOR.tools.callFunction(" + CKEditorFuncNum + ",'',"
						+ "'文件格式不正确（必须为.jpg/.gif/.bmp/.png文件）');");
				out.println("</script>");
				return;
			}
			if (file.getSize() > 1024 * 1024 * 2) {
				out.println("<script type=\"text/javascript\">");
				out.println("window.parent.CKEDITOR.tools.callFunction(" + CKEditorFuncNum + ",''," + "'&#x5927;&#x5C0F;&#x4E0D;&#x80FD;&#x8D85;&#x8FC7;2M&#xFF01;');");
				out.println("</script>");
				return;
			}

			String name = getFileName(file);
			// 给图片添加水印

			//ImageRemarkUtil.setImageMarkOptions(0.5f, 0.85, 0.85, null, null);
			//File localFile = ImageRemarkUtil.getFile(file.getInputStream(), file.getOriginalFilename());
			// FIXME
//			if(true) {
//				String path = request.getSession().getServletContext().getRealPath(File.separator);
//				if(path.endsWith(System.getProperty("file.separator")) == false) {
//					path += System.getProperty("file.separator");
//				}
//				path += "resources"+System.getProperty("file.separator")+"artcle"+System.getProperty("file.separator")+"images"+System.getProperty("file.separator")+"watermark.jpg";
//				ImageRemarkUtil.markImageByIcon(path, localFile.getAbsolutePath(), localFile.getAbsolutePath());
//				System.out.println("IMAGE WATER MARKER SUCCESS!");
//			}

			//file.getInputStream().close();
			//FileInputStream fis = new FileInputStream(localFile);
			ossUtil.uploadFile2OSS(file.getInputStream(), name);
			String url = ossUtil.getImgUrl(name);
			//fis.close();
			file.getInputStream().close();

			// artcleService.saveFile(null,baseController.getUser(request).getId(),name,
			// url, 1, null);
			artcleService.saveFile(null, 5, name, url, 1, null);
			// 返回"图像"选项卡并显示图片 request.getContextPath()为web项目名
			out.println("<script type=\"text/javascript\">");
			out.println("window.parent.CKEDITOR.tools.callFunction(" + CKEditorFuncNum + ",'" + url + "','')");
			out.println("</script>");
			return;
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	static String getFileName(MultipartFile file) {
		String originalFilename = file.getOriginalFilename();
		String substring = originalFilename.substring(originalFilename.lastIndexOf(".")).toLowerCase();
		Random random = new Random();
		String name = random.nextInt(10000) + System.currentTimeMillis() + substring;
		return name;
	}

	/**
	 * 普通上传
	 *
	 * @param files
	 * @param type
	 * @param isCover
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> uploadFile(@RequestParam(value = "file", required = false) CommonsMultipartFile[] files,
										  @RequestParam(required = false, defaultValue = "0") Integer type,
										  @RequestParam(required = false, defaultValue = "0") Integer isCover, HttpServletRequest request) throws IOException {

		List<String> urlList = new ArrayList<>();
		if (files == null)
			return getResult(false, "no files");
		if (isCover == 1 && files.length > 0) {
			files = new CommonsMultipartFile[] { files[files.length - 1] };
		}
		for (MultipartFile f : files) {
			String name = getFileName(f);

			// 给图片添加水印
			//ImageRemarkUtil.setImageMarkOptions(0.5f, 0.85, 0.85, null, null);
			//File localFile = ImageRemarkUtil.getFile(f.getInputStream(), f.getOriginalFilename());
			// FIXME
			if (name.endsWith(".jpg") || name.endsWith(".JPG") || name.endsWith(".png") || name.endsWith(".PNG")
					|| name.endsWith(".jpeg") || name.endsWith(".JPEG")) {
				/*if(true) {
					String path = request.getSession().getServletContext().getRealPath(File.separator);
					if(path.endsWith(System.getProperty("file.separator")) == false) {
						path += System.getProperty("file.separator");
					}
					path += "resources"+System.getProperty("file.separator")+"artcle"+System.getProperty("file.separator")+"images"+System.getProperty("file.separator")+"watermark.jpg";
					ImageRemarkUtil.markImageByIcon(path, localFile.getAbsolutePath(), localFile.getAbsolutePath());
				}*/
			}
			FileInputStream fis = (FileInputStream) (f.getInputStream());
			ossUtil.uploadFile2OSS(fis, name);

			String url = ossUtil.getImgUrl(name);
			urlList.add(url);
			urlList.add(f.getOriginalFilename());
			f.getInputStream().close();
			fis.close();
			InputStream is = null, is1 = null;
			ByteArrayOutputStream bos = null;
			FileInputStream fis2 = null;
			if (type != null && type == 1) {
				try {
					is = f.getInputStream();
					bos = new ByteArrayOutputStream();
					// 压缩图片
					if (name.endsWith(".jpg") || name.endsWith(".JPG") || name.endsWith(".png") || name.endsWith(".PNG")
							|| name.endsWith(".jpeg") || name.endsWith(".JPEG")) {
						Thumbnails.of(is).scale(0.4).toOutputStream(bos);
					}
					byte[] b = bos.toByteArray();
					is1 = new ByteArrayInputStream(b);
					//localFile = ImageRemarkUtil.getFile(is1, localFile.getName());
					// 添加水印
					// FIXME
//					if(true) {
//						String path = request.getSession().getServletContext().getRealPath(File.separator);
//						if(path.endsWith(System.getProperty("file.separator")) == false) {
//							path += System.getProperty("file.separator");
//						}
//						path += "resources"+System.getProperty("file.separator")+"artcle"+System.getProperty("file.separator")+"images"+System.getProperty("file.separator")+"watermark.jpg";
						//ImageRemarkUtil.markImageByIcon(path, localFile.getAbsolutePath(), localFile.getAbsolutePath());
//						//System.out.println("IMAGE WATER MARKER SUCCESS!");
//					}
					//fis2 = (FileInputStream)(is1);//new FileInputStream(localFile);
					String newName = name.substring(0, name.lastIndexOf(".")) + "_mini"
							+ name.substring(name.lastIndexOf("."));
					ossUtil.uploadFile2OSS(is1, newName);
					url = ossUtil.getImgUrl(newName);
					urlList.add(url);
				} catch (IOException e) {
					e.printStackTrace();
				} finally {
					try {
						is.close();
						is1.close();
						bos.close();
						//fis2.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		System.out.println("URL LIST:");
		System.out.println(urlList);
		return getResult("urlList", urlList);
	}

	/**
	 * 文件下载
	 */
	@RequestMapping(value = "/download", method = RequestMethod.POST)
	@ResponseBody
	public void download(String url, String fileName, HttpServletResponse response) {
		downloadFromUrl(url.split("Expires")[0].substring(0, url.split("Expires")[0].length() - 1),
				fileName.replace(" ", ""), "d:/whalkers", response);
	}

	public static String downloadFromUrl(String url, String name, String dir, HttpServletResponse response) {

		try {
			URL httpurl = new URL(url);
			String fileName = getFileNameFromUrl(url);
			System.out.println(fileName);
			File f = new File(dir + fileName);
			FileUtils.copyURLToFile(httpurl, f);
			// 以流的形式下载文件。
			InputStream fis = new BufferedInputStream(new FileInputStream(f));
			byte[] buffer = new byte[fis.available()];
			fis.read(buffer);
			fis.close();
			if (name.endsWith(".zip")) {
				response.setContentType("application/zip");
			} else {
				response.setContentType("application/x-download");
			}
			response.setHeader("Content-Disposition",
					"attachment;filename=\"" + new String((name).getBytes("gbk"), "iso8859-1") + "\"");
			ServletOutputStream ops = response.getOutputStream();
			OutputStream toClient = new BufferedOutputStream(ops);
			toClient.write(buffer);
			toClient.flush();
			toClient.close();
			ops.flush();
			ops.close();
		} catch (Exception e) {
			e.printStackTrace();
			return "Fault!";
		}
		return "Successful!";
	}

	public static String getFileNameFromUrl(String url) {
		String name = new Long(System.currentTimeMillis()).toString() + ".X";
		int index = url.lastIndexOf("/");
		if (index > 0) {
			name = url.substring(index + 1);
			if (name.trim().length() > 0) {
				return name;
			}
		}
		return name;
	}

}
