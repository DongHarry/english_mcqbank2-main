package com.example.english_mcqbank.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "questions")
@AllArgsConstructor
@NoArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
@Data
public class Question {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "qu_id")
    private Integer id;

    @Column(name = "qu_content")
    private String content;

    @Column(name = "qu_option1")
    private String option1;

    @Column(name = "qu_option2")
    private String option2;

    @Column(name = "qu_option3")
    private String option3;

    @Column(name = "qu_option4")
    private String option4;

    @Column(name = "qu_answer")
    private Integer answer;

    @Column(name = "qu_explain")
    private String explain;

    @Column(name = "qu_type")
    private Integer type;

    @Column(name = "tp_id")
    private Integer topicId;

//    @ManyToOne(fetch = FetchType.LAZY)
//    @JoinColumn(name = "tp_id")
//    private Topic topic;

    @Column(name = "DIFFICULT_LEVEL")
    private Integer level;

    @Transient
    public String getCorrectAnswer() {
        if (answer == 1) {
            return option1;
        } else if (answer == 2) {
            return option2;
        } else if (answer == 3) {
            return option3;
        } else if (answer == 4) {
            return option4;
        }

        return null;
    }

}
