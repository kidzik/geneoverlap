# geneoverlap
A CLT-baste test if an overlap in gene selection methods occured at random

Suppose we have `N` genes and three methods `M1, M2, M3` for selecting a subset of genes. Each method selects genes with a certain probability `p1`, `p2` and `p3`. We are interested if the overlap in selection occured at random or not. 

To this end, we need to specify:
- how many genes were provided to each method (the vector `N`)
- how many genes each method selected (the vector `d1`)
- how many genes intersect in each pair of methods (the vector `d2`)
- how many genes intersect in all three methods (`d3`)

This package tests if the intersection of these selection processes occured at random.

## Installation

```R
library("devtools")
install_git("https://github.com/kidzik/geneoverlap")
```

## Usage
```R
library("geneoverlap")
N = c(34602,33627,22144)
d1 = c(458, 1938, 289) # A, B, C
d2 = c(105, 28, 172) # AB, BC, CA
d3 = c(47)

geneoverlap(N,d1,d2,d3) # p-value
```
