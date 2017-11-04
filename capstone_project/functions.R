#setwd("/home/braian/coursera/datasciencecoursera_github/capstone_project")
library(tm)
library(tokenizers)

sample_text_file <- function(file_name,n_lines=NA,p = 1){
  sample_file = character()
  sample_i = 1
  con <- file(file_name, "r") 
  
  ## Read the lines until it reaches the end of the file or the number of lines n_lines 
  i = 1
  repeat {
    line <- readLines(con, 1)
    # file reached its end
    if (length(line) == 0){
      break
    } else {
      # number of lines reached
      if (!is.na(n_lines)){
        if (i > n_lines){
          break
        }
      }
      coinflip <- rbinom(1,1,prob = p)
      if(coinflip == 1){
        #save line
        sample_file[sample_i] = line
        sample_i = sample_i + 1
      }
      i = i + 1
    }
  }
  close(con)
  sample_file
}


#Profanity filtering - removing profanity and other words you do not want to predict.
profanity_filter <- function(tokenized_text, word_list) {
  #TODO
}

# create samples for en_US files
create_en_US_samples <- function(prob){
  en_US.blogs.sample <- sample_text_file("final/en_US/en_US.blogs.txt",NA,prob)
  en_US.news.sample <- sample_text_file("final/en_US/en_US.news.txt",NA,prob)
  en_US.twitter.sample <- sample_text_file("final/en_US/en_US.twitter.txt",NA,prob)
  
  #save files to be able recreate the samples without reading the full texts again
  fileConn<-file("sample/en_US/en_US.blogs.txt")
  writeLines(en_US.blogs.sample, fileConn)
  close(fileConn)
  
  fileConn<-file("sample/en_US/en_US.news.txt")
  writeLines(en_US.news.sample, fileConn)
  close(fileConn)
  
  fileConn<-file("sample/en_US/en_US.twitter.txt")
  writeLines(en_US.twitter.sample, fileConn)
  close(fileConn)
}
