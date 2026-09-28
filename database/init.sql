-- ============================================================
-- Geumdo High School — Tier 3: Database (MySQL)
-- This file is auto-executed ONCE by the official MySQL image
-- the first time the container starts with an empty data volume.
-- (docker-entrypoint-initdb.d convention)
-- ============================================================

CREATE DATABASE IF NOT EXISTS geumdo_db;
USE geumdo_db;

-- ---------- Faculty & Staff ----------
CREATE TABLE IF NOT EXISTS faculty (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  role VARCHAR(100) NOT NULL,
  department VARCHAR(100) NOT NULL
);

INSERT INTO faculty (name, role, department) VALUES
('Han Seo-yeon', 'Principal', 'Administration'),
('Park Min-jun', 'Vice Principal', 'Administration'),
('Choi Ye-jin', 'Homeroom Teacher, Grade 1-A', 'Mathematics'),
('Kim Do-hyun', 'Homeroom Teacher, Grade 2-B', 'Physics'),
('Lee Soo-ah', 'Homeroom Teacher, Grade 3-C', 'Korean Literature'),
('Jung Hae-won', 'English Department Head', 'English'),
('Kang Tae-yang', 'Physical Education Coordinator', 'Athletics'),
('Yoon Ji-hoo', 'Music Director', 'Arts'),
('Oh Se-rin', 'School Counselor', 'Student Affairs'),
('Baek Joon-ho', 'IT & Facilities Manager', 'Operations');

-- ---------- Clubs & Activities ----------
CREATE TABLE IF NOT EXISTS activities (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(120) NOT NULL,
  category VARCHAR(60) NOT NULL,
  description VARCHAR(400) NOT NULL
);

INSERT INTO activities (name, category, description) VALUES
('Robotics Club', 'STEM', 'Builds and programs competition robots for the annual national robotics tournament.'),
('Taekwondo Team', 'Sports', 'Trains for regional taekwondo championships under a certified 5th-dan instructor.'),
('Concert Choir', 'Arts', 'Performs at the spring festival, graduation, and citywide choral competitions.'),
('Debate Society', 'Academic', 'Weekly practice debates covering current affairs and academic topics.'),
('Basketball Team', 'Sports', 'Competes in the Seoul Metropolitan Highschool League every autumn.'),
('Film & Media Club', 'Arts', 'Produces the school''s yearbook video and covers major campus events.'),
('Environmental Society', 'Community', 'Runs the campus recycling program and an annual tree-planting day.'),
('Math Olympiad Team', 'Academic', 'Prepares students for national and international math competitions.');

-- ---------- Notices (shown on the homepage) ----------
CREATE TABLE IF NOT EXISTS notices (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(150) NOT NULL,
  body VARCHAR(500) NOT NULL,
  posted_on DATE NOT NULL
);

INSERT INTO notices (title, body, posted_on) VALUES
('Autumn Festival — October 18', 'This year''s autumn festival will feature the choir, robotics demo booth, and food stalls run by each homeroom.', '2026-09-20'),
('Midterm Exam Schedule Posted', 'Midterm exams run November 3–7. Check your homeroom board for the full timetable.', '2026-09-15'),
('New Library Hours', 'The library will now stay open until 8 PM on weekdays to support exam preparation.', '2026-09-10');

-- ---------- Student Portal (demo login) ----------
CREATE TABLE IF NOT EXISTS students (
  id INT AUTO_INCREMENT PRIMARY KEY,
  student_id VARCHAR(30) NOT NULL UNIQUE,
  password VARCHAR(100) NOT NULL,
  name VARCHAR(100) NOT NULL,
  grade VARCHAR(20) NOT NULL,
  homeroom VARCHAR(20) NOT NULL,
  gpa DECIMAL(3,2) NOT NULL
);

-- Demo account used on the Student Portal page.
-- Plain-text password on purpose for a simple class demo — see routes/students.js note.
INSERT INTO students (student_id, password, name, grade, homeroom, gpa) VALUES
('GHS-2026-014', 'geumdo123', 'Seo Ha-eun', 'Grade 2', '2-B', 3.85),
('GHS-2026-021', 'geumdo123', 'Moon Tae-hyung', 'Grade 3', '3-C', 3.62);

-- ---------- Contact Messages (filled in by the Contact Us form) ----------
CREATE TABLE IF NOT EXISTS contact_messages (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(150) NOT NULL,
  subject VARCHAR(150),
  message TEXT NOT NULL,
  submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
