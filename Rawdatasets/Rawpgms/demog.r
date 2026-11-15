
install.packages("tidyverse")
install.packages("haven")
library(tidyverse)
library(haven)


demog<-tribble(
  ~study,~pt,~sex,~ethnic,~race,~race2,~race3,~race4,~racesp,~age_raw,~age_rawu,~brthdt_raw,~country,
  "CSG001","1001","Male","Hispanic or Latino","White","","","","","35","Years","","USA",
  "CSG001","1002","Female","Not Hispanic or Latino","Asian","American Indian or Alaska Native","","","","40","Years","","USA",
  "CSG001","1003","Male","Hispanic or Latino","Other","","","","BRAZILIAN","40","Years","","USA",
  "CSG001","1004","Male","Hispanic or Latino","White","","","","","38","Years","","USA",
  "CSG001","1005","Male","Not Hispanic or Latino","American Indian or Alaska Native","","","","","64","Years","","USA",
  "CSG001","1006","Female","Not Hispanic or Latino","Native Hawaiian or Other Pacific Islander","","","","","75","Years","","USA",
  "CSG001","1007","Male","Not Hispanic or Latino","Unknown","","","","","32","Years","","USA",
  "CSG001","1008","Female","Not Hispanic or Latino","Not Reported","","","","","83","Years","","USA",
)

