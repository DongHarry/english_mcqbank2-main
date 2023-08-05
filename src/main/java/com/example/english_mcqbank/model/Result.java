package com.example.english_mcqbank.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;

@Entity(name = "results")
@Table(name = "results")
@AllArgsConstructor
@NoArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
@Data
public class Result {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "rs_id")
    private Integer id;

    @Column(name = "rs_score")
    private Integer score;

    @Column(name = "rs_time")
    private Date time;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "us_id")
    @JsonIgnore
    private UserEntity user;

//    @Column(name = "exam_ex_id")
//    private Integer examId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ex_id")
    private Exam exam;

    public void setExamId(Integer examId) {
        exam.setId(examId);
    }

    public int getExamId() {
        return exam.getId();
    }
}
