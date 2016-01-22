DROP TABLE IF EXISTS users;

CREATE TABLE users (
id INTEGER PRIMARY KEY,
fname VARCHAR(255) NOT NULL,
lname VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS questions;

CREATE TABLE questions (
id INTEGER PRIMARY KEY,
title VARCHAR(255) NOT NULL,
body TEXT NOT NULL,
user_id INTEGER NOT NULL,

FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_follows;

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS replies;

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  parent_reply INTEGER, 
  user_id INTEGER NOT NULL,
  body TEXT NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY(parent_reply) REFERENCES replies(id),
  FOREIGN KEY(user_id) REFERENCES users(id),
  FOREIGN KEY(question_id) REFERENCES questions(id)
);

DROP TABLE IF EXISTS question_likes;

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY(question_id) REFERENCES questions(id),
  FOREIGN KEY(user_id) REFERENCES users(id)
);

INSERT INTO users
  (fname, lname)
VALUES
  ('Matt', 'Dubin'),
  ('Peter', 'Griffin'),
  ('Justin', 'Tung'),
  ('Ned', 'Stark');

INSERT INTO questions
  (title, body, user_id)
VALUES
  ('Should we insert questions?', '???', (SELECT id FROM users WHERE fname = 'Matt')),
  ('Can I fart on Meg', 'Why or why not?', (SELECT id FROM users WHERE fname = 'Peter')),
  ('????', 'test question', (SELECT id FROM users WHERE fname = 'Peter'));


INSERT INTO question_likes
  (question_id, user_id)
VALUES
  (2, 3),
  (1, 1),
  (2, 4);

INSERT INTO question_follows
  (question_id, user_id)
VALUES
  (2, 1),
  (2, 4),
  (1, 2);

INSERT INTO replies
  (parent_reply, user_id, body, question_id)
VALUES
  (NULL, 4, 'YES!', 2),
  (1, 3,'That seems mean', 2),
  (NULL, 2, 'Sure, why not', 1);
