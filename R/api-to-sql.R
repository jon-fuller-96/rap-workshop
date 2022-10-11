#install.packages('RSQLite')
#install.packages('DBI')
#install.packages('logr')
#install.packages('httr')
#install.packages('readr')
#install.packages("scales")
#install.packages("dplyr")


library(DBI)
library(logr)
library(httr)
library(scales)
library(dplyr)

# set API url
url <- "https://api.coronavirus.data.gov.uk/v2/data?areaType=msoa&metric=cumPeopleVaccinatedFirstDoseByVaccinationDate&format=csv"
# pull from API
res <- httr::GET(url)
# convert to df
df_api <-  suppressMessages(httr::content(res)) %>% mutate(date = as.character(date))


# log API data
cat(scales::comma(nrow(df_api)),
    " - Rows pulled from API\n")

# Create an ephemeral in-memory RSQLite database
con <- dbConnect(RSQLite::SQLite(), ":memory:")

# write to local SQL server
dbWriteTable(con, "vax_tbl", df_api)

