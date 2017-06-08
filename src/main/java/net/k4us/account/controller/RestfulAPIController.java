package net.k4us.account.controller;

import java.util.concurrent.atomic.AtomicLong;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import net.k4us.account.mail.ApplicationMailer;
import net.k4us.account.model.User;
import net.k4us.account.pojo.Greeting;
import net.k4us.account.service.UserService;

@RestController
@RequestMapping("/rest-api")
public class RestfulAPIController {

	@Autowired
	private ApplicationMailer applicationMaler;

	@Autowired
	private UserService userService;

	private static final String template = "Hello, %s!";
	private final AtomicLong counter = new AtomicLong();

	@RequestMapping(value = "/greeting", method = RequestMethod.GET)
	@ResponseBody
	public Greeting greeting(@RequestParam(value = "name", defaultValue = "World") String name) {
		return new Greeting(counter.incrementAndGet(), String.format(template, name));
	}

	@RequestMapping(value = "/get-user", method = RequestMethod.POST)
	public ResponseEntity<User> posting(@RequestBody GetUserReqData data) {
		User user = userService.findById(data.id);
		return new ResponseEntity<>(user, HttpStatus.OK);
	}

	@RequestMapping(value = "/send-mail", method = RequestMethod.POST)
	public ResponseEntity<SendMailResData> sendMail(@RequestBody SendMailReqData data) {
		try {
			applicationMaler.sendPreConfiguredMail(data.message);
		} catch (Exception e) {
			return new ResponseEntity<>(new SendMailResData("fail to send mail"), HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<>(new SendMailResData("mail has been sent!"), HttpStatus.OK);
	}
}

class GetUserReqData {
	public int id;
}

class SendMailReqData {
	public String message;
}

class SendMailResData {
	public String msg;

	public SendMailResData(String msg) {
		this.msg = msg;
	}
}