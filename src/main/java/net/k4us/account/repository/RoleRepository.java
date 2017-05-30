package net.k4us.account.repository;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;

import net.k4us.account.model.Role;

public interface RoleRepository extends JpaRepository<Role, Long> {
	Role findById(long id);

	Role findByName(String name);

	ArrayList<Role> findAll();
}
