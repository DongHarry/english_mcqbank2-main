package com.example.english_mcqbank.controller.admin;

import com.example.english_mcqbank.exception.InvalidInputFileException;
import com.example.english_mcqbank.model.Question;
import com.example.english_mcqbank.model.Topic;
import com.example.english_mcqbank.service.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class QuestionController {
    final UserDetailsServiceImpl userService;
    final ILogService logService;
    final ITopicService topicService;
    final IQuestionService questionService;
    final IExamService examService;
    final IResultService resultService;
    final ISessionService sessionService;
    final IReadFileService readFileService;

    @RequestMapping(value = "/admin/questions", method = RequestMethod.GET)
    public ModelAndView questionList(@RequestParam(defaultValue = "0") int page,
                                     @RequestParam(defaultValue = "20") int size) {
        List<Question> questions = questionService.getAllQuestions();
        ModelAndView modelAndView = new ModelAndView("questionList");

        //modelAndView.addObject("loggedInUser", sessionService.getLoggedInUser());
        modelAndView.addObject("questions", questions);
        modelAndView.addObject("type", 1);
//        modelAndView.addObject("currentPage", page);
//        assert questions != null;
//        boolean hasNext = questions.size() >= size;
//        modelAndView.addObject("hasNext", hasNext);
        return modelAndView;
    }

    @RequestMapping(value = "/admin/questions/new", method = RequestMethod.GET)
    public ModelAndView addQuestion() {
        List<Topic> topics = topicService.getAllTopics();
        ModelAndView modelAndView = new ModelAndView("addQuestion");
        //modelAndView.addObject("loggedInUser", sessionService.getLoggedInUser());
        modelAndView.addObject("topics", topics);
        return modelAndView;
    }

    @RequestMapping(value = "/admin/addQuestion", method = RequestMethod.POST)
    public ModelAndView addQuestion(@RequestParam("content") String content,
                                    @RequestParam("option1") String option1,
                                    @RequestParam("option2") String option2,
                                    @RequestParam("option3") String option3,
                                    @RequestParam("option4") String option4,
                                    @RequestParam("answer") int correctAnswer,
                                    @RequestParam("explain") String explain,
                                    @RequestParam("topicId") int topicId,
                                    @RequestParam("level") int level,
                                    RedirectAttributes redirectAttributes) {
        if (questionService.existByContent(content)) {
            ModelAndView modelAndView = new ModelAndView("redirect:/admin/questions/new");
            redirectAttributes.addFlashAttribute("message", "Question already exists");
            return modelAndView;
        }

        ModelAndView modelAndView = new ModelAndView("redirect:/admin/questions");

        Question newQuestion = new Question();
        newQuestion.setContent(content);
        newQuestion.setOption1(option1);
        newQuestion.setOption2(option2);
        newQuestion.setOption3(option3);
        newQuestion.setOption4(option4);
        newQuestion.setAnswer(correctAnswer);
        newQuestion.setExplain(explain);
        newQuestion.setLevel(level);
        newQuestion.setTopic(topicService.getTopicById(topicId));
        newQuestion.setType(1);
        questionService.save(newQuestion);

        redirectAttributes.addFlashAttribute("message", "Question: " + newQuestion.getId().toString() + " added successfully");
        return modelAndView;
    }

    @RequestMapping(value = "/admin/questions/{id}", method = RequestMethod.GET)
    public ModelAndView editQuestion(@PathVariable("id") int id, Model model,
                                     @RequestParam(value = "type", defaultValue = "1") int type) {
        Question question = questionService.getQuestionById(id);

        ModelAndView modelAndView = new ModelAndView("editQuestion");
        //modelAndView.addObject("loggedInUser", sessionService.getLoggedInUser());
        modelAndView.addObject("c_question", question);
        model.addAttribute("c_question", question);
        model.addAttribute("type", type);
        return modelAndView;
    }

    @RequestMapping(value = "/admin/questions/{id}/edit", method = RequestMethod.POST)
    public ModelAndView editQuestionHandle(@ModelAttribute("c_question") Question c_question,
                                           @RequestParam(value = "type", defaultValue = "1") int type,
                                           RedirectAttributes redirectAttributes) {

        Question question = questionService.getQuestionById(c_question.getId());
        if (questionService.existByContent(c_question.getContent()) && !question.getContent().equals(c_question.getContent())) {
            ModelAndView modelAndView = new ModelAndView("redirect:/admin/questions/" + c_question.getId().toString());
            redirectAttributes.addFlashAttribute("e_message", "Question already exists");
            return modelAndView;
        }

        ModelAndView modelAndView = new ModelAndView("redirect:/admin/questions");
        if (question != null) {
            question.setContent(c_question.getContent());
            question.setAnswer(c_question.getAnswer());
            question.setOption1(c_question.getOption1());
            question.setOption2(c_question.getOption2());
            question.setOption3(c_question.getOption3());
            question.setOption4(c_question.getOption4());
            question.setExplain(c_question.getExplain());
            question.setLevel(c_question.getLevel());
            questionService.save(question);
            if (type == 2) {
                modelAndView = new ModelAndView("redirect:/admin/topics/" + question.getTopic().getId() + "/questions");
                redirectAttributes.addFlashAttribute("message", "Question: " + question.getId().toString() + " updated successfully");
                return modelAndView;
            }


            redirectAttributes.addFlashAttribute("message", "Question: " + question.getId().toString() + " updated successfully");
        }
        return modelAndView;
    }

    @RequestMapping(value = "/admin/questions/{id}/delete", method = RequestMethod.GET)
    public ModelAndView deleteQuestion(@PathVariable("id") int id,
                                       @RequestParam(value = "type", defaultValue = "1") int type,
                                       RedirectAttributes redirectAttributes) {
        Question question = questionService.getQuestionById(id);

        if (question != null) {
            if (type == 2) {
                ModelAndView modelAndView = new ModelAndView("redirect:/admin/topics/" + question.getTopic().getId() + "/questions");
                questionService.delete(question);
                redirectAttributes.addFlashAttribute("message", "Question: " + question.getId().toString() + " deleted successfully");
                return modelAndView;
            }

            ModelAndView modelAndView = new ModelAndView("redirect:/admin/questions");
            questionService.delete(question);
            redirectAttributes.addFlashAttribute("message", "Question: " + question.getId().toString() + " deleted successfully");
            return modelAndView;
        }


        ModelAndView modelAndView = new ModelAndView("redirect:/admin/questions");
        redirectAttributes.addFlashAttribute("e_message", "Question: " + (question != null ? question.getId().toString() : null) + " deleted failed");
        return modelAndView;
    }

    @RequestMapping(value = "/admin/questions/upload", method = RequestMethod.GET)
    public ModelAndView uploadQuestion() {
        // if csv
        // read file
        // save to db
        // return
        ModelAndView modelAndView = new ModelAndView("uploadQuestion");
        //modelAndView.addObject("loggedInUser", sessionService.getLoggedInUser());
        return modelAndView;
    }

    @RequestMapping(value = "/admin/questions/upload", method = RequestMethod.POST)
    public ModelAndView handleFileUpload(@RequestParam("file") MultipartFile file, Model model, RedirectAttributes redirectAttributes) {
        List<Question> data = new ArrayList<>();

        if (file != null) {
            try {
                if (file.getContentType().equals("text/csv")) {
                    data = readFileService.readCsvData(file);
                } else if (file.getContentType().equals("application/vnd.ms-excel") || file.getContentType().equals("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")) {
                    data = readFileService.readExcelData(file);
                } else {
                    model.addAttribute("error", "Invalid file format. Please upload a CSV or Excel file.");
                    ModelAndView modelAndView = new ModelAndView("redirect:/admin/questions/upload");
                    redirectAttributes.addFlashAttribute("e_message", "Invalid file format. Please upload a CSV or Excel file.");
                    return modelAndView;
                }

                model.addAttribute("data", data);
            } catch (IOException e) {
                model.addAttribute("error", "Error reading file: " + e.getMessage());
            } catch (InvalidInputFileException e) {
                ModelAndView modelAndView = new ModelAndView("redirect:/admin/questions/upload");
                redirectAttributes.addFlashAttribute("e_message", "Invalid input file");
                return modelAndView;
            } catch (Exception e) {
                ModelAndView modelAndView = new ModelAndView("redirect:/admin/questions/upload");
                redirectAttributes.addFlashAttribute("e_message", "Error reading file: " + e.getMessage());
                return modelAndView;
            }
        } else {
            model.addAttribute("error", "Please select a file to upload.");
        }

//        for (Question question : data) {
//            System.out.println(question);
//        }
        int i = 1;
        Map<Integer, Question> map = new java.util.HashMap<>();
        for (Question question : data) {
            map.put(i++, question);
        }
        sessionService.setAttribute("questionMap", map);

        ModelAndView modelAndView = new ModelAndView("addQuestions");
        //modelAndView.addObject("loggedInUser", sessionService.getLoggedInUser());
        modelAndView.addObject("questions", data);
        return modelAndView;
    }

    @RequestMapping(value = "/admin/questions/upload/save", method = RequestMethod.POST)
    public ModelAndView saveQuestions(@RequestParam("submitButton") String submitButton,
                                      @RequestParam(name = "paramList", defaultValue = "") String[] paramList,
                                      RedirectAttributes redirectAttributes) {
        Map<Integer, Question> map = (Map<Integer, Question>) sessionService.getAttribute("questionMap");
        ArrayList<Question> questions = null;
        if (submitButton.equals("save")) {
            Integer[] Ids = new Integer[paramList.length];
            if (paramList == null || paramList.length == 0) {
                ModelAndView modelAndView = new ModelAndView("redirect:/admin/questions/upload");
                redirectAttributes.addFlashAttribute("e_message", "Please select at least one question");
                return modelAndView;
            } else {
                int n = paramList[0].length();
                questions = new ArrayList<>();

                for (int i = 0; i < paramList.length; i++) {
                    Ids[i] = Integer.parseInt(paramList[i].charAt(n - 1) + "");
                }
                for (Integer id : Ids) {
                    questions.add(map.get(id));
                }
            }
        } else {
            questions = new ArrayList<>(map.values());
        }
        sessionService.removeAttribute("questionMap");

//        for (Question question : questions) {
//            System.out.println(question);
//        }
        int count = questionService.saveAll(questions);
        if (count == 0) {
            ModelAndView modelAndView = new ModelAndView("redirect:/admin/questions/upload");
            redirectAttributes.addFlashAttribute("e_message", "Please select at least one question");
            return modelAndView;
        }
//        int count = 0;
//        for (Question question : questions) {
//            System.out.println(question);
//        }

        ModelAndView modelAndView = new ModelAndView("redirect:/admin/questions");
        redirectAttributes.addFlashAttribute("message", "Saved " + count + " questions successfully");

        return modelAndView;
    }

    @RequestMapping(value = "/admin/questions/deleteTopic", method = RequestMethod.GET)
    public ModelAndView deleteAllQuestionOfTopic(@RequestParam("topicId") int topicId,
                                                 RedirectAttributes redirectAttributes) {
        Topic topic = topicService.getTopicById(topicId);
        if (topic == null) {
            ModelAndView modelAndView = new ModelAndView("redirect:/admin/topics");
            redirectAttributes.addFlashAttribute("e_message", "Topic does not exist");
            return modelAndView;
        }
        questionService.deleteAllByTopic(topic);
        ModelAndView modelAndView = new ModelAndView("redirect:/admin/topics");
        redirectAttributes.addFlashAttribute("message", "Deleted all questions of topic " + topic.getName() + " successfully");
        return modelAndView;
    }

    private List<String[]> readCsvData(MultipartFile file) throws IOException {
        List<String[]> data = new ArrayList<>();
        // Your code to read data from the CSV file
        System.out.println("CSV file");
        return data;
    }

    private List<String[]> readExcelData(MultipartFile file) throws IOException {
        List<String[]> data = new ArrayList<>();
        System.out.println("Excel file");
        return data;
    }
}



