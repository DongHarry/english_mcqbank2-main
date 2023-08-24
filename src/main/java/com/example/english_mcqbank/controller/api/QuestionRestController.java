package com.example.english_mcqbank.controller.api;

import com.example.english_mcqbank.model.Question;
import com.example.english_mcqbank.service.IQuestionService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/questions")
public class QuestionRestController {
    private final IQuestionService questionService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ResponseEntity<List<Question>> list() {
        List<Question> questions = questionService.getAllQuestions();
        return ResponseEntity.ok(questions);
    }


    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ResponseEntity<Question> get(@PathVariable int id) {
        Question question = questionService.get(id);
        return ResponseEntity.ok(question);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Question> delete(@PathVariable int id) {
        Question question = questionService.get(id);
        return ResponseEntity.ok(question);
    }

    @RequestMapping("/random")
    public ResponseEntity<List<Question>> getRandom(@RequestParam(defaultValue = "1") int topicId,
                                                    @RequestParam(defaultValue = "1") int level,
                                                    @RequestParam(defaultValue = "1") int number) {
        List<Question> questions = questionService.getRandom(topicId, level, number);
        return ResponseEntity.ok(questions);
    }

    @RequestMapping("/save")
    public ResponseEntity<Question> save(@RequestBody Question question) {
        Question question1 = questionService.save(question);
        return ResponseEntity.ok(question1);
    }


}
