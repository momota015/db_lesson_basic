
-- Q1
CREATE TABLE `departments`(
    `department_id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    `name` VARCHAR(20) NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    );


-- Q2
ALTER TABLE people ADD COLUMN department_id INT UNSIGNED AFTER email;

--Q3
INSERT INTO departments (name) VALUES
    ('営業'),
    ('開発'),
    ('経理'),
    ('人事'),
    ('情報システム');

    INSERT INTO people (name, email, department_id, age, gender) VALUES
    ('山田たろう', 'yamada@gizumo.jp', 1, 25, 1),
    ('佐藤はなこ', 'satoui@gizumo.jp', 1, 35, 2),
    ('鈴木一郎', 'suzuk1i@gizumo.jp', 1, 53, 1),
    ('田中みさき', 'tanaka.misaki@gizumo.jp', 2, 33, 2),
    ('高橋けんた', 'takahashi@gizumo.jp', 2, 23, 1),
    ('伊藤さくら', 'itou@gizumo.jp', 2, 28, 2),
    ('渡辺かける', 'watanabe@gizumo.jp', 2, 48, 1),
    ('中村ゆい', 'nakamura@gizumo.jp', 3, 27, 2),
    ('小林だいすけ', 'kobayashi@gizumo.jp', 4, 37, 1),
    ('加藤あおい', 'katou@gizumo.jp', 5, 22, 2);

    INSERT INTO reports (person_id, content) VALUES 
    (4, '先輩とプログラムのレビューを行いました。'),
    (6, '週末のイベントの準備を進めました。'),
    (27, '午後は社内研修に参加して勉強しました。'),
    (28, '見積書を作成して上司に確認してもらいました。'),
    (29, 'バグの原因を調べて修正方法を考えました。'),
    (29, '来月の売上目標についてチームで話し合いました。'),
    (1, '新人向けのマニュアルを一部更新しました。');


    SELECT p.name AS 社員名, d.name AS 部署名
      FROM people AS p
      LEFT JOIN departments AS d ON p.department_id = d.department_id;

    SELECT r.content AS 日報, p.name AS 名前
      FROM reports AS r
      INNER JOIN people AS p ON r.person_id = p.person_id;


--Q4
SELECT * FROM people WHERE department_id IS NULL;

UPDATE people SET department_id = 1 WHERE person_id = 1;
UPDATE people SET department_id = 2 WHERE person_id = 2;
UPDATE people SET department_id = 3 WHERE person_id = 3;
UPDATE people SET department_id = 4 WHERE person_id = 4;
UPDATE people SET department_id = 6 WHERE person_id = 6;

SELECT p.name AS 名前, d.name AS 部署名
    FROM people AS p
    LEFT JOIN departments AS d ON p.department_id = d.department_id;


--Q5
SELECT name, age FROM people
WHERE gender = 1
ORDER BY age DESC;


--Q6
-- SELECT
--   `name`, `email`, `age`
-- FROM
--   `people`
-- WHERE
--   `department_id` = 1
-- ORDER BY
--   `created_at`;

-- peopleテーブルからカラムdepartment_idが1のレコードの、
-- 名前、Eメール、年齢を作成された順に表示させる。


--Q7
SELECT name FROM people
WHERE (gender = 2 AND age BETWEEN 20 AND 29)
OR (gender = 1 AND age BETWEEN 40 AND 49); 


--Q8
SELECT name, age FROM people
WHERE department_id = 1
ORDER BY age ASC;


--Q9
SELECT AVG(age) AS average_age FROM people
WHERE department_id = 2 AND gender = 2;


--Q10
SELECT p.name AS 名前, d.name AS 部署名, r.content AS 日報内容
FROM people AS p
INNER JOIN departments AS d ON p.department_id = d.department_id
INNER JOIN reports AS r ON p.person_id = r.person_id; 


--Q11
SELECT p.name FROM people AS p
LEFT JOIN reports AS r ON p.person_id = r.person_id
WHERE r.report_id IS NULL;