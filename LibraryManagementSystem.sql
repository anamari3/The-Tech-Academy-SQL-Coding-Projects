CREATE TABLE tbl_branch (
	branch_id INT PRIMARY KEY NOT NULL IDENTITY (1000, 10),
	branch_name VARCHAR(50) NOT NULL,
	branch_address VARCHAR(100) NOT NULL
);

CREATE TABLE tbl_publisher (
	publisher_id INT PRIMARY KEY NOT NULL IDENTITY (22220,1),
	publisher_name NVARCHAR(50) NOT NULL,
	publisher_address VARCHAR(100) NOT NULL,
	publisher_phone VARCHAR(30) NOT NULL
);

CREATE TABLE tbl_bks (
	bks_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	bks_title VARCHAR(100) NOT NULL,
	bks_publisher_id INT FOREIGN KEY REFERENCES tbl_publisher(publisher_id)
);

CREATE TABLE tbl_bkcopies (
	bkcopies_book_id INT FOREIGN KEY REFERENCES tbl_bks(bks_id),
	bkcopies_branch_id INT FOREIGN KEY REFERENCES tbl_branch(branch_id),
	bkcopies_number_of_copies INT NOT NULL
);

CREATE TABLE tbl_borrower (
	borrower_cardno INT PRIMARY KEY NOT NULL IDENTITY (440,1),
	borrower_name VARCHAR(50) NOT NULL,
	borrower_address VARCHAR(100) NOT NULL,
	borrower_phone VARCHAR(30) NOT NULL
);

