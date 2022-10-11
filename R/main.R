# load COVID vaccination dashboard data onto local SQL server
# table name: vax_tbl
source('R/api-to-sql.R')



# can write SQL query to pull data directly into R
sql_query <- "SELECT date, LtlaName, cumPeopleVaccinatedFirstDoseByVaccinationDate FROM vax_tbl"
# read from local server
df_vax <- dbFetch(
  dbSendQuery(con, 
              sql_query)
)

cat(scales::comma(nrow(df_vax))
    , " - Rows pulled from SQL\n")

# remove unneeded objects
rm(list = c("con", 
            "res", 
            "df_api", 
            "url"
            )
  )