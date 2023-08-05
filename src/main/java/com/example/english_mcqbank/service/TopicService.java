package com.example.english_mcqbank.service;

import com.example.english_mcqbank.model.Topic;
import com.example.english_mcqbank.repository.TopicRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TopicService {
    @Autowired
    private TopicRepository topicRepository;

    public List<Topic> getAllTopics() {
        return topicRepository.findAll();
    }

    public Topic getTopicById(Integer topicId) {
        return topicRepository.findById(topicId).orElse(null);
    }
}
