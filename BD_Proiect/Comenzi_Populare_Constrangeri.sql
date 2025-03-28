--Abonamentele pot fi de tip : Bronze,Silver,Gold,Platinum
INSERT INTO ABONAMENT(TIP_ABONAMENT,PRET)
VALUES('Bronze',300);
--Inserare valida

INSERT INTO ABONAMENT(TIP_ABONAMENT,PRET)
VALUES('Silver',400);
--Inserare valida

INSERT INTO ABONAMENT(TIP_ABONAMENT,PRET)
VALUES('Gold',500);
--Inserare valida

INSERT INTO ABONAMENT(TIP_ABONAMENT,PRET)
VALUES('Platinum',600);
--Inserare Valida

INSERT INTO ABONAMENT(TIP_ABONAMENT,PRET)
VALUES('Zirconium' , 600);
--Inserare Gresita deoarece Zirconium nu se afla pe lista de valori acceptate
--check constraint (BD004.SYS_C001812129) violated

INSERT INTO utilizatori (nume, prenume, email, parola, data_inscrierii, tip_abonament)
VALUES ('Cristi', 'Vlad', 'vc@example.com', 'vc123', TO_DATE('12.06.2024', 'DD.MM.YYYY'), 'Bronze');
--Inserare Care Merge si face cu autoincrement, nu mai dam noi ID, VALIDA

INSERT INTO utilizatori (nume, prenume, email, parola, data_inscrierii, tip_abonament)
VALUES ('Giovanni', 'Cristescu', 'vc@example.com', 'parola123', TO_DATE('12.06.2024', 'DD.MM.YYYY'), 'Bronze');
--Constrangere legata de email unic
--ORA-00001: unique constraint (BD004.UTILIZATORI_EMAIL_UN) violated


INSERT INTO utilizatori (nume, prenume, email, parola, data_inscrierii, tip_abonament)
VALUES ('Giovanni', 'Cristescu', 'cece@example.com', 'parola123', TO_DATE('12.02.2024', 'DD.MM.YYYY'), 'Platinum');
--Inserare Valida

INSERT INTO utilizatori (id_utilizator,nume, prenume, email, parola, data_inscrierii, tip_abonament)
VALUES (2,'Ionescu', 'Dimitrescu', 'cererece@example.com', 'orice', TO_DATE('18.06.2024', 'DD.MM.YYYY'), 'Gold');
--Inserare Valida

INSERT INTO utilizatori(nume,prenume,email,parola,data_inscrierii,tip_abonament)
VALUES('Cristofor','Alexandru', 'calexandru@gmail.com','calex214123', TO_DATE('12.02.2024', 'DD.MM.YYYY'), 'Silver');
--Inserare Valida

INSERT INTO utilizatori(nume,prenume,email,parola,data_inscrierii,tip_abonament)
VALUES('Dumitrache','Ion', 'ddion@gmail.com','djohn23', TO_DATE('17.08.2023', 'DD.MM.YYYY'), 'Gold');

--JOIN ABONAMENT CU UTILIZATOR

SELECT id_utilizator,nume,prenume,utilizatori.tip_abonament,pret
FROM utilizatori,abonament
WHERE utilizatori.tip_abonament = abonament.tip_abonament;


--INSERT IN TABELA CARTI
INSERT INTO CARTI (TITLU, AUTOR, AN_PUBLICARE,EXEMPLARE)
VALUES ('Mândrie și prejudecată', 'Jane Austen', '1813',21);

INSERT INTO CARTI (TITLU, AUTOR, AN_PUBLICARE,EXEMPLARE)
VALUES ('1984', 'George Orwell', '1949',1);

INSERT INTO CARTI (TITLU, AUTOR, AN_PUBLICARE,EXEMPLARE)
VALUES ('Codul lui Da Vinci', 'Dan Brown', '2003',23);

INSERT INTO CARTI (TITLU, AUTOR, AN_PUBLICARE, EXEMPLARE)
VALUES ('Micul print', 'Antoine de Saint-Exupery', '1943', 15);

INSERT INTO CARTI (TITLU, AUTOR, AN_PUBLICARE, EXEMPLARE)
VALUES ('To Kill a Mockingbird', 'Harper Lee', '1960', 7);

INSERT INTO CARTI (TITLU, AUTOR, AN_PUBLICARE,EXEMPLARE)
VALUES ('Codul lui Da Vinci', 'Dan Brown', '2003',10);
--Verificare ca nu putem introduce aceeasi Carte cu acelasi Autor si cu acelasi An de publicare!
--ORA-00001: unique constraint (BD004.CARTI_UN) violated



