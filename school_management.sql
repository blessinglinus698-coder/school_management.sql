-- ============================================================
-- Exercise Set 1: Database and Table Creation
-- ============================================================


-- 1. CREATE DATABASE
------------------------------------------------------------
-- Question 1: Create a database called school_management.
CREATE DATABASE school_management;

-- Switch to the newly created database
USE school_management;


-- 2. CREATE TABLES
------------------------------------------------------------
-- Question 2 & 3: Create tables with appropriate data types, constraints, and primary keys.

-- Create students table
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    enrollment_date DATE NOT NULL,
    major VARCHAR(100) NOT NULL
);

-- Create courses table
CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL,
    department VARCHAR(100) NOT NULL
);

-- Create instructors table
CREATE TABLE instructors (
    instructor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    hire_date DATE NOT NULL,
    department VARCHAR(100) NOT NULL
);

-- Create enrollments table
CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    semester VARCHAR(20) NOT NULL,
    year INT NOT NULL,
    grade VARCHAR(5),
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE
);


-- 3. INSERT DATA
------------------------------------------------------------

-- Question 4: Insert at least 10 records into the Students table with varied majors and enrollment dates.
INSERT INTO students (first_name, last_name, date_of_birth, enrollment_date, major) VALUES
('John', 'Doe', '2002-05-14', '2021-09-01', 'Computer Science'),
('Jane', 'Smith', '2003-08-22', '2022-01-15', 'Electrical Engineering'),
('Michael', 'Johnson', '2001-11-30', '2020-09-01', 'Mechanical Engineering'),
('Emily', 'Davis', '2002-02-18', '2021-09-01', 'Computer Science'),
('David', 'Wilson', '2003-12-05', '2022-09-01', 'Mathematics'),
('Sarah', 'Brown', '2001-04-12', '2020-01-15', 'Biology'),
('James', 'Taylor', '2002-09-25', '2021-09-01', 'Business Administration'),
('Jessica', 'Anderson', '2003-06-30', '2022-09-01', 'Chemistry'),
('Daniel', 'Thomas', '2001-01-19', '2020-09-01', 'Physics'),
('Laura', 'Jackson', '2002-07-08', '2021-01-15', 'Mathematics');

-- Question 5: Insert at least 8 records into the courses table spanning different departments.
INSERT INTO courses (course_name, credits, department) VALUES
('Database Systems', 4, 'Computer Science'),
('Data Structures', 4, 'Computer Science'),
('Calculus I', 3, 'Mathematics'),
('Linear Algebra', 3, 'Mathematics'),
('General Physics', 4, 'Physics'),
('Organic Chemistry', 4, 'Chemistry'),
('Principles of Management', 3, 'Business'),
('Circuit Analysis', 4, 'Electrical Engineering');

-- Question 6: Insert at least 5 records into the instructors table.
INSERT INTO instructors (first_name, last_name, hire_date, department) VALUES
('Robert', 'Miller', '2015-08-20', 'Computer Science'),
('Patricia', 'Garza', '2018-01-10', 'Mathematics'),
('Richard', 'Martinez', '2012-09-01', 'Physics'),
('Barbara', 'Hernandez', '2019-08-15', 'Chemistry'),
('William', 'Lopez', '2016-01-20', 'Business');

-- Question 7: Insert at least 20 records into the enrollments table showing different students taking various courses.
INSERT INTO enrollments (student_id, course_id, semester, year, grade) VALUES
(1, 1, 'Fall', 2021, 'A'),
(1, 2, 'Spring', 2022, 'B+'),
(2, 8, 'Fall', 2022, 'A-'),
(2, 3, 'Spring', 2023, 'B'),
(3, 5, 'Fall', 2020, 'B+'),
(3, 1, 'Spring', 2021, 'A'),
(4, 1, 'Fall', 2021, 'A'),
(4, 3, 'Fall', 2021, 'A-'),
(5, 3, 'Fall', 2022, 'B'),
(5, 4, 'Spring', 2023, 'A'),
(6, 6, 'Fall', 2020, 'B-'),
(7, 7, 'Fall', 2021, 'A'),
(8, 6, 'Fall', 2022, 'A'),
(9, 5, 'Fall', 2020, 'A-'),
(10, 3, 'Spring', 2021, 'B+'),
(10, 4, 'Fall', 2021, 'A'),
(1, 3, 'Fall', 2022, 'A'),
(2, 1, 'Spring', 2023, 'B+'),
(3, 8, 'Fall', 2021, 'A-'),
(4, 2, 'Spring', 2022, 'A');


-- 4. QUERIES
------------------------------------------------------------

-- Question 8: Select all students
SELECT * 
FROM students;

-- Question 9: Find all courses with more than 3 credits.
SELECT * 
FROM courses 
WHERE credits > 3;

-- Question 10: Find all instructors in a particular department (e.g., Computer Science).
SELECT * 
FROM instructors 
WHERE department = 'Computer Science';