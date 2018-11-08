See documentation pages in [Italian](docs/it/index.md).

## Convenience functions to develop psychometric tests

_testing_ is a package for the R statistical software providing functions to develop psychometric tests. The package can be installed by connecting to this repository by using the package devtools, which must be previously installed.

After you open R, to install the package _testing_ you can run the command:
```r
devtools::install_github("DavideMassidda/testing")
```
Warning: testing is a package under development and important changes in the future could be implemented.

## Package overview

### Standard scores
* **`stdscore`** From raw scores to standard scores.
* **`rawscore`** From standard scores to raw scores.
* **`std2perc`** Standard scores conversion.
* **`perc2std`** Percentile conversion.
* **`prank`** Percentile rank.

### Normative tables
* **`rollup`** Score intervals.
* **`explode`** Score explosion.
* **`implode`** Score implosion.
* **`is.continuous`** Check for continuous vectors.
* **`is.monotonic`** Check for monotonic vectors.

### Rounding
* **`integer.round`** Conversion from decimal to integer.
* **`decimal.floor`** Round a decimal number to the nearest floor for a given decimal position.
* **`decimal.ceiling`** Round a decimal number to the nearest ceiling for a given decimal position.
* **`integer.floor`** Round a decimal number to the nearest integer floor.
* **`integer.ceiling`** Round a decimal number to the nearest integer ceiling.

### Management of ages
* **`age.completed`** Age Calculation.
* **`age.numeric`** Age Conversion: from character to numeric.
* **`age.character`** Age Conversion: from numeric to character.
* **`age.segment`** Age Segmentation.

### Reliability
* **`kr20`** Kuder–Richardson formula 20.
* **`cronbach.alpha`** Cronbach's alpha.
* **`cronbach.strata`** Stratified Cronbach's alpha.
* **`average.r`** Average reliability coefficient.
* **`fisher.z`** Fisher's z transformation.
* **`invfisher.z`** Fisher's z transformation.
* **`dropitem`** Internal consistency reliability.
* **`split.half`** Split-half reliability.

### Content validity
* **`parallel`** Parallel analysis.

### ROC Analysis
* **`roc.curve`** ROC curve.
* **`roc.table`** Receiver Operating Characteristic.

### Development of test items
* **`item.shuffle`** Item shuffling.
* **`item.split`** Split items.

### Data management
* **`normalize`** Vector rescaling.
* **`reverse`** Item reversing.
* **`write.fwf`** Export data in a fixed-width format.

### Data description
* **`likert.counts`** Likert scale frequencies.
* **`entropy`** Entropy index.
* **`se.measure`** Standard error of measurement.

### Data visualization
* **`bubble.plot`** Bubble plot.

### Missing data
* **`knn.impute`** Missing data replacement by k-nearest neighbour.
* **`na.impute`** Missing data imputation.

### Data simulation
* **`sim.attitude`** Random responses for attitude tests.

### Datasets
* **`drive`** Secure drive project.
