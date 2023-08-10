package com.example.english_mcqbank.model.test;

public class AChild1 implements Parent {
    private String name;

    @Override
    public void doSomething() {
        System.out.println("Child1");
    }
}
