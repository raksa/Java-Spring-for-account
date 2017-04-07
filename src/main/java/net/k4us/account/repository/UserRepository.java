package net.k4us.account.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import net.k4us.account.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
}
