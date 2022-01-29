-- CHALLENGE 1 (finding 5 oldest users)

SELECT * FROM users
order by created_at
LIMIT 5;

-- CHALLENGE 2 (What day of the week do most users register on)

SELECT DAYNAME(created_at) AS day,COUNT(DAYNAME(created_at)) AS COUNTI FROM users
GROUP BY day
ORDER BY COUNTI DESC;

-- CHALLENGE 3 (FIND THE USERNAME WHO HAVE NEVER POSTED PHOTO)

SELECT username,image_url FROM users
LEFT JOIN photos 
ON photos.user_id=users.id
WHERE photos.image_url IS NULL;

-- CHALLENGE 4 (who can get the most likes on a single photo)

SELECT username,image_url,COUNT(*) AS 'Likes' FROM users
JOIN photos ON photos.user_id = users.id 
JOIN likes ON likes.photo_id = photos.id
GROUP BY photos.id
ORDER BY Likes DESC
LIMIT 1;

-- CHALLENGE 5 (Calculate average number of photos per user)

SELECT (SELECT Count(*) 
        FROM   photos) / (SELECT Count(*) 
                          FROM   users) AS avg; 
                          
