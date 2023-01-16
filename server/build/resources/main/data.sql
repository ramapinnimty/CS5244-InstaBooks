DELETE FROM book;
ALTER TABLE book AUTO_INCREMENT = 1001;

DELETE FROM category;
ALTER TABLE category AUTO_INCREMENT = 1001;

INSERT INTO `category` (`name`) VALUES ('Sci-Fi'),('Fantasy'),('Horror'),('Others');


INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Wrong Place Wrong Time', 'Gillian McAllister', 'Descr', 18, 5, TRUE, TRUE, 1001);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('The Giver', 'Lois Lowry', 'Descr', 2, 5, FALSE, FALSE, 1001);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Frankenstein: The 1818 Text', 'Mary Shelley, Ulrich Baer', 'Descr', 5, 5, TRUE, TRUE, 1001);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Scythe', 'Neal Shusterman', 'Descr', 1, 5, TRUE, TRUE, 1001);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Cloud Cuckoo Land', 'Anthony Doerr', 'Descr', 8, 5, FALSE, FALSE, 1001);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Parable of the Sower', 'Octavia E Butler', 'Descr', 8, 5, FALSE, FALSE, 1001);

INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('A Court Of Wings And Ruin', 'Sarah J Mass', 'Descr', 12, 5, TRUE, TRUE, 1002);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Circe','Madeline Miller', 'Descr', 5, 5, FALSE, FALSE, 1002);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Game Of Thrones', 'George R.R. Martin', 'Descr', 1, 5, TRUE, TRUE, 1002);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Jujutsu Kaisen', 'Gege Akutami', 'Descr', 6, 5, FALSE, FALSE, 1002);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('The Handmaids Tale', 'Margaret Atwood', 'Descr', 1, 5, TRUE, TRUE, 1002);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('The Secret', 'Byron Preiss', 'Descr', 13, 5, FALSE, FALSE, 1002);

INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('American Psycho', 'Bret Easton Ellis', 'Descr', 3, 5, FALSE, FALSE, 1003);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('It', 'Stephen King', 'Descr', 2, 5, FALSE, FALSE, 1003);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('The Haunting of Hill House', 'Shirley Jackson', 'Descr', 3, 5, TRUE, TRUE, 1003);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Home Before Dark', 'Riley Sager', 'Descr', 5, 5, FALSE, FALSE, 1003);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('The House Across the Lake', 'Riley Sager', 'Descr', 11, 5, TRUE, TRUE, 1003);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Mexican Gothic', 'Silvia Moreno-Garcia', 'Descr', 5, 5, TRUE, TRUE, 1003);

INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Cracking the Coding Interview', 'Gayle Laakmann McDowell', 'Descr', 14, 5, TRUE, TRUE, 1004);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('The High Performance Planner', 'Brendon Burchard', 'Descr', 16, 5, FALSE, FALSE, 1004);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('What Color is your Parachute?', 'Richard Nelson Bolles', 'Descr', 1, 5, TRUE, TRUE, 1004);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Designing your Life', 'Bill Burnett', 'Descr', 7, 5, FALSE, FALSE, 1004);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('The Gap and the Gain', 'Dan Sullivan', 'Descr', 18, 5, FALSE, FALSE, 1004);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('The Obstacle is the Way', 'Ryan Holiday', 'Descr', 8, 5, FALSE, FALSE, 1004);