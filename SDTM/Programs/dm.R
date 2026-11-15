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