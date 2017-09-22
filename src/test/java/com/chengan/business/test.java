package com.chengan.business;

import com.chengan.business.project.dao.ProjectDao;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.chengan.business.repo.entity.JkProjectApplyMapper;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)  //使用junit4进行测试
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
		"file:src/main/webapp/WEB-INF/spring/root-context.xml","classpath:mybatis-config.xml",
"classpath:/mybatis-generator/generatorConfig.xml","classpath:/com/chengan/business/repo/persistence/*"})
@TransactionConfiguration(transactionManager="transactionManager",defaultRollback=false)
@Transactional
public class test extends AbstractTransactionalJUnit4SpringContextTests {
	@Autowired
	ProjectDao projectDao;

	@Test
	public void test() {
		List<Integer> result = projectDao.getTimeList();
		System.out.println("we come to here!");
		for(Integer a : result){
			System.out.println(a);
			System.out.println("we come to here!");
		}
	}

	public static void main(String[] args) {
		//System.getProperty("java.class.path");

//		Date date = new Date();
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		String date2 = sdf.format(date);
//		System.out.println(date2);
//		System.out.println(sdf.format(new Date(date.getTime() - 1 * 24 * 60 * 60 * 1000)) + " " + "00:00:00");
//		System.out.println(sdf.format(new Date(date.getTime() - 1 * 24 * 60 * 60 * 1000)) + " " + "23:59:59");
	}

}
