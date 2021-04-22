# Convenience functions to develop psychometric tests

_testing_ is a package for the R statistical environment providing functions to develop psychometric tests. The package can be installed by connecting to this repository by using the package _devtools_, which must be previously installed. To install _testing_ you can run the command:

```r
devtools::install_github("DavideMassidda/testing")
```

_testing_ is a collection of R functions useful to develop psychometric tools. _testing_ does not replace other well-known packages as [_psych_](https://cran.r-project.org/web/packages/psych/index.html) (on which it depends), but should be considered as their integration.

The package stems from the author's need to collect into a single repository the most commonly R functions used in his daily practice. These functions are therefore rather heterogeneous, but they share the usefulness in some step of psychometric test building. Some functions of _testing_ are present in other forms into different R packages, if not in base R. In these cases, _testing_ offers a different output format optimized for application in psychometric data analysis. Sometimes, the functions are implemented following algorithmic peculiarities that make them only apparently similar to other sources.

Born from a messy collection of commands scattered within a multitude of scripts, over time the package has been refined, making a great effort to optimize the functions and standardize the style. During the development, some function were refined, other deprecated and not replaced. If you search old versions including function no more available, you can take a look of [old sources](https://github.com/DavideMassidda/testing/releases) of the package.

## Package overview

### Scoring
* **`reverse`** Score reversing.
* **`normalize`** (or `normalise`) Vector rescaling.
* **`stdscore`** From raw scores to standard scores.
* **`rawscore`** From standard scores to raw scores.
* **`percrank`** From observed scores to percentile ranks.
* **`raw2std`** Conversion of raw scores from a norm table.
* **`std2perc`** From standard scores to percentiles.
* **`perc2std`** From percentiles to standard scores.

### Rounding
* **`integer_round`** Conversion from decimal to integer.
* **`decimal_floor`** Round a decimal number to the nearest floor for a given decimal position.
* **`decimal_ceiling`** Round a decimal number to the nearest ceiling for a given decimal position.
* **`integer_floor`** Round a decimal number to the nearest integer floor.
* **`integer_ceiling`** Round a decimal number to the nearest integer ceiling.

### Norming
* **`score_rollup`** Creation of intervals of scores.
* **`score_explode`** Explosion of intervals of scores.
* **`score_implode`** Implosion of intervals of scores.
* **`is_continuous`** Check for continuous vectors.
* **`is_monotonic`** Check for monotonic vectors.
* **`roc_table`** Search a score cut-off by using a ROC analysis.

### Validating
* **`kr20`** Kuder–Richardson formula 20.
* **`cronbach_alpha`** Cronbach's alpha.
* **`cronbach_strata`** Stratified Cronbach's alpha.
* **`average_reliab`** Average reliability coefficient.
* **`drop_item`** Internal consistency reliability.
* **`split_half`** Split-half reliability.
* **`se_measure`** Standard error of measurement.

### Describing
* **`entropy`** Entropy index.
* **`integer_counts`** Count integer values.

### Aging
* **`age_completed`** Age Calculation from dates.
* **`age_numeric`** Age Conversion: from character to numeric.
* **`age_character`** Age Conversion: from numeric to character.
* **`age_segment`** Grouping by age segmentation.

### Datasets
* **`drive`** Secure drive project.
* **`abilityTest`** Ability test.
* **`normTab`** Normative table.
* **`testDates`** Test dates.

## Documentation pages (Italian only)

[:arrow\_forward:](docs/it/standardization.md) [Standardizzazione dei punteggi](docs/it/standardization.md)

[:arrow\_forward:](docs/it/tabulation.md) [Tabulazione di riferimenti normativi](docs/it/tabulation.md)

[:arrow\_forward:](docs/it/ages.md) [Calcolo e conversione dell’età](docs/it/ages.md)
