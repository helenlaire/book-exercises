# Exercise 5: dplyr grouped operations

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
install.packages("nycflights13")  # should be done already
library("nycflights13")
library("dplyr")

View(flights)

# What was the average departure delay in each month?
dep_delay_by_month <- flights %>% 
  group_by(month) %>% 
  #filter(is.na(dep_delay))

  summarize(
    delay = mean(dep_delay, na.rm = TRUE)
    
    #remoe all na values 
  )

  View(dep_delay_by_month)
# Save this as a data frame `dep_delay_by_month`
# Hint: you'll have to perform a grouping operation then summarizing your data


# Which month had the greatest average departure delay?
dep_delay_by_month %>% 
  filter(delay == max(delay)) %>% 
  select(month)

# If your above data frame contains just two columns (e.g., "month", and "delay"
# in that order), you can create a scatterplot by passing that data frame to the
# `plot()` function

plot(dep_delay_by_month)


# To which destinations were the average arrival delays the highest?
# Hint: you'll have to perform a grouping operation then summarize your data
# You can use the `head()` function to view just the first few rows
arrival_delay_dest <- flights %>% 
  group_by(dest) %>% 
  summarise(avg_delay = mean(arr_delay,na.rm = TRUE))%>% 
  arrange(-avg_delay)

View(arrival_delay_dest)

head(arrival_delay_dest)
  
# You can look up these airports in the `airports` data frame!
View(airports)
filter(airports, faa == arrival_delay_dest$dest)
# Which city was flown to with the highest average speed?
highest_speed_city <- flights %>% 
  mutate(speed = distance/air_time) %>% 
  group_by(dest) %>% 
  summarise(avg_speed = mean(speed, na.rm = TRUE)) %>% 
  filter(avg_speed == max(avg_speed, na.rm = TRUE))
highest_speed_city
