package com.example.english_mcqbank.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "exams")
@AllArgsConstructor
@NoArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
@Data
public class Exam {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ex_id")
    private Integer id;

    @Column(name = "ex_percent")
    private Integer percent;

    @Column(name = "tp_id")
    private Integer topicId;

    @Column(name = "ex_question_no")
    private Integer questionNo;

    @Column(name = "ex_time")
    private Date time;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "exam")
    //@Fetch(value = FetchMode.SUBSELECT)
    //@JoinColumn(name = "ex_id")
    private List<Result> resultList;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "exam")
    //@Fetch(value = FetchMode.SUBSELECT)
    //@JoinColumn(name = "ex_id")
    private List<ExamTopic> examTopicList;

    public void addExamTopic(ExamTopic examTopic) {
        if (examTopicList == null) {
            examTopicList = new ArrayList<>();
        }

        if (examTopicList.contains(examTopic)) {
            return;
        }
        examTopic.setExam(this);
        examTopicList.add(examTopic);
    }
}
