USE site8;
SHOW TABLES;
SELECT * FROM article;
SELECT * FROM MEMBER;

DROP DATABASE IF EXISTS blog;

CREATE DATABASE blog;

USE blog;

CREATE TABLE article (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate  DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    title CHAR(200) NOT NULL,
    `body` LONGTEXT NOT NULL
);





SET NAMES utf8mb4;

DROP DATABASE IF EXISTS site39;
CREATE DATABASE site39;
USE site39;

# 카테고리

CREATE TABLE cateItem (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    `name` CHAR(100) NOT NULL UNIQUE
);

SELECT * FROM cateItem;
INSERT INTO cateItem
SET regDate = NOW(),
`name` = 'IT/백엔드';

INSERT INTO cateItem
SET regDate = NOW(),
`name` = '하루공부';

INSERT INTO cateItem
SET regDate = NOW(),
`name` = 'IT/프론트엔드';

# 게시물 테이블 생성
DROP TABLE IF EXISTS article;
CREATE TABLE article (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    cateItemId INT(10) UNSIGNED NOT NULL,
    displayStatus TINYINT(1) UNSIGNED NOT NULL,
    `title` CHAR(200) NOT NULL,
    `body` TEXT NOT NULL
)


INSERT INTO article SET 
regDate = NOW(),
updateDate = NOW(),
cateItemId = 1,
displayStatus =3,
title = '프론트엔드 블로그 시작',
`body` = '잘부탁드립니다';



SELECT * FROM article;





