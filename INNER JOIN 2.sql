SELECT
  user_id,
  user.name AS user_name,
  count(post_id) AS posts_count
FROM
  user
  INNER JOIN post ON post.posted_by = user.user_id
GROUP BY
  user.user_id
HAVING
  posts_count >= 2
  AND strftime("%m", posted_at) = "01"
  AND strftime("%Y", posted_at) = "2021"
ORDER BY
  posts_count DESC,
  user_id ASC;
