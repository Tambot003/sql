--Obtenir la liste des 10 villes les plus peuplées en 2012
SELECT ville_nom, ville_population_2012
FROM villes_france_free 
WHERE ville_population_2012 
ORDER by ville_population_2012 DESC
LIMIT 10;

-- Obtenir la liste des 50 villes ayant la plus faible superficie
SELECT ville_nom, ville_surface
FROM villes_france_free  
WHERE ville_surface 
ORDER BY  ville_surface  ASC  
LIMIT 50;


-- Obtenir la liste des départements d’outres-mer, c’est-à-dire ceux dont le numéro de département commencent par “97”
SELECT ville_code_postal
FROM villes_france_free 
 WHERE ville_code_postal LIKE '97%'


-- Obtenir le nom des 10 villes les plus peuplées en 2012, ainsi que le nom du département associé
SELECT ville_nom, ville_population_2012, departement_nom 
FROM villes_france_free
INNER JOIN departement
WHERE villes_france_free.ville_departement = departement.departement_code
ORDER BY  ville_population_2012 
DESC 
LIMIT 10



-- Obtenir la liste du nom de chaque département, associé à son code et du nombre de commune au sein de ces département, en triant afin d’obtenir en priorité les départements qui possèdent le plus de communes

SELECT departement_nom, departement_code, COUNT(ville_nom) as ville_id
FROM departement 
LEFT JOIN villes_france_free ON departement_code = departement_code
GROUP BY departement_nom, departement_code
ORDER BY COUNT(ville_nom) DESC;




-- Obtenir la liste des 10 plus grands départements, en terme de superficie

SELECT departement_nom, ville_surface
FROM villes_france_free
INNER JOIN departement
ORDER BY departement_nom

DESC 




-- Compter le nombre de villes dont le nom commence par “Saint”
SELECT COUNT(ville_nom)
FROM villes_france_free
 WHERE ville_nom LIKE 'saint%';


-- Obtenir la liste des villes qui ont un nom existants plusieurs fois, et trier afin d’obtenir en premier celles dont le nom est le plus souvent utilisé par plusieurs communes


SELECT ville_nom, COUNT(ville_nom)
from villes_france_free
GROUP BY ville_nom
ORDER BY COUNT(ville_nom) DESC
LIMIT 50




-- Obtenir en une seule requête SQL la liste des villes dont la superficie est supérieur à la superficie moyenne
SELECT ville_nom,  ville_surface
FROM villes_france_free
WHERE ville_surface > (SELECT AVG(ville_surface) FROM villes_france_free)




-- Obtenir la liste des départements qui possèdent plus de 2 millions d’habitants


SELECT departement_nom, SUM(ville_population_2012)
FROM villes_france_free
INNER JOIN departement ON villes_france_free.ville_departement = departement.departement_code
WHERE ville_population_2012 > 200000
GROUP BY departement_nom 



-- Remplacez les tirets par un espace vide, pour toutes les villes commençant par “SAINT-” (dans la colonne qui c les noms en majuscule)
UPDATE ville_nom
FROM villes_france_free 
SET ville_nom = REPLACE (ville_nom, 'SAINT-%', 'SAINT %')
WHERE  LIKE 'SAINT-%';
