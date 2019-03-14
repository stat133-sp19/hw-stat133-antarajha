## ---------------------------
#Title: Data for NBA shots
#Description: This script will import all the data that will be required for the visualization phase. 
#It will also group the data and prepare it better for analysis. 
#It will create the tables needed for final visualization purposes.
# Input: the data about each NBA player
#Output: Summaries and combined tables for all players, which are readu to be used for visualization purposes
## ---------------------------

#Reading in the data

setwd("/Users/antarajha/Desktop/hw-stat133/workout01/data")

curry <- read.csv("/Users/antarajha/Desktop/workout01/data/stephen-curry.csv", stringsAsFactors = FALSE, header = TRUE)
iguodala = read.csv("/Users/antarajha/Desktop/workout01/data/andre-iguodala.csv", stringsAsFactors = FALSE, header = TRUE)
green = read.csv("/Users/antarajha/Desktop/workout01/data/draymond-green.csv", stringsAsFactors = FALSE, header = TRUE)
durant = read.csv("/Users/antarajha/Desktop/workout01/data/kevin-durant.csv", stringsAsFactors = FALSE, header = TRUE)
thompson = read.csv("/Users/antarajha/Desktop/workout01/data/klay-thompson.csv", stringsAsFactors = FALSE, header = TRUE)

#Create vector with player names
player_names = c("curry", "iguodala", "green", "durant", "thompson")

#Adding 'name' column
curry$name = c(rep("Stephen Curry", nrow(curry)))
iguodala$name = c(rep("Andre Iguodala", nrow(iguodala)))
green$name = c(rep("Graymond Green", nrow(green)))
durant$name = c(rep("Kevin Durant", nrow(durant)))
thompson$name = c(rep("Klay Thompson", nrow(thompson)))

#Making values of shot_made_flag more descriptive 
curry$shot_made_flag[curry$shot_made_flag == 'n'] = "shot_no"
curry$shot_made_flag[curry$shot_made_flag == 'y'] = "shot_yes"

iguodala$shot_made_flag[iguodala$shot_made_flag == 'n'] = "shot_no"
iguodala$shot_made_flag[iguodala$shot_made_flag == 'y'] = "shot_yes"

green$shot_made_flag[green$shot_made_flag == 'n'] = "shot_no"
green$shot_made_flag[green$shot_made_flag == 'y'] = "shot_yes"

durant$shot_made_flag[durant$shot_made_flag == 'n'] = "shot_no"
durant$shot_made_flag[durant$shot_made_flag == 'y'] = "shot_yes"

thompson$shot_made_flag[thompson$shot_made_flag == 'n'] = "shot_no"
thompson$shot_made_flag[thompson$shot_made_flag == 'y'] = "shot_yes"

#Creating minute column that contains the minute number where a shot occurred
curry$minute = curry$period*12 - curry$minutes_remaining
iguodala$minute = iguodala$period*12 - iguodala$minutes_remaining
green$minute = green$period*12 - green$minutes_remaining
thompson$minute = thompson$period*12 - thompson$minutes_remaining
durant$minute = durant$period*12 - durant$minutes_remaining

#Use sink() to send the summary() output of each imported data frame into individuals text files
setwd("../output")

sink("stephen-curry-summary.txt")
summary(curry)
sink()

sink("andre-iguodala-summary.txt")
summary(curry)
sink()

sink("kevin-durant-summary.txt")
summary(curry)
sink()

sink("graymond-green-summary.txt")
summary(curry)
sink()

sink("klay-thompson-summary.txt")
summary(curry)
sink()

#stack the tables into one single data frame
setwd("../data")

shots_table = rbind(iguodala, thompson, green, curry, durant)
shots_table
write.csv(shots_table, file = "shots_data.csv")

#send summary through sink
setwd("../output")

sink("shots-data-summary.txt")
summary(shots_table)
sink()