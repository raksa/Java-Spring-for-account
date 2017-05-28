package net.k4us.account.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "role")
public class Role {
    private Long id;
    private String name;
    private Set<User> users;

    @Id
    @Column(name = "ID")
//    Enable here for MySQL
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    
//    Enable here for Oracle XE
//    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ROLE_SEQ")
//    @SequenceGenerator(name = "ROLE_SEQ", sequenceName = "ROLE_SEQ", allocationSize = 1, initialValue = 1)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @ManyToMany(mappedBy = "roles")
    public Set<User> getUsers() {
        return users;
    }

    public void setUsers(Set<User> users) {
        this.users = users;
    }
}
