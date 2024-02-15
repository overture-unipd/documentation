#import "//templates/document.typ": *

#show: project.with(
  title: "Specifica Tecnica",
  managers: p.bulychov,
  recipients: (
    p.vardanega,
    p.cardin,
    [_#(p.zextras)_],
  ),
  changelog: (
    "0.0.2", "2024-02-15", p.vedovato, p.furno, 
    [
      Aggiunta la sezione 'Stato dei requisiti funzionali'.
    ],
    "0.0.1", "2024-02-12", (p.vedovato, p.fabbian), p.bettin, 
    [
      Struttura di base del documento e introduzione.
    ]
  ),
  outline_depth: 3,
)

= Introduzione

== Scopo del documento
Lo scopo di questo documento è quello di elencare e motivare le scelte architetturali che il gruppo Overture ha intrapreso per la realizzazione dell'infrastruttura informatica richiesta. Il documento comprende anche i diagrammi delle classi e dei package al fine di spiegare in maniera più chiara e dettagliata il software sviluppato.

== Glossario
Per evitare ambiguitá o incomprensioni riguardanti la terminologia usata nel documento, é stato deciso di adottare un glossario in cui vengono riportate le varie definizioni. In questa maniera in esso verranno riportati tutti i termini specifici del dominio d'uso con relativi significati.
\
La presenza di un termine all'interno del `Glossario` viene indicata applicando #glossary("questo stile").

== Riferimenti
=== Riferimenti normativi
- `Norme di Progetto v1.0.0`: \ https://overture-unipd.github.io/docs/rtb/interni/norme_di_progetto_v1.0.0.pdf
- *PD2 - Regolamento del progetto didattico* \
  https://www.math.unipd.it/~tullio/IS-1/2023/Dispense/PD2.pdf
- *Capitolato d'appalto C8*: JMAP, il nuovo protocollo standard per la comunicazione email \
  https://www.math.unipd.it/~tullio/IS-1/2023/Progetto/C8.pdf

=== Riferimenti informativi
- `Glossario v1.0.0`: \ https://overture-unipd.github.io/docs/rtb/interni/glossario_v1.0.0.pdf
- `Analisi dei Requisiti v1.1.0`: \ https://overture-unipd.github.io/docs/rtb/esterni/analisi_dei_requisiti_v1.1.0.pdf

#pagebreak()

