
# processControl

<!-- badges: start -->
<!-- badges: end -->

Personal R package for creating process control charts

Functions included:

- c4
  - Used for weighted per-run sample Standard Deviation in X-bar & S charts 
- d2
  - Used for weighting the per-run range in X-bar & R charts

Functions to come:

- A function to manipulate tidy dataframes into ready-to-plot dataframes for
  x-bar, R, and S charts
- A function to take said dataframe and generate a nicely-formatted ggplot graph
  that can be further modified as the user sees fit.
- maybe more, like the various "rules" for interpretation

## Installation

You can install the development version of processControl from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("tclark89/processControl")
```

## Example

Some examples of the c4 and d2 functions. the future goal of this package is to
use avoid having to explicitly call these functions. 

But for now...

``` r
library(processControl)
## basic example code

# better examples to come

# c4
# Vector of measurement counts per run (X-bar & S)
counts <- c(10, 12, 11, 15, 20, 13, 8)

c4(counts)
[1] 0.9726593 0.9775594 0.9753501 0.9823162 0.9869343 0.9794056 0.9650305

# d2
# Vector of measurement counts per run (X-bar & R)
counts <- c(2, 7, 3, 4, 4, 1, 5)

d2(counts)
[1] 1.128379 2.704357 1.692569 2.058751 2.058751 1.128379 2.325929

```

