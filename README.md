See documentation pages in [Italian](docs/it/index.md).

# Convenience functions to develop psychometric tests

_testing_ is a package for the R statistical software providing functions to develop psychometric tests. The package can be installed by connecting to this repository by using the package devtools, which must be previously installed.

``` r
install.packages("devtools")
```

After you open R, to install the package _testing_ you can run the command:

```r
devtools::install_github("DavideMassidda/testing")
```

Warning: testing is a package under development and important changes in the future could be implemented.

## Package overview

### Scoring
* **`stdscore`** From raw scores to standard scores.
* **`rawscore`** From standard scores to raw scores.
* **`percrank`** From observed scores to percentile ranks.
* **`std2perc`** From standard scores to percentiles.
* **`perc2std`** From percentiles to standard scores.
* **`normalize`** (or `normalise`) Vector rescaling.
* **`reverse`** Score reversing.

### Norming
* **`rollup`** Creation of intervals of scores.
* **`explode`** Explosion of intervals of scores.
* **`implode`** Implosion of intervals of scores.
* **`is.continuous`** Check for continuous vectors.
* **`is.monotonic`** Check for monotonic vectors.

### ROC Analysis
* **`roc.curve`** Receiver Operating Characteristic curve.
* **`roc.table`** Receiver Operating Characteristic table.

### Rounding
* **`integer.round`** Conversion from decimal to integer.
* **`decimal.floor`** Round a decimal number to the nearest floor for a given decimal position.
* **`decimal.ceiling`** Round a decimal number to the nearest ceiling for a given decimal position.
* **`integer.floor`** Round a decimal number to the nearest integer floor.
* **`integer.ceiling`** Round a decimal number to the nearest integer ceiling.

### Aging
* **`age.completed`** Age Calculation from dates.
* **`age.numeric`** Age Conversion: from character to numeric.
* **`age.character`** Age Conversion: from numeric to character.
* **`age.segment`** Grouping by age segmentation.

### Reliability
* **`kr20`** Kuder–Richardson formula 20.
* **`cronbach.alpha`** Cronbach's alpha.
* **`cronbach.strata`** Stratified Cronbach's alpha.
* **`average.r`** Average reliability coefficient.
* **`dropitem`** Internal consistency reliability.
* **`splithalf`** Split-half reliability.
* **`se.measure`** Standard error of measurement.

### Content validity
* **`parallel`** Parallel analysis.

### Describe scores
* **`integer.counts`** Count integer values.
* **`entropy`** Entropy index.
* **`bubble.plot`** Bubble plot.

### Build items
* **`item.shuffle`** Item shuffling.
* **`item.split`** Split items.

### Missing data
* **`knn.impute`** Missing data replacement by k-nearest neighbour.
* **`na.impute`** Missing data imputation.

### Datasets
* **`drive`** Secure drive project.

### Export datasets
* **`write.fwf`** Export data in a fixed-width format.

### Data simulation
* **`sim.attitude`** Random responses for attitude tests.
