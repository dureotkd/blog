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
`name` = '코드업/생각정리';

INSERT INTO cateItem
SET regDate = NOW(),
`name` = '스포츠/축구';

INSERT INTO cateItem
SET regDate = NOW(),
`name` = '게임/League of Legend';


# 게시물 테이블 생성

DROP TABLE IF EXISTS `articleReply`;
CREATE TABLE `articleReply` (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    articleId INT(10) UNSIGNED NOT NULL,
    `body` TEXT NOT NULL,
    `memberId` INT(10) UNSIGNED NOT NULL
 );
 
DROP TABLE IF EXISTS `letter`;
 CREATE TABLE `letter`(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    sendNickname CHAR(100) NOT NULL,
    fromNickname CHAR(100) NOT NULL,
    title CHAR(200) NOT NULL,
    `body` TEXT NOT NULL
 );

SELECT * FROM letter;
SELECT * FROM MEMBER;
INSERT INTO test SET 
SET regDate = NOW(),



INSERT INTO articleReply SET 
regDate = NOW(),
articleId = 1,

`body` = '안녕하십쇼1233123';


SELECT * FROM articleReply;
SELECT * FROM article;
INSERT INTO article SET 
regDate = NOW(),
updateDate = NOW(),
cateItemId = 1,
displayStatus =1,
title = '긴글테스트',
`body` = 'ㄴㅁㅇㅇㄴ아아아아아아아아앙ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅁㄴ암안ㅇㄴ마ㅏ앙ㄴ맘ㅇㄴ남ㅇㅇ나';

UPDATE article
WHERE id = "1";
ALTER TABLE `member` ADD mailStatus TINYINT(1) UNSIGNED

ALTER TABLE `member` MODIFY loginPwConfirm CHAR(255);

SELECT * FROM MEMBER;
SELECT * FROM article;




TRUNCATE article;
TRUNCATE MEMBER;
TRUNCATE articleReply;

SELECT * FROM MEMBER WHERE 1 AND id = 4;
SELECT COUNT(*) FROM article WHERE cateItemId = 1

ALTER TABLE `article` MODIFY COLUMN nickname FIRST;

ALTER TABLE `article` MODIFY COLUMN views AFTER hit;

ALTER TABLE `article` CHANGE views hit INT;

ALTER TABLE `member` ADD updateDate NOW();

ALTER TABLE `articleReply` ADD memberId INT NOT NULL;

DESC MEMBER;

SELECT A.*, M.nickname AS extra__writer
FROM article AS A
INNER JOIN `member` AS M
ON A. memberId = M.id
WHERE A.displayStatus = 1
ORDER BY A.id DESC



힌트 : article.getExtra().get("writer");


INSERT  INTO `article`(`id`,`regDate`,`updateDate`,`cateItemId`,`displayStatus`,`title`,`body`) VALUES 
(1,'2020-07-06 13:36:52','2020-07-06 13:36:52',1,1,'[자바 스크립트 기초 2강]','자바스크립로 할 수 있는것은?');


CREATE TABLE 

INSERT INTO test 
SET regDate = NOW(),
STR_TO_DATE(06-30-2020,'%m-%d-%y');

SELECT DATE_FORMAT(regDate,'%M,%e') FROM article
WHERE 1;

SELECT *
AND DATE_FORMAT(regDate,'%M,%e')
FROM article;


INSERT INTO test
SET regDate = STR_TO_DATE(NOW,'')


SELECT *, 
DATE_FORMAT(regDate,'%M,%e') FROM article ;
SELECT * FROM article;
SELECT * FROM MEMBER;
SELECT * FROM articleReply;
SELECT * FROM cateItem;


SELECT * FROM cateItem
INNER JOIN article
ON article.cateItemId = cateItem.id
WHERE 2;

SELECT COUNT(*) AS cnt FROM article WHERE cateItemId = 1 AND displaystatus = 1;

SELECT *
FROM article
INNER JOIN cateItem
ON article.cateItemId = cateItem.id
WHERE 1;

SELECT * FROM letter
INNER JOIN `member`
ON letter.sendNickname = member.nickname
WHERE 1;

SELECT * FROM freeboard WHERE " + en +
                        " LIKE '%" + cn + "%'




출처: https://goppa.tistory.com/entry/MySQL-조회-쓰기-수정-삭제 [Developer]

SELECT * FROM MEMBER WHERE email LIKE '%hs@naver.com%' 
AND WHERE `name` LIKE '%ha%' AND WHERE logindId LIKE '%hs%';

SELECT * FROM MEMBER
WHERE
email LIKE '%hs@naver.com%'
AND WHERE NAME LIKE'%hs%'
AND WHERE logindId LIKE'%hs%'
ALTER TABLE `member` ADD COLUMN `updateDate` DATETIME NOT NULL AFTER `regDate`; 



WHERE email,NAME,logindId REGEXP ('hs@naver.com|hs|hs')
SELECT * FROM article ORDER BY id DESC LIMIT 1;
SELECT * FROM article ORDER BY id ASC LIMIT 1;

SELECT * FROM MEMBER
WHERE CODE = '1234'
AND loginId = 'fafafa123'


SELECT * FROM TABLE WHERE favoritesite IN ('webisfree', 'com', 'blog', 'best');
SELECT * FROM MEMBER WHERE email LIKE "%hs@naver.com%" AND `name` LIKE "%ha%" AND loginId LIKE "%hs%";

TRUNCATE articleReply;

SELECT * FROM articleReply;
SELECT * FROM attr;
SELECT * FROM article;
SELECT * FROM attr;
SELECT * FROM article;
    SELECT * FROM MEMBER;
mailStatus
SELECT * FROM MEMBER;

SELECT * FROM letter;

// 쪽지 이너조인

SELECT L.* ,
M.nickname AS letter__writer
FROM letter AS L
INNER JOIN `member` AS M
ON L. sendNickname = M.nickname
WHERE 1;

ecSql.append("SELECT A.* ,");
		secSql.append(" M.nickname AS extra__writer");
		secSql.append("FROM article AS A");
		secSql.append("INNER JOIN member AS M");
		secSql.append("ON A. memberId = M.id ");
		secSql.append("WHERE A.displayStatus = 1 ");


 