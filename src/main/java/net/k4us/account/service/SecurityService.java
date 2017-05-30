package net.k4us.account.service;

public interface SecurityService {
	String findLoggedInUsername();

	void autologin(String username, String password);
}
