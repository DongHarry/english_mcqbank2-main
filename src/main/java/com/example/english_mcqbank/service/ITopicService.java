package com.example.english_mcqbank.service;

import com.example.english_mcqbank.model.Topic;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface ITopicService {


    public List<Topic> getAllTopics();

    public Topic getTopicById(Integer topicId);

    public List<Topic> getAllTopics(int page, int size);

    @Transactional
    public void save(Topic topic);

    @Transactional
    public void deleteTopic(Topic topic);

    public boolean existsByName(String name);
}
