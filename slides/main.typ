#import "@preview/not-tudabeamer-2023:0.2.0": *

#show: not-tudabeamer-2023-theme.with(
  config-info(
    title: [Discord Bots erstellen],
    short-title: [Discord Bots],
    subtitle: [(Keine FOPBots)],
    author: "Dennis Yildirim",
    short-author: "Dennis",
    date: datetime.today(),
    department: [Erstellt für],
    institute: [die Ofahrt von],
    //logo: text(fallback: true, size: 2.75in, emoji.cat.face)
    logo: image("media/Discord-Symbol-Blurple.svg", height: 125%),
  )
)

#title-slide()

#outline-slide()

#set text(size: 30pt)

= Basics
Grundlagen

== Wie funktionieren Discord Bots?

- Eine Form von Discord Applications
- Können auf Servern installiert werden
- Euer Code interagiert mit der Discord API, damit der Bot coole Sachen macht

== Code-Grundlagen
```java
public static void main(String[] arguments) throws Exception {
    JDA api = JDABuilder.createDefault(BOT_TOKEN).build();
}
```
- Als Library nutzen wir JDA
- Es existieren Libraries für jede erdenkliche Sprache

== Libraries (Symbolbild)
#figure(image("media/libraries.png", width: 100%, height: 80%))