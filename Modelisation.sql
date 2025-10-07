--— form Formation (idFormation Number(4), prerequis Varchar2(300),duree Number(3),idSpecialite Number(4), titre Varchar2(100))
--— form Specialite (idSpecialite Number(4),labelSpecialite Varchar2(100))
--— form Session (idSession Number(4),dateDebut Date,typeSession Number(1),idFormateur Number(4),idFormation Number(4))
--— form Etudiant (idEtudiant Number(4),nomEtudiant Varchar2(20),prenomEtudiant Varchar2(20),dateNaissance date, telEtudiant Varchar2(8),emailEtud Varchar2(20),adresseEtud Varchar2(30), sexe Char)
--— form Inscription (numInscription Number(4),dateInscription Date,idEtudiantNumber(4),idSession Number(4));
--— form Seance (numSeance Number(4),dateSeance Date,heureDeb Number(4),heureFinNumber(4),idSession Number(4),idSalle Number(4))
--— form Salle (numSalle Number(4),capacite Number(3))
--— form formateur (idFormateur Number(4),nomFormateur Varchar2(20),prenomFormateurVarchar2(20),telFormateur Varchar2(8),emailFormateur Varchar2(20),adresseFormateur Varchar2(30),idSpecialite Number(4))
--— form Abscence (idFormateur Number(4),numSeance Number(4),motif Varchar2(300))


CREATE TABLE Specialite(
    idSpecialite Number(4) PRIMARY KEY NOT NULL,
    labelSpecialite Varchar2(100) NOT NULL
);

CREATE TABLE Formation(
    idFormation Number(4) PRIMARY KEY NOT NULL,
    prerequis Varchar2(300) NOT NULL,
    duree Number(3) NOT NULL,
    idSpecialite Number(4) NOT NULL,
    titre Varchar2(100) NOT NULL,
    FOREIGN KEY (idSpecialite) REFERENCES Specialite(idSpecialite)
);

CREATE TABLE Etudiant(
    idEtudiant Number(4) PRIMARY KEY NOT NULL,
    nomEtudiant Varchar2(20) NOT NULL,
    prenomEtudiant Varchar2(20) NOT NULL,
    dateNaissance date NOT NULL,
    telEtudiant Varchar2(8) NOT NULL,
    emailEtud Varchar2(30) NOT NULL,
    adresseEtud Varchar2(30) NOT NULL,
    sexe Char NOT NULL
);

CREATE TABLE formateur(
    idFormateur Number(4)PRIMARY KEY NOT NULL,
    nomFormateur Varchar2(20)NOT NULL,
    prenomFormateur Varchar2(20)NOT NULL,
    telFormateur Varchar2(8)NOT NULL,
    emailFormateur Varchar2(30)NOT NULL,
    adresseFormateur Varchar2(30) NOT NULL,
    idSpecialite Number(4)NOT NULL,
    FOREIGN KEY(idSpecialite) REFERENCES Specialite(idSpecialite)
);

CREATE TABLE Sessionn( -- Le nom 'Session' est reservé par Oracle
    idSession Number(4) PRIMARY KEY NOT NULL,
    dateDebut Date NOT NULL,
    typeSession Number(1) NOT NULL,
    idFormateur Number(4) NOT NULL,
    idFormation Number(4) NOT NULL,
    FOREIGN KEY (idFormateur) REFERENCES formateur(idFormateur),
    FOREIGN KEY (idFormation) REFERENCES Formation(idFormation)
);

CREATE TABLE Inscription(
    numInscription Number(4) PRIMARY KEY NOT NULL,
    dateInscription Date NOT NULL,
    idEtudiant Number(4)NOT NULL,
    idSession Number(4) NOT NULL,
    FOREIGN KEY (idEtudiant) REFERENCES Etudiant(idEtudiant),
    FOREIGN KEY (idSession) REFERENCES Sessionn(idSession)
);

CREATE TABLE Salle(
    numSalle Number(4)PRIMARY KEY NOT NULL,
    capacite Number(3) NOT NULL
);

CREATE TABLE Seance(
    numSeance Number(4) PRIMARY KEY NOT NULL,
    dateSeance Date NOT NULL,
    heureDeb Number(4)NOT NULL,
    heureFin Number(4)NOT NULL,
    idSession Number(4)NOT NULL,
    idSalle Number(4)NOT NULL,
    FOREIGN KEY (idSession) REFERENCES Sessionn(idSession),
    FOREIGN KEY (idSalle) REFERENCES Salle(numSalle)
);

