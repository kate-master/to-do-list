SELECT DISTINCT status
FROM tasks
ORDER BY status

SELECT COUNT(*)
FROM tasks
INNER JOIN projects ON tasks.project_id = projects.id
GROUP BY projects.id
ORDER BY COUNT(*) DESC

SELECT projects.name, COUNT(tasks.id)
FROM tasks
INNER JOIN projects ON tasks.project_id = projects.id
GROUP BY projects.name
ORDER BY projects.name

SELECT tasks.*
FROM tasks
INNER JOIN projects ON tasks.project_id = projects.id
WHERE projects.name LIKE 'N%'

SELECT projects.*, COUNT(tasks.id)
FROM tasks
LEFT JOIN projects ON tasks.project_id = projects.id
WHERE projects.name LIKE '_%a%_'
GROUP BY projects.id

SELECT name
FROM tasks
GROUP BY name
HAVING COUNT(*) > 1
ORDER BY name

SELECT tasks.name, tasks.status, COUNT(tasks.id)
FROM tasks
INNER JOIN projects ON tasks.project_id = projects.id
WHERE projects.name = 'Garage'
GROUP BY tasks.name, tasks.status
HAVING COUNT(tasks.id) > 1
ORDER BY COUNT(tasks.id)

SELECT projects.name
FROM tasks
INNER JOIN projects ON tasks.project_id = projects.id
GROUP BY projects.id
HAVING COUNT(tasks.status = 'complete') > 10
ORDER BY projects.id
