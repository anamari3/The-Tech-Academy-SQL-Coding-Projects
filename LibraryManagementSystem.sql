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
	('The Little Princess', (SELECT publisher_id FROM tbl_publisher WHERE publisher_name = 'Doubleday')),
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
SELECT * FROM tbl_bks 


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
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Little Princess'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Central'), 3),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Hobbit'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Central'), 4),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'Alices Adventures in Wonderland'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Central'), 7),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'Dream of the Red Chamber'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Central'), 4),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'And Then There Were None'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Central'), 2),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Lion, the Witch and the Wardrobe'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Central'), 8),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'Steps to Christ'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Central'), 2),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'Harry Potter and the Deathly Hallows'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Central'), 3),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Catcher in the Rye'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Central'), 4),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'Carrie'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Central'), 4),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'It'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Central'), 4),
		
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Alchemist'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Tumwater'), 3),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'Harry Potter and the Deathly Hallows'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Tumwater'), 5),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'Steps to Christ'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Tumwater'), 3),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Lost Tribe'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Tumwater'), 3),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Little Prince'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Tumwater'), 6),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'Harry Potter and the Philosophers Stone'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Tumwater'), 4),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Catcher in the Rye'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Tumwater'), 3),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Hobbit'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Tumwater'), 2),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'Alices Adventures in Wonderland'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Tumwater'), 2),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'Dream of the Red Chamber'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Tumwater'), 6),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'And Then There Were None'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Tumwater'), 4),

	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Lost Tribe'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Timberland'), 7),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'Carrie'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Timberland'), 3),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'It'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Timberland'), 5),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'A Tale of Two Cities'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Timberland'), 4),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'Steps to Christ'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Timberland'), 6),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Alchemist'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Timberland'), 4),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Catcher in the Rye'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Timberland'), 4),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Da Vinci Code'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Timberland'), 2),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'She: A History of Adventure'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Timberland'), 2),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Lion, the Witch and the Wardrobe'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Timberland'), 6)
;
SELECT * from tbl_bkcopies

INSERT INTO tbl_borrower
	(borrower_name, borrower_address, borrower_phone)
	VALUES
	('Argentina Mally', '94 Orchard Ave. Fairburn, GA 30213', '(660) 989-3086'),
	('Ian Kilkenny', '844 Cottage St. Moses Lake, WA 98837', '(264) 649-0349'),
	('Roseline Gabler', '945 8th St. Birmingham, AL 35209',	'(945) 302-7837'),
	('Enda Vazques', '7709 South Bellevue Ave. Indian Trail, NC 28079',	'(298) 710-9371'),
	('Marcy Conaway', '1 Foxrun St. Staunton, VA 24401', '(634) 483-6477'),
	('Laronda Leppert', '72 Summer Ave. Irvington, NJ 07111', '(626) 770-2115'),
	('Brock Malan', '8020 Augusta Dr. Opa Locka, FL 33054', '(233) 810-1652'),
	('Oren Draeger', '713 Tailwater St. Chatsworth, GA 30705', '(979) 422-4246')
;
SELECT * from tbl_borrower

INSERT INTO tbl_bkauthors
	(bkauthors_book_id, bkauthors_name)
	VALUES
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Lost Tribe'), 'H. Rider Haggard'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'Carrie'), 'Stephen King'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'It'), 'Stephen King'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'A Tale of Two Cities'), 'Charles Dickens'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Lord of the Rings'), 'J. R. R. Tolkien'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Little Prince'), 'Antoine de Saint-Exupéry'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'Harry Potter and the Philosophers Stone'), 'J. K. Rowling'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Little Princess'), 'Antoine de Saint-Exupéry'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Hobbit'), 'J. R. R. Tolkien'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'Alices Adventures in Wonderland'), 'Lewis Carroll'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'Dream of the Red Chamber'), 'Cao Xueqin'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'And Then There Were None'), 'Agatha Christie'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Lion, the Witch and the Wardrobe'), 'C. S. Lewis'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'She: A History of Adventure'), 'H. Rider Haggard'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Da Vinci Code'), 'Antoine de Saint-Exupéry'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Adventures of Pinocchio'), 'H. Rider Haggard'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Catcher in the Rye'), 'Cao Xueqin'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Alchemist'), 'Cao Xueqin'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'Harry Potter and the Deathly Hallows'), 'J. K. Rowling'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'Steps to Christ'), 'Lewis Carroll')
;
SELECT * from tbl_bkauthors

