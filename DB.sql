CREATE DATABASE ConnectEvent;

CREATE TABLE organisateurs (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nom VARCHAR(50),
	prenom VARCHAR(50),
    cin VARCHAR(50),
    email VARCHAR(50),
    num INT
)ENGINE=INNODB;
CREATE TABLE participants (
    id INT PRIMARY KEY AUTO_INCREMENT,
	nom VARCHAR(50),
	prenom VARCHAR(50),
    cin VARCHAR(50),
    email VARCHAR(50),
    num INT
)ENGINE=INNODB;
CREATE TABLE lieux (
	id INT PRIMARY KEY AUTO_INCREMENT,
    adress VARCHAR(50),
    pays VARCHAR(50)
)ENGINE=INNODB;
CREATE TABLE sponsors (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50),
    type VARCHAR(50),
    email VARCHAR(50)
)ENGINE=INNODB;
CREATE TABLE eventt (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50),
	activite VARCHAR(200),
    lieu VARCHAR(100),
    budget VARCHAR(100),
    dateevent DATE,
    idlieu INT,
    FOREIGN KEY (idlieu) REFERENCES lieux (id)
)ENGINE=INNODB;
CREATE TABLE organisation (
	id INT PRIMARY KEY AUTO_INCREMENT,
    idorga INT,
    idevent INT,
    FOREIGN KEY (idorga) REFERENCES organisateurs (id),
    FOREIGN KEY (idevent) REFERENCES eventt (id)
)ENGINE=INNODB;
CREATE TABLE participe (
	id INT PRIMARY KEY AUTO_INCREMENT,
    dateticket DATE,
    categorie VARCHAR(50),
    idevent INT,
    idparticipant INT,
    FOREIGN KEY (idevent) REFERENCES eventt(id),
    FOREIGN KEY (idparticipant) REFERENCES participants (id)
)ENGINE=INNODB;
CREATE TABLE sponsorisation (
	id INT PRIMARY KEY AUTO_INCREMENT,
    idevent INT,
    idsponsor INT,
    FOREIGN KEY (idevent) REFERENCES eventt (id),
    FOREIGN KEY (idsponsor) REFERENCES sponsors (id)
)ENGINE=INNODB


INSERT INTO organisateurs (nom, prenom, cin, email, num)
VALUES ('Tom', 'Erichsen', 'AA986765', 'tomerichsen@gmail.com', 0606060606),
('Jack', 'Rosso', 'AB789065', 'jackrosso@gmail.com', 0609875654),
('Son', 'Karl', 'BB364567', 'sonkarl@gmail.com', 0698349845),
('Ben', 'King', 'ZH002354', 'benking@gmail.com', 0600221314),
('Thomas', 'Scofieled', 'CA991213', 'thomassco@gmail.com', 0612131415);


INSERT INTO participants (nom, prenom, cin, email, num)
VALUES ('Chris', 'Tom', 'WW965869', 'christom@gmail.com', 0789875634),
('Sam', 'Losso', 'SS543423', 'samlosso@gmail.com', 0644239867),
('Bross', 'Karl', 'BB364567', 'brosskarl@gmail.com', 0685986754),
('Smith', 'Callum', 'NB667465', 'smithcallum@gmail.com', 0611208465),
('Neto', 'Kalom', 'RT873465', 'netokalom@gmail.com', 0777234356)

INSERT INTO lieux (adress, pays)
VALUES ('16 Bis, bd Hassan II, rue Ibn Rochd Settat', 'Morocco'),
('rue Oum Rabii, imm. Nakhil, Guéliz Marrakech', 'Morocco'),
('3268 Leverton Cove Road Springfield', 'US'),
('5 Grand-route dAssas, 17058 Valenciennes', 'France'),
('Bajada Teodoro, 8 Esc. 849, Santander, Com 54217', 'Spain')

INSERT INTO sponsors (nom, type, email)
VALUES ('KAMNUS', 'Financial Sponsorship', 'service@kamnus.com'),
('TOFOLA', 'In-kind Sponsorship', 'service@tofola.com'),
('EXPRESS', 'Media Sponsorship', 'service@express.com'),
('DONKA', 'Promotional Partners', 'service@donka.com')

INSERT INTO eventt (nom, activite, lieu, budget, dateevent, idlieu)
VALUES('JOJO', 'Dance', 'Morocco', '5.6M', '2023/11/29', 1),
('TANTAK', 'Swiming', 'Spain', '1.6M', '2023/12/10', 5),
('FROSD', 'Sing', 'US', '3.2M', '2023/12/20', 3)

INSERT INTO organisation (idevent, idorga)
VALUES (1, 3),
(2, 1),
(3, 5)
