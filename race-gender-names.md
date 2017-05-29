# Race, Gender, and Names
Lars Vilhuber  
May 1, 2017  


## Gender
We will use a variety of data. First, use of SSA data for names and gender. We use names from  https://www.ssa.gov/oact/babynames/names.zip.


```r
usnames <- readSSANames("national",base.url = "ssa")
save(usnames, file="usnames.Rdata", compress = TRUE)
```
We read in the frequency of gender by names. 

```r
us.prop <- byNameCount(usnames)
us.prop$prop.male <- us.prop$count.male/(us.prop$count.male + us.prop$count.female)
save(us.prop, file="us.prop.Rdata", compress = TRUE)
```

There are a total of 95025 names in the SSA data base, for birth years from 1880 to 2016. Of those, 34.84% are strongly male (more than 80% of occurrences are for men), and 61.87% are strongly female. In other words, 96.7% of names are not particularly ambiguous names.

## Race
Race can be inferred from family names using a variety of techniques, but again, they typically rely on data provided by the statistical agencies. In "ePluribus : Ethnicity on Social Networks" (2010), Jonathan Chang and Itamar Rosenn and Lars Backstrom and Cameron Marlow (all at Facebook) use the data from the U.S. Census Bureau's Genealogy Project
(files from the 2000 Census).

# Program Sources

- https://github.com/OpenGenderTracking/globalnamedata

# Data Sources

  United States Department of Commerce. Bureau of the Census; Frequently Occurring Surnames from the Census 2000. Ann Arbor, MI: Inter-university Consortium for Political and Social Research [distributor], http://doi.org/10.3886/E100667V1

  United States Department of Commerce. Bureau of the Census; Frequently Occurring Surnames from the 2010 Census. Ann Arbor, MI: Inter-university Consortium for Political and Social Research [distributor], http://doi.org/10.3886/E100668V1

  United States Department of Commerce. Bureau of the Census; Frequently Occurring Surnames from the 1990 Census. Ann Arbor, MI: Inter-university Consortium for Political and Social Research [distributor], http://doi.org/10.3886/E100669V1

  United States Social Security Administration; SSA: Beyond the Top 1000 Names. Ann Arbor, MI: Inter-university Consortium for Political and Social Research [distributor], http://doi.org/10.3886/E100670V1