CREATE TABLE Abscence (
    idFormateur Number(4) PRIMARY KEY NOT NULL,
    numSeance Number(4) NOT NULL,
    motif Varchar2(300) NOT NULL,
    FOREIGN KEY (numSeance) REFERENCES Seance(numSeance)
);


--------  Insertion des données --------------
INSERT INTO Etudiant VALUES(1001, 'Ben Salah', 'Amine', TO_DATE('1999-04-12', 'YYYY-MM-DD'), '21458963', 'amine.bs@gmail.com', 'Rue Habib Bourguiba, Tunis', 'M');
INSERT INTO Etudiant VALUES(1002, 'Trabelsi', 'Sarra', TO_DATE('2001-01-30', 'YYYY-MM-DD'), '21587496', 'sarra.trb@gmail.com', 'Ariana Centre, Ariana', 'F');
INSERT INTO Etudiant VALUES(1003, 'Kacem', 'Youssef', TO_DATE('1998-08-05', 'YYYY-MM-DD'), '21698745', 'ykacem98@gmail.com', 'Ennasr 2, Ariana', 'M');
INSERT INTO Etudiant VALUES(1004, 'Masmoudi', 'Mouna', TO_DATE('2000-12-22', 'YYYY-MM-DD'), '21325498', 'mouna.ms@gmail.com', 'El Menzah 6, Tunis', 'F');
INSERT INTO Etudiant VALUES(1005, 'Chatti', 'Ali', TO_DATE('1997-07-17', 'YYYY-MM-DD'), '21002356', 'ali.chatti@yahoo.com', 'Rue Ibn Khaldoun, Sfax', 'M');
INSERT INTO Etudiant VALUES(1006, 'Hammami', 'Mariem', TO_DATE('2002-11-02', 'YYYY-MM-DD'), '21478596', 'mariem.hm@gmail.com', 'Route de la Marsa, Tunis', 'F');
INSERT INTO Etudiant VALUES(1007, 'Mahmoud', 'Khalil', TO_DATE('1999-06-15', 'YYYY-MM-DD'), '21213478', 'khalil.m@gmail.com', 'Avenue Hedi Nouira, Tunis', 'M');
INSERT INTO Etudiant VALUES(1008, 'Saidi', 'Ines', TO_DATE('2001-10-25', 'YYYY-MM-DD'), '21984756', 'ines.sd@hotmail.com', 'Rue de Marseille, Sousse', 'F');
INSERT INTO Etudiant VALUES(1009, 'Jedidi', 'Ahmed', TO_DATE('1998-03-12', 'YYYY-MM-DD'), '21654321', 'ahmed.j@gmail.com', 'Sahloul, Sousse', 'M');
INSERT INTO Etudiant VALUES(1010, 'Bahri', 'Nadia', TO_DATE('2003-09-05', 'YYYY-MM-DD'), '21365874', 'nadia.bhri@gmail.com', 'El Mourouj, Ben Arous', 'F');
INSERT INTO Etudiant VALUES(1011, 'Gharbi', 'Walid', TO_DATE('1997-02-18', 'YYYY-MM-DD'), '21245789', 'walid.gh@gmail.com', 'Bab El Khadhra, Tunis', 'M');
INSERT INTO Etudiant VALUES(1012, 'Kallel', 'Fatma', TO_DATE('2000-07-01', 'YYYY-MM-DD'), '21784563', 'fatma.0l@gmail.com', 'Route Gremda, Sfax', 'F');
INSERT INTO Etudiant VALUES(1013, 'Ben Amor', 'Rami', TO_DATE('1996-05-09', 'YYYY-MM-DD'), '21015987', 'rami.ba@yahoo.com', 'Centre Ville, Kairouan', 'M');
INSERT INTO Etudiant VALUES(1014, 'Mekki', 'Lina', TO_DATE('2002-04-14', 'YYYY-MM-DD'), '21336987', 'lina.mekki@gmail.com', 'Avenue Bourguiba, Monastir', 'F');
INSERT INTO Etudiant VALUES(1015, 'Bouzid', 'Omar', TO_DATE('1995-11-20', 'YYYY-MM-DD'), '21996633', 'omar.bz@hotmail.com', 'Rue Cheikh Mohamed, Gabes', 'M');

