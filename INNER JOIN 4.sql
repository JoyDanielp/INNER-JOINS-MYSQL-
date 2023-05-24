SELECT
  POST.POST_ID,
  CONTENT,
  COUNT(
    CASE
      WHEN REACTION.REACTION_TYPE IN ("LIKE", "LIT", "WOW", "LOVE") THEN 1
      ELSE NULL
    END
  ) AS positive_reactions_count,
  COUNT(
    CASE
      WHEN REACTION.REACTION_TYPE IN ("DISLIKE") THEN 1
      ELSE NULL
    END
  ) AS negative_reactions_count
FROM
  POST
  INNER JOIN REACTION ON REACTION.POST_ID = POST.POST_ID
GROUP BY
  POST.POST_ID
HAVING
  negative_reactions_count > positive_reactions_count
ORDER BY
  post.POST_ID ASC;