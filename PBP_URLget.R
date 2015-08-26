#Gets Team Codes
library(rvest)

# Gets raw HTML file from site
url <- html("http://www.big12sports.com/SportSelect.dbml?SPSID=106580&SPID=13139&DB_OEM_ID=10410&Q_SEASON=2014")

# Pulling the PBP data out
selector_name <- "#schedule-table .media a:nth-child(5)"
Codes <- html_nodes(url, selector_name) %>%
  html_attr("href") %>%
  strsplit(., "=") %>%
  unlist() %>%
  matrix(., byrow=TRUE)

# Removes a wrong link
Codes <- Codes[-181,]

# Isolates the Team Codes
Codes <- matrix(Codes, ncol=3, byrow=TRUE)
Codes <- Codes[,-1:-2]
IsoCodes <- as.data.frame(Codes)