INSERT INTO Specialite VALUES(9001, 'Développement logiciel');
INSERT INTO Specialite VALUES(9002, 'Design + UX');
INSERT INTO Specialite VALUES(9003, 'Data Science + IA');
INSERT INTO Specialite VALUES(9004, 'Gestion de projets IT');
INSERT INTO Specialite VALUES(9005, 'Cybersécurité');
INSERT INTO Specialite VALUES(9006, 'Réseaux informatiques');
INSERT INTO Specialite VALUES(9007, 'Systèmes embarqués');
INSERT INTO Specialite VALUES(9008, 'Développement mobile');
INSERT INTO Specialite VALUES(9009, 'Cloud Computing');
INSERT INTO Specialite VALUES(9010, 'Ingénierie logicielle');
INSERT INTO Specialite VALUES(9011, 'Architecture SI');
INSERT INTO Specialite VALUES(9012, 'Administration base de données');
INSERT INTO Specialite VALUES(9013, 'Support technique');
INSERT INTO Specialite VALUES(9014, 'Technologie Web');
INSERT INTO Specialite VALUES(9015, 'Innovation numérique');

INSERT INTO Salle VALUES (4001, 30);
INSERT INTO Salle VALUES(4002, 25);
INSERT INTO Salle VALUES(4003, 40);
INSERT INTO Salle VALUES(4004, 20);
INSERT INTO Salle VALUES(4005, 35);
INSERT INTO Salle VALUES(4006, 30);
INSERT INTO Salle VALUES(4007, 50);
INSERT INTO Salle VALUES(4008, 15);
INSERT INTO Salle VALUES(4009, 45);
INSERT INTO Salle VALUES(4010, 28);
INSERT INTO Salle VALUES(4011, 22);
INSERT INTO Salle VALUES(4012, 26);
INSERT INTO Salle VALUES(4013, 18);
INSERT INTO Salle VALUES(4014, 32);
INSERT INTO Salle VALUES(4015, 38);

INSERT INTO Formation VALUES (8001, 'Notions de base en informatique', 90, 9001, 'Développement Web');
INSERT INTO Formation VALUES(8002, 'Connaissances en UX/UI', 60, 9002, 'Design d’interface');
INSERT INTO Formation VALUES(8003, 'Bonne logique mathématique', 100, 9003, 'Data Science');
INSERT INTO Formation VALUES(8004, 'Maîtrise d’Excel', 40, 9004, 'Analyse de données');
INSERT INTO Formation VALUES(8005, 'Anglais technique requis', 70, 9001, 'Développement Mobile');
INSERT INTO Formation VALUES(8006, 'Notions en réseau', 80, 9002, 'Cybersécurité');
INSERT INTO Formation VALUES(8007, 'Avoir déjà codé un programme', 100, 9003, 'Programmation Avancée');
INSERT INTO Formation VALUES(8008, 'Maîtrise de HTML/CSS', 50, 9001, 'Frontend Development');
INSERT INTO Formation VALUES(8009, 'Expérience en gestion', 60, 9004, 'Gestion de projets IT');
INSERT INTO Formation VALUES(8010, 'Aisance avec bases de données', 70, 9003, 'SQL et NoSQL');
INSERT INTO Formation VALUES(8011, 'Utilisation de Git', 30, 9001, 'Contrôle de version');
INSERT INTO Formation VALUES(8012, 'Compétences algorithmiques', 90, 9003, 'Algorithmique avancée');
INSERT INTO Formation VALUES(8013, 'Méthodes agiles connues', 50, 9004, 'Scrum et DevOps');
INSERT INTO Formation VALUES(8014, 'Base en Linux', 60, 9002, 'Administration système');
INSERT INTO Formation VALUES(8015, 'Connaissances mathématiques', 100, 9003, 'Machine Learning');

