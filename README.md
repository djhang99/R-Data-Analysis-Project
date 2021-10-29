# Analyzing Suicide Rates to better understand Mental Health 
- Author: David Jhang
- NYC Data Academy Project 2

## Project Description
Mental Health is rapidly growing worldwide and has in the past few years recently hit mainstream media.  I wanted to take a closer look into the suicide rates to see if there was a way to measure and quantify that growth and see which age group, gender, country/region are experiencing the most rapid growth.

## Goal
Suicide prevention is a multi-sector issue.  It involves health care professionals, government welfare, politicans and expands all the way to patients, caregivers and family members.  I wanted to better understand the data presented to help visually represent this issue so that it could spread awareness to all these involved parties.


## Data
Dataset was taken from Kaggle
- Time period = 1985-2016
- Provided by: World Bank, World Health Organization (WHO)

### Description of Data Files

#### sub-directory "../Data/master.csv"
- contains the original data file taken from Kaggle

#### (Description of the rows below)

- country: name of the country
- year: the year the data was collected for
- sex: gender (male or female)
- age: age-group (5-14, 15-24, 25-34, 35-54, 55-74, 74+)
- suicide_no: (the # of suicides)
- population: population
- suicides/100k pop: formula calculation for suicides / 100k of population
- country-year: string format of country and year
- HDI for year: Human Development Index
- gdp_for_year ($): GDP for that year
- gdp_per_capita (%): GDP per capita for that year
- generation: generation classification (Generation X, Boomers, etc..)
- region: taken from "countrycode" package which I pulled in to split the countries by UN region mapping

## Coding Files
- Done in R
- Shiny App

#### 'EDA.rmd' (main directory)
main code where all the analysis was done and charts were built
#### 'Data Cleaning.rmd' (Data - subdirectory)
main code for cleaning the WSB data files
#### 'ui.R', 'server.R', 'app.R' (Shiny - subdirectory)
all codes pertaining to the Shiny app
