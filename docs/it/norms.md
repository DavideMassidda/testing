[Torna all'indice](index.md)

Tabulazione di punteggi normativi
=================================

Un test deputato alla misura di un costrutto psicologico produce, di base, un punteggio che viene comunemente definito "grezzo". Tale punteggio quantifica su una certa scala di misura il costrutto e la sua metrica può dipendere da molti fattori, quali la variabilità del fenomeno che cerca di catturare, la tipologia e il numero di prove che lo compongono, le convenzioni adottate nella letteratura di riferimento, scelte contestuali alla natura del test.

Inoltre, il test, se dotato di una "taratura", contiene una serie di riferimenti che permettono di convertire il punteggio grezzo in uno standardizzato. A differenza del punteggio grezzo, quello standardizzato consente di localizzare la prestazione di un soggetto rispetto alla prestazione di una popolazione di riferimento. Tale punteggio è quindi generalmente adottato per verificare come il soggetto si colloca rispetto a uno standard. In particolare, nel caso di fenomeni che si assumono essere distribuiti normalmente, il punteggio standardizzato consente di localizzare il soggetto rispetto alla media della popolazione di riferimento.

Il più importante punteggio standardizzato è forse il celebre **punto** ***z***. Moltissime altre tipologie di punteggi, infatti, non sono altro che una riscalatura dei punti *z*, adottata per espanderne la scala e facendo in modo che i valori appartengano all'insieme dei numeri naturali (ovvero numeri interi positivi). Questo stratagemma consente di escludere la possibilità che un punteggio risulti negativo o contenga una parte decimale, favorendo l'interpretazione clinica del valore. La precisa scalatura del punteggio dipende poi da esigenze specifiche, esattamente come per il punteggio grezzo.

La taratura di un test consiste, nella pratica, in una o più **tabelle normative** che contengono la corrispondenza fra punteggi grezzi e standardizzati, grazie alle quali sono possibili le operazioni di conversione. Una parte importante del processo di messa a punto di un test psicometrico riguarda proprio la costruzione di queste tabelle.

Il pacchetto *testing* mette a disposizione diverse funzioni utili per la costruzione delle tabelle normative di un test.

``` r
library(testing)
```

Tabelle normative
-----------------

Consideriamo un ipotetico test dedicato alla misura di un'abilità cognitiva in età scolare (6-10 anni), che può produrre un punteggio grezzo compreso fra 0 e 30. Supponiamo che il costrutto sottoposto a esame si sviluppi con il progredire dell'età.

Vorremmo costruire dei riferimenti normativi per questo test. Dato che il costrutto varia in funzione dell'età, sarebbe opportuno che questi riferimenti normativi siano differenti per ogni anno d'età compiuto.

Immaginiamo di avere a disposizione un campione di osservazioni e di aver calcolato la media e la deviazione standard dei punteggi grezzi per ogni fascia d'età, salvando queste informazioni rispettivamente nei due vettori `m` e `s`.

``` r
m <- c("6" = 7.66, "7" = 12.07, "8" = 16.96, "9" = 20.53, "10" = 22.49)
s <- c("6" = 4.28, "7" =  4.54, "8" =  4.13, "9" =  4.28, "10" =  3.71)
```

Potremmo costruire una tabella normativa che consenta di convertire ogni punteggio grezzo ottenibile al test nel corrispettivo punteggio standardizzato.

### Da grezzo a standardizzato

Decidiamo di utilizzare come punteggio standardizzato il punto *z*, riscalato in modo tale che la media corrisponda a 10 (invece che a 0) e la deviazione standard a 3 (invece che a 1), quindi nel seguente modo:

*q* = 10 + 3 (*x*-*μ*) / *σ* \[1\]

dove *x* è il punteggio grezzo osservato, mentre *μ* e *σ* sono rispettivamente la media e la deviazione standard dei punteggi osservati per i bambini del campione inclusi nella specifica fascia d'età di cui si vogliono costruire le norme. I valori 10 e 3 saranno rispettivamente la nuova media e la nuova deviazione standard dei punteggi.

Questo tipo di scalatura dei punti *z*, utilizzato nei [test Wechsler](https://en.wikipedia.org/wiki/Wechsler_Scales) con il nome di "scaled scores", è diventato piuttosto celebre nella pratica psicometrica.

La funzione `stdscore` del pacchetto testing applica la formula \[1\] per convertire una sequenza di punteggi grezzi nel punteggio standardizzato di riferimento. Per effettuare questa operazione è necessario fornire alla funzione:

-   `m` e `s`: media e deviazione standard di riferimento.

-   `scale`: tipo di scalatura da applicare. Sono disponibili diverse opzioni; nel nostro esempio useremo la scalatura chiamata *scaled*, che indica i *Wechsler Scaled Scores* (si rimanda all'help della funzione per ulteriori dettagli).

``` r
tab <- stdscore(30:0, m=m, s=s, scale="scaled")
```

``` r
show(tab)
```

    ##            6         7          8          9          10
    ## 30 25.658879 21.848018 19.4721550 16.6378505 16.07277628
    ## 29 24.957944 21.187225 18.7457627 15.9369159 15.26415094
    ## 28 24.257009 20.526432 18.0193705 15.2359813 14.45552561
    ## 27 23.556075 19.865639 17.2929782 14.5350467 13.64690027
    ## 26 22.855140 19.204846 16.5665860 13.8341121 12.83827493
    ## 25 22.154206 18.544053 15.8401937 13.1331776 12.02964960
    ## 24 21.453271 17.883260 15.1138015 12.4322430 11.22102426
    ## 23 20.752336 17.222467 14.3874092 11.7313084 10.41239892
    ## 22 20.051402 16.561674 13.6610169 11.0303738  9.60377358
    ## 21 19.350467 15.900881 12.9346247 10.3294393  8.79514825
    ## 20 18.649533 15.240088 12.2082324  9.6285047  7.98652291
    ## 19 17.948598 14.579295 11.4818402  8.9275701  7.17789757
    ## 18 17.247664 13.918502 10.7554479  8.2266355  6.36927224
    ## 17 16.546729 13.257709 10.0290557  7.5257009  5.56064690
    ## 16 15.845794 12.596916  9.3026634  6.8247664  4.75202156
    ## 15 15.144860 11.936123  8.5762712  6.1238318  3.94339623
    ## 14 14.443925 11.275330  7.8498789  5.4228972  3.13477089
    ## 13 13.742991 10.614537  7.1234867  4.7219626  2.32614555
    ## 12 13.042056  9.953744  6.3970944  4.0210280  1.51752022
    ## 11 12.341121  9.292952  5.6707022  3.3200935  0.70889488
    ## 10 11.640187  8.632159  4.9443099  2.6191589 -0.09973046
    ## 9  10.939252  7.971366  4.2179177  1.9182243 -0.90835580
    ## 8  10.238318  7.310573  3.4915254  1.2172897 -1.71698113
    ## 7   9.537383  6.649780  2.7651332  0.5163551 -2.52560647
    ## 6   8.836449  5.988987  2.0387409 -0.1845794 -3.33423181
    ## 5   8.135514  5.328194  1.3123487 -0.8855140 -4.14285714
    ## 4   7.434579  4.667401  0.5859564 -1.5864486 -4.95148248
    ## 3   6.733645  4.006608 -0.1404358 -2.2873832 -5.76010782
    ## 2   6.032710  3.345815 -0.8668281 -2.9883178 -6.56873315
    ## 1   5.331776  2.685022 -1.5932203 -3.6892523 -7.37735849
    ## 0   4.630841  2.024229 -2.3196126 -4.3901869 -8.18598383

La tabella riporta il punteggio standardizzato corrispondente a ogni punteggio grezzo ottenibile (righe), per ogni fascia d'età (colonne).

La tabella, tuttavia, presenta qualche problema. In primo luogo, generalmente l'interpretazione clinica dei punteggi standardizzati viene effettuata arrotondando i valori all'intero più vicino. Tale problema potrebbe essere facilmente superato impostando a TRUE l'argomento `integer`, nel seguente modo:

``` r
tab <- stdscore(30:0, m=m, s=s, scale="scaled", integer=TRUE)
```

Tuttavia, questo non sarebbe sufficiente. Dato che punti *z* inferiori a -3 e superiori a 3 sono molto rari da osservare, generalmente le norme per valori che eccedono questi limiti vengono omesse. Da ciò deriva che sarebbe superfluo presentare i criteri di conversione da grezzo a standardizzato nel caso di scaled score inferiori a 1 (risultato di −3 \* 3 + 10) e superiori a 19 (risultato di 3\*3+10).

Inoltre, come si può osservare in tabella, per una stessa età, a uno stesso punteggio standardizzato possono corrispondere punteggi grezzi diversi: quest'ambiguità andrebbe evitata.

Generalmente, quindi, si preferisce procedere in senso opposto, calcolando il punteggio grezzo corrispondente a ogni standardizzato.

### Da standardizzato a grezzo

A partire dalla \[1\] possiamo facilmente ottenere la formula inversa che consente di calcolare il punteggio grezzo atteso per ogni punteggio standardizzato di interesse:

*x* = *μ* + *σ* (*q* - 10) / 3 \[2\]

Questa formula è implementata nella funzione `rawscore`, che può essere usata per costruire la tabella normativa desiderata.

``` r
tab <- rawscore(19:1, m=m, s=s, scale="scaled")
```

``` r
show(tab)
```

    ##             6           7         8         9       10
    ## 19 20.5000000 25.69000000 29.350000 33.370000 33.62000
    ## 18 19.0733333 24.17666667 27.973333 31.943333 32.38333
    ## 17 17.6466667 22.66333333 26.596667 30.516667 31.14667
    ## 16 16.2200000 21.15000000 25.220000 29.090000 29.91000
    ## 15 14.7933333 19.63666667 23.843333 27.663333 28.67333
    ## 14 13.3666667 18.12333333 22.466667 26.236667 27.43667
    ## 13 11.9400000 16.61000000 21.090000 24.810000 26.20000
    ## 12 10.5133333 15.09666667 19.713333 23.383333 24.96333
    ## 11  9.0866667 13.58333333 18.336667 21.956667 23.72667
    ## 10  7.6600000 12.07000000 16.960000 20.530000 22.49000
    ## 9   6.2333333 10.55666667 15.583333 19.103333 21.25333
    ## 8   4.8066667  9.04333333 14.206667 17.676667 20.01667
    ## 7   3.3800000  7.53000000 12.830000 16.250000 18.78000
    ## 6   1.9533333  6.01666667 11.453333 14.823333 17.54333
    ## 5   0.5266667  4.50333333 10.076667 13.396667 16.30667
    ## 4  -0.9000000  2.99000000  8.700000 11.970000 15.07000
    ## 3  -2.3266667  1.47666667  7.323333 10.543333 13.83333
    ## 2  -3.7533333 -0.03666667  5.946667  9.116667 12.59667
    ## 1  -5.1800000 -1.55000000  4.570000  7.690000 11.36000

In tabella sono dunque riportati i punteggi grezzi corrispondenti a ogni possibile punteggio standardizzato. Si noti che al punteggio standardizzato 10 corrisponde esattamente il punteggio grezzo medio contenuto nel vettore `m`:

``` r
tab["10",]
```

    ##       6     7     8     9    10
    ## 10 7.66 12.07 16.96 20.53 22.49

Questa tabella presenta dei problemi simili a quelli visti per la tabella precedente. Oltre alla presenza di valori decimali, impossibili da osservare (il test produce solo valori grezzi interi), la gamma di valori tabulati eccede la gamma di valori che possono effettivamente essere osservati (0-30).

A entrambi i problemi possiamo far fronte applicando a ogni vettore colonna la funzione `rollup`, che consente di racchiudere i punteggi in intervalli.

Intervalli di punteggi
----------------------

Partendo dall'assunto che i punteggi grezzi prodotti da un test possono appartenere esclusivamente all'insieme dei numeri naturali, la funzione `rollup` associa univocamente ogni punteggio standardizzato a un intervallo di punteggi grezzi. La funzione individua entro quali valori grezzi interi sono racchiusi i punteggi tabulati, "arrotolandoli" entro classi di punteggio. La classificazione può essere effettuata arrotolando in senso ascendente (*forward direction*), ovvero partendo dal basso, oppure discendente (*backward direction*), ovvero partendo dall'alto.

Costruiamo una nuova tabella contenente, per l'età di 6 anni, i punteggi originali e i punteggi classificati, sia in senso ascendente che discendente:

``` r
data.frame(
    row.names = 19:1,
    estimated = tab[,"6"],
      forward = rollup(tab[,"6"], x.min=0, x.max=30, direction="forward"),
     backward = rollup(tab[,"6"], x.min=0, x.max=30, direction="backward")
)
```

    ##     estimated forward backward
    ## 19 20.5000000   20-30    20-30
    ## 18 19.0733333      19    18-19
    ## 17 17.6466667   17-18       17
    ## 16 16.2200000      16    15-16
    ## 15 14.7933333   14-15       14
    ## 14 13.3666667      13    12-13
    ## 13 11.9400000   11-12       11
    ## 12 10.5133333      10       10
    ## 11  9.0866667       9      8-9
    ## 10  7.6600000     7-8        7
    ## 9   6.2333333       6      5-6
    ## 8   4.8066667     4-5        4
    ## 7   3.3800000       3      2-3
    ## 6   1.9533333     1-2        1
    ## 5   0.5266667    <NA>        0
    ## 4  -0.9000000    <NA>     <NA>
    ## 3  -2.3266667    <NA>     <NA>
    ## 2  -3.7533333    <NA>     <NA>
    ## 1  -5.1800000       0     <NA>

Si presti molta attenzione a due aspetti. Il primo è che non a tutti i punteggi standardizzati è associato un punteggio grezzo, ma si possono verificare dei salti (identificati dai valori mancanti). Il secondo è che sia il metodo *forward* che quello *backward*, nonostante portino a risultati leggermente differenti, sono da considerare entrambi validi: la scelta del metodo dovrebbe essere guidata da ragionati fondamenti teorici.

Possiamo applicare la funzione `rollup` a tutte le colonne della tabella normativa facendo uso del comando `sapply`:

``` r
normTab <- sapply(tab, rollup, x.min=0, x.max=30, direction="forward")
normTab <- data.frame(normTab, stringsAsFactors=FALSE, check.names=FALSE)
rownames(normTab) <- rownames(tab)
```

``` r
show(normTab)
```

    ##        6     7     8     9    10
    ## 19 20-30 25-30 29-30  <NA>  <NA>
    ## 18    19    24 27-28  <NA>  <NA>
    ## 17 17-18 22-23    26    30    30
    ## 16    16    21    25    29    29
    ## 15 14-15 19-20 23-24 27-28    28
    ## 14    13    18    22    26    27
    ## 13 11-12 16-17    21 24-25    26
    ## 12    10    15 19-20    23 24-25
    ## 11     9 13-14    18 21-22    23
    ## 10   7-8    12 16-17    20    22
    ## 9      6 10-11    15    19    21
    ## 8    4-5     9    14 17-18    20
    ## 7      3   7-8 12-13    16 18-19
    ## 6    1-2     6    11 14-15    17
    ## 5   <NA>   4-5    10    13    16
    ## 4   <NA>   2-3   8-9 11-12    15
    ## 3   <NA>     1     7    10 13-14
    ## 2   <NA>  <NA>   5-6     9    12
    ## 1      0     0   0-4   0-8  0-11

Si noti che, nella tabella normativa costruita, le ultime due fasce d'età non possono mai ottenere il punteggio standardizzato massimo, perché in entrambi i casi già il punteggio standardizzato 17 è associato al punteggio grezzo massimo. Per ovviare a questo problema, qualora di problema dovesse trattarsi, è possibile impostare a TRUE l'argomento `extremes`:

``` r
normTab[,] <- sapply(tab, rollup, x.min=0, x.max=30, direction="forward", extremes=TRUE)
```

L'argomento `extremes`, quando attivato, fa in modo che gli estremi del vettore risultino sempre valorizzati.

``` r
show(normTab)
```

    ##        6     7     8     9    10
    ## 19 20-30 25-30 29-30    30    30
    ## 18    19    24 27-28  <NA>  <NA>
    ## 17 17-18 22-23    26  <NA>  <NA>
    ## 16    16    21    25    29    29
    ## 15 14-15 19-20 23-24 27-28    28
    ## 14    13    18    22    26    27
    ## 13 11-12 16-17    21 24-25    26
    ## 12    10    15 19-20    23 24-25
    ## 11     9 13-14    18 21-22    23
    ## 10   7-8    12 16-17    20    22
    ## 9      6 10-11    15    19    21
    ## 8    4-5     9    14 17-18    20
    ## 7      3   7-8 12-13    16 18-19
    ## 6    1-2     6    11 14-15    17
    ## 5   <NA>   4-5    10    13    16
    ## 4   <NA>   2-3   8-9 11-12    15
    ## 3   <NA>     1     7    10 13-14
    ## 2   <NA>  <NA>   5-6     9    12
    ## 1      0     0   0-4   0-8  0-11

### Esplosione e implosione della tabella

All'occorrenza, i punteggi contenuti nella tabella normativa prodotta possono essere "srotolati" tramite esplosione o implosione dei vettori colonna.

La funzione `explode` espande ogni intervallo di punteggi estraendo ogni singolo punteggio in esso contenuto. Per fare questo, però, la funzione necessita di sapere se i punteggi sono disposti in senso ascendente o discendente.

Per capire la rilevanza di questo aspetto, si prenda la prima colonna della tabella normativa contenuta in `normTab`. Al punteggio standardizzato 19 corrisponde l'intervallo di punteggi grezzi \[20,30\]. Se il vettore fosse disposto in senso ascendente, questo intervallo sarebbe da esplodere creando una sequenza di interi che va da 20 a 30; all'opposto, se fosse disposto in senso discendente (come in effetti è), l'intervallo sarebbe da esplodere creando una sequenza di interi che va da 30 a 20. Questa informazione è quindi di fondamentale importanza per il risultato finale.

``` r
explode(normTab[,"6"], direction="backward")
```

    ##  [1] 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10  9  8
    ## [24]  7  6  5  4  3  2  1 NA NA NA NA  0

Possiamo anche eseguire l'operazione tenendo traccia del punteggio standardizzato corrispondente a ogni punteggio grezzo:

``` r
explode(normTab[,"6"], direction="backward", out.names=rownames(normTab))
```

    ## 19 19 19 19 19 19 19 19 19 19 19 18 17 17 16 15 15 14 13 13 12 11 10 10  9 
    ## 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10  9  8  7  6 
    ##  8  8  7  6  6  5  4  3  2  1 
    ##  5  4  3  2  1 NA NA NA NA  0

La funzione `implode` individua, per ogni intervallo, un valore unico riassuntivo da associare al punteggio standardizzato. Come impostazione predefinita, tale valore è calcolato come media dei due estremi dell'intervallo.

``` r
implode(normTab[,"6"])
```

    ##  [1] 25.0 19.0 17.5 16.0 14.5 13.0 11.5 10.0  9.0  7.5  6.0  4.5  3.0  1.5
    ## [15]   NA   NA   NA   NA  0.0

Anche in questo caso, possiamo tenere traccia del punteggio standardizzato corrispondente a ogni punteggio grezzo:

``` r
implode(normTab[,"6"], out.names=rownames(normTab))
```

    ##   19   18   17   16   15   14   13   12   11   10    9    8    7    6    5 
    ## 25.0 19.0 17.5 16.0 14.5 13.0 11.5 10.0  9.0  7.5  6.0  4.5  3.0  1.5   NA 
    ##    4    3    2    1 
    ##   NA   NA   NA  0.0