INSERT INTO Formateur VALUES (2001, 'Ayari', 'Hichem', '20254789', 'hichem.ay@gmail.com', 'Cité Ennasr, Tunis', 9001);
INSERT INTO Formateur VALUES (2002, 'Baccar', 'Sonia', '20123456', 'sonia.bacc@gmail.com', 'Marsa Ville, Tunis', 9002);
INSERT INTO Formateur VALUES (2003, 'Feki', 'Anis', '20789456', 'anis.feki@yahoo.com', 'Sahloul, Sousse', 9003);
INSERT INTO Formateur VALUES (2004, 'Mhenni', 'Olfa', '20885677', 'olfa.mh@hotmail.com', 'Route Gremda, Sfax', 9001);
INSERT INTO Formateur VALUES (2005, 'Rebhi', 'Walid', '20993456', 'walid.reb@gmail.com', 'El Mourouj, Tunis', 9004);
INSERT INTO Formateur VALUES (2006, 'Triki', 'Nour', '20567234', 'nour.triki@gmail.com', 'La Goulette, Tunis', 9002);
INSERT INTO Formateur VALUES (2007, 'Jlassi', 'Mohamed', '20247852', 'mohamed.jlas@gmail.com', 'Centre Ville, Kairouan', 9001);
INSERT INTO Formateur VALUES (2008, 'Younes', 'Ines', '20995432', 'ines.youn@gmail.com', 'Bab Bhar, Sousse', 9003);
INSERT INTO Formateur VALUES (2009, 'Guedira', 'Salma', '20345678', 'salma.g@gmail.com', 'La Marsa, Tunis', 9004);
INSERT INTO Formateur VALUES (2010, 'Maatoug', 'Rached', '20221234', 'rached.maato@gmail.com', 'Bizerte Nord', 9002);
INSERT INTO Formateur VALUES (2011, 'Zoghlami', 'Kamel', '20115678', 'kamel.z@gmail.com', 'Denden, Manouba', 9003);
INSERT INTO Formateur VALUES (2012, 'Ben Amor', 'Nesrine', '20896542', 'nesrine.ba@gmail.com', 'Sfax Centre', 9004);
INSERT INTO Formateur VALUES (2013, 'Kharrat', 'Sami', '20778855', 'sami.kharr@gmail.com', 'Ezzahra, Ben Arous', 9001);
INSERT INTO Formateur VALUES (2014, 'Cherni', 'Hedia', '20458963', 'hedia.cher@gmail.com', 'Enfidha, Sousse', 9002);
INSERT INTO Formateur VALUES (2015, 'Mehri', 'Adel', '20994567', 'adel.meh@gmail.com', 'Nabeul Centre', 9003);


INSERT INTO Sessionn VALUES (3001, TO_DATE('2023-09-15', 'YYYY-MM-DD'), 1, 2001, 8001);
INSERT INTO Sessionn VALUES(3002, TO_DATE('2023-09-18', 'YYYY-MM-DD'), 2, 2002, 8002);
INSERT INTO Sessionn VALUES(3003, TO_DATE('2023-09-20', 'YYYY-MM-DD'), 1, 2003, 8003);
INSERT INTO Sessionn VALUES(3004, TO_DATE('2023-09-22', 'YYYY-MM-DD'), 2, 2004, 8004);
INSERT INTO Sessionn VALUES(3005, TO_DATE('2023-09-25', 'YYYY-MM-DD'), 1, 2005, 8005);
INSERT INTO Sessionn VALUES(3006, TO_DATE('2023-09-28', 'YYYY-MM-DD'), 2, 2006, 8006);
INSERT INTO Sessionn VALUES(3007, TO_DATE('2023-10-01', 'YYYY-MM-DD'), 1, 2007, 8007);
INSERT INTO Sessionn VALUES(3008, TO_DATE('2023-10-04', 'YYYY-MM-DD'), 2, 2008, 8008);
INSERT INTO Sessionn VALUES(3009, TO_DATE('2023-10-06', 'YYYY-MM-DD'), 1, 2009, 8009);
INSERT INTO Sessionn VALUES(3010, TO_DATE('2023-10-08', 'YYYY-MM-DD'), 2, 2010, 8010);
INSERT INTO Sessionn VALUES(3011, TO_DATE('2023-10-10', 'YYYY-MM-DD'), 1, 2011, 8011);
INSERT INTO Sessionn VALUES(3012, TO_DATE('2023-10-12', 'YYYY-MM-DD'), 2, 2012, 8012);
INSERT INTO Sessionn VALUES(3013, TO_DATE('2023-10-14', 'YYYY-MM-DD'), 1, 2013, 8013);
INSERT INTO Sessionn VALUES(3014, TO_DATE('2023-10-16', 'YYYY-MM-DD'), 2, 2014, 8014);
INSERT INTO Sessionn VALUES(3015, TO_DATE('2023-10-18', 'YYYY-MM-DD'), 1, 2015, 8015);



