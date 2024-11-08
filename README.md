
<!-- README.md is generated from README.Rmd. Please edit that file -->

# SummaryStatsPkg

The “SummaryStatsPkg” package provides the summary_statistics function
to aid in quick data analysis. It calculates the mean, median, standard
deviation and count of all non-NA values for specified numeric columns
in a dataframe.

## Installation

You can install the development version of `SummaryStatsPkg` from GitHub
with:

``` r
devtools::install_github("stat545ubc-2024/SummaryStatsPkg")
```

## Example

This is a basic example which shows you how to use the
summary_statistics function:

``` r
# Load the package
library(SummaryStatsPkg)

# Example using the palmerpenguins dataset
library(palmerpenguins)
summary_statistics(penguins, columns = c("flipper_length_mm", "body_mass_g"))
#>                        mean median standard_deviation count
#> flipper_length_mm  200.9152    197           14.06171   342
#> body_mass_g       4201.7544   4050          801.95454   342
```
