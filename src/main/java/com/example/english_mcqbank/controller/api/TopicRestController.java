package com.example.english_mcqbank.controller.api;

import com.example.english_mcqbank.model.Topic;
import com.example.english_mcqbank.service.ITopicService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/topics")
public class TopicRestController {
    private final ITopicService topicService;

    @RequestMapping("/")
    public ResponseEntity<List<Topic>> list() {
        List<Topic> topics = topicService.getAllTopics();
        return ResponseEntity.ok(topics);
    }

    @RequestMapping("/{id}")
    public ResponseEntity<Topic> get(@PathVariable int id) {
        Topic topic = topicService.getTopicById(id);
        return ResponseEntity.ok(topic);
    }
}
