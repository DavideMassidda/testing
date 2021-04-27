[:rewind:](../../README.md) [Torna all’indice](../../README.md)

# Tabulazione di riferimenti normativi

-   [Norme basate sulla distribuzione
    normale](#norme-basate-sulla-distribuzione-normale)
-   [Intervalli di punteggi](#intervalli-di-punteggi)
    -   [Esplosione e implosione della
        tabella](#esplosione-e-implosione-della-tabella)
-   [Norme basate sui ranghi
    percentili](#norme-basate-sui-ranghi-percentili)
-   [Corrispondenza fra ranghi e punti
    z](#corrispondenza-fra-ranghi-e-punti-z)

Un test standardizzato include un sistema di **tabelle normative** che
riportano la corrispondenza fra punteggi grezzi e standardizzati,
permettendo così di convertire un punteggio grezzo in uno
standardizzato. Una parte importante del processo di messa a punto di un
test psicometrico riguarda proprio la costruzione di queste tabelle.

Nel costruire una tabella normativa si devono sempre tenere ben presenti
alcuni aspetti.

1.  Una tabella normativa deve fornire la conversione di tutti i
    possibili punteggi grezzi che il test può produrre e non solo di
    quelli osservati nel campione di standardizzazione.

2.  Una tabella normativa deve essere univoca, per cui a ogni punteggio
    grezzo deve corrispondere uno e un solo punteggio standardizzato (al
    contrario, uno stesso punteggio standardizzato può corrispondere a
    più punteggi grezzi).

3.  I punteggi che si trovano sulle estremità delle code della
    distribuzione normale sono così rari da osservare che risulterebbero
    poco informativi dal punto di vista pratico. Generalmente, punteggi
    standardizzati localizzati oltre le 3 deviazioni standard dalla
    media non vengono considerati; qualora a un punteggio grezzo dovesse
    corrispondere un punteggio standardizzato che eccede questi limiti
    prestabiliti, il punteggio verrà appiattito sul limite
    dell’intervallo.

4.  Se la scalatura dei punteggi standardizzati è abbastanza ampia,
    l’interpretazione “clinica” viene effettuata arrotondando i valori
    all’intero più vicino, tralasciando la parte decimale.

5.  Spesso le tabelle normative sono disposte in senso discendente,
    ponendo i punteggi alti in testa e i punteggi bassi ai piedi.

## Norme basate sulla distribuzione normale

Consideriamo un ipotetico test dedicato alla misura di un’abilità
cognitiva in età scolare, che può produrre un punteggio grezzo compreso
fra 0 e 30. Supponiamo che il costrutto sottoposto a esame si sviluppi
con il progredire dell’età.

Vorremmo costruire dei riferimenti normativi per questo test. Dato che
il costrutto varia in funzione dell’età, sarebbe opportuno che questi
riferimenti normativi siano differenti per ogni anno d’età compiuto.

Immaginiamo di avere a disposizione un campione di osservazioni e di
aver calcolato la media e la deviazione standard dei punteggi grezzi per
ogni fascia d’età, salvando queste informazioni rispettivamente nei due
vettori `m` e `s`.

``` r
m <- c("6" = 7.66, "7" = 12.07, "8" = 16.96, "9" = 20.53, "10" = 22.49)
s <- c("6" = 4.28, "7" =  4.54, "8" =  4.13, "9" =  4.28, "10" =  3.71)
```

Decidiamo di utilizzare come punteggio standardizzato il punto *z*,
riscalato in modo tale che la media dellle osservazioni corrisponda a 10
(invece che a 0) e la deviazione standard a 3 (invece che a 1). Questo
tipo di scalatura, utilizzato nei [test
Wechsler](https://en.wikipedia.org/wiki/Wechsler_Scales) con il nome di
*Scaled Score*, è diventato piuttosto celebre nella pratica
psicometrica.

I *Wechsler Scaled Scores* (WSS) sono punteggi che nella pratica clinica
vengono utilizzati come valori interi che variano fra 1 e 19 (valori
esterni a questo intervallo sono rarissimi e quindi poco informativi).

Per costruire la tabella normativa possiamo far uso della funzione
`raw_score`. Partendo dai parametri normativi di media e deviazione
standard, `raw_score` converte una sequenza di punteggi standardizzati
nel corrispettivo punteggio grezzo. Per effettuare questa operazione è
necessario fornire alla funzione:

-   `m` e `s`: media e deviazione standard di riferimento.

-   `scale`: tipo di scalatura da applicare.

``` r
tab <- raw_score(19:1, m=m, s=s, scale="WSS")
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

La funzione tabula i punteggi grezzi corrispondenti a ogni possibile
punteggio standardizzato. Si noti che al punteggio standardizzato 10
corrisponde esattamente il punteggio grezzo medio contenuto nel vettore
`m`:

``` r
tab["10",]
```

    ##       6     7     8     9    10
    ## 10 7.66 12.07 16.96 20.53 22.49

Questa tabella presenta però alcuni problemi. Oltre alla presenza di
valori decimali, impossibili da osservare (il test produce solo punteggi
grezzi interi), la gamma di valori tabulati eccede la gamma di valori
che possono effettivamente essere osservati (0-30).

A entrambi i problemi possiamo far fronte applicando a ogni vettore
colonna la funzione `score_rollup`, che consente di racchiudere i
punteggi in intervalli.

## Intervalli di punteggi

Partendo dall’assunto che i punteggi grezzi prodotti da un test possono
appartenere esclusivamente all’insieme dei numeri naturali, la funzione
`score_rollup` associa univocamente ogni punteggio standardizzato a un
intervallo di punteggi grezzi. La funzione individua entro quali valori
grezzi interi sono racchiusi i punteggi tabulati, “arrotolandoli” entro
classi di punteggio. La classificazione può essere effettuata
arrotolando in senso ascendente (*forward direction*), ovvero partendo
dal basso, oppure discendente (*backward direction*), ovvero partendo
dall’alto.

Costruiamo una nuova tabella, contenente, per l’età di 6 anni, i
punteggi originali e i punteggi classificati, sia in senso ascendente
che discendente:

``` r
data.frame(
    row.names = 19:1,
    estimated = tab[,"6"],
      forward = score_rollup(tab[,"6"], x.min=0, x.max=30, direction="forward"),
     backward = score_rollup(tab[,"6"], x.min=0, x.max=30, direction="backward")
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
    ## 5   0.5266667       0        0
    ## 4  -0.9000000    <NA>     <NA>
    ## 3  -2.3266667    <NA>     <NA>
    ## 2  -3.7533333    <NA>     <NA>
    ## 1  -5.1800000    <NA>     <NA>

Si presti molta attenzione a due aspetti. Il primo è che non a tutti i
punteggi standardizzati è associato un punteggio grezzo, ma si possono
verificare dei salti (identificati dai valori mancanti). Il secondo è
che sia il metodo *forward* che quello *backward*, nonostante portino a
risultati leggermente differenti, sono da considerarsi entrambi validi:
la scelta del metodo dovrebbe essere guidata da ragionati fondamenti
teorici.

Possiamo applicare la funzione `score_rollup` a tutte le colonne della
tabella normativa facendo uso del comando `sapply`:

``` r
normTab <- sapply(tab, score_rollup, x.min=0, x.max=30, direction="forward")
normTab <- data.frame(normTab, row.names = rownames(tab), check.names=FALSE)
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
    ## 5      0   4-5    10    13    16
    ## 4   <NA>   2-3   8-9 11-12    15
    ## 3   <NA>     1     7    10 13-14
    ## 2   <NA>     0   5-6     9    12
    ## 1   <NA>  <NA>   0-4   0-8  0-11

Nella tabella normativa costruita, le ultime due fasce d’età non possono
mai ottenere il punteggio standardizzato massimo, perché in entrambi i
casi già il punteggio standardizzato 17 è associato al punteggio grezzo
massimo. Per ovviare a questo problema, qualora di problema dovesse
trattarsi, è possibile impostare a TRUE l’argomento `extremes`:

``` r
normTab[,] <- sapply(tab, score_rollup, x.min=0, x.max=30, direction="forward", extremes=TRUE)
```

L’argomento `extremes`, quando attivato, fa in modo che gli estremi del
vettore risultino sempre valorizzati.

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

All’occorrenza, i punteggi contenuti nella tabella normativa prodotta
possono essere “srotolati” tramite esplosione o implosione dei vettori
colonna.

La funzione `score_explode` espande ogni intervallo di punteggi
estraendo ogni singolo punteggio in esso contenuto.

``` r
score_explode(normTab[,"6"])
```

    ##  [1] 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10  9  8  7  6
    ## [26]  5  4  3  2  1 NA NA NA NA  0

Possiamo anche eseguire l’operazione tenendo traccia del punteggio
standardizzato corrispondente a ogni punteggio grezzo:

``` r
score_explode(normTab[,"6"], out.names=rownames(normTab))
```

    ## 19 19 19 19 19 19 19 19 19 19 19 18 17 17 16 15 15 14 13 13 12 11 10 10  9  8 
    ## 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10  9  8  7  6  5 
    ##  8  7  6  6  5  4  3  2  1 
    ##  4  3  2  1 NA NA NA NA  0

La funzione `score_implode` individua, per ogni intervallo, un valore
unico riassuntivo da associare al punteggio standardizzato. Come
impostazione predefinita, tale valore è calcolato come media dei due
estremi dell’intervallo.

``` r
score_implode(normTab[,"6"])
```

    ##  [1] 25.0 19.0 17.5 16.0 14.5 13.0 11.5 10.0  9.0  7.5  6.0  4.5  3.0  1.5   NA
    ## [16]   NA   NA   NA  0.0

Anche in questo caso, possiamo tenere traccia del punteggio
standardizzato corrispondente a ogni punteggio grezzo:

``` r
score_implode(normTab[,"6"], out.names=rownames(normTab))
```

    ##   19   18   17   16   15   14   13   12   11   10    9    8    7    6    5    4 
    ## 25.0 19.0 17.5 16.0 14.5 13.0 11.5 10.0  9.0  7.5  6.0  4.5  3.0  1.5   NA   NA 
    ##    3    2    1 
    ##   NA   NA  0.0

## Norme basate sui ranghi percentili

Affrontiamo infine il caso di sistemi di norme basati sui ranghi
percentili. Prendiamo come esempio il dataset *abilityTest*, che
contiene i punteggi ottenuti al test da un ipotetico campione di 30
bambini di 8 anni:

``` r
data("abilityTest")
```

``` r
head(abilityTest)
```

    ##   subject score errors
    ## 1       1    25      3
    ## 2       2    27      2
    ## 3       3     6      0
    ## 4       4     9      0
    ## 5       5    24      2
    ## 6       6     7      0

La prova di abilità richiede di eseguire un compito entro un intervallo
di tempo prestabilito. L’esaminatore valuta l’esecuzione della prova
attribuendole un punteggio compreso fra 0 e 30 (colonna `score`). Il
bambino deve eseguire la prova evitando di commettere errori (il numero
di errori è registrato nella colonna `errors`).

Vogliamo costruire una tabella normativa basata sui ranghi percentili,
che consenta dunque all’utilizzatore del test di conoscere il rango
percentile corrispondente a ogni punteggio grezzo ottenibile.

Partiamo dalla variabile *score*. Dato un vettore di punteggi grezzi
osservati, la funzione `perc_rank` calcola il rango percentile
corrispondente a ogni valore che gli viene passato nell’argomento
`breaks`, individuando la percentuale di osservazioni **minori o
uguali** a ogni breakpoint.

``` r
perc_rank(abilityTest$score, breaks=0:30)
```

    ##     0     1     2     3     4     5     6     7     8     9    10    11    12 
    ##   0.0   6.7   6.7   6.7   6.7  13.3  20.0  23.3  26.7  33.3  33.3  36.7  40.0 
    ##    13    14    15    16    17    18    19    20    21    22    23    24    25 
    ##  40.0  40.0  43.3  50.0  56.7  63.3  63.3  63.3  63.3  66.7  70.0  76.7  90.0 
    ##    26    27    28    29    30 
    ##  93.3  96.7  96.7 100.0 100.0

Passiamo ora alla colonna *errors*. Questa variabile ha una
caratteristica particolare: diversamente da *score*, all’aumentare del
valore, la prestazione del soggetto peggiora, perché la variabile
rappresenta un conteggio di errori. In casi come questo, per facilitare
l’interpretazione dei punteggi prodotti dal test, spesso si preferisce
invertire i ranghi percentili, calcolando la percentuale di osservazioni
**maggiori o uguali** a ogni breakpoint.

Questo può essere fatto sfruttando l’argomento `fun`:

``` r
perc_rank(abilityTest$errors, breaks=0:5, fun=">=")
```

    ##     0     1     2     3     4     5 
    ## 100.0  73.3  53.3  33.3  16.7   6.7

Si ricorda che, spesso, variabili che quantificano errori o tempi non
sono limitate superiormente, ed è bene tenere a mente questo aspetto
nella tabulazione dei valori.

## Corrispondenza fra ranghi e punti z

*testing* dispone di funzioni che permettono di convertire un rango
percentile nel corrispettivo punto *z* (o altro punteggio derivato), e
viceversa di conoscere quale rango percentile corrisponde a un certo
punto *z*.

Utilizzando la funzione `perc2std` possiamo per esempio sapere quale
*Wechsler Scaled Score* corrisponde al rango percentile 75:

``` r
perc2std(75, scale="WSS")
```

    ## [1] 12.02347

All’opposto, utilizzando la funzione `std2perc` possiamo sapere quale
rango percentile corrisponde a uno *scaled score* di 12:

``` r
std2perc(12, scale="WSS")
```

    ## [1] 74.75075

I valori restituiti rappresentano, chiaramente, un calcolo puramente
teorico basato sulle proprietà della distribuzione normale. Più i dati
osservati si avvicinano alla normalità distributiva, più i valori
restituiti dalle due funzioni di conversione saranno rappresentativi
della situazione reale.
