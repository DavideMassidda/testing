[:rewind:](index.md) [Torna all'indice dei tutorial](index.md)

[:arrow\_backward:](norms0.md) [Uso e costruzione delle norme di un test](norms0.md)

[:arrow\_forward:](norms2.md) [Tabulazione di riferimenti normativi](norms2.md)

Standardizzazione di punteggi
=============================

-   [Punti z e loro derivati](#punti-z-e-loro-derivati)
-   [Conversione da parametri normativi](#conversione-da-parametri-normativi)
    -   [Da grezzo a standardizzato](#da-grezzo-a-standardizzato)
    -   [Da standardizzato a grezzo](#da-standardizzato-a-grezzo)
-   [Conversione da tabelle normative](#conversione-da-tabelle-normative)

Punti z e loro derivati
-----------------------

Il più importante punteggio standardizzato è probabilmente il celebre punto *z*, che viene ottenuto centrando un valore osservato *x* rispetto alla media *μ* della popolazione di riferimento e riscalando il risultato per la deviazione standard *σ* della medesima popolazione:

*z* = (*x* - *μ*) / *σ*

Rispetto al valore grezzo, il punto *z* consente di capire immediatamente come un soggetto si colloca rispetto alla "norma", rappresentata dalla prestazione al test della popolazione di riferimento.

Moltissime altre tipologie di punteggi non sono altro che una riscalatura dei punti *z*, ottenuta con la generica formula:

*q* = *z* \* *σ*<sub>*n**e**w*</sub> + *μ*<sub>*n**e**w*</sub>

in cui *μ*<sub>*n**e**w*</sub> e *σ*<sub>*n**e**w*</sub> sono la nuova centratura e la nuova scala dei punteggi.

Tale formula viene adottata per ricentrare ed espandere la scala dei punteggi standardizzati così da renderlì più interpretabili, facendo in modo che i valori possano essere agevolmente ricondotti all'insieme dei numeri naturali (ovvero numeri interi positivi). Queste riscalature consentono di escludere la possibilità che un punteggio risulti negativo o contenga una parte decimale, favorendo l'interpretazione clinica del valore. La precisa metrica del punteggio dipende poi da esigenze specifiche, esattamente come per il punteggio grezzo.

Il pacchetto *testing* implementa diverse opzioni per la scalatura dei punteggi:

| Codice  | Punteggio                     | Media | Dev. St. |
|:--------|:------------------------------|:------|:---------|
| z       | *z* Score                     | 0     | 1        |
| T       | *T* Score                     | 50    | 10       |
| NCE     | Normal Scale Equivalent Score | 50    | ≈ 21     |
| IQ      | Intelligence Quotient Score   | 100   | 15       |
| WSS     | Wechsler Scaled Score         | 10    | 3        |
| Stanine | Standard-nine Score           | 5     | 2        |
| Sten    | Standard-ten Score            | 5.5   | 2        |

Conversione da parametri normativi
----------------------------------

Consideriamo un ipotetico test dedicato alla misura di un'abilità cognitiva in età scolare, che può produrre un punteggio grezzo compreso fra 0 e 30. Nel dataset *abilityTest* sono contenuti i risultati ottenuti al test (colonna `score`) da un gruppo di bambini di 8 anni.

``` r
load("data/abilityTest.rda")
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

Supponiamo di conoscere la media *μ* e la deviazione standard *σ* dei punteggi ottenuti al test dalla popolazione di riferimento, rappresentata dai bambini di 8 anni. Salviamo i due valori nei due oggetti `m` e `s`:

``` r
m <- 16.96
s <- 4.13
```

### Da grezzo a standardizzato

Per standardizzare i punteggi a partire dalla media e dalla deviazione standard normative, è possibile utilizzare la funzione `stdscore`:

``` r
abilityTest$z_score <- stdscore(abilityTest$score, m=m, s=s, scale="z")
```

Per utilizzare altri tipi di scalatura dei punteggi è possibile manipolare l'argomento `scale`, scegliendo l'opzione desiderata e all'occorrenza impostando l'argomento `integer` uguale a TRUE, così da arrotondare il punteggio risultante all'intero più vicino:

``` r
abilityTest$scaled <- stdscore(abilityTest$score, m=m, s=s, scale="WSS", integer=TRUE)
```

``` r
head(abilityTest)
```

    ##   subject score errors   z_score scaled
    ## 1       1    25      3  1.946731     16
    ## 2       2    27      2  2.430993     17
    ## 3       3     6      0 -2.653753      2
    ## 4       4     9      0 -1.927361      4
    ## 5       5    24      2  1.704600     15
    ## 6       6     7      0 -2.411622      3

### Da standardizzato a grezzo

Grazie alla funzione inversa:

*x* = *μ* + *σ* (*q* - *μ*<sub>*n**e**w*</sub>) / *σ*<sub>*n**e**w*</sub>

è possibile riottenere il punteggio grezzo corrispondente a un certo valore standardizzato. Questa operazione è implementata nella funzione `rawscore`:

``` r
rawscore(abilityTest$scaled, m=m, s=s, scale="WSS", integer=TRUE)
```

    ##  [1] 25 27  6  9 24  7 25 18 25  9  0 11 16 24  0 22 17 16 25  6 27  7 29
    ## [24]  5  5 18 16 11 22 17

Conversione da tabella normativa
--------------------------------

In alcuni casi i parametri normativi di media e deviazione standard non sono disponibili e l'unica possibilità di standardizzare un punteggio grezzo prevede di appoggiarsi a una tabella normativa.

Immaginiamo di avere a disposizione la tabella normativa del test che contiene i punteggi grezzi corrispondenti a ogni punteggio standardizzato, per ogni fascia d'età:

``` r
load("data/normTab.rda")
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

Nella tabella, i nomi delle righe riportano la sequenza di punteggi grezzi ottenibili al test, mentre i nomi delle colonne indicano a quale fascia d'età fa riferimento ogni vettore di punteggi grezzi.

La funzione `raw2std` converte un punteggio grezzo in punteggio standardizzato utilizzando come riferimento una tabella normativa. Oltre al vettore di punteggi grezzi da standardizzare, la funzione richiede due argomenti obbligatori:

-   `raw.norm`: vettore di punteggi grezzi estratto della tabella normativa;

-   `std.norm`: vettore di punteggi standardizzati estratto dalla tabella normativa.

Dato che i dati osservati sono stati raccolti somministrando il test a bambini di 8 anni, utilizziamo la norma per questa fascia d'età come riferimento:

``` r
raw2std(abilityTest$score, std.norm=rownames(normTab), raw.norm=normTab[,"8"])
```

    ##  [1] 16 18  2  4 15  3 16 11 16  4  1  6 10 15  1 14 10  9 16  2 17  4 19
    ## [24]  2  2 11 10  7 15 10