= Stato dei requisiti funzionali
#figure(
  requisitiSoddisfatti(
  (
    "R-001-F-2", "Desiderabile", "L’utente che utilizza un client di posta elettronica per interagire con il server deve autenticarsi all’interno del sistema.", "Non soddisfatto",
    "R-002-F-2", "Desiderabile", "È necessario che il client fornisca all’interno della richiesta l’indirizzo email personale dell’utente per procedere con l’autenticazione.", "Non soddisfatto",
    "R-003-F-2", "Desiderabile", "È necessario che il client fornisca all’interno della richiesta la password associata all’indirizzo email personale dell’utente per procedere con l’autenticazione.", "Non soddisfatto",
    "R-004-F-2", "Desiderabile", "Se la fase di autenticazione è fallita allora è necessario che il client riceva dal server una risposta con eventuali dettagli che ne indicano il motivo.", "Non soddisfatto",
    "R-005-F-1", "Obbligatorio", "Il client deve essere in grado di reperire la risorsa JMAP Session, contenente informazioni sulle capacità del server, dettagli sull’account dell’utente e le URL per le richieste API future, in modo da poter interagire con dati e servizi offerti dal server.", "Non soddisfatto",
    "R-006-F-1", "Obbligatorio", "È necessario che il client riceva in risposta l'errore \"unkownCapability\" in caso di esecuzione di una richiesta con proprietà \"using\" non supportata dal server.", "Non soddisfatto",
    "R-007-F-1", "Obbligatorio", "È necessario che il client riceva in risposta l'errore \"notJSON\" se il contenuto di una richiesta inviata al server non era application/json o se la richiesta non è stata interpretata dal server come I-JSON.", "Non soddisfatto",
    "R-008-F-1", "Obbligatorio", "È necessario che il client riceva in risposta l'errore \"notRequest\" se una richiesta JSON non ha corrisposto alla firma di tipo dell'oggetto di richiesta (Request).", "Non soddisfatto",
    "R-009-F-1", "Obbligatorio", "È necessario che il client riceva in risposta l'errore \"limit\" in caso di inserimento di una richiesta che supera uno dei limiti definiti sull'oggetto di capacità, come maxSizeRequest, maxCallsInRequest o maxCurrentRequests.", "Non soddisfatto",
    "R-010-F-1", "Obbligatorio", "È necessario che il client riceva in risposta l'errore \"serverUnavailable\" in caso di inserimento di una richiesta che necessita di alcune risorse interne del server momentaneamente non disponibili.", "Non soddisfatto",
    "R-011-F-1", "Obbligatorio", "È necessario che il client riceva in risposta l'errore \"serverFail\" in caso si verifichi un errore inaspettato o sconosciuto durante l'elaborazione di una sua richiesta dal server.", "Non soddisfatto",
    "R-012-F-1", "Obbligatorio", "È necessario che il client riceva in risposta l'errore \"serverPartialFail\" e proceda risincronizzando i dati in caso si verifichi un errore inaspettato o sconosciuto durante l'elaborazione di una sua richiesta dal server.", "Non soddisfatto",
    "R-013-F-1", "Obbligatorio", "È necessario che il client riceva in risposta l'errore \"unknownMethod\" in caso di inserimento di una richiesta contenente un metodo non riconosciuto dal server.", "Non soddisfatto",
    "R-014-F-1", "Obbligatorio", "È necessario che il client riceva in risposta l'errore \"invalidArguments\" se uno degli argomenti di un metodo fornito all'interno di una richiesta al server è di tipo errato, non valido o, nel caso in cui sia obbligatorio, è assente.", "Non soddisfatto",
    "R-015-F-1", "Obbligatorio", "È necessario che il client riceva in risposta l'errore \"invalidResultReference\" se uno degli argomenti di un metodo fornito all'interno di una richiesta al server ha utilizzato un riferimento di risultato che non è stato possibile risolvere da parte del server.", "Non soddisfatto",
    "R-016-F-1", "Obbligatorio", "È necessario che il client riceva in risposta l'errore \"forbidden\" in caso utilizzi, all'interno di una richiesta al server, un metodo la cui esecuzione violerebbe una Access Control List (ACL) o un’altra policy di autorizzazione.", "Non soddisfatto",
    "R-017-F-1", "Obbligatorio", "È necessario che il client riceva in risposta l'errore \"accountNotFound\" se l’\"accountID\" fornito all'interno di una richiesta al server non corrisponde a un account valido.", "Non soddisfatto",
    "R-018-F-1", "Obbligatorio", "È necessario che il client riceva in risposta l'errore \"accountNotSupportedByMethod\" se all'interno di una richiesta al server è presente un metodo o tipo di dato non supportato dall’\"accountID\" fornito.", "Non soddisfatto",
    "R-019-F-1", "Obbligatorio", "È necessario che il client riceva in risposta l'errore \"accountReadOnly\" se all'interno di una richiesta al server è presente un metodo che tenta di modificare lo stato nonostante l’account sia in sola lettura.", "Non soddisfatto",
    "R-020-F-1", "Obbligatorio", "È necessario che il client riceva in risposta l'errore \"cannotCalculateChanges\" se, in seguito all'inserimento di una richiesta, il server non possa calcolare le modifiche dello stato dalla stringa di stato fornita dal client.", "Non soddisfatto",
    "R-021-F-1", "Obbligatorio", "È necessario che il client riceva in risposta l'errore \"overQuota\" se una richiesta inserita nel server richiede la creazione di oggetti che per dimensione o quantità superano il limite imposto dal server.", "Non soddisfatto",
    "R-022-F-1", "Obbligatorio", "È necessario che il client riceva in risposta l'errore \"notFound\" se una richiesta inserita nel server fornisce degli ID che non possono essere trovati.", "Non soddisfatto",
    "R-023-F-1", "Obbligatorio", "È necessario che il client riceva in risposta l'errore \"willDestroy\" se ha richiesto che un oggetto fosse sia aggiornato che distrutto all'interno della stessa richiesta al server.", "Non soddisfatto",
    "R-024-F-1", "Obbligatorio", "È necessario che il client riceva in risposta l'errore \"tooLarge\" se una richiesta inserita nel server richiede la creazione di un oggetto che supera il limite definito dal server per la dimensione massima per un oggetto di quel tipo.", "Non soddisfatto",
    "R-025-F-1", "Obbligatorio", "È necessario che il client riceva in risposta l'errore \"rateLimit\" se una richiesta inserita nel server comporta la creazione di un oggetto per cui sono stati creati troppi oggetti quel tipo di recente, raggiungendo un limite di frequenza definito dal server.", "Non soddisfatto",
    "R-026-F-1", "Obbligatorio", "È necessario che il client riceva in risposta l'errore \"invalidPatch\" se una richiesta inserita nel server fornisce un PatchObject non valido per modificare il record.", "Non soddisfatto",
    "R-027-F-1", "Obbligatorio", "È necessario che il client riceva in risposta l'errore \"invalidProperties\" se una richiesta inserita nel server fornisce un record non valido.", "Non soddisfatto",
    "R-028-F-1", "Obbligatorio", "È necessario che il client riceva in risposta l'errore \"singleton\" se una richiesta inserita nel server tentasse di agire erroneamente su un tipo singleton.", "Non soddisfatto",
    "R-029-F-1", "Obbligatorio", "È necessario che il client riceva in risposta l'errore \"requestTooLarge\" se una richiesta inserita nel server contiene un numero di azioni che supera il massimo che il server è disposto a elaborare in una singola chiamata di metodo interna alla richiesta.", "Non soddisfatto",
    "R-030-F-1", "Obbligatorio", "È necessario che il client riceva in risposta l'errore \"stateMismatch\" se una richiesta inserita nel server contiene un argomento ifInState e questo non corrisponde allo stato attuale.", "Non soddisfatto",
    "R-031-F-1", "Obbligatorio", "È necessario che il client riceva in risposta l'errore \"blobNotFound\" se una richiesta inserita nel server contiene almeno un ID blob fornito per una parte del corpo dell'email che non esiste.", "Non soddisfatto",
    "R-032-F-1", "Obbligatorio", "È necessario che il client riceva in risposta l'errore \"tooManyKeywords\" se una richiesta inserita nel server modifica un numero di parole chiave dell'email superiore al limite massimo definito dal server.", "Non soddisfatto",
    "R-033-F-1", "Obbligatorio", "È necessario che il client riceva in risposta l'errore \"tooManyMailboxes\" se una richiesta inserita nel server modifica un numero di cartelle a cui appartiene l'email superiore al limite massimo definito dal server.", "Non soddisfatto",
    "R-034-F-1", "Obbligatorio", "È necessario che il client riceva in risposta l'errore \"alreadyExists\" se una richiesta inserita in un server che vieta i duplicati contiene un record già esistente nell'account di destinazione.", "Non soddisfatto",
    "R-035-F-1", "Obbligatorio", "È necessario che il client riceva in risposta l'errore \"fromAccountNotFound\" se una richiesta inserita nel server contiene un fromAccountId che non corrisponde a nessun account valido.", "Non soddisfatto",
    "R-036-F-1", "Obbligatorio", "È necessario che il client riceva in risposta l'errore \"fromAccountNotSupportedByMethod\" se una richiesta inserita nel server contiene un fromAccountId che non supporta un tipo di dato utilizzato.", "Non soddisfatto",
    "R-037-F-1", "Obbligatorio", "È necessario che il client riceva in risposta l'errore \"anchorNotFound\" se una richiesta inserita nel server contiene un argomento di ancoraggio che non è stato trovato nei risultati della query.", "Non soddisfatto",
    "R-038-F-1", "Obbligatorio", "È necessario che il client riceva in risposta l'errore \"unsupportedSort\" se una richiesta inserita nel server presenta una clausola di ordinamento non supportata o un metodo di collezione non riconosciuto dal server.", "Non soddisfatto",
    "R-039-F-1", "Obbligatorio", "È necessario che il client riceva in risposta l'errore \"unsupportedFilter\" se una richiesta inserita nel server contiene un filtro che il server non è grado di elaborare.", "Non soddisfatto",
    "R-040-F-1", "Obbligatorio", "È necessario che il client riceva in risposta l'errore \"tooManyChanges\" se una richiesta inserita nel server contiene un numero di modifiche superiore all'argomento maxChanges inserito del client.", "Non soddisfatto",
    "R-041-F-1", "Obbligatorio", "È necessario che il client riceva in risposta l'errore \"mailboxHasChild\" se una richiesta inserita nel server desidera rimuovere una cartella(Mailbox) che ha ancora almeno una cartella figlia.", "Non soddisfatto",
    "R-042-F-1", "Obbligatorio", "È necessario che il client riceva in risposta l'errore \"mailboxHasEmail\" se una richiesta inserita nel server, con l'argomento onDestroyRemoveEmails impostato su false, desidera rimuovere una cartella(Mailbox) che ha al suo interno almeno una email.", "Non soddisfatto",
    "R-043-F-1", "Obbligatorio", "È necessario che il client riceva in risposta l'errore \"invalidEmail\" se una richiesta inserita nel server contiene un'email da inviare non valida.", "Non soddisfatto",
    "R-044-F-1", "Obbligatorio", "È necessario che il client riceva in risposta l'errore \"tooManyRecipients\" se una richiesta inserita nel server contiene un envelope (insieme di destinatari) che ha più destinatari di quanti il server consenta.", "Non soddisfatto",
    "R-045-F-1", "Obbligatorio", "È necessario che il client riceva in risposta l'errore \"noRecipients\" se una richiesta inserita nel server contiene un envelope (insieme di destinatari) che non presenta alcun destinatario.", "Non soddisfatto",
    "R-046-F-1", "Obbligatorio", "È necessario che il client riceva in risposta l'errore \"invalidRecipients\" se una richiesta inserita nel server contiene un envelope (insieme di destinatari) con almeno un indirizzo email destinatario non valido.", "Non soddisfatto",
    "R-047-F-1", "Obbligatorio", "È necessario che il client riceva in risposta l'errore \"forbiddenMailFrom\" se una richiesta è inserita in un server che non consente all'utente di inviare un messaggio con quel indirizzo mittente nell'envelope (From address).", "Non soddisfatto",
    "R-048-F-1", "Obbligatorio", "È necessario che il client riceva in risposta l'errore \"forbiddenFrom\" se una richiesta è inserita in un server che non consente all'utente di inviare un messaggio con il campo di intestazione From del messaggio da inviare.", "Non soddisfatto",
    "R-049-F-1", "Obbligatorio", "È necessario che il client riceva in risposta l'errore \"forbiddenToSend\" se una richiesta è inserita in un server che non consente all'utente di inviare un messaggio in quel momento.", "Non soddisfatto",
    "R-050-F-1", "Obbligatorio", "L'utente che utilizza un client di posta elettronica per interagire con il server deve avere la possibilità di inviare email.", "Non soddisfatto",
    "R-051-F-1", "Obbligatorio", "È necessario che il client inserisca all'interno della richiesta l'identificazione delle capacità necessarie all'invio di una email.", "Non soddisfatto",
    "R-052-F-1", "Obbligatorio", "È necessario che il client inserisca all'interno della richiesta le chiamate di metodo necessarie all'invio di una email, con relativi parametri (sia quelli comuni, come l'identificativo dell'account da utilizzare, sia quelli specifici del caso) e un identificatore univoco associato.", "Non soddisfatto",
    "R-053-F-1", "Obbligatorio", "È necessario che il client inserisca all'interno della richiesta le proprietà dell'oggetto Email da creare (cartelle in cui è contenuta, mittente, destinatari, oggetto, corpo del messaggio ed altri dettagli definiti dall'RFC5322).", "Non soddisfatto",
    "R-054-F-1", "Obbligatorio", "È necessario che il client inserisca all'interno della richiesta le proprietà dell'oggetto EmailSubmission da creare (l'identificativo dell'email creata in precedenza ed ora da inviare, le informazioni necessarie per l'invio ed altri dettagli).", "Non soddisfatto",
    "R-055-F-1", "Obbligatorio", "È possibile che il client inserisca all'interno della richiesta eventuali azioni da compiere in seguito al corretto invio dell'email.", "Non soddisfatto",
    "R-056-F-1", "Obbligatorio", "È necessario che il client riceva una risposta che contiene l'esito dell'operazione di invio dell'email con relativi parametri (come il nuovo stato, gli oggetti creati ed eventuali errori).", "Non soddisfatto",
    "R-057-F-1", "Obbligatorio", "L'utente che utilizza un client di posta elettronica per interagire con il server deve avere la possibilità di ricevere email e visualizzarne il dettaglio.", "Non soddisfatto",
    "R-058-F-1", "Obbligatorio", "È necessario che il client inserisca all'interno della richiesta l'identificazione delle capacità necessarie alla ricezione di una email.", "Non soddisfatto",
    "R-059-F-1", "Obbligatorio", "È necessario che il client inserisca all'interno della richiesta le chiamate di metodo necessarie alla ricezione di una email, con relativi parametri (sia quelli comuni, come l'identificativo dell'account da utilizzare, sia quelli specifici del caso) e un identificatore univoco associato.", "Non soddisfatto",
    "R-060-F-1", "Obbligatorio", "È necessario che il client inserisca all'interno della richiesta l'identificativo delle email da ricevere", "Non soddisfatto",
    "R-061-F-1", "Obbligatorio", "È possibile che il client inserisca all'interno della richiesta le proprietà specifiche delle email che è interessato a ricevere", "Non soddisfatto",
    "R-062-F-1", "Obbligatorio", "È necessario che il client riceva una risposta che contiene l'esito dell'operazione di ricezione dell'email con relativi parametri (come lo stato corrente dei dati di tipo Email sul server, la lista delle email richieste ed eventuali errori)", "Non soddisfatto",
    "R-063-F-1", "Obbligatorio", "L'utente che utilizza un client di posta elettronica per interagire con il server deve avere la possibilità di eliminare email.", "Non soddisfatto",
    "R-064-F-1", "Obbligatorio", "È necessario che il client inserisca all'interno della richiesta l'identificazione delle capacità necessarie all'eliminazione di una email.", "Non soddisfatto",
    "R-065-F-1", "Obbligatorio", "È necessario che il client inserisca all'interno della richiesta le chiamate di metodo necessarie all'eliminazione di una email, con relativi parametri (sia quelli comuni, come l'identificativo dell'account da utilizzare, sia quelli specifici del caso) e un identificatore univoco associato.", "Non soddisfatto",
    "R-066-F-1", "Obbligatorio", "È necessario che il client inserisca all'interno della richiesta la lista degli identificativi delle email da eliminare.", "Non soddisfatto",
    "R-067-F-1", "Obbligatorio", "È necessario che il client riceva una risposta che contiene l'esito dell'operazione di eliminazione delle email con relativi parametri (come il nuovo stato, gli identificativi degli oggetti eliminati ed eventuali errori)", "Non soddisfatto",
    "R-068-F-1", "Obbligatorio", "L'utente che utilizza un client di posta elettronica per interagire con il server deve avere la possibilità di ricevere cartelle e visualizzarne il dettaglio.", "Non soddisfatto",
    "R-069-F-1", "Obbligatorio", "È necessario che il client inserisca all'interno della richiesta l'identificazione delle capacità necessarie alla ricezione di una cartella.", "Non soddisfatto",
    "R-070-F-1", "Obbligatorio", "È necessario che il client inserisca all'interno della richiesta le chiamate di metodo necessarie alla ricezione di una cartella, con relativi parametri (sia quelli comuni, come l'identificativo dell'account da utilizzare, sia quelli specifici del caso) e un identificatore univoco associato.", "Non soddisfatto",
    "R-071-F-1", "Obbligatorio", "È necessario che il client inserisca all'interno della richiesta l'identificativo delle cartelle da ricevere", "Non soddisfatto",
    "R-072-F-1", "Obbligatorio", "È possibile che il client inserisca all'interno della richiesta le proprietà specifiche delle cartelle che è interessato a ricevere", "Non soddisfatto",
    "R-073-F-1", "Obbligatorio", "È necessario che il client riceva una risposta che contiene l'esito dell'operazione di ricezione della cartella con relativi parametri (come lo stato corrente dei dati di tipo Mailbox sul server, la lista delle cartelle richieste ed eventuali errori)", "Non soddisfatto",
    "R-074-F-1", "Obbligatorio", "L'utente che utilizza un client di posta elettronica per interagire con il server deve avere la possibilità di creare cartelle.", "Non soddisfatto",
    "R-075-F-1", "Obbligatorio", "È necessario che il client inserisca all'interno della richiesta l'identificazione delle capacità necessarie alla creazione di una cartella.", "Non soddisfatto",
    "R-076-F-1", "Obbligatorio", "È necessario che il client inserisca all'interno della richiesta le chiamate di metodo necessarie alla creazione di una cartella, con relativi parametri (sia quelli comuni, come l'identificativo dell'account da utilizzare, sia quelli specifici del caso) e un identificatore univoco associato.", "Non soddisfatto",
    "R-077-F-1", "Obbligatorio", "È necessario che il client inserisca all'interno della richiesta le proprietà dell'oggetto Mailbox da creare (nome, eventuale genitore, ruolo ed altri dettagli).", "Non soddisfatto",
    "R-078-F-1", "Obbligatorio", "È necessario che il client riceva una risposta che contiene l'esito dell'operazione di creazione della cartella con relativi parametri (come lo stato corrente del server, la lista delle cartelle create ed eventuali errori)", "Non soddisfatto",
    "R-079-F-1", "Obbligatorio", "L'utente che utilizza un client di posta elettronica per interagire con il server deve avere la possibilità di modificare cartelle esistenti.", "Non soddisfatto",
    "R-080-F-1", "Obbligatorio", "È necessario che il client inserisca all'interno della richiesta l'identificazione delle capacità necessarie alla modifica di una cartella.", "Non soddisfatto",
    "R-081-F-1", "Obbligatorio", "È necessario che il client inserisca all'interno della richiesta le chiamate di metodo necessarie alla modifica di una cartella, con relativi parametri (sia quelli comuni, come l'identificativo dell'account da utilizzare, sia quelli specifici del caso) e un identificatore univoco associato.", "Non soddisfatto",
    "R-082-F-1", "Obbligatorio", "È necessario che il client inserisca all'interno della richiesta le modifiche da apportare all'oggetto Mailbox che l'utente desidera modificare.", "Non soddisfatto",
    "R-083-F-1", "Obbligatorio", "È necessario che il client riceva una risposta che contiene l'esito dell'operazione di modifica della cartella con relativi parametri (come lo stato corrente del server, la lista delle cartelle modificate ed eventuali errori)", "Non soddisfatto",
    "R-084-F-1", "Obbligatorio", "L'utente che utilizza un client di posta elettronica per interagire con il server deve avere la possibilità di eliminare cartelle esistenti.", "Non soddisfatto",
    "R-085-F-1", "Obbligatorio", "È necessario che il client inserisca all'interno della richiesta l'identificazione delle capacità necessarie alla eliminazione di una cartella.", "Non soddisfatto",
    "R-086-F-1", "Obbligatorio", "È necessario che il client inserisca all'interno della richiesta le chiamate di metodo necessarie alla eliminazione di una cartella, con relativi parametri (sia quelli comuni, come l'identificativo dell'account da utilizzare, sia quelli specifici del caso) e un identificatore univoco associato.", "Non soddisfatto",
    "R-087-F-1", "Obbligatorio", "È necessario che il client inserisca all'interno della richiesta la lista degli identificativi delle cartelle da eliminare.", "Non soddisfatto",
    "R-088-F-1", "Obbligatorio", "È necessario che il client specifichi all'interno della richiesta il comportamento desiderato da parte del server quando si cerca di eliminare una cartella che contiene ancora delle email.", "Non soddisfatto",
    "R-089-F-1", "Obbligatorio", "È necessario che il client riceva una risposta che contiene l'esito dell'operazione di eliminazione della cartella con relativi parametri (come lo stato corrente del server, la lista degli identificativi delle cartelle eliminate ed eventuali errori)", "Non soddisfatto",
    "R-090-F-1", "Obbligatorio", "L'utente che utilizza un client di posta elettronica per interagire con il server deve avere la possibilità di gestire i contenuti di una cartella.", "Non soddisfatto",
    "R-091-F-1", "Obbligatorio", "È necessario che il client inserisca all'interno della richiesta l'identificazione delle capacità necessarie alla gestione dei contenuti di una cartella.", "Non soddisfatto",
    "R-092-F-1", "Obbligatorio", "È necessario che il client inserisca all'interno della richiesta le chiamate di metodo necessarie alla gestione dei contenuti di una cartella, con relativi parametri (sia quelli comuni, come l'identificativo dell'account da utilizzare, sia quelli specifici del caso) e un identificatore univoco associato.", "Non soddisfatto",
    "R-093-F-1", "Obbligatorio", "È necessario che il client inserisca all'interno della richiesta le modifiche da apportare agli oggetti Email che l'utente desidera aggiungere ad una o più cartelle.", "Non soddisfatto",
    "R-094-F-1", "Obbligatorio", "È necessario che il client inserisca all'interno della richiesta le modifiche da apportare agli oggetti Email che l'utente desidera rimuovere da una o più cartelle.", "Non soddisfatto",
    "R-095-F-1", "Obbligatorio", "È necessario che il client inserisca all'interno della richiesta le modifiche da apportare agli oggetti Email che l'utente desidera spostare da una o più cartelle ad una o più cartelle.", "Non soddisfatto",
    "R-096-F-1", "Obbligatorio", "È necessario che il client riceva una risposta che contiene l'esito delle operazioni di gestione dei contenuti di una cartella con relativi parametri (come lo stato corrente del server, la lista delle email modificate ed eventuali errori)", "Non soddisfatto",
    "R-097-F-2", "Desiderabile", "L'utente che utilizza un client di posta elettronica per interagire con il server deve avere la possibilità di condividere le sue cartelle con altri utenti.", "Non soddisfatto",
    "R-098-F-2", "Desiderabile", "È necessario che il client inserisca all'interno della richiesta l'identificazione delle capacità necessarie alla creazione della condivisione di una cartella.", "Non soddisfatto",
    "R-099-F-2", "Desiderabile", "È necessario che il client inserisca all'interno della richiesta le chiamate di metodo necessarie alla creazione della condivisione di una cartella, con relativi parametri (sia quelli comuni, come l'identificativo dell'account da utilizzare, sia quelli specifici del caso) e un identificatore univoco associato.", "Non soddisfatto",
    "R-100-F-2", "Desiderabile", "È necessario che il client inserisca all'interno della richiesta le proprietà dell'oggetto Principal da creare (nome, tipo, descrizione, gli identificativi degli account a cui vogliamo condividere le cartelle e altri dettagli).", "Non soddisfatto",
    "R-101-F-2", "Desiderabile", "È necessario che il client inserisca all'interno della richiesta le modifiche da apportare all'oggetto Mailbox che l'utente desidera condividere, specificando quali diritti hanno su quest'ultimo i membri del principale a cui si sta condividendo.", "Non soddisfatto",
    "R-102-F-2", "Desiderabile", "È necessario che il client riceva una risposta che contiene l'esito delle operazioni di creazione della condivisione di una cartella con relativi parametri (come lo stato corrente dei dati sul server, la lista dei principali creati, la lista delle cartella modificate ed eventuali errori)", "Non soddisfatto",
    "R-103-F-2", "Desiderabile", "L'utente che utilizza un client di posta elettronica per interagire con il server deve avere la possibilità di modificare principali esistenti.", "Non soddisfatto",
    "R-104-F-2", "Desiderabile", "È necessario che il client inserisca all'interno della richiesta l'identificazione delle capacità necessarie alla modifica di un principale.", "Non soddisfatto",
    "R-105-F-2", "Desiderabile", "È necessario che il client inserisca all'interno della richiesta le chiamate di metodo necessarie alla modifica di un principale, con relativi parametri (sia quelli comuni, come l'identificativo dell'account da utilizzare, sia quelli specifici del caso) e un identificatore univoco associato.", "Non soddisfatto",
    "R-106-F-2", "Desiderabile", "È necessario che il client inserisca all'interno della richiesta le modifiche da apportare all'oggetto Principal che l'utente desidera modificare.", "Non soddisfatto",
    "R-107-F-2", "Desiderabile", "È necessario che il client riceva una risposta che contiene l'esito dell'operazione di modifica del principale con relativi parametri (come lo stato corrente del server, la lista dei principali modificati ed eventuali errori)", "Non soddisfatto",
    "R-108-F-2", "Desiderabile", "L'utente che utilizza un client di posta elettronica per interagire con il server deve avere la possibilità di eliminare principali esistenti.", "Non soddisfatto",
    "R-109-F-2", "Desiderabile", "È necessario che il client inserisca all'interno della richiesta l'identificazione delle capacità necessarie alla eliminazione di un principale.", "Non soddisfatto",
    "R-110-F-2", "Desiderabile", "È necessario che il client inserisca all'interno della richiesta le chiamate di metodo necessarie alla eliminazione di un principale, con relativi parametri (sia quelli comuni, come l'identificativo dell'account da utilizzare, sia quelli specifici del caso) e un identificatore univoco associato.", "Non soddisfatto",
    "R-111-F-2", "Desiderabile", "È necessario che il client inserisca all'interno della richiesta la lista degli identificativi dei principali da eliminare.", "Non soddisfatto",
    "R-112-F-2", "Desiderabile", "È necessario che il client riceva una risposta che contiene l'esito dell'operazione di eliminazione del principale con relativi parametri (come lo stato corrente del server, la lista degli identificativi dei principali eliminati ed eventuali errori)", "Non soddisfatto",
    "R-113-F-2", "Desiderabile", "L'utente che utilizza un client di posta elettronica per interagire con il server deve avere la possibilità di modificare la condivisione di una cartella (compresa l'eliminazione di quest'ultima).", "Non soddisfatto",
    "R-114-F-2", "Desiderabile", "È necessario che il client inserisca all'interno della richiesta l'identificazione delle capacità necessarie alla modifica della condivisione di una cartella (compresa l'eliminazione di quest'ultima).", "Non soddisfatto",
    "R-115-F-2", "Desiderabile", "È necessario che il client inserisca all'interno della richiesta le chiamate di metodo necessarie alla modifica della condivisione di una cartella (compresa l'eliminazione di quest'ultima), con relativi parametri (sia quelli comuni, come l'identificativo dell'account da utilizzare, sia quelli specifici del caso) e un identificatore univoco associato.", "Non soddisfatto",
    "R-116-F-2", "Desiderabile", "È necessario che il client inserisca all'interno della richiesta le modifiche da apportare all'oggetto Mailbox di cui l'utente desidera modificare/eliminare la condivisione, specificando i nuovi diritti che hanno su quest'ultimo i membri del principale a cui si sta condividendo.", "Non soddisfatto",
    "R-117-F-2", "Desiderabile", "È necessario che il client riceva una risposta che contiene l'esito dell'operazione di modifica della condivisione di una cartella (compresa l'eliminazione di quest'ultima) con relativi parametri (come lo stato corrente del server, la lista degli identificativi delle cartelle modificate ed eventuali errori)", "Non soddisfatto",
    "R-118-F-3", "Opzionale", "Un client di posta elettronica utilizzato da un utente per interagire con il server deve avere la possibilità di mantenersi sincronizzato con gli ultimi aggiornamenti per quanto riguarda le email.", "Non soddisfatto",
    "R-119-F-3", "Opzionale", "È necessario che il client inserisca all'interno della richiesta l'identificazione delle capacità necessarie alla sincronizzazione delle email.", "Non soddisfatto",
    "R-120-F-3", "Opzionale", "È necessario che il client inserisca all'interno della richiesta le chiamate di metodo necessarie alla sincronizzazione delle email, con relativi parametri (sia quelli comuni, come l'identificativo dell'account da utilizzare, sia quelli specifici del caso) e un identificatore univoco associato.", "Non soddisfatto",
    "R-121-F-3", "Opzionale", "È necessario che il client inserisca all'interno della richiesta il suo stato corrente per quanto riguarda le email, con lo scopo di sincronizzarsi.", "Non soddisfatto",
    "R-122-F-3", "Opzionale", "È necessario che il client inserisca all'interno della richiesta il numero massimo di identificatori di email che desidera ricevere come risposta, con lo scopo di sincronizzarsi.", "Non soddisfatto",
    "R-123-F-3", "Opzionale", "È necessario che il client riceva una risposta che contiene le informazioni di cui ha bisogno per sincronizzarsi (come lo stato corrente del server, un flag booleano che indica se ci sono ulteriori cambiamenti nel server relativi ai dati di tipo Email, oltre a quelli già restituiti nella risposta corrente, e la lista delle email da creare/modificare/eliminare per sincronizzarsi)", "Non soddisfatto",
    "R-124-F-3", "Opzionale", "Un client di posta elettronica utilizzato da un utente per interagire con il server deve avere la possibilità di mantenersi sincronizzato con gli ultimi aggiornamenti per quanto riguarda le cartelle.", "Non soddisfatto",
    "R-125-F-3", "Opzionale", "È necessario che il client inserisca all'interno della richiesta l'identificazione delle capacità necessarie alla sincronizzazione delle cartelle.", "Non soddisfatto",
    "R-126-F-3", "Opzionale", "È necessario che il client inserisca all'interno della richiesta le chiamate di metodo necessarie alla sincronizzazione delle cartelle, con relativi parametri (sia quelli comuni, come l'identificativo dell'account da utilizzare, sia quelli specifici del caso) e un identificatore univoco associato.", "Non soddisfatto",
    "R-127-F-3", "Opzionale", "È necessario che il client inserisca all'interno della richiesta il suo stato corrente per quanto riguarda le cartelle, con lo scopo di sincronizzarsi.", "Non soddisfatto",
    "R-128-F-3", "Opzionale", "È necessario che il client inserisca all'interno della richiesta il numero massimo di identificatori di cartelle che desidera ricevere come risposta, con lo scopo di sincronizzarsi.", "Non soddisfatto",
    "R-129-F-3", "Opzionale", "È necessario che il client riceva una risposta che contiene le informazioni di cui ha bisogno per sincronizzarsi (come lo stato corrente del server, un flag booleano che indica se ci sono ulteriori cambiamenti nel server relativi ai dati di tipo Mailbox, oltre a quelli già restituiti nella risposta corrente, e la lista delle cartelle da creare/modificare/eliminare per sincronizzarsi)", "Non soddisfatto"
  )
)
,caption: [Stato dei requisiti funzionali])

== Grafici riassuntivi
#resumeRequisiti(0,0,0,0)