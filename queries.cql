-- Zadatak 1

SELECT now() FROM system.local; 

-- Korak 2

CREATE KEYSPACE IF NOT EXISTS vjezba
  WITH replication = {
    'class': 'SimpleStrategy',
    'replication_factor': 1
  };

USE vjezba;

CREATE TABLE narudzbe (
  korisnik_id UUID,
  created_at  TIMESTAMP,
  narudzba_id UUID,
  ukupno      DECIMAL,
  status      TEXT,
  grad        TEXT,
  PRIMARY KEY (korisnik_id, created_at)
) WITH CLUSTERING ORDER BY (created_at DESC);

CREATE TABLE proizvodi (
  id          UUID PRIMARY KEY,
  naziv       TEXT,
  cijena      DECIMAL,
  kategorija  TEXT,
  dostupnost  BOOLEAN
);

CREATE TABLE recenzije (
  proizvod_id UUID,
  korisnik_id UUID,
  ocjena      INT,
  komentar    TEXT,
  created_at  TIMESTAMP,
  PRIMARY KEY (proizvod_id, korisnik_id)
);

DESCRIBE TABLES;
DESCRIBE TABLE narudzbe;

-- Zadatak 2

CREATE TABLE IF NOT EXISTS pregledi_proizvoda (
    korisnik_id UUID,
    datum_pregleda DATE,
    proizvod_id UUID,
    broj_pregleda INT,
    PRIMARY KEY ((korisnik_id, datum_pregleda), proizvod_id)
);

-- Korak 3

INSERT INTO proizvodi (id, naziv, cijena, kategorija, dostupnost)
VALUES (uuid(), 'Laptop Pro 15', 1299.99, 'elektronika', true);

INSERT INTO proizvodi (id, naziv, cijena, kategorija, dostupnost)
VALUES (uuid(), 'Bežične slušalice', 149.99, 'elektronika', true);

INSERT INTO proizvodi (id, naziv, cijena, kategorija, dostupnost)
VALUES (uuid(), 'Ergonomska stolica', 349.00, 'namještaj', true);

INSERT INTO proizvodi (id, naziv, cijena, kategorija, dostupnost)
VALUES (uuid(), 'Mehanička tipkovnica', 89.99, 'elektronika', false);

INSERT INTO proizvodi (id, naziv, cijena, kategorija, dostupnost)
VALUES (uuid(), 'Monitor 27"', 499.00, 'elektronika', true);

INSERT INTO proizvodi (id, naziv, cijena, kategorija, dostupnost)
VALUES (uuid(), 'Radni stol', 279.00, 'namještaj', true);

-- Narudžbe korisnika A (3 narudžbe)
INSERT INTO narudzbe (korisnik_id, created_at, narudzba_id, ukupno, status, grad)
VALUES (a3b7c9d2-1e4f-4a5b-8c3d-9e2f1a4b7c8d,
        toTimestamp(now()), uuid(), 1449.98, 'isporuceno', 'Zagreb');

INSERT INTO narudzbe (korisnik_id, created_at, narudzba_id, ukupno, status, grad)
VALUES (a3b7c9d2-1e4f-4a5b-8c3d-9e2f1a4b7c8d,
        toTimestamp(now()), uuid(), 349.00, 'u_obradi', 'Zagreb');

INSERT INTO narudzbe (korisnik_id, created_at, narudzba_id, ukupno, status, grad)
VALUES (a3b7c9d2-1e4f-4a5b-8c3d-9e2f1a4b7c8d,
        toTimestamp(now()), uuid(), 89.99, 'isporuceno', 'Zagreb');

-- Narudžbe korisnika B (2 narudžbe)
INSERT INTO narudzbe (korisnik_id, created_at, narudzba_id, ukupno, status, grad)
VALUES (f6e8d7c5-2b3a-4d9e-8f1c-7e6d5c4b3a2f ,
        toTimestamp(now()), uuid(), 499.00, 'isporuceno', 'Split');

INSERT INTO narudzbe (korisnik_id, created_at, narudzba_id, ukupno, status, grad)
VALUES (f6e8d7c5-2b3a-4d9e-8f1c-7e6d5c4b3a2f,
        toTimestamp(now()), uuid(), 279.00, 'otkazano', 'Split');

