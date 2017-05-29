#' Match names across gender count
#'
#' Construct a pivot table for imput data frames which are in long format
#'
#' @param x A data frames with columns for Name, Sex, Count
#' and Year
#' @param by string denoting common value for data frame (e.g. year or state)
#'
#' @return A single data frame with columns for Name, F, M, and Year
#' @importFrom reshape2 dcast
matchSexes <- function(x) {
  ## Condense names to single row. Accepts a single argument, x with the form
  #        Name Sex Count Year
  # 1      Mary   F  7065 1880
  # 2      Anna   F  2604 1880
  # 3      Emma   F  2003 1880
  # 4 Elizabeth   F  1939 1880
  
  ## dcast helps build a pivot table based on names
  # for each name/sex combo, we compute the sum of births and accumulate
  x.out <- dcast(
    x[, c("Name", "Sex", "Count")], 
    Name ~ Sex, sum,
    value.var = "Count"
  )
  
  ## x.out structure
  #     Name  F   M
  # 1  Aaron  0 102
  # 2     Ab  0   5
  # 3  Abbie 71   0
  # 4 Abbott  0   5
  
  return(x.out)
}
