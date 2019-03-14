## ---------------------------
#Title: Charts for NBA player shots
#Description: This script will create all the charts necessary for the final report.
#Input:
#Output:
## ---------------------------

library(ggplot2)
library(jpeg)
library(grid)

# court image (to be used as background of plot)
court_file <- "/Users/antarajha/Desktop/hw-stat133/workout01/images/nba-court.jpg"
# create raste object
court_image <- rasterGrob( readJPEG(court_file), width = unit(1, "npc"), height = unit(1, "npc"))

# 4.1) shot charts with court background
setwd("/Users/antarajha/Desktop/hw-stat133/workout01/images")

#andre
andre_iguodala_shot_chart <- ggplot(data = iguodala) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') + theme_minimal()
andre_iguodala_shot_chart

ggsave("andre_iguodala_shot_chart.pdf", width = 6.5, height = 5)

#green
draymond_green_shot_chart = ggplot(data = green) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') + theme_minimal()
draymond_green_shot_chart

ggsave("draymond_green_shot_chart.pdf", width = 6.5, height = 5)

#durant
kevin_durant_shot_chart = ggplot(data = durant) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') + theme_minimal()
kevin_durant_shot_chart

ggsave("kevin_durant_shot_chart.pdf", width = 6.5, height = 5)

#thompson
klay_thompson_shot_chart = ggplot(data = thompson) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') + theme_minimal()
klay_thompson_shot_chart

ggsave("klay_thompson_shot_chart.pdf", width = 6.5, height = 5)

#curry
stephen_curry_shot_chart = ggplot(data = curry) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') + theme_minimal()
stephen_curry_shot_chart

ggsave("stephen_curry_shot_chart.pdf", width = 6.5, height = 5)

#4.2) Faceting
setwd("/Users/antarajha/Desktop/hw-stat133/workout01/images")
gsw_shots_chart = ggplot(data = shots_table) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) + ggtitle('Shot Charts: GSW (2016 season)') + theme_minimal() + facet_wrap(~ name, ncol = 3)
gsw_shots_chart
ggsave("gsw_shots_chart.pdf", width = 8 , height = 7 )
ggsave("gsw_shots_chart.png", width = 8, height = 7)

