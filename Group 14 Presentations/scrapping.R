#this codes uses web crawling concept to scrap data sets from websites
#libraries needed
library(rvest)
library(dplyr)
library(purrr)
#fetching url
url_base<-"http://www.cochranelibrary.com/cochrane-database-of-systematic-reviews/table-of-contents/2004/Issue%d/"
#getting the html content in the url and converting it into a data frame
map_df(1:4,function(i){
  page<-read_html(sprintf(url_base,i))
  data.frame(IssueID=html_text(html_nodes(page,".results-block__toc-issue-heading")),
             Heading=html_text(html_nodes(page,".mainTitle")),
             Author=html_text(html_nodes(page,".results-block__author")),
             DOI=html_text(html_nodes(page,".results-block__doi"))
             )
})->conc