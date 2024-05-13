library(dplyr)

file_path <- "C:/Users/natha/OneDrive/Desktop/CSU Global/MIS 480/Module 5/CRM.csv"

df <- read.csv(file_path)

# Top 10 highs of Close
highs <- df %>% top_n(10, Close)

# Top 10 lows of Close
lows <- df %>% top_n(-10, Close)

# Moving Average
window <- 20  # Define the window size for SMA
df$SMA <- SMA(df$Close, n = window)

# Relative Strength Index
rsi_period <- 14  # Define the period for RSI calculation
df$RSI <- RSI(df$Close, n = rsi_period)

# Print the highs, lows, moving average, and relative strength index
print("The dates of the 10 highest 'Close' values are:")
print(highs[c('Date', 'Close')])

print("The dates of the 10 lowest 'Close' values are:")
print(lows[c('Date', 'Close')])

print("Moving Average (SMA) and Relative Strength Index (RSI):")
print(tail(df[c('Date', 'SMA', 'RSI')]))