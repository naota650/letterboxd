install.packages("readr")
library(readr)
library(lubridate)
library(dplyr)
movies <- read_csv("diary.csv")
m1<- arrange(movies, desc(Date))
m2 <- arrange(movies, desc(Name))
m3 <- arrange(movies, desc(Rating))

#count # of 5/5 movies i've rated
sum(movies$Rating >= 5, na.rm = TRUE)
#average score of movies i've watched
mean(movies$Rating, na.rm = TRUE)

m4 <- m3
december <- m4 %>%
  filter(month(`Watched Date`) == 12)
january <- m4 %>%
  filter(month(`Watched Date`) == 1)

m5 <- m4 %>%
  group_by(month = month(`Watched Date`)) %>%
  summarize(avg_rating = mean(Rating, na.rm=TRUE)) %>%
  mutate(month = month.name[month])

save.image(file= "my_env.RData")

write.csv(january, "january.csv", row.names=FALSE)
