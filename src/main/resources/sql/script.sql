create table exams
(
    EX_ID          int auto_increment
        primary key,
    EX_NAME        varchar(100) not null,
    EX_QUESTION_NO int          null,
    EX_TIME        datetime     null,
    EX_TYPE        int          null
);

create table topics
(
    TP_ID          int auto_increment
        primary key,
    TP_NAME        varchar(120) not null,
    TP_DESCRIPTION varchar(200) null
);

create table exam_topic
(
    ET_ID      int auto_increment
        primary key,
    EX_ID      int not null,
    TP_ID      int not null,
    ET_PERCENT int null,
    constraint exam_topic_exams_EX_ID_fk
        foreign key (EX_ID) references exams (ex_id),
    constraint exam_topic_topics_TP_ID_fk
        foreign key (TP_ID) references topics (tp_id)
);

create table questions
(
    QU_ID           int auto_increment
        primary key,
    QU_CONTENT      varchar(500) not null,
    QU_OPTION1      varchar(200) null,
    QU_OPTION2      varchar(200) null,
    QU_OPTION3      varchar(200) null,
    QU_OPTION4      varchar(200) null,
    QU_ANSWER       int(1)       not null,
    QU_EXPLAIN      text         null,
    QU_TYPE         int(1)       null,
    TP_ID           int          not null,
    DIFFICULT_LEVEL int          not null,
    constraint QU_CONTENT
        unique (QU_CONTENT),
    constraint questions_topics_TP_ID_fk
        foreign key (TP_ID) references topics (tp_id)
);

create table users
(
    US_ID            int auto_increment
        primary key,
    US_USERNAME      varchar(45)  not null,
    US_PASSWORD      varchar(120) not null,
    US_FULLNAME      varchar(45)  not null,
    US_ADDRESS       varchar(45)  null,
    US_MOBILE_NUMBER varchar(10)  null,
    US_EMAIL         varchar(45)  null,
    US_CREATED_DATE  datetime     null,
    US_STATUS        int(1)       null,
    US_GROUP         int          null,
    constraint US_EMAIL
        unique (US_EMAIL),
    constraint US_MOBILE_NUMBER
        unique (US_MOBILE_NUMBER),
    constraint US_USERNAME
        unique (US_USERNAME)
);

create table logs
(
    LG_ID       int auto_increment
        primary key,
    LG_NAME     varchar(120) not null,
    LG_STATUS   int(1)       null,
    LG_DATETIME datetime     null,
    US_ID       int          null,
    constraint logs_users_US_ID_fk
        foreign key (US_ID) references users (us_id)
);

create table results
(
    RS_ID    int auto_increment
        primary key,
    RS_SCORE int      not null,
    RS_TIME  datetime null,
    US_ID    int      not null,
    EX_ID    int      not null,
    constraint results_exams_EX_ID_fk
        foreign key (EX_ID) references exams (ex_id),
    constraint results_users_US_ID_fk
        foreign key (US_ID) references users (us_id)
);