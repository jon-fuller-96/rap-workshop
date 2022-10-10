#install.packages('RSQLite')
#install.packages('DBI')
#install.packages('logr')
#install.packages('httr')
#install.packages('readr')
#install.packages("scales")


library(DBI)
library(logr)
library(httr)
library(scales)

# set API url
url <- "https://api.coronavirus.data.gov.uk/v2/data?areaType=msoa&metric=cumPeopleVaccinatedFirstDoseByVaccinationDate&format=csv"
# pull from API
res <- httr::GET(url)
# convert to df
df_api <-  suppressMessages(httr::content(res))
# log API data
cat(scales::comma(nrow(df_api)), " - Rows pulled from API\n")

# Create an ephemeral in-memory RSQLite database
con <- dbConnect(RSQLite::SQLite(), ":memory:")

# write to local SQL server
dbWriteTable(con, "df_vax", df_api)

# read from local server
res <- dbSendQuery(con, "SELECT * FROM df_vax")
df_vax <- dbFetch(res)
cat(scales::comma(nrow(df_vax)), " - Rows pulled from SQL\n")

# remove unneeded objects
rm(list = c("con", "res", "df_api", "url"))
