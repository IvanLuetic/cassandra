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
VALUES (f6e8d7c5-2b3a-4d9e-8f1c-7e6d5c4b3a2f,
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