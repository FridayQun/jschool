package com.chengan.business;

import com.chengan.business.project.dao.ProjectDao;
import com.chengan.business.repo.entity.JkProjectApplyMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)  //使用junit4进行测试

public class test {
	@Autowired
	JkProjectApplyMapper mapper;

	@Test
	public void test() {
		ProjectDao projectDao = new ProjectDao();
		List<Integer> result = projectDao.getTimeList();
		for(Integer a : result){
			System.out.println(a);
		}
	}

	public static void main(String[] args) {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date2 = sdf.format(date);
		System.out.println(date2);
		System.out.println(sdf.format(new Date(date.getTime() - 1 * 24 * 60 * 60 * 1000)) + " " + "00:00:00");
		System.out.println(sdf.format(new Date(date.getTime() - 1 * 24 * 60 * 60 * 1000)) + " " + "23:59:59");
	}

}
