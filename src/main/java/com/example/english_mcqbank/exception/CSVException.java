package com.example.english_mcqbank.exception;

public class CSVException extends RuntimeException {
    public CSVException(String message) {
        super(message);
    }

    public CSVException(String message, Throwable cause) {
        super(message, cause);
    }

    public CSVException(Throwable cause) {
        super(cause);
    }
}
