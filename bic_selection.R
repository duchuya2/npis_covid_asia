library(performance)
bic <- function(model){
  fix2 <- performance(model)
  x<- as.character(substitute(model))
  fix2 <- fix2 %>% 
    mutate( npi = x)
}