INSERT INTO IMPRUMUTURI(Data_Imprumutului,Data_Returnarii,ID_utilizator,ID_Carte)
VALUES(TO_DATE('12.04.2024','DD.MM.YYYY'),TO_DATE('19.03.2024','DD.MM.YYYY'),1,1);

INSERT INTO IMPRUMUTURI(Data_Imprumutului,Data_Returnarii,ID_utilizator,ID_Carte)
VALUES(TO_DATE('13.04.2024','DD.MM.YYYY'),TO_DATE('21.04.2024','DD.MM.YYYY'),2,3);
--Inserare valida

INSERT INTO IMPRUMUTURI(Data_Imprumutului,Data_Returnarii,ID_utilizator,ID_Carte)
VALUES(TO_DATE('08.08.2024','DD.MM.YYYY'),TO_DATE('19.08.2024','DD.MM.YYYY'),3,1);
--Inserare valida

INSERT INTO IMPRUMUTURI(Data_Imprumutului,Data_Returnarii,ID_utilizator,ID_Carte)
VALUES(TO_DATE('31.12.2025','DD.MM.YYYY'),TO_DATE('01.05.2026','DD.MM.YYYY'),1,1);
--Verificare Trigger care nu permite ca data de imprumut > SYSDATE
--ORA-04088: error during execution of trigger 'BD004.TRG_IMPRUMUTURI_DATA_IMPRUMUTULUI'


INSERT INTO IMPRUMUTURI(Data_Imprumutului,Data_Returnarii,ID_utilizator,ID_Carte)
VALUES(TO_DATE('21.04.2024','DD.MM.YYYY'),TO_DATE('29.04.2024','DD.MM.YYYY'),2,2);
--Un utilizator mai imprumuta o carte / Valid

INSERT INTO IMPRUMUTURI(Data_Imprumutului,Data_Returnarii,ID_utilizator,ID_Carte)
VALUES(TO_DATE('14.07.2024','DD.MM.YYYY'),TO_DATE('14.08.2024','DD.MM.YYYY'),4,5);
--Inserare Valida

INSERT INTO IMPRUMUTURI(Data_Imprumutului,Data_Returnarii,ID_utilizator,ID_Carte)
VALUES(TO_DATE('14.07.2024','DD.MM.YYYY'),TO_DATE('14.08.2024','DD.MM.YYYY'),5,5);
--Inserare Valida



INSERT INTO IMPRUMUTURI(Data_Imprumutului,Data_Returnarii,ID_utilizator,ID_Carte)
VALUES(TO_DATE('21.04.2024','DD.MM.YYYY'),TO_DATE('29.04.2024','DD.MM.YYYY'),3,2);
--Cazul in care nu mai avem exemplare de imprumutat!
--ORA-04088: error during execution of trigger 'BD004.TRG_EXEMPLARE_OK'


--Statusul reprezinta validitatea imprumutului,adica: ( IF data_returnarii >= SYSDATE ) => STATUS = 1,
--else => STATUS = 0;

--Imprumuturile care au STATUS = 1 inseamna ca sunt valabile in momentul de fata(SYSDATE) si marcarea acestora prin STATUS 
--ofera o buna vizualizare a cererilor relevante

--O varianta care ar trebui apelata de fiecare data pentru a se mentine informatiile din tabela coerente
--UPDATE care respecta cele mentionate mai sus legate de "relevanta imprumuturilor"



-- Dezactivăm triggerul
ALTER TRIGGER Trg_EXEMPLARE_OK DISABLE;

-- Actualizăm statutul împrumuturilor
UPDATE imprumuturi
SET statut = 0
WHERE data_returnarii < SYSDATE
AND statut is NULL;

UPDATE imprumuturi 
SET statut = 1
WHERE data_returnarii >= SYSDATE;

  
-- Reactivăm triggerul
ALTER TRIGGER Trg_EXEMPLARE_OK ENABLE;





-- Inserare sancțiune pentru utilizatorul 1
INSERT INTO SANCTIUNI (MOTIV, DURATA_SANCTIUNE, DATA_INCEPUT_SANCTIUNE, ID_UTILIZATOR)
VALUES ('Întârziere la returnarea cărții', 5, TO_DATE('01.12.2024', 'DD.MM.YYYY'), 1);


