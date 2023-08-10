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
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class LogService implements ILogService {
    final
    LogRepository logRepository;

    @Override
    public void saveLog(Log log) {
        logRepository.save(log);
    }

    @Override
    public List<Log> getLogsByUser(UserEntity user) {
        return logRepository.findAllByUser(user);
    }

    @Override
    public List<Log> findAll() {
        return logRepository.findAll();
    }

    @Override
    public List<Log> findAllLogs(int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        Page<Log> logPage = logRepository.findAll(pageable);
        return logPage.getContent();
    }

    @Override
    public void deleteAllLog(List<Log> logs) {
        logRepository.deleteAll(logs);
    }

    @Override
    public List<Log> getLogsByUser(UserEntity user, int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        Page<Log> logPage = logRepository.findAllByUser(user, pageable);
        return logPage.getContent();
    }

    @Override
    public List<Log> findAllLogs() {
        return logRepository.findAll();
    }

    @Override
    public Log findLogById(int logId) {
        return logRepository.findById(logId).orElse(null);
    }

    @Override
    @Transactional
    public void deleteLog(Log log) {
        logRepository.delete(log);
    }
}
