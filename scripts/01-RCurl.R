# Loading packages ----
library(tidyverse)

# Loading the page ----
rcurl_url <- 'https://beppegrillo.it/un-mare-di-plastica-ci-sommergera/'
rcurl_page <- RCurl::getURL(url = rcurl_url)

# Getting the links ----
links <- XML::getHTMLLinks(rcurl_page)
links_filtered <- stringr::str_subset(links, pattern = '^https://beppegrillo\\.it[[:graph:]]') %>% unique()
