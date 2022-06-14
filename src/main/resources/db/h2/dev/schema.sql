DROP TABLE IF EXISTS member;
DROP TABLE IF EXISTS post;
DROP TABLE IF EXISTS comment;
DROP TABLE IF EXISTS reply;
DROP TABLE IF EXISTS review;
DROP TABLE IF EXISTS category;

CREATE TABLE member (
       PRIMARY KEY (member_id),
       member_id      INT         NOT NULL AUTO_INCREMENT,
       phone_num      CHAR(11)    NOT NULL UNIQUE,
       password       VARCHAR(50) NOT NULL,
       nickname       VARCHAR(10) NOT NULL,
       birthday       DATE,
       gender         CHAR(1),
       auto_login_yn  BOOLEAN     NOT NULL DEFAULT false,
       join_date      TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE post (
        PRIMARY KEY (post_id),
        post_id     INT          NOT NULL AUTO_INCREMENT,
        category_id INT          NOT NULL,
        writer      INT          NOT NULL,
        title       VARCHAR(50)  NOT NULL,
        contents    VARCHAR(300) NOT NULL,
        create_date TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
        like_num    INT          NOT NULL DEFAULT 0,
        update_date DATE,
        delete_date DATE
);

CREATE TABLE comment (
        PRIMARY KEY (comment_id),
        comment_id   INT          NOT NULL AUTO_INCREMENT,
        post_id      INT          NOT NULL,
        writer       INT          NOT NULL,
        contents     VARCHAR(300) NOT NULL,
        create_date  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
        like_num     INT          NOT NULL DEFAULT 0,
        update_date  DATE,
        delete_date  DATE
);

CREATE TABLE reply (
        PRIMARY KEY (reply_id),
        reply_id     INT          NOT NULL AUTO_INCREMENT,
        comment_id   INT          NOT NULL,
        writer       INT          NOT NULL,
        contents     VARCHAR(300) NOT NULL,
        create_date  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
        like_num     INT          NOT NULL DEFAULT 0,
        update_date  DATE,
        delete_date  DATE
);

CREATE TABLE review (
        PRIMARY KEY (review_id),
        review_id    INT            NOT NULL AUTO_INCREMENT,
        laundry_id   INT            NOT NULL,
        writer       INT            NOT NULL,
        title        VARCHAR(50)    NOT NULL,
        contents     VARCHAR(300)   NOT NULL,
        create_date  TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,
        like_num     INT            NOT NULL DEFAULT 0,
        update_date  DATE,
        delete_date  DATE
);

CREATE TABLE category (
        PRIMARY KEY (category_id),
        category_id     INT         NOT NULL AUTO_INCREMENT,
        category_name   VARCHAR(10)
);