INSERT INTO Inscription VALUES (5001, TO_DATE('2023-09-01', 'YYYY-MM-DD'), 1001, 3001);
INSERT INTO Inscription VALUES(5002, TO_DATE('2023-09-03', 'YYYY-MM-DD'), 1002, 3002);
INSERT INTO Inscription VALUES(5003, TO_DATE('2023-09-05', 'YYYY-MM-DD'), 1003, 3001);
INSERT INTO Inscription VALUES(5004, TO_DATE('2023-09-06', 'YYYY-MM-DD'), 1004, 3003);
INSERT INTO Inscription VALUES(5005, TO_DATE('2023-09-08', 'YYYY-MM-DD'), 1005, 3004);
INSERT INTO Inscription VALUES(5006, TO_DATE('2023-09-10', 'YYYY-MM-DD'), 1006, 3002);
INSERT INTO Inscription VALUES(5007, TO_DATE('2023-09-11', 'YYYY-MM-DD'), 1007, 3003);
INSERT INTO Inscription VALUES(5008, TO_DATE('2023-09-12', 'YYYY-MM-DD'), 1008, 3001);
INSERT INTO Inscription VALUES(5009, TO_DATE('2023-09-13', 'YYYY-MM-DD'), 1009, 3004);
INSERT INTO Inscription VALUES(5010, TO_DATE('2023-09-15', 'YYYY-MM-DD'), 1010, 3001);
INSERT INTO Inscription VALUES(5011, TO_DATE('2023-09-16', 'YYYY-MM-DD'), 1011, 3003);
INSERT INTO Inscription VALUES(5012, TO_DATE('2023-09-17', 'YYYY-MM-DD'), 1012, 3004);
INSERT INTO Inscription VALUES(5013, TO_DATE('2023-09-18', 'YYYY-MM-DD'), 1013, 3002);
INSERT INTO Inscription VALUES(5014, TO_DATE('2023-09-20', 'YYYY-MM-DD'), 1014, 3001);
INSERT INTO Inscription VALUES(5015, TO_DATE('2023-09-22', 'YYYY-MM-DD'), 1015, 3003);


INSERT INTO Seance VALUES (6001, TO_DATE('2023-10-01', 'YYYY-MM-DD'), 9, 12, 3001, 4001);
INSERT INTO Seance VALUES (6002, TO_DATE('2023-10-02', 'YYYY-MM-DD'), 13, 16, 3002, 4002);
INSERT INTO Seance VALUES (6003, TO_DATE('2023-10-03', 'YYYY-MM-DD'), 9, 12, 3003, 4003);
INSERT INTO Seance VALUES (6004, TO_DATE('2023-10-04', 'YYYY-MM-DD'), 14, 17, 3004, 4001);
INSERT INTO Seance VALUES (6005, TO_DATE('2023-10-05', 'YYYY-MM-DD'), 8, 11, 3001, 4002);
INSERT INTO Seance VALUES (6006, TO_DATE('2023-10-06', 'YYYY-MM-DD'), 10, 13, 3002, 4003);
INSERT INTO Seance VALUES (6007, TO_DATE('2023-10-07', 'YYYY-MM-DD'), 9, 12, 3003, 4001);
INSERT INTO Seance VALUES (6008, TO_DATE('2023-10-08', 'YYYY-MM-DD'), 11, 14, 3004, 4002);
INSERT INTO Seance VALUES (6009, TO_DATE('2023-10-09', 'YYYY-MM-DD'), 13, 16, 3001, 4003);
INSERT INTO Seance VALUES (6010, TO_DATE('2023-10-10', 'YYYY-MM-DD'), 15, 18, 3002, 4001);
INSERT INTO Seance VALUES (6011, TO_DATE('2023-10-11', 'YYYY-MM-DD'), 9, 12, 3003, 4002);
INSERT INTO Seance VALUES (6012, TO_DATE('2023-10-12', 'YYYY-MM-DD'), 10, 13, 3004, 4003);
INSERT INTO Seance VALUES (6013, TO_DATE('2023-10-13', 'YYYY-MM-DD'), 14, 17, 3001, 4001);
INSERT INTO Seance VALUES (6014, TO_DATE('2023-10-14', 'YYYY-MM-DD'), 8, 11, 3002, 4002);
INSERT INTO Seance VALUES (6015, TO_DATE('2023-10-15', 'YYYY-MM-DD'), 9, 12, 3003, 4003);