CREATE TABLE tbl_bkauthors (
	bkauthors_book_id INT FOREIGN KEY REFERENCES tbl_bks(bks_id),
	bkauthors_name VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_bkloans (
	bkloans_book_id INT FOREIGN KEY REFERENCES tbl_bks(bks_id),
	bkloans_branch_id INT FOREIGN KEY REFERENCES tbl_branch(branch_id),
	bkloans_card_no INT FOREIGN KEY REFERENCES tbl_borrower(borrower_cardno),
	bkloans_dtout DATE NOT NULL,
	bkloans_dtdue DATE NOT NULL
);

INSERT INTO tbl_branch
	(branch_name, branch_address)
	VALUES
	('Sharpstown', '500 College St SE, Lacey, WA 98503'),
	('Central', '415 12th Ave SW, Olympia, WA 98501'),
	('Tumwater','7023 New Market St SW, Tumwater, WA 98501'),
	('Timberland', '313 8th Ave SE, Olympia, WA 98501')
;
SELECT * FROM tbl_branch

INSERT INTO  tbl_publisher
	(publisher_name, publisher_address, publisher_phone)
	VALUES
	('Doubleday','8863 1st St. San Pablo, CA 94806', '(419) 461-8448'),
	('Viking', '506 St Margarets Avenue Chesapeake, VA 23320',	'(561) 425-5660'),
	('Penguin Random House', '8151 Smith Drive Bridgewater, NJ 08807', '(997) 481-5478'),
	('Hachette Livre', '860 South Longbranch Street Wantagh, NY 11793',	'(863) 319-2916'),
	('HarperCollins', '93 Applegate Ave. Waterford, MI 48329',	'(904) 889-7685'),
	('Pan Macmillan', '584 South Ryan Lane Libertyville, IL 60048',	'(736) 562-1742')
;
SELECT * FROM tbl_publisher

INSERT INTO tbl_bks
	(bks_title, bks_publisher_id)
	VALUES
	('The Lost Tribe', (SELECT publisher_id FROM tbl_publisher WHERE publisher_name = 'Penguin Random House')),
	('Carrie', (SELECT publisher_id FROM tbl_publisher WHERE publisher_name = 'Doubleday')),
	('It', (SELECT publisher_id FROM tbl_publisher WHERE publisher_name = 'Viking')),
	('A Tale of Two Cities', (SELECT publisher_id FROM tbl_publisher WHERE publisher_name = 'Hachette Livre')),
	('The Lord of the Rings',(SELECT publisher_id FROM tbl_publisher WHERE publisher_name = 'HarperCollins')),
	('The Little Prince', (SELECT publisher_id FROM tbl_publisher WHERE publisher_name = 'Pan Macmillan')),
	('Harry Potter and the Philosophers Stone', (SELECT publisher_id FROM tbl_publisher WHERE publisher_name = 'Penguin Random House')),
	('The Little Prince', (SELECT publisher_id FROM tbl_publisher WHERE publisher_name = 'Doubleday')),
	('The Hobbit', (SELECT publisher_id FROM tbl_publisher WHERE publisher_name = 'Viking')),
	('Alices Adventures in Wonderland', (SELECT publisher_id FROM tbl_publisher WHERE publisher_name = 'Hachette Livre')),
	('Dream of the Red Chamber', (SELECT publisher_id FROM tbl_publisher WHERE publisher_name = 'HarperCollins')),
	('And Then There Were None', (SELECT publisher_id FROM tbl_publisher WHERE publisher_name = 'Pan Macmillan')),
	('The Lion, the Witch and the Wardrobe', (SELECT publisher_id FROM tbl_publisher WHERE publisher_name = 'Penguin Random House')),
	('She: A History of Adventure', (SELECT publisher_id FROM tbl_publisher WHERE publisher_name = 'Doubleday')),
	('The Da Vinci Code', (SELECT publisher_id FROM tbl_publisher WHERE publisher_name = 'Viking')),
	('The Adventures of Pinocchio', (SELECT publisher_id FROM tbl_publisher WHERE publisher_name = 'Hachette Livre')),
	('The Catcher in the Rye', (SELECT publisher_id FROM tbl_publisher WHERE publisher_name = 'HarperCollins')),
	('The Alchemist', (SELECT publisher_id FROM tbl_publisher WHERE publisher_name = 'Pan Macmillan')),
	('Harry Potter and the Deathly Hallows', (SELECT publisher_id FROM tbl_publisher WHERE publisher_name = 'HarperCollins')),
	('Steps to Christ', (SELECT publisher_id FROM tbl_publisher WHERE publisher_name = 'Pan Macmillan'))
;
SELECT * FROM tbl_bks --Why are there over 20 books?? And why are only the last 60+ correctly contain publisher IDs?

UPDATE tbl_bks
SET bks_publisher_id = (SELECT publisher_id FROM tbl_publisher WHERE publisher_name = 'Pan Macmillan')
WHERE bks_title = 'Steps to Christ'


INSERT INTO tbl_bkcopies
	(bkcopies_book_id, bkcopies_branch_id, bkcopies_number_of_copies)
	VALUES
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Lost Tribe'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Sharpstown'), 6),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'Carrie'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Sharpstown'), 2),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'It'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Sharpstown'), 9),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'A Tale of Two Cities'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Sharpstown'), 2),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Lord of the Rings'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Sharpstown'), 5),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'And Then There Were None'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Sharpstown'), 7),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Lion, the Witch and the Wardrobe'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Sharpstown'), 5),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'She: A History of Adventure'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Sharpstown'), 3),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Da Vinci Code'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Sharpstown'), 2),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Little Prince'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Sharpstown'), 4),

	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'Harry Potter and the Philosophers Stone'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Central'), 4),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Little Prince'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Central'), 3),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Hobbit'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Central'), 4),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'Alices Adventures in Wonderland'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Central'), 7),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'Dream of the Red Chamber'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Central'), 4),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'And Then There Were None'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Central'), 2),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Lion, the Witch and the Wardrobe'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Central'), 8),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'Steps to Christ'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Central'), 2),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'Harry Potter and the Deathly Hallows'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Central'), 3),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Catcher in the Rye'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Central'), 4),
	