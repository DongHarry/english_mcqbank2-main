package com.example.english_mcqbank.repository;

import com.example.english_mcqbank.model.Topic;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TopicRepository extends JpaRepository<Topic, Integer> {
}