INSERT INTO Abscence VALUES (2001, 6002, 'Congé maladie');
INSERT INTO Abscence VALUES (2003, 6005, 'Retard de transport');
INSERT INTO Abscence VALUES (2002, 6006, 'Problème personnel');
INSERT INTO Abscence VALUES (2004, 6003, 'Formation en ligne');
INSERT INTO Abscence VALUES (2005, 6004, 'Urgence familiale');
INSERT INTO Abscence VALUES (2006, 6009, 'Problème technique');
INSERT INTO Abscence VALUES (2015, 6008, 'Consultation médicale');
INSERT INTO Abscence VALUES (2007, 6001, 'Rendez-vous administratif');
INSERT INTO Abscence VALUES (2008, 6012, 'Problème de santé');
INSERT INTO Abscence VALUES (2009, 6010, 'Retard justifié');
INSERT INTO Abscence VALUES (2010, 6011, 'Congé autorisé');
INSERT INTO Abscence VALUES (2011, 6007, 'Mission professionnelle');
INSERT INTO Abscence VALUES (2012, 6013, 'Force majeure');
INSERT INTO Abscence VALUES (2013, 6014, 'Absent sans justification');
INSERT INTO Abscence VALUES (2014, 6015, 'Difficulté de déplacement');


-------------------- CREATION DU DATA MART -------------------------------

DROP TABLE IF EXISTS `form_Fact_DemandeFormation`;
DROP TABLE IF EXISTS `form_Dim_Date`;
DROP TABLE IF EXISTS `form_Dim_Etudiant`;
DROP TABLE IF EXISTS `form_Dim_Specialite`;
DROP TABLE IF EXISTS `form_Dim_formation`;
DROP TABLE IF EXISTS `form_Dim_TypeEnseignement`;
DROP TABLE IF EXISTS `form_Fact_RendementFormateur`;
DROP TABLE IF EXISTS `form_Dim_Formateur`;
DROP TABLE IF EXISTS `Dim_Seance`;


CREATE TABLE FORM_DIM_DATE (
  IDDATE       NUMBER(8)     NOT NULL,
  DATEC        DATE          NOT NULL,
  MOIS         VARCHAR2(2)   NOT NULL,
  TRIMESTRE    VARCHAR2(2)   NOT NULL,
  ANNEE        VARCHAR2(4)   NOT NULL,
  PRIMARY KEY (IDDATE)
);

CREATE TABLE FORM_DIM_ETUDIANT (
  IDETUDIANT       NUMBER(4)     NOT NULL,
  NOMCOMPLETETUD   VARCHAR2(41)  NOT NULL,
  SEXE             VARCHAR2(5)   NOT NULL,
  AGE              NUMBER(2)     NOT NULL,
  PRIMARY KEY (IDETUDIANT)
);


CREATE TABLE FORM_DIM_SPECIALITE (
  IDSPECIALITE      NUMBER(4)     NOT NULL,
  LABELSPECIALITE   VARCHAR2(20)  NOT NULL,
  PRIMARY KEY (IDSPECIALITE)
);
  

CREATE TABLE FORM_DIM_FORMATION (
  IDFORMATION    NUMBER(4)    NOT NULL,
  DUREE          NUMBER(3)    NOT NULL,
  TITRE          VARCHAR2(100) NOT NULL,
 PRIMARY KEY (IDFORMATION)
);

CREATE TABLE FORM_DIM_TYPEENSEIGNEMENT (
  IDTYPEENSEIGNEMENT  NUMBER(4)   NOT NULL,
  TYPEENSEIGNEMENT    VARCHAR2(10) NOT NULL,
  PRIMARY KEY (IDTYPEENSEIGNEMENT)
);
ALTER TABLE FORM_DIM_TYPEENSEIGNEMENT ADD TYPESESSION NUMBER(1)

