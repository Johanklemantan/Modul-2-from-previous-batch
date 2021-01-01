-- 1.1
CREATE TABLE `sekolahku`.`users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(50) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `password` VARCHAR(50) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`));

SELECT * FROM users;
DESC users;
INSERT INTO users(username,email,password)
VALUES('Andi','andi@andi.com','12345'),
('Budi','budi@budi.com','67890'),
('Caca','caca@caca.com','abcde'),
('Deni','deni@deni.com','fghij'),
('Euis','euis@euis.com','klmno'),
('Fafa','fafa@fafa.com','pqrst');


-- 1.2
CREATE TABLE `sekolahku`.`courses` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `course` VARCHAR(50) NOT NULL,
  `mentor` VARCHAR(50) NOT NULL,
  `title` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`));
  
  SELECT * FROM courses;
  DESC courses;
  INSERT INTO courses(course,mentor,title)
  VALUES('C++','Ari','Dr.'),
  ('C#','Ari','Dr.'),
  ('C#','Ari','Dr.'),
  ('CSS','Cania','S.Kom'),
  ('HTML','Cania','S.Kom'),
  ('Javascript','Cania','S.Kom'),
  ('Python','Barry','S.T.'),
  ('Micropython','Barry','S.T.'),
  ('Java','Darren','M.T.'),
  ('Ruby','Darren','M.T.');
  
  
  -- 1.3
  CREATE TABLE `sekolahku`.`usercourse` (
  `id_user` INT(11) NULL,
  `id_course` INT(11) NULL);
  
  SELECT * FROM usercourse;
  DESC usercourse;
  INSERT INTO usercourse(id_user,id_course)
  VALUES(1,1),(1,2),(1,3),
  (2,4),(2,5),(2,6),
  (3,7),(3,8),(3,9),
  (4,1),(4,3),(4,5),
  (5,2),(5,4),(5,6),
  (6,7),(6,8),(6,9);
 
 -- 1.4
SELECT uc.id_user,username,course,mentor,title FROM users u JOIN usercourse uc
ON u.id=uc.id_user
JOIN courses c 
ON uc.id_course=c.id;
  -- 1.5
SELECT uc.id_user,username,course,mentor,title FROM users u JOIN usercourse uc
ON u.id=uc.id_user
JOIN courses c 
ON uc.id_course=c.id
WHERE title REGEXP ('^S');

-- 1.6
SELECT uc.id_user,username,course,mentor,title FROM users u JOIN usercourse uc
ON u.id=uc.id_user
JOIN courses c 
ON uc.id_course=c.id
WHERE title NOT LIKE ('S%');

-- 1.7

SELECT course,mentor,title, COUNT(course) AS jumlah_peserta
FROM users u JOIN usercourse uc
ON u.id=uc.id_user
JOIN courses c 
ON uc.id_course=c.id
GROUP BY course;

-- 1.8
SELECT mentor, COUNT(mentor) AS jumlah_peserta,
2000000*COUNT(mentor) AS total_fee
FROM users u JOIN usercourse uc
ON u.id=uc.id_user
JOIN courses c 
ON uc.id_course=c.id
GROUP BY mentor;
