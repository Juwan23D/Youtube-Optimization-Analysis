--Most commented videos
SELECT Title, Comments
FROM `stoked-grin-387603.youtube.stats`
Order BY Comments DESC
LIMIT 10;


--Most liked videos
SELECT Title, Likes
FROM `stoked-grin-387603.youtube.stats`
Order BY Likes DESC
LIMIT 10;


--Most commented keyword
SELECT Keyword,Comments
FROM `stoked-grin-387603.youtube.stats`
Order BY Comments DESC
LIMIT 10;


--Most Liked keyword
SELECT Title, Keyword, Likes,
FROM `stoked-grin-387603.youtube.stats`
Order BY Likes DESC
LIMIT 10;


--Keyword categories
SELECT Keyword, COUNT(*) as key_num,
FROM `stoked-grin-387603.youtube.stats`
GROUP BY Keyword
ORDER BY key_num DESC;


--Keyword views
SELECT Keyword, SUM(Views) as View_num
FROM `stoked-grin-387603.youtube.stats`
GROUP BY Keyword
Order BY View_num DESC;


--Keyword likes
SELECT Keyword, SUM(Likes) as like_num
FROM `stoked-grin-387603.youtube.stats`
GROUP BY Keyword
Order BY like_num DESC;
--Keyword comments
SELECT Keyword,SUM(Comments) as comm_num
FROM `stoked-grin-387603.youtube.stats`
GROUP BY Keyword
Order BY comm_num DESC;


--Joined table
SELECT *
FROM `stoked-grin-387603.youtube.stats` AS stats
LEFT JOIN `stoked-grin-387603.youtube.comments` AS comments
ON stats.Video_ID = comments.Video_ID


--Most liked comments 
SELECT Distinct title, keyword, comment, Likes_1
FROM `stoked-grin-387603.youtube.joined table`
Order BY Likes_1 DESC
LIMIT 10


--Average sentiment score in each category
SELECT  keyword, ROUND(Avg(sentiment),2) as SS,
FROM `stoked-grin-387603.youtube.joined table`
Group BY keyword
Order BY SS DESC


--Company appearances
SELECT DISTINCT keyword as company, COUNT(*) as key_num,
FROM `stoked-grin-387603.youtube.stats`
WHERE keyword in ('cnn','nintendo','apple','marvel','google')
Group BY keyword
ORDER BY key_num DESC;