INSERT INTO tbl_bkloans
	(bkloans_book_id, bkloans_branch_id, bkloans_card_no, bkloans_dtout, bkloans_dtdue)
	VALUES
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Lost Tribe'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Central'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Roseline Gabler'), '01/13/2018','01/25/2018'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Lost Tribe'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Central'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Roseline Gabler'), '01/21/2018','02/02/2018'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Lost Tribe'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Sharpstown'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Marcy Conaway'), '01/29/2018','02/10/2018'),

	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'Carrie'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Tumwater'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Enda Vazques'), '02/06/2018','02/18/2018'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'Carrie'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Central'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Enda Vazques'), '02/14/2018','02/26/2018'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'Carrie'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Tumwater'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Argentina Mally'), '02/22/2018','03/06/2018'),

	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'It'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Sharpstown'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Brock Malan'), '03/02/2018','03/14/2018'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'It'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Central'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Oren Draeger'), '03/10/2018','03/22/2018'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'It'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Central'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Roseline Gabler'), '03/18/2018','03/30/2018'),

	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'A Tale of Two Cities'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Sharpstown'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Brock Malan'), '03/26/2018','04/07/2018'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'A Tale of Two Cities'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Sharpstown'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Oren Draeger'), '04/03/2018','04/15/2018'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'A Tale of Two Cities'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Tumwater'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Marcy Conaway'), '04/11/2018','04/23/2018'),

	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Lord of the Rings'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Sharpstown'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Argentina Mally'), '04/19/2018','05/01/2018'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Lord of the Rings'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Timberland'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Argentina Mally'), '04/27/2018','05/09/2018'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Lord of the Rings'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Central'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Roseline Gabler'), '05/05/2018','05/17/2018'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Lord of the Rings'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Tumwater'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Roseline Gabler'), '05/13/2018','05/25/2018'),

	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Little Prince'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Tumwater'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Laronda Leppert'), '05/21/2018','06/02/2018'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Little Prince'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Central'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Enda Vazques'), '05/29/2018','06/10/2018'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Little Prince'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Tumwater'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Enda Vazques'), '06/06/2018','06/18/2018'),

	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'Harry Potter and the Philosophers Stone'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Central'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Oren Draeger'), '06/14/2018','06/26/2018'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'Harry Potter and the Philosophers Stone'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Timberland'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Argentina Mally'), '06/22/2018','07/04/2018'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'Harry Potter and the Philosophers Stone'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Timberland'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Marcy Conaway'), '06/30/2018','07/12/2018'),

	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Little Princess'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Tumwater'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Ian Kilkenny'), '07/08/2018','07/20/2018'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Little Princess'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Sharpstown'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Enda Vazques'), '07/16/2018','07/28/2018'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Little Princess'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Sharpstown'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Enda Vazques'), '07/24/2018','08/05/2018'),

	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Hobbit'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Timberland'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Roseline Gabler'), '08/01/2018','08/13/2018'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Hobbit'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Tumwater'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Ian Kilkenny'), '08/09/2018','08/21/2018'),

	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'Alices Adventures in Wonderland'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Sharpstown'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Ian Kilkenny'), '08/17/2018','08/29/2018'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'Alices Adventures in Wonderland'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Timberland'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Marcy Conaway'), '08/25/2018','09/06/2018'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'Alices Adventures in Wonderland'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Sharpstown'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Oren Draeger'), '09/02/2018','09/14/2018'),

	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'And Then There Were None'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Sharpstown'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Oren Draeger'), '09/10/2018','09/22/2018'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'And Then There Were None'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Sharpstown'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Marcy Conaway'), '09/18/2018','09/30/2018'),

	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Lion, the Witch and the Wardrobe'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Tumwater'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Laronda Leppert'), '09/26/2018','10/08/2018'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Lion, the Witch and the Wardrobe'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Tumwater'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Oren Draeger'), '10/04/2018','10/16/2018'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Lion, the Witch and the Wardrobe'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Timberland'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Roseline Gabler'), '10/12/2018','10/24/2018'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Lion, the Witch and the Wardrobe'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Sharpstown'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Roseline Gabler'), '10/20/2018','11/01/2018'),

	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'She: A History of Adventure'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Central'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Argentina Mally'), '10/28/2018','11/09/2018'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'She: A History of Adventure'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Central'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Enda Vazques'), '11/05/2018','11/17/2018'),

	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Da Vinci Code'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Sharpstown'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Enda Vazques'), '11/13/2018','11/25/2018'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Da Vinci Code'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Central'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Argentina Mally'), '11/21/2018','12/03/2018'),

	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Adventures of Pinocchio'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Timberland'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Brock Malan'), '11/29/2018','12/11/2018'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Adventures of Pinocchio'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Timberland'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Roseline Gabler'), '12/07/2018','12/19/2018'),

	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Catcher in the Rye'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Central'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Roseline Gabler'), '12/15/2018','12/27/2018'),

	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Alchemist'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Central'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Enda Vazques'), '12/23/2018','01/04/2019'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Alchemist'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Sharpstown'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Enda Vazques'), '12/31/2018','01/12/2019'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'The Alchemist'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Timberland'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Ian Kilkenny'), '01/08/2019','01/20/2019'),

	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'Harry Potter and the Deathly Hallows'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Central'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Laronda Leppert'), '01/16/2019','01/28/2019'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'Harry Potter and the Deathly Hallows'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Sharpstown'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Enda Vazques'), '01/24/2019','02/05/2019'),

	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'Steps to Christ'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Central'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Brock Malan'), '02/01/2019','02/13/2019'),
	((SELECT bks_id FROM tbl_bks WHERE bks_title = 'Steps to Christ'), (SELECT branch_id FROM tbl_branch WHERE branch_name = 'Timberland'), (SELECT borrower_cardno FROM tbl_borrower WHERE borrower_name = 'Brock Malan'), '02/09/2019','02/21/2019')
