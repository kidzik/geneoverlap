# geneoverlap
A CLT-baste test if an overlap in gene selection methods occured at random

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

geneoverlap(N,d1,d2,d3)
```