INSERT INTO recenzije (proizvod_id, korisnik_id, ocjena, komentar, created_at)
VALUES (a951d238-4125-4b88-96db-7bc6ea671731, a3b7c9d2-1e4f-4a5b-8c3d-9e2f1a4b7c8d,
        5, 'Odličan laptop, brz i tih.', toTimestamp(now()));

INSERT INTO recenzije (proizvod_id, korisnik_id, ocjena, komentar, created_at)
VALUES (a951d238-4125-4b88-96db-7bc6ea671731, f6e8d7c5-2b3a-4d9e-8f1c-7e6d5c4b3a2f,
        4, 'Dobra kupnja, baterija mogla bolja.', toTimestamp(now()));

INSERT INTO recenzije (proizvod_id, korisnik_id, ocjena, komentar, created_at)
VALUES (a5f3a109-af01-486c-a375-405fff520ef6, a3b7c9d2-1e4f-4a5b-8c3d-9e2f1a4b7c8d,
        5, 'Spasila mi je leđa!', toTimestamp(now()));

-- Zadatak 3

INSERT INTO narudzbe (korisnik_id, created_at, narudzba_id, ukupno, status, grad)
VALUES (a4b7c9d2-1e5f-3a2b-8c3d-9e2f1a4b7c9e,
        toTimestamp(now()), uuid(), 1449.98, 'isporuceno', 'Osijek');

INSERT INTO narudzbe (korisnik_id, created_at, narudzba_id, ukupno, status, grad)
VALUES (a4b7c9d2-1e5f-3a2b-8c3d-9e2f1a4b7c9e,
        toTimestamp(now()), uuid(), 349.00, 'u_obradi', 'Osijek');

INSERT INTO narudzbe (korisnik_id, created_at, narudzba_id, ukupno, status, grad)
VALUES (a4b7c9d2-1e5f-3a2b-8c3d-9e2f1a4b7c9e,
        toTimestamp(now()), uuid(), 89.99, 'isporuceno', 'Osijek');

INSERT INTO narudzbe (korisnik_id, created_at, narudzba_id, ukupno, status, grad)
VALUES (a4b7c9d2-1e5f-3a2b-8c3d-9e2f1a4b7c9e, '2024-01-15 10:30:00', uuid(), 89.99, 'isporuceno', 'Osijek');

INSERT INTO narudzbe (korisnik_id, created_at, narudzba_id, ukupno, status, grad)
VALUES (a4b7c9d2-1e5f-3a2b-8c3d-9e2f1a4b7c9e, '2024-01-15 10:30:00', uuid(), 29.99, 'isporuceno', 'Osijek');

SELECT * FROM narudzbe WHERE korisnik_id = a4b7c9d2-1e5f-3a2b-8c3d-9e2f1a4b7c9e

--Korak 4

SELECT korisnik_id, created_at, ukupno, status
FROM narudzbe
WHERE korisnik_id = 11111111-1111-1111-1111-111111111111;

SELECT * FROM narudzbe
WHERE korisnik_id = 11111111-1111-1111-1111-111111111111
  AND created_at >= '2024-01-01 00:00:00+0000';

SELECT * FROM narudzbe
WHERE korisnik_id = 11111111-1111-1111-1111-111111111111
LIMIT 2;

SELECT naziv, cijena, kategorija, dostupnost
FROM proizvodi;

-- Filtriranje po non-partition key stupcu zahtijeva ALLOW FILTERING
SELECT naziv, cijena FROM proizvodi
WHERE kategorija = 'elektronika'
ALLOW FILTERING;

-- Ekvivalentno za dostupne proizvode
SELECT naziv, cijena FROM proizvodi
WHERE dostupnost = true
ALLOW FILTERING;

-- Umetni zapis koji automatski nestaje za 60 sekundi
INSERT INTO narudzbe (korisnik_id, created_at, narudzba_id, ukupno, status, grad)
VALUES (33333333-3333-3333-3333-333333333333,
        toTimestamp(now()), uuid(), 9.99, 'test', 'Mostar')
USING TTL 60;

