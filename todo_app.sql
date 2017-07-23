1.
DROP USER IF EXISTS michael;
2.
CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';
3.
DROP DATABASE IF EXISTS todo_app;
4.
CREATE DATABASE todo_app;
5.
\c todo_app
6.
CREATE TABLE tasks (
  id SERIAL,
  title VARCHAR(255) NOT NULL,
  description TEXT NULL,
  created_at timestamp without time zone NOT NULL DEFAULT NOW(),
  updated_at timestamp NULL,
  completed BOOLEAN NOT NULL DEFAULT false
);
7.
ALTER TABLE tasks ADD PRIMARY KEY (id);
8.
9.
ALTER TABLE tasks DROP COLUMN completed;
10.
ALTER TABLE tasks ADD COLUMN completed_at timestamp DEFAULT NULL;
11.
ALTER TABLE tasks ALTER COLUMN updated_at SET DEFAULT NOW();
ALTER TABLE tasks ALTER COLUMN updated_at SET NOT NULL;
12.
INSERT INTO tasks (title, description, created_at, updated_at, completed_at)
VALUES ('Study SQL', 'Complete this exercise', NOW(), NOW(), NULL);
13.
INSERT INTO tasks (title, description)
VALUES ('Study PostgreSQL', 'Read all the documentation');
14.
SELECT title FROM tasks WHERE tasks.completed_at IS NULL;
15.
UPDATE tasks SET completed_at = NOW() WHERE tasks.title = 'Study SQL';
16.
SELECT title, description FROM tasks WHERE tasks.completed_at IS NULL;
17.
SELECT * FROM tasks ORDER BY created_at DESC;
18.
INSERT INTO tasks (title, description)
VALUES ('mistake 1', 'a test entry');
19.
INSERT INTO tasks (title, description)
VALUES ('mistake 2', 'another test entry');
20.
INSERT INTO tasks (title, description)
VALUES ('third mistake', 'another test entry');
21.
SELECT title FROM tasks WHERE title LIKE '%mistake%';
22.
DELETE FROM tasks WHERE title = 'mistake 1';
23.
SELECT title, description FROM tasks WHERE title LIKE '%mistake%';
24.
DELETE FROM tasks WHERE title LIKE '%mistake%';
25.
SELECT * FROM tasks ORDER BY title;