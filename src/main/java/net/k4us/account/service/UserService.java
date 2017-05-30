package net.k4us.account.service;

import net.k4us.account.model.User;

public interface UserService {
	void save(User user);

	User findByUsername(String username);

	User findByEmail(String email);
}
