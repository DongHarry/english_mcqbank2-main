package com.example.english_mcqbank.service;

import com.example.english_mcqbank.model.Question;
import com.example.english_mcqbank.model.Topic;
import org.springframework.transaction.annotation.Transactional;

import java.io.InputStream;
import java.util.List;

public interface IQuestionService {
    List<Question> listAll();

    Question save(Question question);

    Question get(int id);

    @Transactional
    void delete(int id);

    List<Question> findByTopicId(int topicId);

    List<Question> findByTopicIdAndLevel(int topicId, int level);

    List<Question> getRandom(int topicId, int level, int number);

    List<Question> getAllQuestions(int page, int size);

    List<Question> getRandom(Integer topicId, int level, int number, int examType);

    List<Question> getAllQuestions();

    Question getQuestionById(int id);

    int countAllByTopic(Topic topic);

    void delete(Question question);

    boolean existByContent(String content);

    List<Question> saveFromCSV(InputStream is);
}