-- Provjeri preostali TTL
SELECT TTL(status), TTL(ukupno), status, grad
FROM narudzbe
WHERE korisnik_id = 33333333-3333-3333-3333-333333333333;

-- Nakon 60 sekundi zapis nestaje automatski

-- Zadatak 4

SELECT * FROM 
narudzbe 
WHERE korisnik_id = a4b7c9d2-1e5f-3a2b-8c3d-9e2f1a4b7c9e
ORDER BY created_at ASC;

SELECT *
FROM narudzbe
WHERE status = 'isporuceno'
ALLOW FILTERING;

INSERT INTO narudzbe (korisnik_id, created_at, narudzba_id, ukupno, status, grad)
VALUES (a4b7c9d2-1e5f-3a2b-8c3d-9e2f1a4b7c9e, 
        '2024-01-15 11:00:00', uuid(), 149.99, 'isporuceno', 'Osijek')
USING TTL 30;

SELECT TTL(status) as TTL, ukupno, status 
FROM narudzbe 
WHERE korisnik_id = a4b7c9d2-1e5f-3a2b-8c3d-9e2f1a4b7c9e 
  AND created_at = '2024-01-15 11:00:00';

SELECT *
FROM narudzbe 
WHERE korisnik_id = a4b7c9d2-1e5f-3a2b-8c3d-9e2f1a4b7c9e 
  AND created_at = '2024-01-15 11:00:00';

--Korak 5

-- Ažuriranje statusa narudžbe (mora specificirati puni primary key)
UPDATE narudzbe
SET status = 'isporuceno'
WHERE korisnik_id = 22222222-2222-2222-2222-222222222222
  AND created_at = <timestamp-narudzbe>;  -- kopiraj iz SELECT upita

-- Ažuriranje više polja odjednom
UPDATE narudzbe
SET status = 'u_obradi', grad = 'Rijeka'
WHERE korisnik_id = 22222222-2222-2222-2222-222222222222
  AND created_at = <timestamp-narudzbe>;

-- Brisanje jedne narudžbe
DELETE FROM narudzbe
WHERE korisnik_id = 33333333-3333-3333-3333-333333333333
  AND created_at = <timestamp-narudzbe>;

-- Brisanje samo jednog stupca (ostavlja red, briše vrijednost)
DELETE komentar FROM recenzije
WHERE proizvod_id = <uuid-proizvoda>
  AND korisnik_id = 11111111-1111-1111-1111-111111111111;

-- INSERT koji uspijeva samo ako zapis NE POSTOJI
INSERT INTO proizvodi (id, naziv, cijena, kategorija, dostupnost)
VALUES (uuid(), 'Novi proizvod', 49.99, 'ostalo', true)
IF NOT EXISTS;

-- UPDATE koji uspijeva samo ako je trenutni status 'u_obradi'
UPDATE narudzbe
SET status = 'isporuceno'
WHERE korisnik_id = 11111111-1111-1111-1111-111111111111
  AND created_at = <timestamp-narudzbe>
IF status = 'u_obradi';

-- Logged BATCH je atomičan unutar iste particije
BEGIN BATCH
  INSERT INTO recenzije (proizvod_id, korisnik_id, ocjena, komentar, created_at)
  VALUES (<uuid-monitora>, 22222222-2222-2222-2222-222222222222,
          5, 'Odlična rezolucija.', toTimestamp(now()));

  UPDATE recenzije
  SET ocjena = 5
  WHERE proizvod_id = <uuid-monitora>
    AND korisnik_id = 22222222-2222-2222-2222-222222222222;
APPLY BATCH;

-- Zadatak 5

UPDATE narudzbe
SET status = 'isporuceno'
WHERE korisnik_id = a4b7c9d2-1e5f-3a2b-8c3d-9e2f1a4b7c9e
  AND created_at = '2026-05-25 11:59:22.876000+0000'; 

SELECT * 
FROM narudzbe
WHERE korisnik_id = a4b7c9d2-1e5f-3a2b-8c3d-9e2f1a4b7c9e AND created_at = '2026-05-25 11:59:22.876000+0000';

