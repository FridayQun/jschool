package com.chengan.business.foot.controller;

import java.util.Date;
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

import com.chengan.business.base.BaseController;
import com.chengan.business.foot.service.FooterService;
import com.chengan.business.repo.model.JkFoot;
import com.chengan.business.repo.model.JkFootDetail;

@Controller
@RequestMapping("/footerInfor")
public class FooterController extends BaseController {
	@Autowired
	FooterService footerService;

	@RequestMapping(value = "/getFooter", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getFooter(HttpServletRequest req) {
		Map<String, Object> map = new HashMap<>();
		List<JkFoot> foots = footerService.getListPage(null, null, null, null);
		map.put("foots", foots);
		return map;
	}
	
	@RequestMapping(value = "/getFooterDetailByPId", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getFooterDetailByPId(@RequestParam(required = true) Integer pId) {
		Map<String, Object> map = new HashMap<>();
		List<JkFootDetail> footDetails = footerService.getDetailListPage(pId, null, null);
		map.put("footDetails", footDetails);
		return map;
	}
}
