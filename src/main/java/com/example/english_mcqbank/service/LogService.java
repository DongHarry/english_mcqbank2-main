package com.example.english_mcqbank.service;

import com.example.english_mcqbank.model.Log;
import com.example.english_mcqbank.model.UserEntity;
import com.example.english_mcqbank.repository.LogRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.crypto.password.Pbkdf2PasswordEncoder;
import org.springframework.stereotype.Service;

import org.springframework.data.domain.Pageable;
import java.util.List;

@Service
@RequiredArgsConstructor
public class LogService {
    final
    LogRepository logRepository;

    public void saveLog(Log log) {
        logRepository.save(log);
    }

    public List<Log> getLogsByUser(UserEntity user) {
        return logRepository.findAllByUser(user);
    }

    public List<Log> findAll() {
        return logRepository.findAll();
    }

    public List<Log> findAllLogs(int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        Page<Log> logPage = logRepository.findAll(pageable);
        return logPage.getContent();
    }

    public void deleteAllLog(List<Log> logs) {
        logRepository.deleteAll(logs);
    }

    public List<Log> getLogsByUser(UserEntity user, int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        Page<Log> logPage = logRepository.findAllByUser(user, pageable);
        return logPage.getContent();
    }
}
