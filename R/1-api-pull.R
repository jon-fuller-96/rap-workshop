#install.packages('httr')
#install.packages("scales")
#install.packages("dplyr")


# Load in some packages
library(httr, quietly = TRUE)
library(scales, quietly = TRUE)
library(dplyr, quietly = TRUE)

# set API url (copied-and-pasted from https://coronavirus.data.gov.uk/)
url <- "https://api.coronavirus.data.gov.uk/v2/data?areaType=msoa&metric=cumPeopleVaccinatedFirstDoseByVaccinationDate&format=csv"

# ask API for a response
res <- httr::GET(url)

# load in data that API sent
df <- httr::content(res, show_col_types = FALSE)

# print off metadata
cat(scales::comma(nrow(df)),
    " - Rows pulled from API\n")





