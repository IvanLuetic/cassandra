1. Cassandra koristi port 9042, služi za CQL klijentske konekcije. Nema browser sučelje jer je dizajnirana za visoke performanse za ogromne količine podataka, a user interface je puno manje bitan.

2. Partition key je kritičan zato što određuje gdje spremamo podatke. Ako imamo jedan partition key, svi podaci idu na isti čvor (hot partition problem). Ovo je loše zato što ne distribuiramo podatke, i doći će do preopterećenja čvora i sporijih performansi.

4.
4.1. ALLOW FILTERING je problematično u produkciji zato što to skenira sve particije. Ovo bi uzrokovalo probleme u velikim bazama.
4.2. Partition key određuje na koji čvor spremamo podatke, a clustering column određuje redoslijed podataka. U WHERE upitima partition key moramo koristiti (u suprotnome, sve particije se skeniraju), a clustering column možemo dodatno koristiti sa operatorima u upitima.

5. Tombstone je marker koji Cassandra ostavlja nakon DELETE. On govori da je zapis obrisan, ali i dalje postoji na disku. Ovo se radi zbog sigurnosti, zato što je Cassandra distribuirana i podatak se nalazi na više replika. Compaction čisti Tombstone nakon što prođe određeni period (gc_grace_seconds).

