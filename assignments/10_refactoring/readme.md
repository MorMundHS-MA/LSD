# Refactoring

[Repository eigener Code](https://github.com/MorMundHS-MA/repo-03)

## Gefundene Code Smells

```
    /**
     * Receives new message from the user.
     *
     * @param json A JSON object containing the fields to,from,date and text.
     * @return If successful returns 204(Created) and a JSON object containing
     * date and sequenceNumber of the Message.
     */
    @PUT
    @Path("/send")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public Response send(String json) {
        try {
            String corsOrigin = Config.getSettingValue(Config.corsAllowOrigin);
            Message msg = null;
            try {
                msg = Message.fromJson(json);
            } catch (ParseException e) {
                System.out.println("[/send] Message was badly formatted");
                return Response.status(Response.Status.BAD_REQUEST)
                        .header("Access-Control-Allow-Origin", corsOrigin)
                        .entity("Message was incomplete").build();
            }

            if (msg != null && msg.to != null && msg.from != null &&
                    msg.date != null && msg.text != null && msg.token != null) {
                if (authenticateUser(msg.token, msg.from) != null) {
                    User receiver = new User(msg.to);
                    if (receiver.sendMessage(msg) == null) {
                        System.out.println("[/send] DB refused message.");
                        return Response.status(Response.Status.BAD_REQUEST)
                                .header("Access-Control-Allow-Origin", corsOrigin)
                                .entity("Message was not correctly formatted").build();
                    }
                } else {
                    System.out.printf("[/send] Could not authenticate user %s with token %s\n", msg.from, msg.token);
                    return Response.status(Response.Status.UNAUTHORIZED)
                            .entity("Invalid Token")
                            .header("Access-Control-Allow-Origin", corsOrigin)
                            .build();
                }
                try {
                    return Response.status(Response.Status.CREATED)
                            .header("Access-Control-Allow-Origin", corsOrigin)
                            .entity(msg.toJson(true).toString()).build();
                } catch (JSONException e) {
                    e.printStackTrace();
                    return Response
                            .status(Response.Status.INTERNAL_SERVER_ERROR)
                            .header("Access-Control-Allow-Origin", corsOrigin).build();
                }
            } else {
                System.out.println("[/send] Message was incomplete");
                return Response.status(Response.Status.BAD_REQUEST)
                        .header("Access-Control-Allow-Origin", corsOrigin)
                        .entity("Message was incomplete").build();
            }
        } catch (Exception e) {
            System.out.printf("[/send] Unhandled exception  %s %s", json, e.getMessage());
            e.printStackTrace();
            return Response
                    .status(Response.Status.INTERNAL_SERVER_ERROR)
                    .header("Access-Control-Allow-Origin", "*")
                    .build();
        }
}
```

Die Methoden nutzt zu tiefe Verschachtelung (resultierend zu lange Zeilen), duplizierten Code im Error Handling und unreachable Code beim Verifizieren von msg und dessen Properties da diese schon durch die Message Konstrukturen garantiert wird. Die Methode ist nicht durch unit tests abgedeckt da eine statische Datenbankservice Klasse verwendet wird.


```
public class StorageProviderMongoDB extends StorageProviderCoreMongoDB {

    private static final int sequenceOffset = 1;

    protected StorageProviderMongoDB() throws Exception {
    }

    public static synchronized void init();
    public static int addMessage(User user, Message msg);
    public static List<Message> getMessages(User user, int sequenceBegin);
    public static boolean removeMessages(User user, int sequenceBegin);
}
```

Da in Java statische Methoden nur schwierig gemockt werden können verhindert die Nutzung dieser Service Klasse das schreiben von unit tests für die REST Klasse.

```
public class StorageProviderMongoDB extends StorageProviderCoreMongoDB{

    private static final int sequenceOffset = 1;

    public StorageProviderMongoDB(MongoClientURI uri, String database) {
        super(uri, database);
    }

    public int addMessage(User user, Message msg);
}
```

Die Klasse wird im in der Main Methode der REST Klasse erstellt und einer statische Variable zugewiesen. Um die Serviceklasse in tests zu mocken kann diese auch über den Konstruktor zugewiesen werden.

```
public Service(StorageProviderMongoDB provider, AuthenticationProvider auth) {
    Service.provider = provider;
    Service.auth = auth;
}
```

Eine statische Variable im Konstruktor zu setzen ist in sich selbst ein Code Smell und wird auch von SpotBugs als kritisch eingestuft. Richtiger wäre das nutzen der Code Injection von Jersey gewesen. Diese würde jedoch ein Update der Jersey Library auf Version 2 und weiter Änderungen vorrausetzen.

```
public Response send(String json) {
    String corsOrigin = Config.corsAllowOrigin.value();
    Message msg;
    try {
        msg = Message.fromJson(json);
    } catch (ParseException e) {
        System.out.println("[/send] Message was badly formatted");
        return Response.status(Response.Status.BAD_REQUEST)
                .header("Access-Control-Allow-Origin", corsOrigin)
                .entity("Message was incomplete").build();
    }

    if (authenticateUser(msg.token, msg.from) == null) {
        System.out.printf("[/send] Could not authenticate user %s with token %s%n", msg.from, msg.token);
        return Response.status(Response.Status.UNAUTHORIZED)
                .entity("Invalid Token")
                .header("Access-Control-Allow-Origin", corsOrigin)
                .build();

    }

    User receiver = new User(provider, msg.to);
    if (receiver.sendMessage(msg) == null) {
        System.out.println("[/send] DB refused message.");
        return Response.status(Response.Status.BAD_REQUEST)
                .header("Access-Control-Allow-Origin", corsOrigin)
                .entity("Message was not correctly formatted").build();
    }

    return Response.status(Response.Status.CREATED)
            .header("Access-Control-Allow-Origin", corsOrigin)
            .entity(msg.toJson(true).toString()).build();
}
```

Der verbleibende doppelte Code `.header("Access-Control-Allow-Origin", corsOrigin)` könnte noch durch die Nutzung eines `ContainerResponseFilter` ersetzt werden, was jedoch auch Dependency Injection voraussetzt.  

Zusätzlich wurden noch SpotBugs und PMD Warnung behoben. Hier handelte es sich aber hauptsächlich um ungenutzte Imports und die Verwedendung `\n` als line terminator anstatt `%n`.