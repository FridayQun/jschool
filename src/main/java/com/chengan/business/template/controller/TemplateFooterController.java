package com.chengan.business.template.controller;

import java.text.ParseException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.chengan.business.base.BaseController;
import com.chengan.business.foot.service.FooterService;
import com.chengan.business.repo.model.JkFoot;
import com.chengan.business.repo.model.JkFootDetail;
import com.github.pagehelper.Page;

/**
 * 
 * @author y
 *
 */
@Controller
@RequestMapping("/template/footer")
public class TemplateFooterController extends BaseController {
	@Autowired
	FooterService footerService;

	@RequestMapping(value = "getFooterList", method = RequestMethod.GET)
	@ResponseBody
	public Map<Object, Object> getFooterList(HttpServletRequest request) {
		System.out.println("1.根据参数获取标签列表");
		List<JkFoot> list = footerService.getListPage(null, null, null, null);

		Map<Object, Object> result = new HashMap<Object, Object>();
		result = getResult("rows", list);
		result.put("total", list.size());
		return result;
	}
	
	@RequestMapping(value = "getFootPicById", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> getFootPicById(HttpServletRequest request, @RequestParam(required = false) Integer id) {
//		System.out.println("======================="+id);
		List<JkFootDetail> list = footerService.getDetailListPage(id, null, null);

		Map<Object, Object> result = new HashMap<Object, Object>();
		result = getResult("rows", list);
		result.put("total", list.size());
		return result;
	}

	@RequestMapping(value = "saveOrUpdate", method = RequestMethod.POST)
	public ModelAndView saveOrUpdate(HttpServletRequest request, @RequestParam(required = false) Integer id
			, @RequestParam(required = false) String name, @RequestParam(required = false) String enName
			, @RequestParam(required = false) String link, @RequestParam(required = false) String uri
			, @RequestParam(required = false) String description
			, @RequestParam(required = false) List<String> addedPic, @RequestParam(required = false) List<Integer> deletedPic) throws ParseException {
		JkFoot jkFoot = new JkFoot();
		jkFoot.setId(id); jkFoot.setFootName(name); jkFoot.setFootEnName(enName); jkFoot.setFootLink(link); jkFoot.setFootUri(uri); jkFoot.setFootDesc(description);
		footerService.saveOrUpdate(jkFoot);
		footerService.deleteList(null, deletedPic);
		footerService.saveList(jkFoot, addedPic);
		return new ModelAndView("redirect:/template/login/toGrid?gridName=footer");
	}

	@RequestMapping(value = "deleteById", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> delete(HttpServletRequest request, Integer id) {
		footerService.delete(id);
		footerService.deleteList(id, null);
		return getResult(true, "");
	}
}
