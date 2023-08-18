package com.example.english_mcqbank.service;

import com.example.english_mcqbank.exception.InvalidInputFileException;
import com.example.english_mcqbank.model.Question;
import com.example.english_mcqbank.model.Topic;
import com.opencsv.CSVReader;
import com.opencsv.CSVReaderBuilder;
import com.opencsv.exceptions.CsvValidationException;
import lombok.RequiredArgsConstructor;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ReadFileService implements IReadFileService {
    final ITopicService topicService;

    @Override
    public List<Question> readCsvData(MultipartFile file) throws IOException, InvalidInputFileException {
        List<String[]> data = readCsvData2(file);
        if (data.get(0).length != 10 && data.get(0).length != 11) {
            throw new InvalidInputFileException("Invalid input file");
        }

        ArrayList<Question> questions = new ArrayList<>();

        if (data.get(0).length == 10) {
            for (String[] d : data) {
                Question question = new Question();
                question.setContent(d[0]);
                question.setOption1(d[1]);
                question.setOption2(d[2]);
                question.setOption3(d[3]);
                question.setOption4(d[4]);
                question.setAnswer(Integer.parseInt(d[5]));
                question.setExplain(d[6]);
                question.setType(Integer.parseInt(d[7]));

                Topic topic = topicService.getTopicById(Integer.parseInt(d[8]));
                if (topic == null) {
//                    throw new InvalidInputFileException("Invalid input file");
                    continue;
                }
                question.setTopic(topic);
                question.setLevel(Integer.parseInt(d[9]));
                questions.add(question);
            }
        } else {
            for (String[] d : data) {
                Question question = new Question();
                question.setId(Integer.parseInt(d[0]));
                question.setContent(d[1]);
                question.setOption1(d[2]);
                question.setOption2(d[3]);
                question.setOption3(d[4]);
                question.setOption4(d[5]);
                question.setAnswer(Integer.parseInt(d[6]));
                question.setExplain(d[7]);
                question.setType(Integer.parseInt(d[8]));
                Topic topic = topicService.getTopicById(Integer.parseInt(d[9]));
                if (topic == null) {
//                    throw new InvalidInputFileException("Invalid input file");
                    continue;
                }
                question.setTopic(topic);
                question.setLevel(Integer.parseInt(d[10]));
                questions.add(question);
            }
        }

        return questions;
    }

    @Override
    public List<Question> readExcelData(MultipartFile file) throws IOException, InvalidInputFileException {
        List<Question> data = new ArrayList<>();
        try (InputStream inputStream = file.getInputStream(); Workbook workbook = new XSSFWorkbook(inputStream)) {
            Sheet sheet = workbook.getSheetAt(0);

            for (Row row : sheet) {
                if (row.getRowNum() == 0) {
                    continue; // Skip header row
                }

                int cellCount = row.getLastCellNum();
                if (cellCount != 10 && cellCount != 11) {
                    continue;
                }
                Question excelData = new Question();
                try {
                    excelData.setId(cellCount == 11 ? (int) row.getCell(0).getNumericCellValue() : null);
                    excelData.setContent(row.getCell(cellCount == 11 ? 1 : 0).getStringCellValue());
                    excelData.setOption1(row.getCell(cellCount == 11 ? 2 : 1).getStringCellValue());
                    excelData.setOption2(row.getCell(cellCount == 11 ? 3 : 2).getStringCellValue());
                    excelData.setOption3(row.getCell(cellCount == 11 ? 4 : 3).getStringCellValue());
                    excelData.setOption4(row.getCell(cellCount == 11 ? 5 : 4).getStringCellValue());
                    excelData.setAnswer((int) row.getCell(cellCount == 11 ? 6 : 5).getNumericCellValue());
                    excelData.setExplain(row.getCell(cellCount == 11 ? 7 : 6).getStringCellValue());
                    excelData.setType((int) row.getCell(cellCount == 11 ? 8 : 7).getNumericCellValue());
                    Topic topic = topicService.getTopicById((int) row.getCell(cellCount == 11 ? 9 : 8).getNumericCellValue());
                    if (topic == null) {
//                    throw new InvalidInputFileException("Invalid input file");
                        continue;
                    }
                    excelData.setTopic(topic);
                    excelData.setLevel((int) row.getCell(cellCount == 11 ? 10 : 9).getNumericCellValue());
                } catch (Exception e) {
                    throw new InvalidInputFileException("Invalid input file");
                }
                data.add(excelData);
            }
        } catch (Exception e) {
            throw new InvalidInputFileException("Invalid input file");
        }
        return data;
    }

    private List<String[]> readCsvData2(MultipartFile file) throws IOException {
        List<String[]> data = new ArrayList<>();
        try (CSVReader csvReader = new CSVReaderBuilder(new InputStreamReader(file.getInputStream())).withSkipLines(1).build()) {
            String[] line;
            while ((line = csvReader.readNext()) != null) {
                data.add(line);
            }
        } catch (CsvValidationException e) {
            throw new RuntimeException(e);
        }
        return data;
    }
}