INSERT INTO proizvodi (id, naziv, cijena, kategorija, dostupnost)
VALUES (a951d238-4125-4b88-96db-7bc6ea671731, 'Laptop', 999.99, 'elektronika', true)
IF NOT EXISTS;

DELETE FROM proizvodi WHERE id = 99c4d101-f177-43c4-9200-f81a4636a2ad;

SELECT * FROM proizvodi WHERE id = 99c4d101-f177-43c4-9200-f81a4636a2ad;

-- Korak 6

-- Kreiraj index na kategorija stupcu
CREATE INDEX idx_kategorija ON proizvodi (kategorija);

-- Sada query radi bez ALLOW FILTERING
SELECT naziv, cijena FROM proizvodi
WHERE kategorija = 'elektronika';

-- Provjeri index
DESCRIBE INDEX idx_kategorija;

-- MV koji omogućuje pretragu narudžbi po gradu
CREATE MATERIALIZED VIEW narudzbe_po_gradu AS
  SELECT *
  FROM narudzbe
  WHERE grad IS NOT NULL
    AND korisnik_id IS NOT NULL
    AND created_at IS NOT NULL
  PRIMARY KEY (grad, korisnik_id, created_at)
  WITH CLUSTERING ORDER BY (korisnik_id ASC, created_at DESC);

-- Efikasan query po gradu (bez ALLOW FILTERING)
SELECT * FROM narudzbe_po_gradu
WHERE grad = 'Zagreb';

-- Ukupan broj narudžbi korisnika
SELECT COUNT(*) AS broj_narudzbi
FROM narudzbe
WHERE korisnik_id = 11111111-1111-1111-1111-111111111111;

-- Suma svih narudžbi korisnika
SELECT SUM(ukupno) AS ukupna_potrosnja
FROM narudzbe
WHERE korisnik_id = 11111111-1111-1111-1111-111111111111;

-- Prosječna ocjena za proizvod
SELECT AVG(ocjena) AS prosjecna_ocjena, COUNT(*) AS broj_recenzija
FROM recenzije
WHERE proizvod_id = <uuid-laptopa>;

-- Zadatak 6

CREATE INDEX idx_proizvodi_dostupnost ON proizvodi (dostupnost);

SELECT * FROM proizvodi WHERE dostupnost = true;

CREATE MATERIALIZED VIEW narudzbe_po_statusu AS
SELECT korisnik_id, created_at, narudzba_id, ukupno, status, grad
FROM narudzbe
WHERE status IS NOT NULL AND korisnik_id IS NOT NULL AND created_at IS NOT NULL
PRIMARY KEY (status, korisnik_id, created_at)
WITH CLUSTERING ORDER BY (korisnik_id ASC, created_at DESC);

SELECT * FROM narudzbe_po_statusu WHERE status = 'isporuceno';

SELECT SUM(ukupno) AS ukupna_potrosnja
FROM narudzbe
WHERE korisnik_id = a4b7c9d2-1e5f-3a2b-8c3d-9e2f1a4b7c9e;

SELECT AVG(ukupno) AS prosjecna_narudzba
FROM narudzbe
WHERE korisnik_id = a4b7c9d2-1e5f-3a2b-8c3d-9e2f1a4b7c9e;

-- Korak 7

-- Zahtijeva da naziv proizvoda uvijek postoji
ALTER TABLE proizvodi
ADD CONSTRAINT naziv_nn CHECK (naziv IS NOT NULL);

-- U novijim verzijama Cassandre (4.1+), direktno pri CREATE:
-- naziv TEXT NOT NULL,

-- Osigurava da je cijena uvijek pozitivna
ALTER TABLE proizvodi
ADD CONSTRAINT cijena_pozitivna CHECK (cijena > 0);

-- Ocjena mora biti između 1 i 5
ALTER TABLE recenzije
ADD CONSTRAINT ocjena_raspon CHECK (ocjena >= 1 AND ocjena <= 5);

-- Opis cijelog keyspace-a
DESCRIBE KEYSPACE vjezba;

-- Opis specifične tablice s PRIMARY KEY info
DESCRIBE TABLE narudzbe;
DESCRIBE TABLE narudzbe_po_gradu;

-- Svi indeksi u keyspace-u
SELECT * FROM system_schema.indexes
WHERE keyspace_name = 'vjezba';

