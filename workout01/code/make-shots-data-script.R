
###Script for Shots Data
# Combines separate player tables, modifies their contents 
# Inputs csv files of separated player data, outputs cleaned tables, 
# and text files of table summaries


##Reads in downloaded csv files containing separate player data
setwd("~/Desktop/hw-stat133/workout01/code")
curry <- read.csv("../data/steph.csv", stringsAsFactors = FALSE, header = T,
                  colClasses = c("character", "character", "real", "real", "real", "real",
                                 "character", "character", "factor", "real", "character",
                                 "double", "double"))
green <- read.csv("../data/draymond.csv", stringsAsFactors = FALSE, header = T,
                  colClasses = c("character", "character", "real", "real", "real", "real",
                                 "character", "character", "factor", "real", "character",
                                 "double", "double"))
thompson <- read.csv("../data/klay.csv", stringsAsFactors = FALSE, header = T,
                     colClasses = c("character", "character", "real", "real", "real", "real",
                                    "character", "character", "factor", "real", "character",
                                    "double", "double"))
iguodala <- read.csv("../data/andre.csv", stringsAsFactors = FALSE, header = T,
                     colClasses = c("character", "character", "real", "real", "real", "real",
                                    "character", "character", "factor", "real", "character",
                                    "double", "double"))
durant <- read.csv("../data/kevin.csv", stringsAsFactors = FALSE, header = T,
                   colClasses = c("character", "character", "real", "real", "real", "real",
                                  "character", "character", "factor", "real", "character",
                                  "double", "double"))

##Add column for player name to each table
curry$name <- rep("Stephen Curry", nrow(curry))
green$name <- rep("Draymond Green", nrow(green))
iguodala$name <- rep("Andre Iguodala", nrow(iguodala))
thompson$name <- rep("Klay Thompson", nrow(thompson))
durant$name <- rep("Kevin Durant", nrow(durant))

##Change "shot_made_flag" column values from "y/n" to 
## "shot_yes/shot_no" in each table
curry$shot_made_flag <- factor(curry$shot_made_flag,
                               levels = c("y","n"),
                               labels = c("shot_yes", "shot_no"))
green$shot_made_flag <- factor(green$shot_made_flag,
                               levels = c("y","n"),
                               labels = c("shot_yes", "shot_no"))
durant$shot_made_flag <- factor(durant$shot_made_flag,
                               levels = c("y","n"),
                               labels = c("shot_yes", "shot_no"))
iguodala$shot_made_flag <- factor(iguodala$shot_made_flag,
                               levels = c("y","n"),
                               labels = c("shot_yes", "shot_no"))
thompson$shot_made_flag <- factor(thompson$shot_made_flag,
                               levels = c("y","n"),
                               labels = c("shot_yes", "shot_no"))

##Convert minutes_remaining column from min remaining in period
# to minutes elapsed during entire game
curry$minute <- (curry$period - 1)*12 + (12 - curry$minutes_remaining)
durant$minute <- (durant$period - 1)*12 + (12 - durant$minutes_remaining)
iguodala$minute <- (iguodala$period - 1)*12 + (12 - iguodala$minutes_remaining)
thompson$minute <- (thompson$period)*12 + (12 - thompson$minutes_remaining)
green$minute <- (green$period - 1)*12 + (12 - green$minutes_remaining)

##Sinks a txt file of player table summaries to output folder in 
##project repository for each table
sink("../output/stephen-curry-summary.txt")
summary(curry)
sink()
sink("../output/klay-thompson-summary.txt")
summary(curry)
sink()
sink("../output/kevin-durant-summary.txt")
summary(curry)
sink()
sink("../output/draymond-green-summary.txt")
summary(curry)
sink()
sink("../output/andre-iguodala-summary.txt")
summary(curry)
sink()

##Combines shot data from all players into one table, 
##writes it into data directory of project as a csv file
shots_data <- rbind(curry, green, iguodala, thompson, durant)
write.csv(rbind(curry, green, iguodala, thompson, durant), "../data/shots-data.csv")

##Sinks txt file of the combined data into output folder
sink("../output/shots-data-summary.txt")
summary(shots_data)
sink()
