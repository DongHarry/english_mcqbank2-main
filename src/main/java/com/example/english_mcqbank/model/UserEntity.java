package com.example.english_mcqbank.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "users")
@AllArgsConstructor
@NoArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
@Data
public class UserEntity {
    @Id
    @Column(name = "us_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @JsonIgnore
    private int id;

    @Column(name = "us_username")
    private String username;

    @Column(name = "us_password")
    @JsonIgnore
    private String password;

    @Column(name = "us_fullname")
    private String fullName;

    @Column(name = "us_address")
    private String address;

    @Column(name = "us_created_date")
    private Date createdDate;

    @Column(name = "us_mobile_number")
    private String phone;

    @Column(name = "us_email")
    private String email;

    @Column(name = "us_status")
    @JsonIgnore
    private int status;

    @Column(name = "us_group")
    @JsonIgnore
    private int groupId;

//    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
//    private List<Log> logs = new ArrayList<>();

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JsonIgnore
    private List<Result> results;

    public UserEntity(String username, String password, String fullName, String address, String phone, String email, int status, int groupId) {
        this.username = username;
        this.password = password;
        this.fullName = fullName;
        this.address = address;
        this.phone = phone;
        this.email = email;
        this.status = status;
        this.groupId = groupId;
        this.createdDate = new Date();
    }

    public String[] getRoles() {
        if (this.groupId == 0) {
            return new String[]{"ROLE_ADMIN"};
        }
        return new String[]{"ROLE_USER"};
    }

    public boolean isEnabled() {
        return this.status == 1;
    }

    public void addResult(Result result) {
        if (results == null) {
            results = new ArrayList<>();
        }
        result.setUser(this);
        results.add(result);
    }
}