-- Briše sve podatke, ali čuva tablicu (brže od DELETE sve particije)
TRUNCATE TABLE recenzije;

-- Briše tablicu kompletno
DROP TABLE IF EXISTS recenzije;

-- Briše cijeli keyspace (ne koristiti u produkciji bez backup-a!)
DROP KEYSPACE IF EXISTS vjezba;

-- Zavrsni Zadatak

CREATE TABLE tecaj (
  tecaj_id UUID PRIMARY KEY,
  naziv TEXT,
  instruktor TEXT,
  kategorija TEXT,
  cijena DECIMAL,
  trajanje_sati INT
);

CREATE TABLE upis (
  student_id UUID,
  tecaj_id UUID,
  datum_upisa TIMESTAMP,
  napredak INT,
  status TEXT,
  PRIMARY KEY (student_id, tecaj_id)
);

CREATE TABLE lekcija (
  tecaj_id UUID,
  redni_broj INT,
  naslov TEXT,
  trajanje_min INT,
  sadrzaj_url TEXT,
  PRIMARY KEY (tecaj_id, redni_broj)
) WITH CLUSTERING ORDER BY (redni_broj ASC);

--insert tečaja

INSERT INTO tecaj (tecaj_id, naziv, instruktor, kategorija, cijena, trajanje_sati)
VALUES (11111111-1111-1111-1111-111111111111, 'Python', 'Ivan', 'programiranje', 199.99, 40);

INSERT INTO tecaj (tecaj_id, naziv, instruktor, kategorija, cijena, trajanje_sati)
VALUES (22222222-2222-2222-2222-222222222222, 'Java', 'Ana', 'programiranje', 249.99, 35);

INSERT INTO tecaj (tecaj_id, naziv, instruktor, kategorija, cijena, trajanje_sati)
VALUES (33333333-3333-3333-3333-333333333333, 'SQL baze podataka', 'Marko', 'baze_podataka', 179.99, 30);

INSERT INTO tecaj (tecaj_id, naziv, instruktor, kategorija, cijena, trajanje_sati)
VALUES (44444444-4444-4444-4444-444444444444, 'Cassandra', 'Daniel', 'baze_podataka', 299.99, 45);

INSERT INTO tecaj (tecaj_id, naziv, instruktor, kategorija, cijena, trajanje_sati)
VALUES (55555555-5555-5555-5555-555555555555, 'React', 'Tomislav', 'web_razvoj', 349.99, 50);

--insert upisa

INSERT INTO upis (student_id, tecaj_id, datum_upisa, napredak, status)
VALUES (a4b7c9d2-1e5f-3a2b-8c3d-9e2f1a4b7c9e, 11111111-1111-1111-1111-111111111111, toTimestamp(now()), 40, 'aktivan');

INSERT INTO upis (student_id, tecaj_id, datum_upisa, napredak, status)
VALUES (a4b7c9d2-1e5f-3a2b-8c3d-9e2f1a4b7c9e, 22222222-2222-2222-2222-222222222222, toTimestamp(now()), 45, 'aktivan');

INSERT INTO upis (student_id, tecaj_id, datum_upisa, napredak, status)
VALUES (a4b7c9d2-1e5f-3a2b-8c3d-9e2f1a4b7c9e, 33333333-3333-3333-3333-333333333333, toTimestamp(now()), 100, 'završen');

INSERT INTO upis (student_id, tecaj_id, datum_upisa, napredak, status)
VALUES (a3b7c9d2-1e4f-4a5b-8c3d-9e2f1a4b7c8d, 22222222-2222-2222-2222-222222222222, toTimestamp(now()), 50, 'aktivan');

INSERT INTO upis (student_id, tecaj_id, datum_upisa, napredak, status)
VALUES (a3b7c9d2-1e4f-4a5b-8c3d-9e2f1a4b7c8d, 44444444-4444-4444-4444-444444444444, toTimestamp(now()), 65, 'aktivan');

INSERT INTO upis (student_id, tecaj_id, datum_upisa, napredak, status)
VALUES (a3b7c9d2-1e4f-4a5b-8c3d-9e2f1a4b7c8d, 33333333-3333-3333-3333-333333333333, toTimestamp(now()), 10, 'aktivan');

