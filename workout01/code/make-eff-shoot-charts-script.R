
###Creates Effective Shooting Percentage Tables using Shots-Data

#Imports shots data, only reads columns "shot_type", "shot_made_flag"
# and "name"
setwd("~/Desktop/hw-stat133/workout01/data")
library("dplyr")
dat <- read.csv("./shots-data.csv", header=T,
                col.names = c("NULL", "NULL", "NULL", "NULL",
                              "NULL", "NULL", "NULL", "made",
                              "NULL", "type", "NULL", "NULL",
                              "NULL", "NULL", "name", "NULL"),
                colClasses = c("NULL", "NULL", "NULL", "NULL",
                               "NULL", "NULL", "NULL", "character",
                               "NULL", "character", "NULL", "NULL",
                               "NULL", "NULL", "factor", "NULL"))

#Cleans shots-data table: reorders columns, converts column made 
# into integers
dat <- select(dat, c("name", "made", "type"))
dat <- as.data.frame(dat)
dat[dat$made=="shot_yes", "made"] <- 1
dat[dat$made=="shot_no", "made"] <- 0
dat$made <- as.integer(dat$made)
summary(dat)

#Creates 3 summary tables of shooting data grouped by player, 
#one table each for 2PT, 3PT, and both
two_pt <- filter(dat, type == "2PT Field Goal")
three_pt <- filter(dat, type == "3PT Field Goal")

eff_shoot_2pt <- two_pt %>% group_by(name) %>% summarise(total = length(type), made = sum(made), perc_made = 100*made/total) %>% arrange(desc(perc_made))
eff_shoot_3pt <- three_pt %>% group_by(name) %>% summarise(total = length(type), made = sum(made), perc_made = 100*made/total) %>% arrange(desc(perc_made))
eff_shoot_combined <- dat %>% group_by(name) %>% summarise(total = length(type), made = sum(made), perc_made = 100*made/total) %>% arrange(desc(perc_made))

##Creates table including points earned 
eff_two_three <- merge(eff_shoot_2pt, eff_shoot_3pt, by = "name", type = "left")
points_earned <- eff_two_three %>%  
  mutate(points_earned = made.x*2 + made.y*3, total = total.x + total.y) %>% 
  arrange(desc(points_earned))

##Outputs png file of barplot of percent made arranged by player 
##using data from eff_shoot_combined
png("../images/perc-made.png", units = "in", res = 300, width = 8, height = 7)
eff_shoot_combined %>% arrange(desc(perc_made)) %>%
  mutate(name = factor(name, levels = name)) %>%
  ggplot(aes(x = name, y = perc_made))+ 
  geom_bar(stat = "identity", color = "black", fill = c("#12233c", "#244369", "#096887", "#008989", "#97a4b2")) + 
  ylab("Percent of Shots Made") + xlab(" ") +
  theme(axis.text.x = element_text(face = "bold", size = 10))
dev.off()

##Outputs png file of earned points barplot arranged by player 
##using data from points_earned table
png("../images/points-earned.png", units = "in", res = 300, width = 8, height = 7)
points_earned %>% ggplot(aes(x = name)) %>%
  geom_bar(aes(y = points_earned), stat = "identity", color = "black", 
           fill = c("#652e05", "#b1511d", "#dc9051", "#efcf82", "#1e5213")) + 
  geom_point(aes(y = total), stat = "identity", shape = 23, fill = "#FC0FC0", size = 5) +
  ylab("Total Points Earned") + xlab(" ") + 
  theme(axis.text.x = element_text(face = "bold", size = 3))
dev.off()
