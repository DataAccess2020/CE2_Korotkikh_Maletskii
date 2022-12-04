# Loading packages ----
library(tidyverse)

# Loading the page ----
rcurl_url <- 'https://beppegrillo.it/un-mare-di-plastica-ci-sommergera/'
email <- "wiscain@yandex.ru"
agent <- R.Version()$version.string
user_id <- c(From = email, `User-Agent` = agent)
rcurl_page <- RCurl::getURL(url = rcurl_url,  httpheader= (user_id))

# Getting the links ----
links <- XML::getHTMLLinks(rcurl_page)
links_filtered <- stringr::str_subset(links, pattern = '^https://beppegrillo\\.it[[:graph:]]') %>% unique()