;
SELECT * from tbl_bkloans

--QUERY #1
CREATE PROCEDURE dbo.spQuery1
AS
SELECT a1.bks_title as 'Title', a2.branch_name as 'Branch', a3.bkcopies_number_of_copies as 'Number of copies' 
FROM tbl_bkcopies a3
INNER JOIN tbl_bks a1 ON a1.bks_id = a3.bkcopies_book_id
INNER JOIN tbl_branch a2 ON a2.branch_id = a3.bkcopies_branch_id
WHERE bks_title='The Lost Tribe' AND branch_name='Sharpstown'
;
GO

EXECUTE dbo.spQuery1

--QUERY #2
CREATE PROCEDURE dbo.spQuery2
AS
SELECT a1.bks_title as 'Title', a2.branch_name as 'Branch', a3.bkcopies_number_of_copies as 'Number of copies' 
FROM tbl_bkcopies a3
INNER JOIN tbl_bks a1 ON a1.bks_id = a3.bkcopies_book_id
INNER JOIN tbl_branch a2 ON a2.branch_id = a3.bkcopies_branch_id
WHERE bks_title='The Lost Tribe'
;
GO

EXECUTE dbo.spQuery2

--QUERY #3
CREATE PROCEDURE dbo.spQuery3
AS
SELECT borrower_name as 'Name'
FROM tbl_borrower
WHERE borrower_cardno NOT IN (SELECT bkloans_card_no FROM tbl_bkloans)
;
GO

EXECUTE dbo.spQuery3

--QUERY #4
CREATE PROCEDURE dbo.spQuery4
AS
SELECT a1.bks_title as 'Title', a2.borrower_name as 'Name', a2.borrower_address as 'Address'
	FROM tbl_bkloans a3
	INNER JOIN tbl_bks a1 ON a1.bks_id = a3.bkloans_book_id
	INNER JOIN tbl_branch a4 ON a4.branch_id = a3.bkloans_branch_id
	INNER JOIN tbl_borrower a2 ON a2.borrower_cardno = a3.bkloans_card_no
	WHERE bkloans_dtdue = '2018-12-3' AND branch_name = 'Sharpstown'
;
GO

EXECUTE dbo.spQuery4

--QUERY #5 --
CREATE PROCEDURE dbo.spQuery5
AS
SELECT * from tbl_branch
INNER JOIN tbl_bkloans ON branch_id = branch_id
;
GO

EXECUTE dbo.spQuery5

--QUERY #6
CREATE PROCEDURE dbo.spQuery6
AS
SELECT borrower_name as 'Name', borrower_address as 'Address', COUNT(*) AS NumberofBooksCheckedOut
	FROM tbl_bkloans
	INNER JOIN tbl_borrower ON borrower_cardno = tbl_bkloans.bkloans_card_no
	GROUP BY borrower_name, borrower_address HAVING COUNT(*) > 5
;
GO

EXECUTE dbo.spQuery6

--QUERY #7
CREATE PROCEDURE dbo.spQuery7
AS
SELECT a1.bks_title as 'Title', a2.bkcopies_number_of_copies as 'Number of Copies'
	FROM tbl_bks a1
	INNER JOIN tbl_bkcopies a2 ON a2.bkcopies_book_id = a1.bks_id
	INNER JOIN tbl_bkauthors a3 ON a3.bkauthors_book_id = a1.bks_id
	INNER JOIN tbl_branch a4 ON a4.branch_id = a2.bkcopies_branch_id
	WHERE bkauthors_name ='Stephen King' AND branch_name ='Central'
;
GO

EXECUTE dbo.spQuery7


DROP PROC dbo.spcopiesGet
GO

DROP TABLE tbl_bkauthors ;
DROP TABLE tbl_bkloans;
DROP TABLE tbl_borrower;
DROP TABLE tbl_bkcopies;
DROP TABLE tbl_branch;
DROP TABLE tbl_bks;
DROP TABLE tbl_publisher;
GO

DROP PROC dbo.spQuery1;
DROP PROC dbo.spQuery2;
DROP PROC dbo.spQuery3;
DROP PROC dbo.spQuery4;
DROP PROC dbo.spQuery5;
DROP PROC dbo.spQuery6;
DROP PROC dbo.spQuery7;
GO