# from https://github.com/OpenGenderTracking/globalnamedata/blob/master/R/util.R
byNameCount <- function(data) {
  # input structure should look like this:
  #     Name  F   M Year
  # 1  Aaron  0 102 1880
  # 2     Ab  0   5 1880
  # 3  Abbie 71   0 1880
  # 4 Abbott  0   5 1880
  # 5   Abby  6   0 1880
  # 6    Abe  0  50 1880
  
  # Cache factor of names
  name.factor <- as.factor(data[, "Name"])
  
  # Group by year/name combination, return the unique year rows
  # prevents double counting for years for M and F in the same year
  years.appearing <- tapply(data[, "Year"], name.factor,
                            function(x) {
                              length(unique(x))
                            }
  )
  
  data.out <- data.frame(
    Name = rownames(years.appearing),
    years.appearing = as.numeric(years.appearing),
    # Sum the counts for each level in the name factor (every name)
    count.male = as.numeric(rowsum(data[, "M"], group = name.factor)),
    count.female = as.numeric(rowsum(data[, "F"], group = name.factor)),
    stringsAsFactors = FALSE
  )
  
  return(data.out)
}
