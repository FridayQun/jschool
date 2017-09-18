package com.chengan.business.sponsor.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chengan.business.repo.model.JkSponsor;
import com.chengan.business.sponsor.service.SponsorService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/sponsor")
public class SponsorController {
	@Autowired
	SponsorService sponsorService;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "getListPage", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getListPage(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<JkSponsor> sponsorList = sponsorService.getListPage(null, 0, null, 0);

		map.put("sponsors", sponsorList);

		return map;
	}

}
