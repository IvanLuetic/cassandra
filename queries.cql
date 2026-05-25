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

SELECT * FROM narudzbe WHERE korisnik_id = a4b7c9d2-1e5f-3a2b-8c3d-9e2f1a4b7c9e;
