package net.k4us.account.mail;

import javax.mail.Message;
import javax.mail.MessagingException;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.icegreen.greenmail.util.GreenMail;
import com.icegreen.greenmail.util.GreenMailUtil;
import com.icegreen.greenmail.util.ServerSetup;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({ "classpath:appconfig-root.xml" })
@TestPropertySource("classpath:application.properties")
public class ApplicationMailerTest {
	private GreenMail testSmtp;

	@Value("${mail.host}")
	String mailHost;
	@Value("${mail.protocol}")
	String mailProtocol;
	@Value("${mail.port}")
	int mailPort;
	@Value("${mail.sender.email}")
	String mailSenderEmail;
	@Value("${mail.sender.password}")
	String mailSenderPassword;
	@Value("${mail.receiver.email}")
	String mailReceiverEmail;

	@Autowired
	private MailSender mailSender;

	@Before
	public void testSmtpInit() {
		ServerSetup setup = new ServerSetup(mailPort, mailHost, mailProtocol);
		testSmtp = new GreenMail(setup);
		testSmtp.start();
	}

	@Test
	public void testEmail() throws InterruptedException, MessagingException {
		String subject = "Hi There!!";
		String body = "How are you?";

		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(mailReceiverEmail);
		message.setSubject(subject);
		message.setText(body);
		mailSender.send(message);

		Message[] messages = testSmtp.getReceivedMessages();
		Assert.assertEquals(1, messages.length);
		Assert.assertEquals(subject, messages[0].getSubject());
		String receiverBody = GreenMailUtil.getBody(messages[0]);
		Assert.assertEquals(body, receiverBody);
	}

	@After
	public void cleanup() {
		testSmtp.stop();
	}

}
