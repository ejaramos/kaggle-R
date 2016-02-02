# Kaggle Scripts on Datacamp
# library (dplyr) not needed if already installed

# Load in your data
acs_url <- "http://s3.amazonaws.com/assets.datacamp.com/production/course_810/AC_Survey_Subset.RData"
# load(url(acs_url))

# Investigate first 20 observations
head(AC_Survey_Subset, n = 20)

# Load in the dplyr package and convert AC_Survey_Subset to tbl_df
acs <- tbl_df(AC_Survey_Subset) 

# Use the pipe operator and chaining 
AC_Survey_Subset_Cleaned <- acs %>% na.omit(acs) %>% filter( SCHL %in% c(21,22,24) ) %>% group_by(SCHL) 

# dplyr is loaded, AC_Survey_Subset_Cleaned and degree_codes are available

# Count the number of Bachelor, Master and PhD holders
degree_holders <- summarize(AC_Survey_Subset_Cleaned, count = n() )

# Join degree_codes with degree_holders, assign to degree_holders_2
degree_codes <- data.frame (SCHL = c(21, 22, 24), Degree = c('Bachelors', 'Masters', 'Doctorate'))
degree_holders_2 <- inner_join(degree_holders, degree_codes )
View(degree_holders_2)

# Load the ggplot2 package
# library(ggplot2)

# Visualize the number of Bachelor, Master and PhD holders   
ggplot(degree_holders_2, aes(x =  , y = , fill = )) +                        
  geom_bar(stat = ) +
  xlab("") + 
  ylab("") + 
  ggtitle("")




