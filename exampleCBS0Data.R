# Een hele handige package voor het downloaden van CBS data.
# GITHUB: https://github.com/edwindj/cbsodataR
# DOCUMENTATION: https://cran.r-project.org/web/packages/cbsodataR/cbsodataR.pdf

# Load and install dependencies
install.packages("cbsodataR")
install.packages("dplyr")
# na error message
install.packages('curl')

library("cbsodataR")
library("dplyr")
library("curl")
# get list of dutch CBS tables
tables_nl <- get_table_list(Language="nl")
View(tables_nl)
head(tables_nl)

# get list of all dutch themes from the Catalog "CBS"
themes_nl <- get_themes(Language="nl", Catalog="CBS")
View(themes_nl)

# Meta info about package
# doodoorzaken:
m81452 <- get_meta('81452NED')
# Bevolking:
m7461 <-  get_meta('7461bev')
# BelDO:
m80202 <- get_meta('80202ned')
# verkeersdoden provincie:
m71426 <- get_meta('71426ned')
# verkeersdoden deelname:
m71936 <- get_meta('71936ned')
  
#  get_meta('')

# Get the data (Doodsoorzaken)
Doodsoorzaken <- get_data('81452NED')
head(Doodsoorzaken)

Bevolking <- get_data('7461bev')
head(Bevolking)

BelDO <- get_data('80202ned')
head(BelDO)

VD_prov <- get_data('71426ned')
head(VD_prov)

VD_deelname <- get_data('71936ned')
head(VD_deelname)

# Direct save in folder 'data/doodsoorzaken'
# default is C:\Users\Bos_n\AppData\Local\Temp\RtmpE1KXDI
# geef dus ook een pad op
# get_data('81452NED', dir='data/doodsoorzaken')
get_data('81452NED', dir='C:/Users/niels/git/cbso/data/Doodsoorzaken')
get_data('7461bev',  dir='C:/Users/niels/git/cbso/data/Bevolking')
get_data('80202ned', dir='C:/Users/niels/git/cbso/data/BelDO')
get_data('71426ned', dir='C:/Users/niels/git/cbso/data/VD_prov')
get_data('71936ned', dir='C:/Users/niels/git/cbso/data/VD_deelname')



tables_nl2 <- get_table_list(Updated='2014-02-04T02:00:00')

tables_nl %>% 
  select(Updated, Identifier, ShortTitle) %>% 
  head 
names(m81452)

download_table(id="7461bev", dir='C:/R/data/Bevolking_downl', cache=TRUE)
