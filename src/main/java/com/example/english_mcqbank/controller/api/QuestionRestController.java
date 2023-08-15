package com.example.english_mcqbank.controller.api;

import com.example.english_mcqbank.model.Question;
import com.example.english_mcqbank.service.IQuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/questions")
public class QuestionRestController {
    @Autowired
    private IQuestionService IQuestionService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ResponseEntity<List<Question>> list() {
        List<Question> questions = IQuestionService.getAllQuestions();
        return ResponseEntity.ok(questions);
    }


    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ResponseEntity<Question> get(@PathVariable int id) {
        Question question = IQuestionService.get(id);
        return ResponseEntity.ok(question);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Question> delete(@PathVariable int id) {
        Question question = IQuestionService.get(id);
        return ResponseEntity.ok(question);
    }

    @RequestMapping("/random")
    public ResponseEntity<List<Question>> getRandom(@RequestParam(defaultValue = "1") int topicId,
                                                    @RequestParam(defaultValue = "1") int level,
                                                    @RequestParam(defaultValue = "1") int number) {
        List<Question> questions = IQuestionService.getRandom(topicId, level, number);
        return ResponseEntity.ok(questions);
    }

    @RequestMapping("/save")
    public ResponseEntity<Question> save(@RequestBody Question question) {
        Question question1 = IQuestionService.save(question);
        return ResponseEntity.ok(question1);
    }


}
