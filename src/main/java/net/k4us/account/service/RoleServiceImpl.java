package net.k4us.account.service;

import net.k4us.account.model.Role;
import net.k4us.account.repository.RoleRepository;
import net.k4us.account.repository.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class RoleServiceImpl implements RoleService {
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private RoleRepository roleRepository;

	@Override
	public void save(Role role) {
		// TODO Auto-generated method stub

	}

	@Override
	public Role findById(long id) {
		return roleRepository.findById(id);
	}

	@Override
	public Role findByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Role> getAll() {
		return roleRepository.findAll();
	}
}
