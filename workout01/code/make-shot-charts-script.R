
###Creates shot charts depicting where players attempted shots on court

##Imports court image from class github repository
library(jpeg)
library(grid)
library(ggplot2)
setwd("~/Desktop/hw-stat133/workout01/code")
court_file <- "../images/court_f.jpeg"
court_image <- rasterGrob(readJPEG(court_file), width = unit(1, "npc"), 
                           height = unit(1, "npc"))

##Imports shots-data table 
dat <- read.csv("../data/shots-data.csv")

##Filters conbined table into data for each player selects only 
## columns: "x", "y", and "shot_made_flag"
klay <- dat[dat$name=="Klay Thompson", c("x", "y", "shot_made_flag")]
draymond <- dat[dat$name=="Draymond Green", c("x", "y", "shot_made_flag")]
curry <- dat[dat$name=="Stephen Curry", c("x", "y", "shot_made_flag")]
kevin <- dat[dat$name=="Kevin Durant", c("x", "y", "shot_made_flag")]
andre <- dat[dat$name=="Andre Iguodala", c("x", "y", "shot_made_flag")]

##Creates shot chart for each player using filtered tables above, 
##outputs pdf of chart into images directory
pdf("../images/draymond-green-shot-chart.pdf", width = 6.5, height = 5)
ggplot(data = draymond) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') + theme_minimal()
dev.off()

pdf("../images/andre-iguodala-shot-chart.pdf", width = 6.5, height = 5)
ggplot(data = andre) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') + theme_minimal()
dev.off()

pdf("../images/klay-thompson-shot-chart.pdf", width = 6.5, height = 5)
ggplot(data = klay) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') + theme_minimal()
dev.off()

pdf("../images/steph-curry-shot-chart.pdf", width = 6.5, height = 5)
ggplot(data = curry) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') + theme_minimal()
dev.off()

pdf("../images/kevin-durant-shot-chart.pdf", width = 6.5, height = 5)
ggplot(data = kevin) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') + theme_minimal()
dev.off()

pdf("../images/gsw-shot-charts.pdf", width = 8, height = 7)
ggplot(data = dat[, c("name", "x", "y", "shot_made_flag")]) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Charts: GSW (2016 season)') + facet_wrap(. ~ name) + theme_minimal()
dev.off()

##Uses entire player data to line up shot charts of each player,
##outputs png of charts into images directory
png("../images/gsw-shot-chart.png",  units = "in", res = 300, width = 8, height = 7)
ggplot(data = dat[, c("name", "x", "y", "shot_made_flag")]) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Charts: GSW (2016 season)') + facet_wrap(. ~ name) + theme_minimal()
dev.off()

##Uses entire player data to line up shot charts of Andre vs Klay,
##outputs png of charts into images directory
png("../images/andre_klay_charts.png",  units = "in", res = 300, width = 7, height = 5)
ggplot(data = dat[dat$name == c("Andre Iguodala", "Klay Thompson"), c("name", "x", "y", "shot_made_flag")]) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + facet_wrap(. ~ name) + theme_minimal()
dev.off()


