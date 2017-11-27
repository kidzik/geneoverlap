#' Test if an overlap in gene selection methods occured at random
#'
#' Suppose we have N genes and three methods M1, M2, M3 for
#' selecting a subset of genes, selecting each gene with some fixed probability p1, p2, p3 respectively.
#' This package tests if the intersection of these selection processes occured at random.
#'
#' @title Test if an overlap in gene selection methods occured at random
#'
#' @param N a three-dimensional vector consisting of the number of genes used for selection in methods M1, M2, M3
#' @param d1 a three-dimensional vector consisting of the number of genes selected by methods M1, M2, M3
#' @param d2 a three-dimensional vector consisting of the number of genes selected by both methods (M1,M2), (M2,M3), (M3,M1)
#' @param d3 the number of genes selected by all three methods (M1,M2,M3)
#' @return p-value of the Z-score
#' @examples
#' N = c(34602,33627,22144)
#' d1 = c(458, 1938, 289) # A, B, C
#' d2 = c(105, 28, 172) # AB, BC, CA
#' d3 = c(47)
#'
#' geneoverlap(N,d1,d2,d3)
#' @export
#'
geneoverlap = function(N,d1,d2,d3){

  N1 = d1[1] + d2[1] + d2[3] + d3
  N2 = d1[2] + d2[1] + d2[2] + d3
  N3 = d1[3] + d2[2] + d2[3] + d3

  p1 = N1/N[1]
  p2 = N2/N[2]
  p3 = N3/N[3]

  Px.nominator = p1*p2 + p1*p3 +  p2*p3 - 2*p1*p2*p3 # P(x|S)
  Px.denominator = 1 - (1-p1)*(1-p2)*(1-p3) # P(x|S)
  Px = Px.nominator / Px.denominator

  Ns = sum(d1,d2,d3)

  EX = Ns * Px
  varX = Ns * Px * ( 1 - Px )
  ss = sum(d2,d3)

  Z = (ss - EX) / sqrt(varX)
  2*pnorm(-abs(Z))
}
