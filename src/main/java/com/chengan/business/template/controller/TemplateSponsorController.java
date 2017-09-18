package com.chengan.business.template.controller;

import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.chengan.business.base.BaseController;
import com.chengan.business.repo.model.JkSponsor;
import com.chengan.business.sponsor.service.SponsorService;
import com.github.pagehelper.Page;

/**
 * 
 * @author y
 *
 */
@Controller
@RequestMapping("/template/sponsor")
public class TemplateSponsorController extends BaseController {
	@Autowired
	SponsorService sponsorService;

	@RequestMapping(value = "getSponsorListPage", method = RequestMethod.GET)
	@ResponseBody
	public Map<Object, Object> getAdListPage(String moduleName, Integer isShow, HttpServletRequest request,
			Integer pageNumber, Integer pageSize) {
		System.out.println("1.根据参数获取标签列表");
		Page<JkSponsor> list = (Page<JkSponsor>) sponsorService.getListPage(moduleName, isShow, pageNumber, pageSize);

		Map<Object, Object> result = new HashMap<Object, Object>();
		result = getResult("rows", list);
		result.put("total", list.getTotal());
		return result;
	}

	@RequestMapping(value = "saveOrUpdate", method = RequestMethod.POST)
	public ModelAndView saveOrUpdate(HttpServletRequest request, JkSponsor jkSysModule) throws ParseException {
		System.out.println(jkSysModule.getId());
		sponsorService.saveOrUpdate(jkSysModule);
		System.out.println(jkSysModule.getId());
		return new ModelAndView("redirect:/template/login/toGrid?gridName=sponsor");
	}

	@RequestMapping(value = "deleteById", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> delete(HttpServletRequest request, Integer id) {
		sponsorService.delete(id);
		return getResult(true, "");
	}
}
