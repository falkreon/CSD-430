USE CSD430;

DROP USER IF EXISTS 'student1'@'localhost';
CREATE USER 'student1'@'localhost' IDENTIFIED BY 'pass';

DROP TABLE IF EXISTS `isaacbooks`;

CREATE TABLE isaacbooks (
	AuthorLastName VARCHAR(40) NOT NULL,
	AuthorOtherNames VARCHAR(40),
	Title VARCHAR(256) NOT NULL,
	InitialPublicationYear INT NOT NULL,
	ISBN13 BIGINT NOT NULL,
	PRIMARY KEY(`ISBN13`)
);

INSERT INTO isaacbooks VALUES
("Tolstoy",          "Leo",       "Anna Kerenina",          1878, 9780143035008),
("Lee",              "Harper",    "To Kill A Mockingbird",  1960, 9780060935467),
("Silverstein",      "Shel",      "Where the Sidewalk Ends",1974, 9780060256678),
("Susann",           "Jacqueline","Valley of the Dolls",    1966, 9781860498879),
("King",             "Stephen",   "The Shining",            1977, 9780345806789),
("de Saint-Exupéry", "Antoine",   "The Little Prince",      1943, 9780156012195),
("Tolkein",          "J.R.R.",    "The Fellowship of the Ring", 1954, 9780547928210),
("Atwood",           "Margaret",  "The Handmaid's Tale",    1985, 9780385490818),
("L'Engle",          "Madeline",  "A Wrinkle in Time",      1962, 9780312367541),
("Austen",           "Jane",      "Pride and Prejudice",    1813, 9780141439518),
("Woodward",         "Bob",       "All the President's Men",1974, 9781476770512),
("Frankl",           "Viktor",    "Man's Search for Meaning",1946,9780807014271),
("Morrison",         "Toni",      "Beloved",                1987, 9781400033416),
("Capote",           "Truman",    "In Cold Blood",          1965, 9780679745587),
("Beah",             "Ishmael",   "A Long Way Gone: Memoirs of a Boy Solider", 2007, 9780374531263)
;

GRANT ALL ON `isaacbooks` TO `student1`@`localhost`;
