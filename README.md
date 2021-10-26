# NYC Data Academy Project 2 - (Analyzing Suicide Rates to better understand Mental Health)

## Project Description
Mental Health is rapidly growing worldwide and has in the past few years recently hit mainstream media.  I wanted to take a closer look into the suicide rates to see if there was a way to measure and quantify that growth and see which age group, gender, country/region are experiencing the most rapid growth.

## Goal
Suicide prevention is a multi-sector issue.  It involves health care professionals, government welfare, politicans and expands all the way to patients, caregivers and family members.  I wanted to better understand the data presented to help visually represent this issue so that it could spread awareness to all these involved parties.

------------------------------------------------------------------------
## Data
Dataset was taken from Kaggle which was pulled from the World Bank, World Health Organization (WHO).
- Time period = 1985-2016

<files, location, description>
*** DESCRIPTION OF '.csv' FILES ***
## ex:'20201228-stonks.csv' & 'combined.csv' & 'WSB.csv' in 'WSB Data' sub-directory

(Description of the rows below:)

•	ticker: The stock ticker.
•	date: The day that the current data is from.
•	url: The url of the stock on Yahoo Finance.
•	num_mentions: The number of times the stock ticker was seen in any posts or comments for this day.
•	pct_mentions: The number of mentions of this stock as a percentage of all stock ticker mentions for this day.
•	pos_count: The number of times this stock was mentioned within a (predicted) positive context for this day.
•	neg_count: The number of times this stock was mentioned within a (predicted) negative context for this day.
•	bullish_pct: The number of positive sentiment mentions as a percentage of all the mentions of this stock for this day.
•	bearish_pct: The number of negative sentiment mentions as a percentage of all the mentions of this stock for this day.
•	neutral_pct: The number of mentions that were not classified as either positive or negative as a percentage of all the mentions of this stock for this day.
•	price: The price of this stock as of market close (usually) from the previous day. This data was scraped daily from Yahoo Finance. See the time_of_price column to confirm what time the price was actually reported from the previous day (some say like 11AM for some reason).
•	price_change_net: The change in price of the stock as a dollar amount from the previous market open to the previous market close.
•	price_change_pct: The change in price of the stock as a percentage from the previous market open to the previous market close.
•	time_of_price: The time at which this price was reported on Yahoo Finance.
------------------------------------------------------------------------
## Coding Files
- Done in R
- Shiny App

#### 'WSB Analysis.ipynb' (main directory)
main code where all the analysis was done and charts were built
#### 'Data Cleaning.ipynb' (WSB Data - subdirectory)
main code for cleaning the WSB data files
#### 'Data Scraping Yahoo Finance Historical Stock Data.ipynb' (main directory)
main code for pulling data from Yahoo Finance
