package net.k4us.account.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.Assert;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({ "classpath:appconfig-root.xml" })
public class RoleControllerTest {
	@Autowired
	private RoleController roleController;

	@Test
	public void test() {
		Assert.assertNotNull(roleController);
	}

}
