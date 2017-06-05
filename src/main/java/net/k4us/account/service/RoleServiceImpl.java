package net.k4us.account.service;

import net.k4us.account.model.Role;
import net.k4us.account.repository.RoleRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class RoleServiceImpl implements RoleService {
	@Autowired
	private RoleRepository roleRepository;

	@Override
	public void save(Role role) {
		roleRepository.save(role);
	}

	@Override
	public Role findById(long id) {
		return roleRepository.findById(id);
	}

	@Override
	public Role findByName(String name) {
		return roleRepository.findByName(name);
	}

	@Override
	public ArrayList<Role> getAll() {
		return roleRepository.findAll();
	}
}
