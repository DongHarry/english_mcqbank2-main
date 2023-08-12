package com.example.english_mcqbank.service;

import com.example.english_mcqbank.model.Question;
import com.example.english_mcqbank.model.Topic;
import com.example.english_mcqbank.repository.QuestionRepository;
import com.example.english_mcqbank.util.CsvUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.InputStream;
import java.util.List;

@Service
@RequiredArgsConstructor
public class QuestionService implements IQuestionService {
    private final QuestionRepository questionRepository;
    private final CsvUtils csvUtils;

    @Override
    public List<Question> listAll() {
        return questionRepository.findAll();
    }

    @Override
    @CachePut(value = "questionCache", key = "#question.id")
    public Question save(Question question) {
        return questionRepository.save(question);
    }

    @Override
    @Cacheable(value = "questionCache", key = "#id")
    public Question get(int id) {
        return questionRepository.findById(id).orElse(null);
    }

    @Override
    @Transactional
    @CacheEvict(value = "questionCache", key = "#id")
    public void delete(int id) {
        questionRepository.deleteById(id);
    }

    @Override
    public List<Question> findByTopicId(int topicId) {
        return questionRepository.findByTopicId(topicId);
    }

    @Override
    public List<Question> findByTopicIdAndLevel(int topicId, int level) {
        return questionRepository.findByTopicIdAndLevel(topicId, level);
    }

    @Override
    public List<Question> getRandom(int topicId, int level, int number) {
        if (topicId <= 0) {
            return questionRepository.findRandomQuestions(number,1);
        }

        if (level <= 0) {
            return questionRepository.findRandomQuestions(topicId, number,1);
        }

        return questionRepository.findRandomQuestions(topicId, level, number, 1);
    }

    @Override
    public List<Question> getAllQuestions(int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        return questionRepository.findAll(pageable).getContent();
    }

    @Override
    public List<Question> getRandom(Integer topicId, int level, int number, int examType) {
            if (topicId <= 0) {
                return questionRepository.findRandomQuestions(number, examType);
            }

            if (level <= 0) {
                return questionRepository.findRandomQuestions(topicId, number, examType);
            }

            return questionRepository.findRandomQuestions(topicId, level, number, examType);

    }

    @Override
    @Cacheable(value = "questionCache")
    public List<Question> getAllQuestions() {
        return questionRepository.findAll();
    }

    @Override
    @Cacheable(value = "questionCache", key = "#id")
    public Question getQuestionById(int id) {
        return questionRepository.findById(id).orElse(null);
    }

    @Override
    public int countAllByTopic(Topic topic) {
        return questionRepository.countAllByTopic(topic);
    }

    @Override
    @CacheEvict(value = "questionCache", key = "#question.id")
    public void delete(Question question) {
        questionRepository.delete(question);
    }

    @Override
    public boolean existByContent(String content) {
        return questionRepository.existsByContent(content);
    }

    @Override
    public List<Question> saveFromCSV(InputStream is) {
        List<Question> questions = csvUtils.csvToQuestion(is);
        questionRepository.saveAll(questions);

        return questions;
    }
}
