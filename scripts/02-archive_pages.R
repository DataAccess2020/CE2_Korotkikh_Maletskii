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

# Downloading the pages ----
counter = 1  # it is used to save the page with its own number
for (i in 1:47) {
  for (j in 1:length(archive_links[[i]])) {
    grillo_page <- RCurl::getURL(url = archive_links[[i]][j],  httpheader= (user_id))
    download.file(url = archive_links[[i]][j], destfile = here::here('pages', str_c('page_', counter, '.html')))
    counter = counter + 1
    Sys.sleep(0.5)
  }
}

# Extracting the main text from the pages ----
main_texts <- vector(mode = 'list', length = 470)
for (i in 1:470) {
  main_texts[[i]] <- rvest::read_html(here::here('pages', str_c('page_', i, '.html'))) %>% 
    html_elements(css = "p") %>% 
    html_text()
}
