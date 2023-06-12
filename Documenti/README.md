# Progetto per il corso "Introduzione alla programmazione Web"

## Istruzioni per l’avvio del progetto

Per avviare correttamente il progetto:
- avviare il server per il database Derby in locale. Nel caso in cui la variabile d’ambiente ```DERBY_HOME``` sia impostata, eseguire da terminale uno dei seguenti comandi:
```sh
java -jar %DERBY_HOME%/lib/derbyrun.jar server start    # (Windows)
java -jar $DERBY_HOME/lib/derbyrun.jar server start     # (Linux, Mac)
```
- in alternativa, è possibile recarsi nella propria cartella dove è presente Derby, entrare nella sottocartella lib ed eseguire da terminale il seguente comando:
```
java -jar derbyrun.jar server start
```
- se è la prima volta che viene aperto il progetto, allora sarà necessario creare manualmente il database. Per farlo, basterà utilizzare da terminale uno dei comandi precedenti con ```ij``` al posto di ```“server start```. Dopodichè, utilizzare il seguente comando dallo stesso terminale con il quale si è eseguito il precedente:
```
CONNECT 'jdbc:derby://localhost:1527/Tum4WorldDB;create=true';
```
- aprire la cartella ```Sorgente/``` con IntelliJ IDEA
- avviare il progetto con la configurazione presente (Tomcat locale) ed inserendo un SDK

Il progetto include le configurazioni per l’avvio e per il collegamento al database. Non è necessario creare manualmente le tabelle e popolarle, la servlet InitServer.java si occupa dell’inizializzazione.