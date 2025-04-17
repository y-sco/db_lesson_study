Q1
CREATE TABLE departments (
  department_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(20) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP 
);

Q2
ALTER TABLE people ADD department_id int UNSIGNED AFTER email;

Q3
INSERT INTO
  departments (name)
VALUES
  ('営業'),('開発'),('経理'),('人事'),('情報システム');
INSERT INTO 
  people (name, email, department_id, age, gender)
VALUES
  ('西川周作', 'nishikawa@gizumo.jp', 1, 37, 2),
  ('原口元気', 'haraguchi@gizumo.jp', 1, 33, 1),
  ('関根貴大', 'sekine@gizumo.jp', 1, 29, 2),
  ('荻原拓也', 'ogihara@gizumo.jp', 4, 26, 2),
  ('マテウスサヴィオ', 'mathews@gizumo.jp', 5, 28, 1), 
  ('中島翔哉', 'nakajima@gizumo.jp', 2, 33, 2),
  ('柴戸海', 'sibato@gizumo.jp', 2, 30, 1),
  ('安居海渡', 'yasukai@gizumo.jp', 2, 26, 1),
  ('渡邉凌磨', 'ryouma@gizumo.jp', 2, 28, 1),
  ('マリウスホイブラーテン', 'marius@gizumo.jp', 3, 28, 2);
  
INSERT INTO reports (person_id, content) 
VALUES 
  (11, 'test1111111111'),
  (12, 'test1212121212'), 
  (13, 'test1313131313'),
  (14, 'test1414141414'),
  (15, 'test1515151515'),
  (16, 'test1616161616'),
  (17, 'test1717171717'),
  (18, 'test1818181818'),
  (19, 'test1919191919'),
  (20, 'test2020202020');

Q4
UPDATE people SET department_id = 3 WHERE gender = 1;
UPDATE people SET department_id = 4 WHERE gender = 2;
UPDATE people SET department_id = 5 WHERE person_id = 6;

Q5
SELECT name, age FROM people WHERE gender = 1 ORDER BY age DESC;

Q6
peopleテーブルからdepartment_idが1のレコードをname、mailadress、ageの3カラムをcreated_atの昇順に並べて取得する。

Q7
SELECT * FROM people WHERE (gender = 2 AND age BETWEEN 20 AND 29) OR (gender = 1 AND age BETWEEN 40 AND 49);

Q8
SELECT * from people WHERE department_id = 1 ORDER BY age ASC;

Q9
SELECT AVG(age) AS average_age FROM people WHERE department_id = 2 AND gender = 2;

Q10
SELECT
  p.name, d.name, r.content
FROM
  people p
JOIN
  reports r
ON
  p.person_id = r.person_id
JOIN
  departments d
ON
  p.department_id = d.department_id;

Q11
SELECT
  p.name, r.report_id
FROM
  people p
LEFT OUTER JOIN
  reports r
ON
  p.person_id = r.person_id
WHERE
  r.report_id
IS NULL;