CREATE TABLE FORM_FACT_DEMANDEFORMATION (
  IDTYPEENSEIGNEMENT  NUMBER(4)  NOT NULL,
  IDDATE              NUMBER(8)  NOT NULL,
  IDETUDIANT          NUMBER(4)  NOT NULL,
  IDSPECIALITE        NUMBER(4)  NOT NULL,
  IDFORMATION         NUMBER(4)  NOT NULL,
  NBINSCRIPTION       NUMBER(4)  NOT NULL,
  PRIMARY KEY (IDTYPEENSEIGNEMENT, IDDATE, IDETUDIANT, IDSPECIALITE, IDFORMATION),
  FOREIGN KEY (IDTYPEENSEIGNEMENT) REFERENCES FORM_DIM_TYPEENSEIGNEMENT (IDTYPEENSEIGNEMENT),
  FOREIGN KEY (IDDATE) REFERENCES FORM_DIM_DATE (IDDATE),
  FOREIGN KEY (IDETUDIANT) REFERENCES FORM_DIM_ETUDIANT (IDETUDIANT),
  FOREIGN KEY (IDSPECIALITE) REFERENCES FORM_DIM_SPECIALITE (IDSPECIALITE),
  FOREIGN KEY (IDFORMATION) REFERENCES FORM_DIM_FORMATION (IDFORMATION)
);

CREATE TABLE DIM_SEANCE (
  NUMSEANCE  NUMBER(4) NOT NULL,
  DUREE      INTEGER   NOT NULL
);

CREATE TABLE FORM_DIM_FORMATEUR (
  IDFORMATEUR    NUMBER(4)     NOT NULL,
  NOMCOMPLETFORM VARCHAR2(41)  NOT NULL,
  CONSTRAINT PK_FORM_DIM_FORMATEUR PRIMARY KEY (IDFORMATEUR)
);

CREATE TABLE FORM_FACT_RENDEMENTFORMATEURR (
  IDDATE        NUMBER(8) NOT NULL,
  IDSPECIALITE  NUMBER(4) NOT NULL,
  IDFORMATEUR   NUMBER(4) NOT NULL,
  NBSEANCE      NUMBER(4) NOT NULL,
  NBSESSION     NUMBER(4) NOT NULL,
  DUREE         NUMBER(4) NOT NULL,
  ABSENCE       NUMBER(4) NOT NULL,
  PRIMARY KEY (IDDATE, IDSPECIALITE, IDFORMATEUR),
  FOREIGN KEY (IDDATE) REFERENCES FORM_DIM_DATE (IDDATE),
  FOREIGN KEY (IDSPECIALITE) REFERENCES FORM_DIM_SPECIALITE (IDSPECIALITE),
  FOREIGN KEY (IDFORMATEUR) REFERENCES FORM_DIM_FORMATEUR (IDFORMATEUR)
);
DROP TABLE FORM_FACT_RENDEMENTFORMATEUR;

---------------------- Les procedures -------------------------
-- Dimension form_Dim_TypeEnseignement
create sequence seqTypeEnseignement start with 1 increment by 1;
CREATE OR REPLACE PROCEDURE Pdim_TypeEnseignement AS
BEGIN
  INSERT INTO form_Dim_TypeEnseignement(idTypeEnseignement, typeEnseignement,typesession)
  SELECT seqTypeEnseignement.NEXTVAL,
         CASE typeSession
           WHEN 1 THEN 'Présentiel'
           WHEN 2 THEN 'En ligne'
         END CASE,typeSession
  FROM (SELECT DISTINCT typeSession FROM Sessionn);
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

create or replace procedure Pform_Dim_Formation as
begin
insert into form_dim_Formation (idFormation, duree, titre)
select idFormation, duree, titre from formation;
exception
when others then dbms_output.put_line(SQLERRM);
end;
    
--Dimension form_Dim_Etudiant
create or replace procedure Pform_Dim_Etudiant as
begin
insert into form_Dim_Etudiant(idEtudiant, nomCompletEtud,sexe,age)
select idEtudiant,nomEtudiant||' '||prenomEtudiant,
case sexe
when 'M' then 'Homme'
when 'F' then 'Femme'
else 'inconnu'
end,
trunc ((sysdate - dateNaissance)/365)
from Etudiant;
exception
when others then dbms_output.put_line(SQLERRM);
end;

--Dimension form_Dim_specialite
create or replace procedure Pform_Dim_specialite as
begin
insert into form_Dim_specialite (idspecialite, labelspecialite)
select idspecialite, labelspecialite from specialite;
exception
when others then dbms_output.put_line(SQLERRM);
end;

