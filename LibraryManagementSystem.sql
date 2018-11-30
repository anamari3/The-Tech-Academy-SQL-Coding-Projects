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

--All tables are built. Next, fill them with information
--Test them with SELECT * from tbl_[name]
--Create 7 stored procedures