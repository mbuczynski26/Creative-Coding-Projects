# make df

birthday_data <-  read.table(header = T, text = '
name         birthday
Chrissy_S    Feb_12
Dad          Feb_12
Mom          Sept_01
Magda_N      Sept_23
Hannah_W     Sept_2
Micaela_R    Mar_6
Ryan_H       Feb_13
Sarah_H      Feb_13
Christina_S  Mar_29
Elizabeth_H  May_11
Morgan_J     Aug_21
Tia_Q        Apr_21
Myrissa_D    Oct_13
Maria_B      Mar_31
Tressa_H     Jan_6
Elizabeth_E  Sept_18

')

# convert df to tibble - organization is easier in my opinion in a df vs. a tibble when creating a dataset from scratch 

library(tidyverse)

birthday_data_tb <- as_tibble(birthday_data) 

# check if stored as tibble

is_tibble(birthday_data_tb)

# run loop 

for (i in 1:dim(birthday_data_tb)[1]) {
  if(birthday_data_tb$birthday[i] == "Feb_12") {
    print(birthday_data_tb$name[i])
  }
}

