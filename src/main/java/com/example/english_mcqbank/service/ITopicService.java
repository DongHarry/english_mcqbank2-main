package com.example.english_mcqbank.service;

import com.example.english_mcqbank.model.Topic;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface ITopicService {


    List<Topic> getAllTopics();

    Topic getTopicById(Integer topicId);

    List<Topic> getAllTopics(int page, int size);

    @Transactional
    void save(Topic topic);

    @Transactional
    void deleteTopic(Topic topic);

    boolean existsByName(String name);
}
