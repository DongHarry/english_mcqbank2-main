package com.example.english_mcqbank.service;

import com.example.english_mcqbank.model.Topic;
import com.example.english_mcqbank.repository.TopicRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class TopicService implements ITopicService {
    @Autowired
    private TopicRepository topicRepository;

    @Cacheable(value = "topicCache")
    public List<Topic> getAllTopics() {
        return topicRepository.findAll();
    }

    @Cacheable(value = "topicCache", key = "#topicId")
    public Topic getTopicById(Integer topicId) {
        return topicRepository.findById(topicId).orElse(null);
    }

    public List<Topic> getAllTopics(int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        return topicRepository.findAll(pageable).getContent();
    }

    @Transactional
    @CachePut(value = "topicCache", key = "#topic.id")
    public void save(Topic topic) {
        topicRepository.save(topic);
    }

    @Transactional
    @CacheEvict(value = "topicCache", key = "#topic.id")
    public void deleteTopic(Topic topic) {
        topicRepository.delete(topic);
    }

    public boolean existsByName(String name) {
        return topicRepository.existsByName(name);
    }
}
