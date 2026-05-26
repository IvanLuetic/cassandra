Zadatak 1. 
Cassandra koristi port 9042, služi za CQL klijentske konekcije. Nema browser sučelje jer je dizajnirana za visoke performanse za ogromne količine podataka, a user interface je puno manje bitan.

Zadatak 2. 
Partition key je kritičan zato što određuje gdje spremamo podatke. Ako imamo jedan partition key, svi podaci idu na isti čvor (hot partition problem). Ovo je loše zato što ne distribuiramo podatke, i doći će do preopterećenja čvora i sporijih performansi.

Zadatak 4
4.1. ALLOW FILTERING je problematično u produkciji zato što to skenira sve particije. Ovo bi uzrokovalo probleme u velikim bazama.
4.2. Partition key određuje na koji čvor spremamo podatke, a clustering column određuje redoslijed podataka. U WHERE upitima partition key moramo koristiti (u suprotnome, sve particije se skeniraju), a clustering column možemo dodatno koristiti sa operatorima u upitima.

Zadatak 5 
Tombstone je marker koji Cassandra ostavlja nakon DELETE. On govori da je zapis obrisan, ali i dalje postoji na disku. Ovo se radi zbog sigurnosti, zato što je Cassandra distribuirana i podatak se nalazi na više replika. Compaction čisti tombstone nakon što prođe određeni period (gc_grace_seconds).

Zadatak 6
Secondary Index koristimo za jednostavne upite za low cardinality stupce poput 'kategorija', obično na manjim tablicama ili za rijeđe upite jer on skenira sve particije. Materialized View koristimo za stabilne obrasce koji se rijetko mijenjaju (npr. status) i česte upite koji zahtijevaju drugačiju organizaciju podataka. 

Završni zadatak

U tecaj tablici tecaj_id je partition key zato što tečajeve dohvaćamo po id-u. Partition key upisa je (student_id, tecaj_id) jer svi upise jednog studenta stavljamo na isti čvor, a najčešće dohvaćamo tečajeve po studentu. U lekciji koristimo (tecaj_id, redni_broj) jer tecaj_id stavlja sve lekcije nekog tečaja na isti čvor, a lekcije se obično dohvaćaju po rednom broju (pomoću clustering column redni_broj).

Cassandra bi bila bolji izbor za platformu online tečajeva ako je potreban visok write throughput (ako milijuni korisnika dnevno rade upise, za manje sustave Postgre bi bio dovoljno dobar), što Cassandra distribuira na mnogo čvorova. Kada je potrebna globalna distribucija podataka, Cassandra je također bolja od Postgre-a jer je horizontalno skaliranje jednostavno u Cassandri, a kompleksno u relacijskim bazama. TTL za trial pristup je koristan zato što ima automatsko brisanje podataka, npr. nakon što trial istekne, bez potrebe za dodatnom background logikom. Također, zbog masterless arhitekture, paralelno zapisivanje milijuna istovremenih podataka od više korisnika poput video streaming podataka je lako u Cassandri, dok je PostgreSQL ograničen master čvorom.