# Exercise 6: dplyr join operations

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library("nycflights13")
library("dplyr")

# Create a dataframe of the average arrival delays for each _destination_, then 
# use `left_join()` to join on the "airports" dataframe, which has the airport
# information
# Which airport had the largest average arrival delay?
largest_avg_arr_delay <- flights %>%
  group_by(dest) %>% 
  summarize(avg_arr_delay = mean(arr_delay, na.rm = TRUE)) %>% 
  mutate(faa = dest) %>% 
  left_join(airports, by = "faa") %>% 
  filter(avg_arr_delay == max(avg_arr_delay, na.rm = TRUE))
largest_avg_arr_delay
# Create a dataframe of the average arrival delay for each _airline_, then use
# `left_join()` to join on the "airlines" dataframe
# Which airline had the smallest average arrival delay?
smallest_avg_arr_delay <- flights %>% 
  group_by(carrier) %>% 
  summarize(avg_arr_delay_carr = mean(carrier, na.rm = TRUE)) %>%
  left_join(airlines, by = "carrier") %>% 
  filter(avg_arr_delay_carr == max(avg_arr_delay_carr, na.rm = TRUE))
smallest_avg_arr_delay