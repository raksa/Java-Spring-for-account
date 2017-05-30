package net.k4us.account.service;

import java.util.ArrayList;

import net.k4us.account.model.Role;

public interface RoleService {
	void save(Role role);

	Role findById(long id);

	Role findByName(String name);

	ArrayList<Role> getAll();
}
