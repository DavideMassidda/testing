[Torna all'indice](index.md)

Gestione delle età per analisi di test psicometrici
================

Nel a mettere a punto un test psicometrico per l'età evolutiva spesso si incontrano numerose difficoltà nella gestione delle variabili che codificano per l'età dei bambini. Talvolta tali variabili arrivano rappresentate secondo standard differenti rispetto a quanto richiesto, oppure l'analisi dei dati può necessitare di operazioni di ricodifica verso formati complessi da ottenere.

Il pacchetto [testing](https://github.com/DavideMassidda/testing) contiene alcune funzioni che possono tornare utili in questi casi, pensate per essere flessibili e adattabili a esigenze diverse. Nel presente tutorial vengono mostrati gli usi principali di queste funzioni.

``` r
library(testing)
```

Calcolo dell'età compiuta
=========================

Il modo più semplice per registrare l'età di un gruppo di soggetti è... non registrarla. Ci sono infatti diversi pacchetti R che consentono di calcolare l'età in un preciso istante conoscendo semplicemente la data del giorno della valutazione e la data di nascita dell'individuo. È dunque possibile calcolare l'età di un soggetto a cui è stato somministrato un test conoscendo semplicemente la data di nascita e la data di valutazione. Il calcolo automatizzato dell'età consente di limitare l'influenza dell'errore che può essere commesso attraverso il calcolo manuale, ma presuppone una registrazione rigorosa delle date.

Il dataset *testdates* contiene la data di nascita (*born*) e la data di somministrazione (*test*) di un test, per un ipotetico gruppo di bambini.

``` r
load("testdates.rda")
```

``` r
show(testdates)
```

    ##          born       test
    ## 1  2008-02-17 2012-05-02
    ## 2  2010-08-06 2011-09-17
    ## 3  2008-02-21 2013-03-09
    ## 4  2008-06-25 2012-01-07
    ## 5  2008-04-16 2013-02-11
    ## 6  2009-04-16 2013-02-11
    ## 7  2008-04-28 2012-02-29
    ## 8  2007-03-21 2010-03-12
    ## 9  2007-03-21 2016-03-22
    ## 10 2009-12-07 2010-01-05
    ## 11 2007-05-21 2012-06-03
    ## 12 2007-01-15 2012-02-04
    ## 13 2007-01-15 2012-03-08
    ## 14 2007-02-04 2012-01-15
    ## 15 2007-02-04 2013-01-15

``` r
str(testdates)
```

    ## 'data.frame':    15 obs. of  2 variables:
    ##  $ born: chr  "2008-02-17" "2010-08-06" "2008-02-21" "2008-06-25" ...
    ##  $ test: chr  "2012-05-02" "2011-09-17" "2013-03-09" "2012-01-07" ...

Visualizzando la struttura del dataset possiamo notare come entrambe le date non siano di tipo *Date*, ma *character*. Il pacchetto *testing*, infatti, non necessita di variabili esplicitate come data; tuttavia, è necessario che le stringhe riportino delle date espresse nel formato **YYYY-MM-DD**.

Prima di partire con il calcolo dell'età, ci sono alcune importanti decisioni da prendere.

units
-----

La prima scelta che dobbiamo fare riguarda l'unità di misura da adottare per esprimere l'età. *testing* fornisce due alternative: **anni** compiuti oppure **mesi** compiuti. I giorni non sono disponibili semplicemente perché si tratta di un caso banale per il quale è sufficiente calcolare lo scarto fra la data del test e quella di nascita, ovvero:

``` r
with(testdates, as.Date(test) - as.Date(born) )
```

    ## Time differences in days
    ##  [1] 1536  407 1843 1291 1762 1397 1402 1087 3289   29 1840 1846 1879 1806
    ## [15] 2172

depth
-----

La seconda scelta riguarda la profondità del formato in cui l'età deve essere espressa. Per esempio, potremmo non accontentarci di esprimere l'età in anni compiuti, ma vorremmo anche tenere traccia dei mesi compiuti, se non dei giorni, così da poter ordinare per età soggetti nati nello stesso anno o nello stesso mese.

Il primo soggetto inserito nella tabella *testdates*, nato il 17 febbraio del 2008 e valutato il 2 maggio del 2012, ha 4 anni, ma potremmo anche specificare meglio e dire che ha 4 anni e 2 mesi, come potremmo spingerci ancora più in profondità e dire che ha 4 anni, 2 mesi e 15 giorni compiuti.

output
------

L'ultima scelta da prendere riguarda il formato in cui esprimere l'età.

Potremmo utilizzare un formato **testuale** analogo a quello usato poco sopra, esprimendo l'età del primo soggetto come "4:2:15", separando gli anni, i mesi e i giorni utilizzando un carattere convenzionale. In *testing* questo carattere convenzionale è il simbolo *due punti*, congruentemente con quanto accade sui manuali di molti test psicometrici (meglio evitare il punto o la virgola, che rischierebbero facilmente di essere confusi con un separatore decimale).

In alternativa, potremmo scegliere di esprimere l'età attraverso un formato **numerico**: un numero positivo la cui parte intera specifica la porzione di unità completate e la parte decimale la porzione completata dell'unità successiva. Per esempio, l'età di un bambino che ha appena compito 3 anni e 6 mesi può essere espressa come 3.5 anni, perché, oltre a tre anni, il bambino ha anche compito metà del successivo anno di vita (quindi: 3 anni + 0.5 anni).

Considerando che 3 anni corrispondono a 36 mesi, l'età di questo bambino potrebbe essere espressa anche come 42.0, ovvero i 36 mesi che corrispondono a 6 anni più i successivi 6 mesi.

age.completed
-------------

La funzione che calcola l'età a partire dalle date di nascita e di valutazione è `age.completed`. La funzione richiede che siano specificati gli argomenti `units`, `depth` e `output`, secondo le scelte prese seguendo quanto descritto sopra. Nel calcolo vengono considerati anche gli anni bisestili, aggiustando opportunamente il risultato. Di seguito sono descritti nel dettaglio gli argomenti.

-   `born`, `test`: data di nascita e di valutazione di ogni soggetto.
-   `units`: unità di misura dell'età, che può essere "days", oppure "months".
-   `depth`: profondità del calcolo, che può essere "days", "months" oppure "years".
-   `use.leap`: valore logico che specifica se correggere per gli anni bisestili.
-   `output`: tipo di risultato da produrre, che può essere "numeric" oppure "character".

A eccezione di `born` e `test`, tutte le opzioni dispongono di valori predefiniti. Si rimanda all'help della funzione per ulteriori informazioni.

esempi
------

Età in formato numerico in cui la parte intera rappresenta il numero di anni compiuti e la parte decimale la porzione di anno successivo trascorsa dall'ultimo compleanno, espressa in giorni.

``` r
age.completed(testdates$born, testdates$test,
    units = "years", depth = "days", output = "n"
)
```

    ##  [1] 4.20491803 1.11475410 5.04383562 3.53551913 4.82465753 3.82465753
    ##  [7] 3.83879781 2.97534247 9.00273973 0.07945205 5.03561644 5.05464481
    ## [13] 5.14480874 4.94520548 5.94535519

Età in formato numerico in cui la parte intera rappresenta il numero di anni compiuti e la parte decimale la porzione di anno successivo trascorsa dall'ultimo compleanno, espressa in mesi.

``` r
age.completed(testdates$born, testdates$test,
    units = "years", depth = "months", output = "n"
)
```

    ##  [1] 4.166667 1.083333 5.000000 3.500000 4.750000 3.750000 3.833333
    ##  [8] 2.916667 9.000000 0.000000 5.000000 5.000000 5.083333 4.916667
    ## [15] 5.916667

Età in formato numerico in cui la parte intera rappresenta il numero di mesi compiuti e la parte decimale la porzione di mese successivo dall'ultimo mese compiuto, espressa in giorni.

``` r
age.completed(testdates$born, testdates$test,
    units = "month", depth = "days", output = "n"
)
```

    ##  [1]  50.5000000  13.3666667  60.5714286  42.4193548  57.8387097
    ##  [6]  45.8387097  46.0344828  35.6785714 108.0322581   0.9354839
    ## [11]  60.4193548  60.6451613  61.7586207  59.3548387  71.3548387

Numero di anni, mesi e giorni compiuti.

``` r
age.completed(testdates$born, testdates$test,
    units = "years", depth = "days", output = "c"
)
```

    ##  [1] "4:2:15"  "1:1:11"  "5:0:16"  "3:6:13"  "4:9:26"  "3:9:26"  "3:10:1" 
    ##  [8] "2:11:19" "9:0:1"   "0:0:29"  "5:0:13"  "5:0:20"  "5:1:22"  "4:11:11"
    ## [15] "5:11:11"

Numero di anni e di mesi compiuti.

``` r
age.completed(testdates$born, testdates$test,
    units = "years", depth = "months", output = "c"
)
```

    ##  [1] "4:2"  "1:1"  "5:0"  "3:6"  "4:9"  "3:9"  "3:10" "2:11" "9:0"  "0:0" 
    ## [11] "5:0"  "5:0"  "5:1"  "4:11" "5:11"

Numero di mesi e di giorni compiuti.

``` r
age.completed(testdates$born, testdates$test,
    units = "month", depth = "days", output = "c"
)
```

    ##  [1] "50:15" "13:11" "60:16" "42:13" "57:26" "45:26" "46:1"  "35:19"
    ##  [9] "108:1" "0:29"  "60:13" "60:20" "61:22" "59:11" "71:11"

Conversione dell'età
====================

Non sempre le date di nascita e di somministrazione del test sono disponibili. Talvolta l'età arriva già calcolata in formata numerico, mentre altre volte arriva codificata in un formato testuale. Per far fronte a queste evenienze, il pacchetto *testing* dispone di due funzioni che consentono di passare da un formato all'altro, approssimando l'età. Si tratta, in ogni caso, di un'approssimazione: il risultato, per quanto si avvicini all'età corretta, talvolta potrebbe non risultare precisissimo, a causa della perdita di informazione che si ha passando da un formato all'altro.

Prima di partire con gli esempi, aggiungiamo al dataset due variabili età, una in formato numerico e una in formato carattere.

``` r
testdates$ageNum <- with(testdates,
    age.completed(born, test, units = "years", depth = "days", output = "n")
)
testdates$ageChr <- with(testdates,
    age.completed(born, test, units = "years", depth = "months", output = "c")
)
```

``` r
show(testdates)
```

    ##          born       test     ageNum ageChr
    ## 1  2008-02-17 2012-05-02 4.20491803    4:2
    ## 2  2010-08-06 2011-09-17 1.11475410    1:1
    ## 3  2008-02-21 2013-03-09 5.04383562    5:0
    ## 4  2008-06-25 2012-01-07 3.53551913    3:6
    ## 5  2008-04-16 2013-02-11 4.82465753    4:9
    ## 6  2009-04-16 2013-02-11 3.82465753    3:9
    ## 7  2008-04-28 2012-02-29 3.83879781   3:10
    ## 8  2007-03-21 2010-03-12 2.97534247   2:11
    ## 9  2007-03-21 2016-03-22 9.00273973    9:0
    ## 10 2009-12-07 2010-01-05 0.07945205    0:0
    ## 11 2007-05-21 2012-06-03 5.03561644    5:0
    ## 12 2007-01-15 2012-02-04 5.05464481    5:0
    ## 13 2007-01-15 2012-03-08 5.14480874    5:1
    ## 14 2007-02-04 2012-01-15 4.94520548   4:11
    ## 15 2007-02-04 2013-01-15 5.94535519   5:11

da carattere a numerico
-----------------------

La funzione `age.numeric` consente di convertire in formato numerico un'età espressa in formato carattere, assumendo il simbolo *due punti* come separatore fra i livelli di profondità.

La funzione necessita dei seguenti argomenti:

-   `origin.units`: vettore che specifica l'unità di misura di ogni livello di profondità dell'età di origine.
-   `units`, `depth`: unità di misura e di profondità del vettore da restituire in output.
-   `use.leap`: valore logico che specifica se correggere per gli anni bisestili.

Per esempio, la colonna ageChr del dataset testdates contiene delle età espresse come anni:mesi. Partendo da questo vettore, vogliamo calcolare l'età dei soggetti in anni compiuti, raggiungendo i giorni come livello di profondità:

``` r
age.numeric(testdates$ageChr,
    origin.units = c("years","months"), units = "years", depth = "days"
)
```

    ##  [1] 4.166667 1.083333 5.000000 3.500000 4.750000 3.750000 3.833333
    ##  [8] 2.916667 9.000000 0.000000 5.000000 5.000000 5.083333 4.916667
    ## [15] 5.916667

Si noti che, dal momento che il vettore di partenza non conteneva l'informazione sui giorni compiuti, la sua conversione in numero non poteva essere fatta raggiungendo i giorni come livello di profondità, per cui si era obbligati a fermarsi ai mesi.

da numerico a carattere
-----------------------

Volendo effettuare l'operazione inversa, ovvero convertire delle età da formato numerico a formato carattere, possiamo utilizzare la funzione `age.character`. Gli argomenti di cui la funzione necessita per lavorare sono gli stessi descritti per la funzione `age.numeric`, ma se ne aggiunge uno:

-   `origin.depth`: livello di profondità del vettore di età di origine.

Il valore `origin.depth` interviene soprattutto nei casi in cui l'età è stata codificata saltando un livello di profondità, quindi in cui la parte intera rappresenta il numero di anni compiuti e la parte decimale rappresenta i giorni compiuti (come nella nostra variabile ageNum).

``` r
age.character(testdates$ageNum,
    origin.units = "years", origin.depth = "days",
    units = "years", depth = "months"
)
```

    ##  [1] "4:2"  "1:1"  "5:0"  "3:6"  "4:9"  "3:9"  "3:10" "2:11" "9:0"  "0:0" 
    ## [11] "5:0"  "5:0"  "5:1"  "4:11" "5:11"

Raggruppamento per età
======================

Un'esigenza molto comune che si presenta quando si ha a che fare con l'analisi di test psicometrici è il raggruppamento dei soggetti in fasce d'età. Il pacchetto *testing* fornisce per questo scopo la funzione `age.segment`.

La funzione suddivide un vettore d'età in intervalli chiusi a sinistra e aperti a destra. Ciò significa che la fascia d'età "3 anni - 4 anni" includerà tutti i soggetti la cui età è maggiore o uguale a 3 e inferiore a 4 (tutti i soggetti che hanno compiuto 4 anni, quindi, saranno esclusi).

Il risultato è un nuovo vettore che indica, per ogni soggetto, in quale gruppo si trova.

age.segment
-----------

La funzione richiede quattro argomenti:

-   `x`: vettore di età espresse in formato carattere, in cui il simbolo *due punti* è usato come separatore fra i livelli di profondità.
-   `breaks`: vettore che specifica, per ogni fascia d'età desiderata, il limite inferiore, tranne per l'ultimo valore, che speficica il limite superiore. Gli intervalli sono chiusi a sinistra e aperti a destra.
-   `labels`: etichette da attribuire a ogni fascia d'età.
-   `factor`: specifica se restituire o meno un vettore di tipo fattore, in cui i livelli sono ordinati in senso crescente per età (default: TRUE).

esempio
-------

Dividiamo i soggetti in cinque fasce d'età:

``` r
testdates$group <- age.segment(testdates$ageChr,
    breaks = c("0:0",      "2:0",      "3:0",      "4:0",    "6:0"),
    labels = c("0:0-1:11", "2:0-3:11", "3:0-4:11", "4:0-5:11"     )
)
```

``` r
show(testdates)
```

    ##          born       test     ageNum ageChr    group
    ## 1  2008-02-17 2012-05-02 4.20491803    4:2 4:0-5:11
    ## 2  2010-08-06 2011-09-17 1.11475410    1:1 0:0-1:11
    ## 3  2008-02-21 2013-03-09 5.04383562    5:0 4:0-5:11
    ## 4  2008-06-25 2012-01-07 3.53551913    3:6 3:0-4:11
    ## 5  2008-04-16 2013-02-11 4.82465753    4:9 4:0-5:11
    ## 6  2009-04-16 2013-02-11 3.82465753    3:9 3:0-4:11
    ## 7  2008-04-28 2012-02-29 3.83879781   3:10 3:0-4:11
    ## 8  2007-03-21 2010-03-12 2.97534247   2:11 2:0-3:11
    ## 9  2007-03-21 2016-03-22 9.00273973    9:0     <NA>
    ## 10 2009-12-07 2010-01-05 0.07945205    0:0 0:0-1:11
    ## 11 2007-05-21 2012-06-03 5.03561644    5:0 4:0-5:11
    ## 12 2007-01-15 2012-02-04 5.05464481    5:0 4:0-5:11
    ## 13 2007-01-15 2012-03-08 5.14480874    5:1 4:0-5:11
    ## 14 2007-02-04 2012-01-15 4.94520548   4:11 4:0-5:11
    ## 15 2007-02-04 2013-01-15 5.94535519   5:11 4:0-5:11

``` r
table(testdates$group, useNA = "always")
```

    ## 
    ## 0:0-1:11 2:0-3:11 3:0-4:11 4:0-5:11     <NA> 
    ##        2        1        3        8        1

Per operazioni di raggruppamento più sofisticate e che richiedono di operare più in profondità con gli intervalli, si rimanda alle funzioni `cut` e `findInterval` del pacchetto `base`.
