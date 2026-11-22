install.packages(c("glue","tidyverse","haven","assertthat","huxtable","data.table","hms","lubridate","pharmaRTF"))



library(glue)
library(tidyverse)
library(haven)
library(assertthat)
library(huxtable)
library(data.table)
library(hms)
library(lubridate)
library(pharmaRTF)

# read input datasets -----------------------------------------------------
demog02 <- demog

ipadmin01 <- ipadmin
eos01 <- eos
enrl01 <- enrlment


# studyid,usubjid,Race


demog3 <-demog02 |>mutate( 
                          STUDYID=study,
                          USUBJID=paste(study,pt,sep="-"),
                          SEX1 = case_when(
                                            sex == "Female" ~ "F",
                                            sex == "Male"   ~ "M",
                                            TRUE           ~ NA_character_
                                          ),
                           ETHINCITY=ethnic,
                           RACE0=race
                            ) |> select(-c(sex,race)) |> rename(SEX=SEX1) 
                           
                         
                 



                                                
                            