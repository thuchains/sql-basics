--1. How many users have 'travel' in their bio?
--Type: Counting, filtering by string pattern.
SELECT COUNT(bio) AS bio_with_travel FROM users
WHERE bio LIKE '%travel%';
-- There are 2 users with the word 'travel' in their bio.

--2. How many posts were created between May 1st and May 10th, 2023?
--Type: Counting, filtering by date range.
SELECT COUNT(created_at) AS posts_created FROM posts
WHERE created_at BETWEEN '2023-05-01' AND '2023-05-10';
-- In the posts db there was 1 post that was created between May 1st and May 10th, 2023

--3. What user has the most comments? (return the user_id)
--Type: Aggregation, grouping, ordering, limiting.
-- SELECT * FROM comments

SELECT user_id, COUNT(*) AS comment_count FROM comments
GROUP BY user_id
ORDER BY comment_count DESC;
-- user_id: 2 has the most number of comments (6), however there are 3 other users that also have the same amount of comments, user_id: 3, 7, and 11. But if you set the limit to just 1, it would return user_id: 2. I reached this conclusion by counting how many times the user's user_id appears in the comments table and grouping the data by the user_id to make the output more readable.

--4. How many users have usernames that end with 'er'?
--Type: Counting, filtering by string pattern.
SELECT COUNT(*) FROM users
WHERE username LIKE '%er';
-- There are 2 users that have a username that ends with 'er'.

--5. What post has the most comments? (return the post_id)
--Type: Aggregation, grouping, ordering, limiting.
SELECT * from comments

SELECT post_id, COUNT(*) AS num_comments FROM comments
GROUP BY post_id
ORDER BY num_comments DESC
LIMIT 1;
-- Post_id 1 through 50 all have 5 comments, however if you set the limit to 1, post_id 1 has the most comments. I reached this conclusion by counting how many times the post's post_id appears in the comments table and grouping the data by the post_id to make the output more readable.

--6. How many different user IDs have posted content?
--Type: Counting distinct values.
SELECT user_id, COUNT(*) AS num_posts FROM posts
GROUP BY user_id;
-- Each user makes 1 post, so there are 50 different user IDs that have posted.

--7. What user has the most people following them? (return the user_id)
--Type: Aggregation, grouping, ordering, limiting.
SELECT * FROM following

SELECT followed_id, COUNT(*) AS num_followers FROM following
GROUP BY followed_id
ORDER BY num_followers DESC
LIMIT 1;
-- user_id: 1 has the most number of people following them, 7, however user_id: 2, 5, and 6 also have 7 people following them. But if you set the limit to just 1, it would return user_id: 1. I reached this conclusion by counting how many times a user's user_id appeared in the followed_id column and ordered the count in descending order to show first the user_id that appeared the most amount of times on the followed_id column.


--8. From users who joined in February 2023, how many have usernames containing 'john'?
--Type: Counting, filtering by date and string pattern.
SELECT COUNT(*) FROM users
WHERE created_at BETWEEN '2023-02-01' AND '2023-02-28' AND username LIKE '%john%'; 
-- There were no usernames containing 'john' that was created in February 2023.


--9. From users who joined in March 2023, how many have usernames containing 'mar'?
--Type: Counting, filtering by date and string pattern.
SELECT COUNT(*) FROM users
WHERE created_at BETWEEN '2023-03-01' AND '2023-03-31' AND username LIKE '%mar%'; 
-- There were no usernames containing 'mar' that was created in March 2023.

--10. What post has the most reactions? (return the post_id)
--Type: Aggregation, grouping, ordering, limiting.
SELECT post_id, COUNT(post_id) AS reactions_count FROM reactions
GROUP BY post_id
ORDER BY reactions_count DESC
LIMIT 1;
-- post_id: 1 has the most amount of reactions, which was 5. However, post_id 1 through 50 also have 5 reactions, but limit 
