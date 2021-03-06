# Database for our Chatservice

![ER-Diagramm](./diagrams/database-final.svg)

## Designentscheidungen

### Unterscheidung 1:1-Konversation/Gruppenkonversation

#### Jede Konversation ist ein Channel (dafür haben wir uns entschieden)

* Sämtliche Konversationen finden in Channels statt
* 1:1 Konversationen werden ähnlich wie Gruppenkonversationen behandelt

#### alle Konversationstypen haben eine Tabellenübergreifend eizigartige ID

* Gruppen und 1:1-Konversationen haben tabellenübergreifend einzigartige Primärschlüssel (UUID/Sequence)
* Eine Tabelle hält alle Nachrichten
* Nachrichten verweisen auf eine KoversationsID
* Gruppen, 1:1-Konversationen und Nachrichten müssen gejoint werden

#### 1:1-Nachrichten und Gruppennachrichten werden separat gespeichert

* zwischen Gruppen und 1:1-Konversationen wird unterschieden
* jeweils eine Tabelle speichert alle Gruppennachrichten/1:1-Nachrichten
