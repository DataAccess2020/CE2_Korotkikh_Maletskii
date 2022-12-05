# Loading packages ----
library(httr)
library(rvest)

# Putting pages into a list ----
archive_url <- 'https://beppegrillo.it/category/archivio/2016/'
archive_links <- vector(mode = 'list', length = 47)
for (i in 1:47) {
  link <- str_c('https://beppegrillo.it/category/archivio/2016/', 'page/', i)
  page <- read_html(link)
  archive_links[[i]] <- html_attr(html_nodes(page, '.td_module_10 a'), 'href') %>% unique()
}

# session <- rvest::session(link,
#                           add_headers(
#                             From = email, 
#                             `User-Agent` = user_agent
#                           )
# )
