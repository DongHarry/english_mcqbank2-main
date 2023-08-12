package com.example.english_mcqbank.service;

import com.example.english_mcqbank.model.Log;
import com.example.english_mcqbank.model.UserEntity;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface ILogService {
    void saveLog(Log log);

    List<Log> getLogsByUser(UserEntity user);

    void deleteAllLog(List<Log> logs);

    List<Log> findAllLogs();

    Log findLogById(int logId);

    @Transactional
    void deleteLog(Log log);
}
