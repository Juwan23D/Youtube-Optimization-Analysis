# Youtube-Optimization-Analysis
Everyone uses YouTube across all ages. From kids looking up paw patrol, women searching for hair tutorials, and guys debating sports clips, YouTube has become a common place of interest that attracts people from all over. With so many people coming to one place, that leaves a lot of data available that can open doors to new possibilities. That is why I’ve chosen to explore a dataset that contains over 2,000 YouTube videos and comments to see which keywords bring in the most traffic. 

**[Youtube Dasboard](https://public.tableau.com/views/YoutubeDashboard_16856611459230/Dashboard1?:language=en-US&:sid=&:display_count=n&:origin=viz_share_link)**

**[Youtube Presentation](https://docs.google.com/presentation/d/1r-9OqrqN_GgzQsvdn8VQfZ5q5uGI5ouv6rjBMO18GHQ/present?slide=id.p1)**

_6 step data analysis process_

**[ASK](https://github.com/Juwan23D/Youtube-Optimization-Analysis?tab=readme-ov-file#ask)**

**[Prepare](https://github.com/Juwan23D/Youtube-Optimization-Analysis?tab=readme-ov-file#prepare)**

# ASK
* What are the most commented-upon videos? Or the most liked?
* How many total views does each category have? How many likes?
* What are the most-liked comments?

   _Measurable questions can help us gain a numeric answer, and help establish the popularity of different ideas_

* What is the average sentiment score in each keyword category?
* How many times do company names (i.e., Apple or Samsung) appear in each keyword category?

  _Gaining insight to a customer's mindset can explain their interests and give them useful recommendations_ 

# Prepare

Source: [Youtube Dataset](https://www.kaggle.com/datasets/advaypatil/youtube-statistics)

We will be using a youtube dataset that is available to the public with a no copyright license [(CC0 1.0 universal public domain)](https://creativecommons.org/publicdomain/zero/1.0/). 
* 2 CSV files
* It spans over 2 data tables containing over 18,000 + rows each,  one detailing data on the comments and the other consisting of stats. 
* Videos dates spanning from 2007 - 2022, and collected using Youtubes data API. 
* Comprehensive metrics measured such as likes, views, comments, and keyword categories. 

_Exploring this information can help in collecting data to support the direction a company wants to go whether it be in marketing, business, or anyone wanting to see the public's view._

# Process

**Excel**

* Checked for duplicates, empty spaces, and spelling errors.

   _First I used excel to check for duplicates, and empty spaces which it was free of. The tricky part came down to the comments because it had spelling errors, but I chose to leave them be since people communicate differently._

* Utilized power query to reformat the unicode so symbols and emojis were readable.

   _Learning their phrases, symbols, and code words is very important to understanding your audience. In order to translate the symbols and emojis I had to reformat the unicode back into excel because the first upload had them untranscribable._

 **SQL**
 
_In SQL I wanted to answer the questions that I asked above in order to gain an understanding of my explorations. Using commands such as order by, group by, where, and left join helped me sift through different information to see what exactly was going on._
  *  Most Commented videos, keyword Categories, Joined Table, Average Sentiment score are some of the ideas measured.

_Joining the tables using a column they both had allowed me to see them side by side at once and allowed for my code to be shorter and easier to read. Using where allowed me to identify specifics, and count allowed me to get a number that could identify the popularity of certain metrics._

**[SQL Code](https://github.com/Juwan23D/Youtube-Optimization-Analysis/blob/main/Youtube%20SQL.sql)**
    


