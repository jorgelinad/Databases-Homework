CREATE TABLE mentors (
  id        SERIAL PRIMARY KEY,
  name      VARCHAR(30) NOT NULL,
  lived_in_glasgow   INT NOT NULL,
  address   VARCHAR(120),
  favourite_programming_language   VARCHAR(50)
)

INSERT INTO mentors (name, lived_in_glasgow, address, favourite_programming_language)
             VALUES ('Ana', '5', 'glasgow', 'Javascript');
INSERT INTO mentors (name, lived_in_glasgow, address, favourite_programming_language)
             VALUES ('Jose', '10', 'glasgow', 'nodeJS');
INSERT INTO mentors (name, lived_in_glasgow, address, favourite_programming_language)
             VALUES ('Wilmer', '6', 'glasgow', 'SQl');
INSERT INTO mentors (name, lived_in_glasgow, address, favourite_programming_language)
             VALUES ('Josselyn', '3', 'glasgow', 'Python');
INSERT INTO mentors (name, lived_in_glasgow, address, favourite_programming_language)
             VALUES ('Pedro', '4', 'glasgow', 'Java');             

CREATE TABLE students (
  id        SERIAL PRIMARY KEY,
  name      VARCHAR(30) NOT NULL,
  address   VARCHAR(120),
  graduated_code_future   VARCHAR(10)
)

INSERT INTO students (name, address, graduated_code_future)
              VALUES ('Marlene', 'Madrid', 'si');
INSERT INTO students (name, address, graduated_code_future)
              VALUES ('Jorge', 'Madrid', 'si');
INSERT INTO students (name, address, graduated_code_future)
              VALUES ('Alfredo', 'Barcelona', 'no');
INSERT INTO students (name, address, graduated_code_future)
              VALUES ('Elimar', 'Manresa', 'no');
INSERT INTO students (name, address, graduated_code_future)
              VALUES ('Montserrat', 'Girona', 'si');
INSERT INTO students (name, address, graduated_code_future)
              VALUES ('Vanesa', 'Barcelona', 'no');
INSERT INTO students (name, address, graduated_code_future)
              VALUES ('Jennifer', 'Manresa', 'si');
INSERT INTO students (name, address, graduated_code_future)
              VALUES ('Rosario', 'Tarragona', 'no');
INSERT INTO students (name, address, graduated_code_future)
              VALUES ('Raquel', 'Toledo', 'si');
INSERT INTO students (name, address, graduated_code_future)
              VALUES ('Martin', 'Valencia', 'no');

select * from mentors
select * from students

CREATE TABLE classes (
  id        SERIAL PRIMARY KEY,
  leading_mentor    VARCHAR(20),
  topic   VARCHAR(20),
  specific_date   DATE NOT NULL,
  specific_location VARCHAR(30)
)

INSERT INTO classes (leading_mentor, topic, specific_date, specific_location)
             VALUES ('Luana', 'Javascript', '07/07/2022', 'Barcelona');
INSERT INTO classes (leading_mentor, topic, specific_date, specific_location)
             VALUES ('Pedro', 'Sql', '20/07/2022', 'Manresa');
INSERT INTO classes (leading_mentor, topic, specific_date, specific_location)
             VALUES ('Pablo', 'Java', '01/08/2022', 'Manresa');
INSERT INTO classes (leading_mentor, topic, specific_date, specific_location)
             VALUES ('Diego', 'Databases', '02/08/2022', 'Barcelona');

CREATE TABLE attends (
    id                  SERIAL PRIMARY KEY,
    student_id          INT REFERENCES students(id),
    class_id            INT REFERENCES classes(id)
);

INSERT INTO attends (student_id, class_id) 
                 VALUES(1, 4);               
INSERT INTO attends    (student_id, class_id) 
                 VALUES(4, 3);

select * from attends;

SELECT name, lived_in_glasgow FROM mentors WHERE lived_in_glasgow > '5'
SELECT name, favourite_programming_language FROM mentors WHERE favourite_programming_language = 'Javascript'
SELECT name, graduated_code_future FROM students WHERE graduated_code_future = 'si'
SELECT * FROM classes WHERE specific_date < '01/06/2022' 
SELECT student_id FROM attends WHERE class_id = 1            