INSERT INTO upis (student_id, tecaj_id, datum_upisa, napredak, status)
VALUES (f6e8d7c5-2b3a-4d9e-8f1c-7e6d5c4b3a2f , 11111111-1111-1111-1111-111111111111, toTimestamp(now()), 30, 'aktivan');

INSERT INTO upis (student_id, tecaj_id, datum_upisa, napredak, status)
VALUES (f6e8d7c5-2b3a-4d9e-8f1c-7e6d5c4b3a2f , 44444444-4444-4444-4444-444444444444, toTimestamp(now()), 90, 'aktivan');

INSERT INTO upis (student_id, tecaj_id, datum_upisa, napredak, status)
VALUES (f6e8d7c5-2b3a-4d9e-8f1c-7e6d5c4b3a2f , 33333333-3333-3333-3333-333333333333, toTimestamp(now()), 20, 'aktivan');

INSERT INTO upis (student_id, tecaj_id, datum_upisa, napredak, status)
VALUES (f6e8d7c5-2b3a-4d9e-8f1c-7e6d5c4b3a2f , 22222222-2222-2222-2222-222222222222, toTimestamp(now()), 15, 'aktivan');

--insert lekcija

INSERT INTO lekcija (tecaj_id, redni_broj, naslov, trajanje_min, sadrzaj_url)
VALUES (11111111-1111-1111-1111-111111111111, 1, 'Uvod u Python', 15, 'https://example.com/tecaj1/lekcija1');

INSERT INTO lekcija (tecaj_id, redni_broj, naslov, trajanje_min, sadrzaj_url)
VALUES (11111111-1111-1111-1111-111111111111, 2, 'Varijable i tipovi podataka', 25, 'https://example.com/tecaj1/lekcija2');

INSERT INTO lekcija (tecaj_id, redni_broj, naslov, trajanje_min, sadrzaj_url)
VALUES (11111111-1111-1111-1111-111111111111, 3, 'Kontrola toka', 30, 'https://example.com/tecaj1/lekcija3');

INSERT INTO lekcija (tecaj_id, redni_broj, naslov, trajanje_min, sadrzaj_url)
VALUES (11111111-1111-1111-1111-111111111111, 4, 'Funkcije i moduli', 20, 'https://example.com/tecaj1/lekcija4');

INSERT INTO lekcija (tecaj_id, redni_broj, naslov, trajanje_min, sadrzaj_url)
VALUES (22222222-2222-2222-2222-222222222222, 1, 'Generatori', 25, 'https://example.com/tecaj2/lekcija1');

INSERT INTO lekcija (tecaj_id, redni_broj, naslov, trajanje_min, sadrzaj_url)
VALUES (22222222-2222-2222-2222-222222222222, 2, 'Rad s datotekama i JSON', 20, 'https://example.com/tecaj2/lekcija2');

INSERT INTO lekcija (tecaj_id, redni_broj, naslov, trajanje_min, sadrzaj_url)
VALUES (22222222-2222-2222-2222-222222222222, 3, 'Asinkrono programiranje', 35, 'https://example.com/tecaj2/lekcija3');

INSERT INTO lekcija (tecaj_id, redni_broj, naslov, trajanje_min, sadrzaj_url)
VALUES (22222222-2222-2222-2222-222222222222, 4, 'Testiranje i debugging', 20, 'https://example.com/tecaj2/lekcija4');

INSERT INTO lekcija (tecaj_id, redni_broj, naslov, trajanje_min, sadrzaj_url)
VALUES (33333333-3333-3333-3333-333333333333, 1, 'SELECT i WHERE uvjeti', 20, 'https://example.com/tecaj3/lekcija1');

INSERT INTO lekcija (tecaj_id, redni_broj, naslov, trajanje_min, sadrzaj_url)
VALUES (33333333-3333-3333-3333-333333333333, 2, 'JOIN i podupiti', 30, 'https://example.com/tecaj3/lekcija2');

