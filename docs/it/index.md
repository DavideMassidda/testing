# Funzioni di supporto per lo sviluppo di test psicometrici

_testing_ è un pacchetto per il software statistico R, che fornisce funzioni per lo sviluppo di test psicometrici. Può essere installato connettendosi direttamente a questo repository sfruttando il pacchetto devtools, che deve essere preventivamente installato.

``` r
install.packages("devtools")
```

Aperto R, per instllare il pacchetto testing è sufficiente lanciare il comando:

```r
devtools::install_github("DavideMassidda/testing")
```

## Introduzione

_testing_ è una collezione di funzioni R per la messa a punto di strumenti psicometrici. _testing_ non è sostitutivo di altri più celebri pacchetti, come [_psych_](https://cran.r-project.org/web/packages/psych/index.html) (dal quale dipende), ma va considerato come una loro integrazione.

Il pacchetto nasce dall’esigenza personale dell’autore di raccogliere in un unico repository le funzioni R di uso più comune nella sua pratica quotidiana. Le funzioni che il pacchetto mette a disposizione risultano quindi piuttosto eterogenee, ma sono tutte accomunate dal fatto che possono tornare utili in una qualche fase del processo di costruzione di uno strumento psicometrico.

Alcune delle funzioni incluse nel pacchetto sono presenti sotto altre forme anche da altre parti, se non addirittura già nella versione base di R. In questi casi, _testing_ offre un formato dell’output differente e ottimizzato per l’applicazione nelle analisi di dati psicometrici. Talvolta, le funzioni sono implementate seguendo delle peculiarità algoritmiche che le rendono solo in apparenza uguali ad altre. In altri casi, semplicemente, l'autore trovava comodo avere a disposizione all'interno di un unico pacchetto tutto ciò di cui necessitava nella sua attività lavorativa.

Nato da una disordinata raccolta di comandi sparsi all’interno di una moltitudine di script, nel corso del tempo il pacchetto è stato rifinito, compiendo un grosso sforzo per ottimizzare le funzioni e uniformarne lo stile. Sotto questo punto di vista, il pacchetto deve ancora maturare e in futuro sarà probabilmente sottoposto a ulteriori revisioni, ma meno pesanti rispetto al passato.

Per qualsiasi genere di richiesta o segnalazione, puoi aprire un _issue_ nell’apposita sezione oppure puoi scrivere personalmente all’autore, che puoi contattare anche qualora volessi entrare a far parte del progetto come sviluppatore o per rimanere aggiornato sull'evoluzione pacchetto (e-mail: _davide.massidda_ [at] _gmail.com_).

## Tutorial disponibili

+ [Tabulazione di punteggi](norms.md)
+ [Gestione delle età](ages.md)