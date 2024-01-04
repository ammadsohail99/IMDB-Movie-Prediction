# Introduction
The 2023 IMDb Prediction Challenge was an engaging project designed to harness the power of statistical models to predict the IMDb ratings of twelve upcoming blockbusters in November. This project is a practical application of predictive analytics in the entertainment industry, focusing on understanding and forecasting the critical reception of films based on various factors.

# Requirements
To successfully run this project, the following are necessary:

R Programming Language: Ensure you have the latest version of R installed. \
RStudio: Recommended for a more interactive development environment. \
Libraries: To run the .rmd file, the following libraries are required:

- knitr
- stringr
- dplyr
- ggplot2 
- RColorBrewer
- tidyr
- wordcloud
- purrr
- ggfortify
- corrplot
- igraph
- ggraph
- car
- lmtest
- plm
- caTools
- boot
- broom

For running the app in the .r file, ensure you have:

- shiny
- shinyWidgets

Please ensure all libraries are installed and updated to their latest versions for optimal performance. Use install.packages("library_name") to install any missing libraries.

Ensure all libraries are installed and updated to their latest versions for optimal performance. Use install.packages("library_name") to install any missing libraries.

# Data Description
The dataset used for training the statistical model includes information about 2,000 movies from IMDb. Key variables in the dataset encompass film identifiers, cast characteristics, film specifics, and production details. The primary dependent variable is the IMDb score of each movie. Other variables include movie budget, language, country, maturity rating, various actor metrics from IMDbPro, and more, providing a comprehensive set of features to model and predict the movie ratings.

# Exploratory Data Analysis
The challenge began with an exploratory data analysis phase, encouraging a comprehensive understanding of the dataset, understand variable distributions, and detect outliers or unusual patterns. This phase was crucial for formulating hypotheses and deciding on the direction of the statistical modeling.

# Model Selection and Refinement
Building a predictive model for IMDb ratings required creativity and technical skill. We were tasked with crafting a model with significant predictive power, considering issues like collinearity, heteroskedasticity, and overfitting. The process involved testing various predictors, managing non-linear relationships, and using different forms of regression analysis.

# Results
The project's goal was to develop a robust model that could accurately predict IMDb scores for selected films. Focusing solely on the multiple linear regression model, we trained a model achieving an R-square value of 49.1% and a Mean Squared Error of 0.505. Eventually, this trained model was used to predict ratings for the test set, consisting of 12 upcoming movies in November 2023.

# Conclusion
The 2023 IMDb Prediction Challenge was not only a test of statistical modeling knowledge but also an opportunity for me to engage with real-world data and develop a nuanced understanding of predictive analytics in the entertainment sector. It was an exercise in creativity, technical skill, and scientific communication, providing valuable insights into the application of data science and statistics in predicting film success.

# Acknowledgments
This project was a part of a master's program at McGill. Special thanks to the organizers and contributors who provided the data, tools, and resources necessary to make this challenge a stimulating and enriching experience.
