package net.k4us.account.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import net.k4us.account.model.Role;

public interface RoleRepository extends JpaRepository<Role, Long>{
}