-- Inserare sancțiune pentru utilizatorul 2
INSERT INTO SANCTIUNI (MOTIV, DURATA_SANCTIUNE, DATA_INCEPUT_SANCTIUNE, ID_UTILIZATOR)
VALUES ('Abuz de drepturi', 10, TO_DATE('15.11.2024', 'DD.MM.YYYY'), 2);

-- Inserare sancțiune pentru utilizatorul 3
INSERT INTO SANCTIUNI (MOTIV, DURATA_SANCTIUNE, DATA_INCEPUT_SANCTIUNE, ID_UTILIZATOR)
VALUES ('Nerespectarea termenului de returnare', 3, TO_DATE('20.11.2024', 'DD.MM.YYYY'), 3);

INSERT INTO SANCTIUNI (MOTIV, DURATA_SANCTIUNE, DATA_INCEPUT_SANCTIUNE, ID_UTILIZATOR)
VALUES ('Deteriorarea materialului împrumutat', 7, TO_DATE('15.12.2024', 'DD.MM.YYYY'), 4);

INSERT INTO SANCTIUNI (MOTIV, DURATA_SANCTIUNE, DATA_INCEPUT_SANCTIUNE, ID_UTILIZATOR)
VALUES ('Întârziere frecventă la returnare', 10, TO_DATE('01.01.2025', 'DD.MM.YYYY'), 5);



SELECT Nume,Prenume,tip_abonament,Motiv,Data_Inceput_Sanctiune,Durata_Sanctiune
FROM utilizatori u,sanctiuni s
WHERE u.id_utilizator = s.id_utilizator;



--JOIN pentru a vedea functionalitatea FK dintre tabele


--JOIN intre utilizatori,imprumuturi,carti
SELECT u.Nume, u.Prenume,i.Data_Imprumutului, c.Titlu, c.Autor
FROM utilizatori u, Imprumuturi i, Carti c
WHERE u.id_utilizator = i.id_utilizator  -- Condiția de legătură între utilizatori și împrumuturi
AND i.id_carte = c.id_carte;  -- Condiția de legătură între împrumuturi și cărți


SELECT * from carti;


--INSERARE IN TABELA REVIEW
INSERT INTO REVIEW(OPINIE,NOTA,ID_CARTE,ID_UTILIZATOR)
VALUES ('Una dintre cele mai bune carti pe care le-am citit',10,1,1);
--Inserare valida folosire auto-increment

INSERT INTO REVIEW (OPINIE, NOTA, ID_CARTE, ID_UTILIZATOR)
VALUES ('O carte captivantă, dar finalul putea fi mai bine dezvoltat.', 8, 2, 3);
--Inserare valida

INSERT INTO REVIEW (OPINIE, NOTA, ID_CARTE, ID_UTILIZATOR)
VALUES ('Un roman extraordinar, recomand tuturor!', 9, 3, 2);
--Inserare valida

INSERT INTO REVIEW (OPINIE, NOTA, ID_CARTE, ID_UTILIZATOR)
VALUES ('Nu este pe gustul meu, dar are câteva idei interesante.', 5, 5, 5);
--Inserare valida

INSERT INTO REVIEW (OPINIE, NOTA, ID_CARTE, ID_UTILIZATOR)
VALUES ('Personajele sunt bine construite, iar povestea te ține în suspans.', 9, 1, 4);
--Inserare valida

INSERT INTO REVIEW(OPINIE,NOTA,ID_CARTE,ID_UTILIZATOR)
VALUES ('Una dintre cele mai bune carti pe care le-am citit',11,1,1);
--unique constraint (BD004.REVIEW__UN) violated primul constraint care apare este cel de unicitate

INSERT INTO REVIEW(OPINIE,NOTA,ID_CARTE,ID_UTILIZATOR)
VALUES ('Destul de buna cartea',11,2,2);
--ORA-02290: check constraint (BD004.INTERVALNOTA_CK) violated intervalul de nota setat este pentru note de la 1 - 10 cu precizie de 4 si scale 2
-- note de forma : xx.xx


--PENTRU REVIEW un utilizator poate lasa mai multe reviewuri pentru aceeasi carte doar in cazul in care coloana "opinie" nu este aceeasi pentru
--nu a avea un review care se repeta.

SELECT * from utilizatori;
SELECT * from carti;
SELECT * from sanctiuni;
SELECT * from imprumuturi;
SELECT * from abonament;
SELECT * from review;