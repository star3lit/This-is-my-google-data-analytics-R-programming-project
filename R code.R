install.packages(tidyverse) ## loading packages
library(tidyverse)
library(readr)
dailyActivity_csv <- read_csv("C:/Users/starl/Desktop/GOOGLE DATA ANALYTICS/dailyActivity_csv.csv") ## Importing datasets
sleepDay_csv <- read_csv("C:/Users/starl/Desktop/GOOGLE DATA ANALYTICS/sleepDay_csv.csv")
hourlyCalories_csv <- read_csv("C:/Users/starl/Desktop/GOOGLE DATA ANALYTICS/hourlyCalories_csv.csv")
View(dailyActivity_csv)
View(sleepDay_csv)
View(hourlyCalories_csv)
head(dailyActivity_csv) ## Exploring daily activity dataset
colnames(dailyActivity_csv) 
nrow(dailyActivity_csv)
head(sleepDay_csv) ##Exploring sleep day dataset
colnames(sleepDay_csv)
nrow(sleepDay_csv)
head(hourlyCalories_csv) ##exploring hourly calories dataset
colnames(hourlyCalories_csv)
nrow(hourlyCalories_csv)
n_distinct(dailyActivity_csv $ Id) ## No. of participants in each dataset
n_distinct(sleepDay_csv $ Id)
n_distinct(hourlyCalories_csv $ Id)
which(!complete.cases(dailyActivity_csv)) ##Data cleaning 
which(!complete.cases(sleepDay_csv))
which(!complete.cases(hourlyCalories_csv ))## NA values and removing if exist
## Summary statistics of datasets
dailyActivity_csv %>%  
  select(TotalSteps,
         TotalDistance,
         SedentaryMinutes,
         Calories) %>%
  summary()
sleepDay_csv %>%  
  select(TotalSleepRecords,
         TotalMinutesAsleep,
         TotalTimeInBed) %>%
  summary()
hourlyCalories_csv %>% 
  select(ActivityHour,
         Calories) %>% 
  summary()
##Visualization
ggplot(data=dailyActivity_csv, 
       aes(x=TotalSteps, y=SedentaryMinutes)) + geom_point() + labs(title="Total steps vs. sedentary minutes")
combined_data <- merge(sleepDay_csv, dailyActivity_csv, by="Id")
n_distinct(combined_data $ Id)
ggplot(data=sleepDay_csv, 
       aes(x=TotalMinutesAsleep, y=TotalTimeInBed)) + geom_point() + geom_smooth() + labs(title="Total minutes asleep vs. total time in bed")
ggplot(dailyActivity_csv, 
       aes(x=TotalSteps, y=Calories)) + geom_point() + geom_smooth() + labs(title="TotalStep vs. calories")
# Create boxplots
ggplot(aes(x=TotalSleepRecords , y= TotalTimeInBed, fill = TotalSleepRecords), data = sleepDay_csv) + geom_boxplot(alpha=0.3) +
  theme(legend.position="none")