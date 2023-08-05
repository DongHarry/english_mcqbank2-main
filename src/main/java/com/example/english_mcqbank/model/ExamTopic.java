package com.example.english_mcqbank.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "exam_topic")
@AllArgsConstructor
@NoArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
@Data
public class ExamTopic {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "et_id")
    private Integer id;

//    @Column(name = "ex_id")
//    private Integer examId;

    @ManyToOne
    @JoinColumn(name = "ex_id")
    private Exam exam;

//    @Column(name = "tp_id")
//    private Integer topicId;

    @OneToOne
    @JoinColumn(name = "tp_id")
    private Topic topic;

    @Column(name = "et_percent")
    private Integer percent;


}
