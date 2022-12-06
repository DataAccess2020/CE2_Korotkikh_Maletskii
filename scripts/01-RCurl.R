# Loading packages ----
library(tidyverse)
library(stringr)

# Loading the page ----
rcurl_url <- 'https://beppegrillo.it/un-mare-di-plastica-ci-sommergera/'
email <- "wiscain@yandex.ru"
agent <- R.Version()$version.string
user_id <- c(From = email, `User-Agent` = agent)
rcurl_page <- RCurl::getURL(url = rcurl_url,  httpheader= (user_id))

# Getting the links ----
links <- XML::getHTMLLinks(rcurl_page)
links_filtered <- stringr::str_subset(links, pattern = '^https://beppegrillo\\.it[[:graph:]]') %>% unique()

# It is pointless to further filtering with the help of regexps
# because the list consists of only 28 links and it is to hard to create a search pattern
# as there are some links with just names and again should be subset manually even with regexps
# for example : "https://beppegrillo.it/cookie-policy/" or "https://beppegrillo.it/grilloteca/" (which actually is a part of "categories" of the website)

links_filtered_2 = as_data_frame(links_filtered)
links_filtered_final = links_filtered_2[c(18,19,21,22,23,24,25,26,27), ]
