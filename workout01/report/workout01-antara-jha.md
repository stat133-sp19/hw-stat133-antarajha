Workout 1
================
Antara Jha

``` r
curry <- read.csv("/Users/antarajha/Desktop/hw-stat133/workout01/data/stephen-curry.csv", stringsAsFactors = FALSE, header = TRUE)
```

Introduction
============

ANALYSIS OF GSW PLAYERS This is an analysis of the performance of the starting 5 GSW players.

Motivation
----------

The Golden State Warriors capture the hearts of all sports fans in California, and being at UC Berkeley, we are not exempt. Thus, I have taken the initiative to analyze the performance of GSW and specifically of its 5 starting players.

Background
----------

The Golden State Warriors are an American professional basketball team based in Oakland, California. The Warriors compete in the National Basketball Association, as a member of the league's Western Conference Pacific Division. They are one of the most celebrated basketball teams ever!

For the Warriors, wild numbers are more than just wild. Some carry historical significance. Others lengthen their lead on a basketball world trying—and almost always failing—to keep up.

Data
----

The data that I have used combines a statistics about a variety of variables, right from their team details to the details of every shot they have taken (when was it taken? what kind of shot was it? did it go in?). Here is an example of data about Stephen Curry

``` r
head(curry, n=5)
```

    ##               team_name game_date season period minutes_remaining
    ## 1 Golden State Warriors  12/15/16   2016      3                 3
    ## 2 Golden State Warriors  10/28/16   2016      3                 9
    ## 3 Golden State Warriors   11/1/16   2016      2                 5
    ## 4 Golden State Warriors   12/1/16   2016      3                 5
    ## 5 Golden State Warriors    4/4/17   2016      3                 2
    ##   seconds_remaining shot_made_flag                    action_type
    ## 1                51              y Cutting Finger Roll Layup Shot
    ## 2                14              y Cutting Finger Roll Layup Shot
    ## 3                 8              y Cutting Finger Roll Layup Shot
    ## 4                27              y Cutting Finger Roll Layup Shot
    ## 5                 4              y Cutting Finger Roll Layup Shot
    ##        shot_type shot_distance               opponent   x  y
    ## 1 2PT Field Goal             3        New York Knicks  25 21
    ## 2 2PT Field Goal             2   New Orleans Pelicans   9 26
    ## 3 2PT Field Goal             2 Portland Trail Blazers -22  2
    ## 4 2PT Field Goal             0        Houston Rockets   2  7
    ## 5 2PT Field Goal             2 Minnesota Timberwolves   1 26

Analysis
--------

The analysis involved cleaning the data, adding columns to better categorize the date (by player name), generating charts that make the observations and analysis more clear, and combining tables. Here is an example of a summary of data about Stephen Curry:

``` r
summary(curry)
```

    ##   team_name          game_date             season         period     
    ##  Length:1250        Length:1250        Min.   :2016   Min.   :1.000  
    ##  Class :character   Class :character   1st Qu.:2016   1st Qu.:1.000  
    ##  Mode  :character   Mode  :character   Median :2016   Median :2.000  
    ##                                        Mean   :2016   Mean   :2.305  
    ##                                        3rd Qu.:2016   3rd Qu.:3.000  
    ##                                        Max.   :2016   Max.   :4.000  
    ##  minutes_remaining seconds_remaining shot_made_flag     action_type       
    ##  Min.   : 0.000    Min.   : 0.00     Length:1250        Length:1250       
    ##  1st Qu.: 1.000    1st Qu.:13.00     Class :character   Class :character  
    ##  Median : 4.000    Median :29.00     Mode  :character   Mode  :character  
    ##  Mean   : 4.221    Mean   :28.53                                          
    ##  3rd Qu.: 7.000    3rd Qu.:44.00                                          
    ##  Max.   :11.000    Max.   :59.00                                          
    ##   shot_type         shot_distance     opponent               x           
    ##  Length:1250        Min.   : 0.00   Length:1250        Min.   :-246.000  
    ##  Class :character   1st Qu.: 5.00   Class :character   1st Qu.: -96.500  
    ##  Mode  :character   Median :23.00   Mode  :character   Median :   0.500  
    ##                     Mean   :17.99                      Mean   :  -3.642  
    ##                     3rd Qu.:26.00                      3rd Qu.:  91.000  
    ##                     Max.   :71.00                      Max.   : 240.000  
    ##        y        
    ##  Min.   :-36.0  
    ##  1st Qu.: 18.0  
    ##  Median :144.0  
    ##  Mean   :135.4  
    ##  3rd Qu.:228.0  
    ##  Max.   :717.0

Here is an image that captures the main elements of the analysis about the shots made by each of the players:

<img src="/Users/antarajha/Desktop/hw-stat133/workout01/images/gsw_shots_chart.png" width="80%" style="display: block; margin: auto;" />
