package net.k4us.account.model;


import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "user_account")
public class User {
    private Long id;
    private String username;
    private String email;
    private String password;
    private String passwordConfirm;
    private Set<Role> roles;
    
    @Id
    @Column(name = "ID")
//    Enable here for MySQL
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    
//  Enable here for Oracle XE
//    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "USER_ACCOUNT_SEQ")
//    @SequenceGenerator(name = "USER_ACCOUNT_SEQ", sequenceName = "USER_ACCOUNT_SEQ", allocationSize = 1, initialValue = 1)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Transient
    public String getPasswordConfirm() {
        return passwordConfirm;
    }

    public void setPasswordConfirm(String passwordConfirm) {
        this.passwordConfirm = passwordConfirm;
    }

    @ManyToMany
    @JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_account_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }
}
