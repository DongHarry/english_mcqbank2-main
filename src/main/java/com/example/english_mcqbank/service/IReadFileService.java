package com.example.english_mcqbank.service;

import com.example.english_mcqbank.exception.InvalidInputFileException;
import com.example.english_mcqbank.model.Question;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

public interface IReadFileService {
    List<Question> readCsvData(MultipartFile file) throws IOException, InvalidInputFileException;

    List<Question> readExcelData(MultipartFile file) throws IOException, InvalidInputFileException;
}
