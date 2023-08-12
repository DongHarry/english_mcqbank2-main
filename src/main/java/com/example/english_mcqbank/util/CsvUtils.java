package com.example.english_mcqbank.util;

import com.example.english_mcqbank.exception.CSVException;
import com.example.english_mcqbank.model.Question;
import com.example.english_mcqbank.service.TopicService;
import lombok.RequiredArgsConstructor;
import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Component
@RequiredArgsConstructor
public class CsvUtils {
    private static final String TYPE = "text/csv";
    private static final String[] QUESTION_HEADER = {"QU_ID, QU_CONTENT, QU_OPTION1, " +
            "QU_OPTION2, QU_OPTION3, QU_OPTION4, QU_ANSWER, QU_EXPLAIN, " +
            "QU_TYPE, TP_ID, DIFFICULT_LEVEL"};
    private final TopicService topicService;

    public boolean hasCsvFormat(MultipartFile file) {
        if (TYPE.equals(file.getContentType())
                || Objects.equals(file.getContentType(), "application/vnd.ms-excel")) {
            return true;
        }
        return false;
    }

    public List<Question> csvToQuestion(InputStream is) {
        try (BufferedReader bf = new BufferedReader(new InputStreamReader(is, StandardCharsets.UTF_8));
             CSVParser csvParser = new CSVParser(bf,
                CSVFormat.DEFAULT.withFirstRecordAsHeader().withIgnoreHeaderCase().withTrim())) {
            List<Question> questionList = new ArrayList<>();
            Iterable<CSVRecord> csvRecords = csvParser.getRecords();
            for (CSVRecord theCSVRecord: csvRecords) {
                Question theQuestion = Question
                        .builder()
                        .content(theCSVRecord.get("QU_CONTENT"))
                        .option1(theCSVRecord.get("QU_OPTION1"))
                        .option2(theCSVRecord.get("QU_OPTION2"))
                        .option3(theCSVRecord.get("QU_OPTION3"))
                        .option4(theCSVRecord.get("QU_OPTION4"))
                        .answer(Integer.parseInt(theCSVRecord.get("QU_ANSWER")))
                        .explain(theCSVRecord.get("QU_EXPLAIN"))
                        .type(Integer.parseInt(theCSVRecord.get("QU_TYPE")))
                        .topic(topicService.getTopicById(Integer.parseInt(theCSVRecord.get("TP_ID"))))
                        .level(Integer.parseInt(theCSVRecord.get("DIFFICULT_LEVEL")))
                        .build();
                questionList.add(theQuestion);
            }

            return questionList;

        }
        catch (IOException exc) {
            throw new CSVException("Failed to parse csv file");
        }
    }
}