INSERT INTO lekcija (tecaj_id, redni_broj, naslov, trajanje_min, sadrzaj_url)
VALUES (33333333-3333-3333-3333-333333333333, 3, 'Indeksi i optimizacija', 25, 'https://example.com/tecaj3/lekcija3');

INSERT INTO lekcija (tecaj_id, redni_broj, naslov, trajanje_min, sadrzaj_url)
VALUES (44444444-4444-4444-4444-444444444444, 1, 'Data modeliranje u Cassandri', 30, 'https://example.com/tecaj4/lekcija1');

INSERT INTO lekcija (tecaj_id, redni_broj, naslov, trajanje_min, sadrzaj_url)
VALUES (44444444-4444-4444-4444-444444444444, 2, 'Primary key dizajn', 25, 'https://example.com/tecaj4/lekcija2');

INSERT INTO lekcija (tecaj_id, redni_broj, naslov, trajanje_min, sadrzaj_url)
VALUES (44444444-4444-4444-4444-444444444444, 3, 'TTL i tombstone-ovi', 20, 'https://example.com/tecaj4/lekcija3');

INSERT INTO lekcija (tecaj_id, redni_broj, naslov, trajanje_min, sadrzaj_url)
VALUES (55555555-5555-5555-5555-555555555555, 1, 'Komponente i props', 25, 'https://example.com/tecaj5/lekcija1');

INSERT INTO lekcija (tecaj_id, redni_broj, naslov, trajanje_min, sadrzaj_url)
VALUES (55555555-5555-5555-5555-555555555555, 2, 'State i lifecycle', 30, 'https://example.com/tecaj5/lekcija2');

INSERT INTO lekcija (tecaj_id, redni_broj, naslov, trajanje_min, sadrzaj_url)
VALUES (55555555-5555-5555-5555-555555555555, 3, 'Hooks', 20, 'https://example.com/tecaj5/lekcija3');

INSERT INTO lekcija (tecaj_id, redni_broj, naslov, trajanje_min, sadrzaj_url)
VALUES (55555555-5555-5555-5555-555555555555, 4, 'React Router', 15, 'https://example.com/tecaj5/lekcija4');

-- Upiti

SELECT * FROM lekcija 
WHERE tecaj_id = 11111111-1111-1111-1111-111111111111 
ORDER BY redni_broj ASC;

SELECT tecaj_id, datum_upisa, napredak, status 
FROM upis 
WHERE student_id = a3b7c9d2-1e4f-4a5b-8c3d-9e2f1a4b7c8d;

UPDATE upis 
SET napredak = 85, status = 'u_tijeku' 
WHERE student_id = a3b7c9d2-1e4f-4a5b-8c3d-9e2f1a4b7c8d
  AND tecaj_id = 33333333-3333-3333-3333-333333333333;

SELECT * FROM upis 
WHERE student_id = a3b7c9d2-1e4f-4a5b-8c3d-9e2f1a4b7c8d
  AND tecaj_id = 33333333-3333-3333-3333-333333333333;


INSERT INTO upis (student_id, tecaj_id, datum_upisa, napredak, status)
VALUES (a3b7c9d2-1e4f-4a5b-8c3d-9e2f1a4b7c8d, 44444444-4444-4444-4444-444444444444, 
        toTimestamp(now()), 0, 'probni_pristup')
USING TTL 604800;

SELECT student_id, tecaj_id, status, TTL(status)
FROM upis
WHERE student_id = a3b7c9d2-1e4f-4a5b-8c3d-9e2f1a4b7c8d;

CREATE MATERIALIZED VIEW tecajevi_po_kategoriji AS
SELECT kategorija, tecaj_id, naziv, instruktor, cijena, trajanje_sati
FROM tecaj
WHERE kategorija IS NOT NULL AND tecaj_id IS NOT NULL
PRIMARY KEY (kategorija, tecaj_id);

SELECT * FROM tecajevi_po_kategoriji WHERE kategorija = 'programiranje';

SELECT tecaj_id, COUNT(*) as broj_upisa 
FROM upis 
ALLOW FILTERING;

SELECT student_id, AVG(napredak) AS napredak_prosjek
FROM upis
WHERE student_id = a3b7c9d2-1e4f-4a5b-8c3d-9e2f1a4b7c8d;