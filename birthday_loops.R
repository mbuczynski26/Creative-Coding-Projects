# make df

birthday_data <-  read.table(header = T, text = '
name         birthday
Chrissy_S    Feb_12
Dad          Feb_12
Mom          Sep_01
Magda_N      Sep_23
Hannah_W     Sep_2
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
Elizabeth_E  Sep_18
Dana_M       Apr_22
Hannah_S     May_20
  
                             ')


# run today's date and choose format 

today_sys <- Sys.Date() # assign today's date to the variable "today" 
today <- format(today_sys, format = "%b_%d")  # adjust date format 

# loop that indicates name of person who has a birthday today.  No response is generated if no birthday occurs today

  for (i in 1:dim(birthday_data)[1]) {               # for each iteration for rows 1 through x; x being the automatic calculation of the number of rows (minus the header)  
    if(birthday_data$birthday[i] == today) {        # if the value in the "birthday" column is equal to the value of "today" 
      print(birthday_data$name[i])                   # then the returned value will be the value in the "name" column that is associated with the ith observation from if the statement in the line above is TRUE  
    }                                                  
  }


# run all days that are 2 weeks from today

pre_two_weeks_sys <- c(today_sys + 14, 
                   today_sys + 13, 
                   today_sys + 12, 
                   today_sys + 11,
                   today_sys + 10,
                   today_sys + 9, 
                   today_sys + 8, 
                   today_sys + 7, 
                   today_sys + 6, 
                   today_sys + 5, 
                   today_sys + 4, 
                   today_sys + 3, 
                   today_sys + 2, 
                   today_sys + 1)


pre_two_weeks <- format(pre_two_weeks_sys, format = "%b_%d") # adjust data format

pre_two_weeks # view all dates that occur two weeks from today

# create function that indicates if anyone has birthday two weeks from today  

pre_birthday_two_weeks <- function(pre_two_weeks){
  for (i in 1:dim(birthday_data)[1]) {               # for each iteration for rows 1 through x; x being the automatic calculation of the number of rows (minus the header)  
    if(birthday_data$birthday[i] == pre_two_weeks) {        # if the value in the "birthday" column is equal to the value of "today" 
      print(birthday_data$name[i])            # then the returned value will be the value in the "name" column that is associated with the ith observation from if the statement in the line above is TRUE 
        }     
  }
}

# run function 
# - if receive only NULL, nobody's birthday is in two weeks 
# - if receive name, that is the name of the person who has birthday in two weeks

unlist(lapply(pre_two_weeks, FUN = pre_birthday_two_weeks))


# - if we want to search for when within the next two weeks that person has birthday, we can use a pipe 

# load library 

library(dplyr)

birthday_data %>% 
  filter(name == "NAME") # where NAME is the name of the person





