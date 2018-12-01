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
	(bks_title)
	VALUES
	('The Lost Tribe'),
	('Carrie'),
	('It'),
	('A Tale of Two Cities'),
	('The Lord of the Rings'),
	('The Little Prince'),
	('Harry Potter and the Philosophers Stone'),
	('The Little Prince'),
	('The Hobbit'),
	('Alices Adventures in Wonderland'),
	('Dream of the Red Chamber'),
	('And Then There Were None'),
	('The Lion, the Witch and the Wardrobe'),
	('She: A History of Adventure'),
	('The Da Vinci Code'),
	('The Adventures of Pinocchio'),
	('The Catcher in the Rye'),
	('The Alchemist'),
	('Harry Potter and the Deathly Hallows'),
	('Steps to Christ')
;
SELECT * FROM tbl_bks