#import "@preview/not-tudabeamer-2023:0.2.0": *

#show: not-tudabeamer-2023-theme.with(
  config-info(
    title: [Discord Bots erstellen - Interaktiv - Live - Für Anfänger - Präsentation - Ofahrt 2025],
    short-title: [Discord Bots],
    subtitle: [(Keine FOPBots)],
    author: "",
    short-author: "McPlagiat",
    date: datetime.today(),
    department: [Erstellt für],
    institute: [die Ofahrt von],
    //logo: text(fallback: true, size: 2.75in, emoji.cat.face)
    logo: image("media/bot.png", height: 200%),
  )
)

#title-slide()

#set text(size: 30pt)

= Theorie
Theorie

== Wie funktionieren Discord Bots?

- Eine Form von Discord Applications
- Können auf Servern installiert werden
- Euer Code interagiert mit der Discord API, damit der Bot coole Sachen macht

== Code-Grundlagen
- Als Library nutzen wir JDA
- Es existieren Libraries für jede erdenkliche Sprache

== Code-Grundlagen
- Als Library nutzen wir JDA (außer Nikola, der macht Racket)
- Es existieren Libraries für jede erdenkliche Sprache

== Libraries (Symbolbild)
#figure(image("media/libraries.png", width: 100%, height: 80%))

== Code-Grundlagen
- Als Library nutzen wir JDA
- Es existieren Libraries für jede erdenkliche Sprache
```java
public static void main(String[] arguments) throws Exception {
    JDA api = JDABuilder.createDefault(BOT_TOKEN).build();
}
```
- Hiermit wird eine Verbindung zur Discord API aufgebaut
- Der Bot ist jetzt online

== Exkurs: .env file
- Wir wollen nicht den Bot Token direkt in unseren Code schreiben
- Deshalb erstellen wir eine Datei namens ".env" in unserem Projekt
- Und greifen dann über eine Library auf den Token zu
`.env:`
```env
token=FHLIUADS38z92dsh32HIU98dsf2ijf893t298zfwejhiod98G82fhd
```
- Und diese comitten wir bitte nicht
  - Sonst müssen wir in der Zeit reisen

== Gateway Intents
- Gateway Intents legen fest, welche Events der Bot empfangen kann
- Zum Beispiel:
  - GUILD_MESSAGES: Der Bot kann Nachrichten in Servern empfangen
  - GUILD_MESSAGE_TYPING: Der Bot kann sehen, wenn jemand eine Nachricht schreibt
  - etc.

== Gateway Intents
- Einige Intents erfordern, dass euer Bot von Discord verifiziert wird
  - Allerdings nur, wenn der Bot auf mehr als 100 Servern ist
- Deshalb aktivieren wir heute einfach alle Intents
```java
public static void main(String[] arguments) throws Exception {
    JDA bot = JDABuilder
              .createDefault(BOT_TOKEN)
              .enableIntents(List.of(GatewayIntent.values()))
              .build();
}
```

== Listeners
- Listeners sind Klassen, die auf Events reagieren
  - Beispiel: Listener, der auf Nachrichten reagiert
```java
public class MessageListener extends ListenerAdapter
{
    @Override
    public void onMessageReceived(MessageReceivedEvent event)
    {
      ...
    }
}
```

== Listeners
- Damit diese Klasse auch auf Events reagieren kann, muss sie dem Bot hinzugefügt werden
```java
public static void main(String[] arguments) throws Exception {
    JDA bot = JDABuilder
              .createDefault(BOT_TOKEN)
              .enableIntents(List.of(GatewayIntent.values()))
              .addEventListeners(new MessageListener())
              .build();
}
```

== Rest Actions
- Rest Actions beschreiben, was der Bot tun soll, bevor er es tut
- Beispiel: Nachricht senden
```java
Message message = event.getMessage();
RestAction<Message> action = message.reply("abc");
```
- Diese Aktion kann dann ausgeführt werden
```java
action.queue();
```

== Rest Actions
- Wenn wir mit Rest Actions arbeiten, können wir auch auf das Ergebnis reagieren
```java
action.queue(message ->
    message.editMessage("cba").queue());

```
- Hiermit wird die Nachricht, die wir gerade gesendet haben, bearbeitet

== Rest Actions
- Statt queue() können wir auch submit() oder complete() verwenden
- Wie die funktionieren, steht in der JDA-Dokumentation

== Weitere Features
- JDA hat noch viele weitere Features
- Hier sind ein paar Beispiele:
  - Slash Commands
  - Buttons
  - Modals
  - Interaktionen
  - etc.
- Diese Features sind alle in der JDA-Dokumentation beschrieben

= Der Coole Part
Der Coole Part

== RPS Bot
*Live Presentation*

== Bot Application erstellen
*Live Presentation*

#text(blue)[https://discord.com/developers/applications]

== Code schreiben
*Live Presentation*

#text(blue)[https://git.burg.ofahrt.com/Dennis/Discord-Bot]

#text(blue)[https://discord.gg/eNSkhE3d]

== Ende
#image("media/feedback.png")