--Dimension form_Dim_Formateur
create or replace procedure Pform_Dim_Formateur as
begin
insert into form_Dim_Formateur (idFormateur, nomCompletForm)
select idFormateur, nomFormateur||' '||prenomFormateur
from formateur;
exception
when others then dbms_output.put_line(SQLERRM);
end;

--Dimension form_Dim_Date
create sequence seq_dimDate start with 1 increment by 1;
create or replace procedure Pform_Dim_Date as
begin
insert into form_Dim_Date (idDate, datec,mois, trimestre, annee)
select seq_dimDate.nextval, d, extract (month from d), to_char(d,'Q'),extract (year from d)
from (
select distinct(d) from (
select distinct (dateinscription) d from inscription
union
select distinct(dateDebut) d from sessionn
)
);
exception
when others then dbms_output.put_line(SQLERRM);
end;

-- Table de faits form_fact_demandeFormation
-- Table de faits form_fact_demandeFormation
create or replace procedure Pform_fact_demandeFormation as
begin
insert into form_fact_demandeFormation (idTypeEnseignement, idDate,
idEtudiant, idSpecialite, idFormation, nbInscription)
select te.idTypeEnseignement, d.idDate, e.idEtudiant, f.idSpecialite,f.idFormation, count(i.numInscription)
from form_dim_typeenseignement te,
form_dim_date d,
form_dim_etudiant e,
form_dim_formation fd,
inscription i,
sessionn ses,
formation f
WHERE i.idEtudiant=e.idEtudiant
and i.idsession=ses.idsession
and ses.idformation=f.idformation
and f.idformation=fd.idformation
and i.dateinscription=d.datec
and ses.typesession=te.typesession
group by (te.idTypeEnseignement, d.idDate, e.idEtudiant, f.idSpecialite,f.idFormation);
exception
when others then dbms_output.put_line(SQLERRM);
end;

--Fact form_Fact_RendementFormateur
--function nbSession effectuées par un formateur
create or replace function nbSession(idf in Number, mois form_dim_date.mois%type, annee form_dim_date.annee%type) return Number is
result number(4);
begin
select count(idsession) into result
from sessionn
where idformateur=idf
and to_char(extract(month from dateDebut))=mois
and to_char(extract(year from dateDebut))=annee;
return result;
end;

--function nbSeance effectuées par un formateur dans une session
create or replace function nbSeance(idf in Number,ids in Number) return
Number is
result number(4);
begin
select count(numseance) into result
from sessionn ses,seance sea
where ses.idsession=sea.idsession
and ses.idformateur=idf
and ses.idsession=ids;
return result;
end;


--function nbAbsence effectuées par un formateur dans une session
create or replace function nbAbsence(idf in Number,ids in Number) return
Number is
result number(4);
begin
select count(abs.numseance) into result
from seance sea, abscence abs
where abs.numseance=sea.numseance
and abs.idformateur=idf
and sea.idsession=ids;
return result;
end;


--function duree totale des séances effectivement enseignées par unformateur dans une session
create or replace function duree(idf in Number, ids in Number) return
Number is
result number(4):=0;
begin
select sum(heurefin-heuredeb) into result
from sessionn ses, seance sea
where ses.idsession=sea.idsession
and ses.idsession =ids
and ses.idformateur=idf
and sea.numseance not in (select abs.numseance from abscence abs);
if result is null then result:=0; end if;
return result;
end;



-- Alimentation de la table des faits
create or replace procedure Pform_fact_rendementFormateur as
begin
insert into form_fact_rendementFormateurr(iddate,idspecialite,idformateur,nbseance,nbsession,duree,absence)
select d.iddate,sp.idspecialite,f.idformateur,nbSeance(f.idformateur,ses.idsession) nbSeance,nbSession(f.idformateur, d.mois,d.annee)nbSession,duree(f.idformateur,ses.idsession) duree,nbAbsence(f.idformateur,ses.idsession) nbAbsence
from formateur f,specialite sp, form_dim_date d, sessionn ses, form_dim_formateur fd
where f.idspecialite=sp.idspecialite
and d.datec=ses.dateDebut
and ses.idformateur=f.idformateur
and f.idformateur=fd.idformateur;
exception
when others then dbms_output.put_line(SQLERRM);
end;





begin
    Pform_fact_rendementFormateur;
end;
/






















