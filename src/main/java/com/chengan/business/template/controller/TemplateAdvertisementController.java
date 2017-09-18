package com.chengan.business.template.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.chengan.business.advertisement.service.AdvertisementService;
import com.chengan.business.base.BaseController;
import com.chengan.business.repo.model.JkAdvertisement;
import com.github.pagehelper.Page;

/**
 * 
 * @author y
 *
 */
@Controller
@RequestMapping("/template/advertisement")
public class TemplateAdvertisementController extends BaseController {
	@Autowired
	AdvertisementService advertisementService;

	@RequestMapping(value = "getAdListPage", method = RequestMethod.GET)
	@ResponseBody
	public Map<Object, Object> getAdListPage(String title, Integer type, HttpServletRequest request, Integer pageNumber,
			Integer pageSize) {
		// 1.根据参数获取标签列表
		Page<JkAdvertisement> list = (Page<JkAdvertisement>) advertisementService.getListPageOfAdWithoutTime(title,
				type, pageNumber, pageSize);

		Map<Object, Object> result = new HashMap<Object, Object>();
		result = getResult("rows", list);
		result.put("total", list.getTotal());
		return result;
	}

	@RequestMapping(value = "saveOrUpdate", method = RequestMethod.POST)
	public ModelAndView saveOrUpdate(HttpServletRequest request, Integer id, String title, String image, String url,
			Integer type, Integer level, String createTime,
			@RequestParam(required = false, defaultValue = "2017-01-01") String startTime,
			@RequestParam(required = false, defaultValue = "2100-01-01") String endTime) throws ParseException {
		JkAdvertisement jkAdvertisement = new JkAdvertisement();
		jkAdvertisement.setId(id);
		jkAdvertisement.setTitle(title);
		jkAdvertisement.setImage(image);
		jkAdvertisement.setUrl(url);
		jkAdvertisement.setType(type);
		jkAdvertisement.setLevel(level);
		jkAdvertisement.setCreateTime(new Date());
		jkAdvertisement.setStartTime(new SimpleDateFormat("yyyy-MM-dd").parse(startTime));
		jkAdvertisement.setEndTime(new SimpleDateFormat("yyyy-MM-dd").parse(endTime));
		advertisementService.saveOrUpdate(jkAdvertisement);
		return new ModelAndView("redirect:/template/login/toGrid?gridName=AdGrid");
	}

	@RequestMapping(value = "deleteById", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> delete(HttpServletRequest request, Integer id) {
		advertisementService.delete(id);
		return getResult(true, "");
	}
}
