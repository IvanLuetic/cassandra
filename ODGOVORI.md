1. Cassandra koristi port 9042, služi za CQL klijentske konekcije. Nema browser sučelje jer je dizajnirana za visoke performanse za ogromne količine podataka, a user interface je puno manje bitan.

2. Partition key je kritičan zato što određuje gdje spremamo podatke. Ako imamo jedan partition key, svi podaci idu na isti čvor (hot partition problem). Ovo je loše zato što ne distribuiramo podatke, i doći će do preopterećenja čvora i sporijih performansi.
