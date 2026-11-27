
# Inlämningsuppgift 1

## Del A – Miljö och arkitektur (LR 1)

### Uppgift 1

Jag startade Docker Desktop och använde Windows PowerShell
för att kontrollera och starta min MySQL-container.

Kommandon som jag använde:

```powershell
docker ps
docker ps -a
docker start jovial_tu
```

Jag kopierade sedan SQL-filen till min Docker-container.

```powershell
docker cp "C:\Users\datga\IdeaProjects\Jud26Leo\database\Laboration1.sql" jovial_tu:/Laboration1.sql
```

Därefter loggade jag in i MySQL med:

```powershell
docker exec -it jovial_tu mysql -u root -p
```

Jag importerade SQL-filen med:

```sql
SOURCE /Laboration1.sql;
```

### Uppgift 2

Jag använde följande SQL-kommandon för att undersöka
databasen och dess tabeller:

```sql
USE laboration1;
SHOW TABLES;
DESCRIBE account;
DESCRIBE moon_mission;
```

Primärnyckeln i account är user_id.
Primärnyckeln i moon_mission är mission_id.

Jag kunde identifiera primärnycklarna genom att det stod
PRI under kolumnen Key i resultatet från DESCRIBE.

Båda primärnycklarna använder AUTO_INCREMENT, vilket innebär
att MySQL automatiskt tilldelar ett nytt ID när en rad skapas.

### Uppgift 3

Min MySQL-server körs i en Docker-container som heter
jovial_tu på min Windows-dator.

Jag använder PowerShell för att starta containern och
MySQL Client för att köra SQL-kommandon inuti containern.

Jag använder även IntelliJ som grafisk SQL-klient.
IntelliJ kommunicerar med MySQL-servern via TCP/IP
genom localhost på port 3306.



## Del C – SQL eller NoSQL (LR 3)

### Uppgift 15 – Banköverföringar mellan konton

Jag skulle välja SQL eftersom banköverföringar kräver säkra transaktioner och korrekt information. När pengar överförs mellan två konton måste båda kontona uppdateras korrekt. Om något går fel kan man använda ROLLBACK för att ångra transaktionen så att inga pengar försvinner.

### Uppgift 16 – Inloggningssessioner i en webbshop

Jag skulle välja NoSQL, exempelvis Redis, eftersom inloggningssessioner är tillfälliga och behöver vara snabba att komma åt. Redis har en funktion som heter TTL (Time To Live), vilket gör att en session automatiskt kan tas bort efter 30 minuter.

### Uppgift 17 – Produktkatalog med olika attribut

Jag skulle välja NoSQL, exempelvis MongoDB, eftersom det har en flexibel datastruktur. Olika produkter kan ha olika egenskaper. En mobiltelefon kan exempelvis ha lagringsutrymme och batterikapacitet, medan en tröja har storlek och färg. Produkterna behöver därför inte följa samma fasta struktur.


## Del D – Reflektion (VG)

### Uppgift 18 – Användning av AI

Jag använde ChatGPT som stöd under uppgift 12a, där jag skulle lägga till ett nytt uppdrag i databasen.

**Min prompt:**

"kan man inte lägga CREATE ?"

**AI:ns svar (utdrag):**

"Nej, inte i den här uppgiften. Det beror på att tabellen `moon_mission` redan finns."

AI förklarade att CREATE används för att skapa en ny databas eller tabell, medan INSERT INTO används för att lägga till information i en befintlig tabell.

**Min SQL-kod:**

```sql
INSERT INTO moon_mission (spacecraft, launch_date)
VALUES ('Apollo 11', '1969-07-16');
```

**Vad jag behövde ändra och kontrollera:**

Jag behövde kontrollera att kolumnnamnen stämde överens med tabellen och att uppskjutningsdatumet var korrekt. Jag råkade även köra INSERT flera gånger, vilket skapade dubbletter som jag sedan fick ta bort med DELETE.

Jag fick också hjälp med LAST_INSERT_ID(), som hämtar det automatiskt tilldelade ID:t. Det gjorde att jag inte behövde använda ett hårdkodat ID i mina UPDATE- och DELETE-kommandon.

**Skillnaden mellan min prompt och SQL:**

Min prompt är skriven på naturligt språk och beskriver min fråga. SQL är däremot ett strukturerat språk som kräver tydliga kommandon, korrekta kolumnnamn och en bestämd syntax för att databasen ska förstå vad den ska göra.

### Uppgift 19 – Varför är account-tabellen dålig design för lösenord?

Account-tabellen har en dålig design eftersom lösenorden lagras i klartext. Om någon obehörig får tillgång till databasen kan personen läsa användarnas lösenord direkt.

Istället bör lösenorden sparas som hashvärden med hjälp av en säker algoritm, exempelvis Argon2id eller bcrypt.

Man bör även använda ett unikt salt för varje lösenord. Det gör att två användare som har samma lösenord ändå får olika hashvärden.

På detta sätt förbättras säkerheten och det blir svårare för obehöriga att komma åt användarnas ursprungliga lösenord vid en databasläcka.