-- *Q1*
CREATE TABLE departments(
  department_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR (20) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- *Q2*
ALTER TABLE people ADD department_id INT UNSIGNED AFTER email;


-- *Q3*
INSERT INTO departments (name) 
VALUES
('営業'),
('開発'), 
('経理'), 
('人事'),
('情報システム');

INSERT INTO people (name, department_id, age, gender) 
VALUES
('山田ゆう',1,30,1),
('臼井あこ',1,23,2),
('丹治伊織',1,36,1),
('布勢穂乃果',2,35,2),
('保科翠',2,29,1),
('白州のえる',2,27,2),
('白水詩乃',2,18,2),
('市川梛緖',3,32,1),
('塩月玲香',4,26,2),
('来栖柊',5,31,1);

INSERT INTO reports (person_id, content)
VALUES
(7,'オレンジジュースを飲んだ'),
(8,'手洗いうがいを必ずする'),
(9,'お腹の音が大きく鳴った'),
(10,'信号機が毎回赤になる'),
(11,'散歩中の犬を撫でさせてもらった'),
(12,'傘を会社に忘れてしまった'),
(13,'今日の夕飯は餃子にした'),
(14,'スポーツ観戦をしに行った'),
(15,'好きな曲を人に教えた'),
(16,'昼下がりに美術館に行った');


-- *Q4*
UPDATE people 
SET 
department_id = ELT(FIELD (person_id, 1,2,3,4,6), '1','2','3','4','5')
WHERE person_id IN (1,2,3,4,6)


-- *Q5*
SELECT name, age FROM people WHERE gender = 1 ORDER BY age DESC;


-- *Q6*
peopleというテーブルでdepartment_idが1のレコードを、
name、email、ageの３つのカラムに絞って、作成時刻の昇順で表示するSQL文


-- *Q7*
SELECT name FROM people WHERE 
20<= age AND 30> age AND gender = 2 or
40<= age AND 50> age AND gender = 1;


-- *Q8*
SELECT * FROM people WHERE department_id = 1 ORDER BY age ASC;


-- *Q9*
SELECT AVG(age) AS average_age FROM people WHERE department_id = 2 AND gender = 2;


-- *Q10*
SELECT p.department_id, p.name, r.content
FROM people p JOIN reports r ON p.person_id = r.person_id;


-- *Q11*
SELECT
  p.name
FROM
  people p
LEFT OUTER JOIN 
  reports r USING (person_id)
WHERE
  content IS NULL;
