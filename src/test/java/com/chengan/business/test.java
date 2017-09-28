package com.chengan.business;

import com.chengan.business.project.dao.ProjectDao;
import com.chengan.business.project.service.ProjectService;
import com.chengan.business.repo.model.SMSApplyEntity;
import com.chengan.business.task.QuartzJob;
import com.chengan.business.util.AlidayuSmsUtil;
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
import java.util.Date;
import java.util.List;
import java.util.Set;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)  //使用junit4进行测试
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
		"file:src/main/webapp/WEB-INF/spring/root-context.xml","classpath:mybatis-config.xml",
"classpath:/mybatis-generator/generatorConfig.xml","classpath:/com/chengan/business/repo/persistence/*"})
@TransactionConfiguration(transactionManager="transactionManager",defaultRollback=false)
@Transactional
public class test extends AbstractTransactionalJUnit4SpringContextTests {

	@Autowired
	QuartzJob quartzJob;

	@Test
	public void test() {
	    //测试申请项目后短信发送情况，定时发送短信，申请中的项目，如果当天有新增申请人，短信提醒查看。
		quartzJob.applyOnce();
	}
}
