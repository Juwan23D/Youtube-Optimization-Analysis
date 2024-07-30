# Youtube-Optimization-Analysis
Everyone uses YouTube across all ages. From kids looking up paw patrol, women searching for hair tutorials, and guys debating sports clips, YouTube has become a common place of interest that attracts people from all over. With so many people coming to one place, that leaves a lot of data available that can open doors to new possibilities. That is why I’ve chosen to explore a dataset that contains over 2,000 YouTube videos and comments to see which keywords bring in the most traffic. 

**[Youtube Dasboard](https://public.tableau.com/views/YoutubeDashboard_16856611459230/Dashboard1?:language=en-US&:sid=&:display_count=n&:origin=viz_share_link)**

**[Youtube Presentation](https://docs.google.com/presentation/d/1r-9OqrqN_GgzQsvdn8VQfZ5q5uGI5ouv6rjBMO18GHQ/present?slide=id.p1)**

_6 step data analysis process_

**[ASK](https://github.com/Juwan23D/Youtube-Optimization-Analysis?tab=readme-ov-file#ask)**

**[Prepare](https://github.com/Juwan23D/Youtube-Optimization-Analysis?tab=readme-ov-file#prepare)**

**[Process](https://github.com/Juwan23D/Youtube-Optimization-Analysis/tree/main?tab=readme-ov-file#process)**

**[Analyze](https://github.com/Juwan23D/Youtube-Optimization-Analysis/tree/main#analyze)**

**[Share](https://github.com/Juwan23D/Youtube-Optimization-Analysis/tree/main#share)**

**[Act](https://github.com/Juwan23D/Youtube-Optimization-Analysis/tree/main#act)**

# ASK
* What are the most commented-upon videos? Or the most liked?
* How many total views does each keyword have? How many likes?
* What are the most-liked comments?

   _Measurable questions can help us gain a numeric answer, and help establish the popularity of different ideas_

* What is the average sentiment score in each keyword category?
* How many times do company names (i.e., Apple or Samsung) appear in each keyword category?

  _Gaining insight to a customer's mindset can explain their interests and give them useful recommendations. This can also help understand their path to the video
  such as typing cnn to see a newstory or using google search that brought them to the video. The sentiment was meant to score the overall feeling towards the video
  such as with 0 as negative, 1 as neutral, and 2 as positive._ 

# Prepare

Source: [Youtube Dataset](https://www.kaggle.com/datasets/advaypatil/youtube-statistics)

We will be using a youtube dataset that is available on kaggle to the public with a no copyright license [(CC0 1.0 universal public domain)](https://creativecommons.org/publicdomain/zero/1.0/). 
* 2 CSV files
* It spans over 2 data tables containing over 18,000 + rows each,  one detailing data on the comments and the other consisting of stats. 
* Videos dates spanning from 2007 - 2022 created using YouTube's data API. 
* Comprehensive metrics measured such as likes, views, comments, and keyword categories.
* Dislikes were not included in this data.

_Exploring this information can help in collecting data to support the direction a company wants to go whether it be in marketing, business, or anyone wanting to see the public's view.
For this task it'll tell us the keywords that brought the engagement to Youtubes platform. Details about how many people watched the video, the likes, comments telling specifics on how they feel about
the video is all here._

# Process

**Excel**

* Checked for duplicates, empty spaces, and spelling errors.
* Chose to keep all columns presented since they gave various insights into keyword engagement.
* Deleted any duplicated column sets that were uploaded. 
* Left the 2 videos that had empty spaces included because they were only missing information in 2 columns but they still gave valuable insight for the "machine" Learning keyword. 

   _This was tricky because the 2 columns missing for the videos held the view and like count. However they both still told the story of how the machine learning keyword
  brought traffic to the videos through the comments, and comment like column. Unfortunateley I couldn't find the videos to personally input the missing information, so I decided it would
  be best to still include them since the empty space did not negatively impact the study._

* Reuploaded comments table into Power Query as a CSV file, and changed the file origin into a 65001.Unicode(UTF-8) instead of 65000 :(UTF-7) so special characters such as symbols and emojis would go from untranscribable to a readable format.
* Removed the number counting column to make sure the table only had information we needed.
* Used Power Query to merge the Youtube stats and Comments dataset into 1 table by using left Join on the ID column.
* Changed column titles such as "youtube stats" to "Video Title" to bring clarity to information presented.
* Rearranged columns to better reflect information. 

   _Learning their phrases, symbols, and code words is very important to understanding your audience. In order to translate the symbols and emojis I had to reformat the unicode back into excel because the first upload had them untranscribable.
  I also renamed the columns so I could better understand the information after merging them. Seeing a Likes.1 and Likes.2 would be very confusing especially after already deleting a few duplicate rows and columns. Renaming them to "Video  Likes" and
  "Comment Likes" made things a lot easier to understand._

 **SQL**
 
_In SQL I wanted to answer the questions that I asked above in order to gain an understanding of my explorations. Using commands such as order by, group by, where, and left join helped me sift through different information to see what exactly was going on._
  *  Most Commented videos, keyword Categories, Joined Table, Average Sentiment score are some of the ideas measured.

_I joined the 2 tables initially in Power Query, but I had an issue with BigQuerys schema that was solved by updating the rules to account for quotes. I beleive it may have been from 
the special characters in the comments column, and by this time I had already separated the 2 cleaned datasets so I thought it would be a good chance to exercise the Join clause in
SQL to save time._

**[SQL Code](https://github.com/Juwan23D/Youtube-Optimization-Analysis/blob/main/Youtube%20SQL.sql)**

# Analyze

## Summary:

 The main idea I wanted to understand was which keyword generated the most traffic to the videos. Observing the views, likes, and comments was a direct response from the consumers and the data there lays the path to understanding what brought them to the video. 

**Most Commented Videos**

The most commented showed what captured viewers attention the most and gave insight about their thoughts on the video
 ```
--Most commented videos
SELECT Title, Comments
FROM `stoked-grin-387603.youtube.stats`
Order BY Comments DESC
LIMIT 10;
```
![Most](https://github.com/Juwan23D/Youtube-Optimization-Analysis/blob/main/Sheet%201%20(4).png)

**Most Liked Video**

The likes can be seen as instant positive feedback, showing that viewers actually enjoyed the content, and how Youtube can better optimize their algorithm to show the viewers something similar.
```
--Most liked videos
SELECT Title, Likes
FROM `stoked-grin-387603.youtube.stats`
Order BY Likes DESC
LIMIT 10;
```
![Most](https://github.com/Juwan23D/Youtube-Optimization-Analysis/blob/main/Sheet%202%20(9).png)

**Most Viewed Keyword**

The most viewed keywords showed what was involved in searching for their desired video. This revealed that google was seen the most with over 46 billion views, showcasing its importance in searches.

```
--Keyword views
SELECT Keyword, SUM(Views) as View_num
FROM `stoked-grin-387603.youtube.stats`
GROUP BY Keyword
Order BY View_num DESC;
```
![Most](https://github.com/Juwan23D/Youtube-Optimization-Analysis/blob/main/Sheet%203%20(2).png)

**Most liked Keyword**

Certain keywords brought in different people to videos, and the likes were measured based on the searched keyword. Such as the mr.beast being involved in multiple videos and those videos he was involved in generated over 1 billion likes.
```
--Keyword likes
SELECT Keyword, SUM(Likes) as like_num
FROM `stoked-grin-387603.youtube.stats`
GROUP BY Keyword
Order BY like_num DESC;
```
![Most](https://github.com/Juwan23D/Youtube-Optimization-Analysis/blob/main/Sheet%204%20(6).png)
**Top liked Comments by Keyword**

Certain keywords brought in different people to videos, and the comments were measured based on the searched keyword. This also had mr.beast as the main traffic generator taking majority of the top liked comments.

```
--Most liked comments 
SELECT Distinct title, keyword, comment, Likes_1
FROM `stoked-grin-387603.youtube.joined table`
Order BY Likes_1 DESC
LIMIT 10
```
![Most](https://github.com/Juwan23D/Youtube-Optimization-Analysis/blob/main/Sheet%205%20(5).png)

# Share

**[Youtube Dasboard](https://public.tableau.com/views/YoutubeDashboard_16856611459230/Dashboard1?:language=en-US&:sid=&:display_count=n&:origin=viz_share_link)**

![Most](https://github.com/Juwan23D/Youtube-Optimization-Analysis/blob/main/Dashboard%201%20(4).png)

**[Youtube Presentation](https://docs.google.com/presentation/d/1r-9OqrqN_GgzQsvdn8VQfZ5q5uGI5ouv6rjBMO18GHQ/present?slide=id.p1)**

![Most](https://github.com/Juwan23D/Youtube-Optimization-Analysis/blob/main/Screenshot_19-7-2024_135540_docs.google.com.jpeg)

# Act

* What are the most commented-upon videos? Or the most liked?

  _The most commented videos where El Chombo - Dame Tu Cosita feat. Cutty Ranks (Official Video) [Ultra Music], I Opened A Restaurant That Pays You To Eat At It, $456,000 Squid Game In Real Life!, One Direction - History (Official Video), and history of the entire world, i guess with a combined total of almost 3,00,000 comments_

  _The most liked videos where El Chombo - Dame Tu Cosita feat. Cutty Ranks (Official Video) [Ultra Music], $456,000 Squid Game In Real Life!, Martin Garrix - Animals (Official Video), Powfu - death bed (coffee for your head) (Official Video) ft. beabadoobee, The Weeknd - Save Your Tears (Official Music Video) with almost 50,000,000 likes._

* How many total views does each Keyword have? How many likes?

    _The most keyword views came from google with over 46,000,000 views alone and Mr Beast had the most likes that surpassed 1 billion._

* What are the most-liked comments?

   _The most liked comments came from the Mr beast category and the number 1 was ‘Like I said in the video, subscribe if you haven’t already and you could win $10,000!’ coming from Mr beast on the video ‘$456,000 Squid Game In Real Life!’._

 * What is the average sentiment score in each keyword category?

   _Lofi has the highest sentiment score with 1.832, machine learning 1.745, music 1.739, asmr 1.739, and tutorial 1.7088._

 * How many times do company names (i.e., Apple or Samsung) appear in each keyword category?

    For the companies category cnn had 50, marvel 50, nintendo 48, google 45, and apple 42.

   ## Conclusion

   The purpose of this study was to be discover which keywords drove the most traffic to videos. Many were found through using google to bring viewers to the videos first, and this revealed google as an indirect player in boosting Youtubes reach to the public. We discovered the influence of Mr. Beast, the most liked, and commented video, along with discovering that 1 keyword can generate over 1 billion views. My recommendation would be for Youtube to explore a positive relationship with google and Mr.Beast since they have shown to be major players in generating traffic to the site, and that they can bring further growth to Youtube's platform.

    





    


