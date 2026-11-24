install.packages(c("glue","tidyverse","haven","assertthat","huxtable","data.table","hms","lubridate","pharmaRTF","admiral"))



library(glue)
library(tidyverse)
library(haven)
library(assertthat)
library(huxtable)
library(data.table)
library(hms)
library(lubridate)
library(pharmaRTF)
library(admiral)

# read input datasets -----------------------------------------------------
demog02 <- demog

ipadmin01 <- ipadmin
eos01 <- eos
enrl01 <- enrlment


# studyid,usubjid,Race

demog3 <-demog02 |>admiral::convert_blanks_to_na() |> 
         mutate( 
                DOMAIN="DM",
                SITEID=substr(pt,1,2),
                STUDYID=study,
                USUBJID=paste(study,pt,sep="-"),
                SEX1 = case_when(
                                 sex == "Female" ~ "F",
                                 sex == "Male"   ~ "M",
                                 TRUE            ~ NA_character_
                                ),
                ETHINCITY=ethnic,
                AGE=ifelse(!is.na(age_raw),as.integer(age_raw),NA_integer_),
                AGEU=toupper(age_rawu),
                RACE0=race) |> 
                select(-c(sex,race)) |> 
                rename(SEX=SEX1) |> 
          mutate(
                RACEOTH=ifelse(!is.na(racesp),racesp,NA_character_)
                )


rficdtc0 <-enrl01 |>convert_blanks_to_na() |> 
     mutate( 
                DOMAIN="DM",
                SITEID=substr(pt,1,2),
                STUDYID=study,
                USUBJID=paste(study,pt,sep="-"),
                RFICDTC=ifelse(!is.na(icdt_raw),format_ISO8601(as_date(icdt_raw,format ="%d/%m/%Y" )),NA_character_ ),
                ENRLDTC=ifelse(!is.na(enrldt_raw),format_ISO8601(as_date(enrldt_raw,format ="%d/%m/%Y" )),NA_character_ ),
                RANDDTC=ifelse(!is.na(randdt_raw),format_ISO8601(as_date(randdt_raw,format ="%d/%m/%Y" )),NA_character_ )
                
           ) |> select(USUBJID,RFICDTC,RANDDTC,ENRLDTC)

rfpendt <- eos |> convert_blanks_to_na() |> 
     mutate(USUBJID=paste0(study,"-",pt)
 
           )
                     
                         



                                                
                            