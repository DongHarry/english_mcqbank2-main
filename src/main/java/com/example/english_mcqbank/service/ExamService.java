package com.example.english_mcqbank.service;

import com.example.english_mcqbank.model.Exam;
import com.example.english_mcqbank.model.Question;
import com.example.english_mcqbank.model.Result;
import com.example.english_mcqbank.model.UserEntity;
import com.example.english_mcqbank.repository.ExamRepository;
import com.example.english_mcqbank.repository.ResultRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ExamService {
    @Autowired
    private ResultRepository resultService;
    @Autowired
    private QuestionService questionService;


    @Autowired
    private ExamRepository examRepository;

    public List<Exam> getAllExams(int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        return examRepository.findAll(pageable).getContent();
    }

    public void saveExam(Exam exam) {
        examRepository.save(exam);
    }

    public Exam getExamById(int id) {
        return examRepository.findById(id).orElse(null);
    }

    public void deleteExam(Exam exam) {
        resultService.deleteAllByExam(exam);
        examRepository.delete(exam);
    }

    public List<Result> getResultsByExamId(int examId, int page, int size) {
        Exam exam = examRepository.findById(examId).orElse(null);

        if (exam == null) {
            return null;
        }
        Pageable pageable = PageRequest.of(page, size);

        return resultService.findAllByExam(exam, pageable);
    }

    public List<Result> getResultsByExamId(int examId) {
        Exam exam = examRepository.findById(examId).orElse(null);

        if (exam == null) {
            return null;
        }

        return resultService.findAllByExam(exam);
    }

    public Map<Long, Integer> getTopicNumOfQuMap(Map<String, String> requestParams) {
        Map<Long, Integer> topicNumOfQuMap = new HashMap<>();
        for (Map.Entry<String, String> entry : requestParams.entrySet()) {
            String paramName = entry.getKey();
            String paramValue = entry.getValue();

            // Kiểm tra các paramName để xác định danh sách topic và numQu
            // Ví dụ: paramName có dạng "topic1", "numQu.OfTopic1", ...
            if (paramName.startsWith("topic")) {
                // Xử lý danh sách topic được chọn (paramValue chứa giá trị của topic.id)
                Long topicId = Long.parseLong(paramValue);
                // Tạo tên tham số numOfQu tương ứng
                String numOfQuParamName = "numQu.OfTopic" + topicId;
                // Lấy giá trị numOfQu từ requestParams dựa vào tên tham số numOfQu tương ứng
                String numOfQuValue = requestParams.get(numOfQuParamName);
                // Chuyển đổi giá trị numOfQu từ String sang Integer (hoặc bạn có thể sử dụng parseInt)
                Integer numOfQu = Integer.valueOf(numOfQuValue);

                // Đưa cặp topicId và numOfQu vào Map
                topicNumOfQuMap.put(topicId, numOfQu);
            }
        }
        return topicNumOfQuMap;
    }

    public int calculateScore(Map<String, String> params) {
        int score = 0;
        for (String paramName : params.keySet()) {
            if (paramName.startsWith("question_")) {
                int questionId = Integer.parseInt(paramName.substring("question_".length()));
                Question question = questionService.get(questionId);
                //Question question = questionMap.get(questionId);
                String selectedOption = params.get(paramName);
                // Do something with the selected option for each question (e.g., save to database)
                if (selectedOption.equals(question.getCorrectAnswer())) {
                    score++;
                }
                //System.out.println("Question " + questionId + ": Selected Option: " + selectedOption);
            }

        }
        return score;
    }


    public List<Exam> getAllExams() {
        return examRepository.findAll();
    }
}
