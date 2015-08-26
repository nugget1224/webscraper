# Loads rvest library for use, needs package installed beforehand.
library(rvest)

# Gets raw HTML file from site
url <- html("http://www.big12sports.com/ViewContent.dbml?CONTENT_ID=965464&DB_OEM_ID=10410#GAME.PLY")

# Pulling the PBP data out
selector_name <- "pre:nth-child(35)"
PBP <- html_node(url, selector_name) %>%
  html_text()