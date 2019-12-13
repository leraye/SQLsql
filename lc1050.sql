## LC 1050
# MySQL

SELECT a.actor_id AS ACTOR_ID, a.director_id AS DIRECTOR_ID
FROM ActorDirector a
GROUP BY a.actor_id, a.director_id
HAVING count(a.timestamp) >= 3
