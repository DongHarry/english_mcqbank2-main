package com.example.english_mcqbank.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;

@Entity(name = "logs")
@Table(name = "logs")
@AllArgsConstructor
@NoArgsConstructor
@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class Log {
    @Id
    @Column(name = "lg_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private String id;

    @Column(name = "lg_name")
    private String name;

    @Column(name = "lg_status")
    private int status;

    @Column(name = "lg_datetime")
    private Date datetime;

//    @Column(name = "us_id")
//    private String userid;

    @ManyToOne
    @JoinColumn(name = "us_id")
    private UserEntity user;

}
