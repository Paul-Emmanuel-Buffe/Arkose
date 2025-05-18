-- ===============================================================
-- Arkose - Requêtes SQL pour l'analyse de fidélisation des clients
-- ===============================================================

-- 1. Création de la base de données
CREATE DATABASE IF NOT EXISTS ARKOSE CHARACTER SET utf8mb4 COLLATE utf8MB4_unicode_ci;

-- 2. Calcul de l'âge moyen des clients
-- Cette requête extrait l'âge moyen des clients, arrondi à l'entier le plus proche
SELECT ROUND(AVG(age)) AS age_moyen
FROM clients
WHERE age IS NOT NULL;

-- 3. Calcul de la proportion de passages en Tarif Réduit
-- Cette requête identifie les passages avec tarif réduit en recherchant dans la colonne Designation
-- Elle prend en compte les variations d'orthographe (Réduit/Reduit)
SELECT
    ROUND(
        SUM(
            CASE
                WHEN LOWER(REPLACE(Designation,'é', 'e')) LIKE '%reduit'
                THEN 1 ELSE 0
            END
        ) *100.0 /COUNT(*),
        2
    ) AS prop_tarif_reduit
FROM passages
WHERE Designation IS NOT NULL;

-- 4. Analyse des passages par mois et par année
-- Cette requête extrait le nombre de passages groupés par année et mois
SELECT 
    YEAR(`Date Passage`) AS annee,
    MONTH(`Date Passage`) AS mois,
    COUNT(*) AS passages
FROM passages
GROUP BY annee, mois
ORDER BY annee, mois;

-- 5. Répartition des clients par année d'inscription
-- Cette requête extrait les dates d'inscription des clients
SELECT `ID Client`, `Date Inscription`
FROM clients
WHERE `Date Inscription` IS NOT NULL;

-- 6. Analyse du temps écoulé entre l'inscription et le dernier passage
-- Cette requête calcule le nombre de jours entre l'inscription et le dernier passage pour chaque client
SELECT
    c.`ID Client`,
    c.`Date Inscription`,
    MAX(p.`Date Passage`) AS Dernier_Passage,
    DATEDIFF(MAX(p.`Date Passage`), c.`Date Inscription`) AS Jours_absence
FROM clients c
JOIN passages p ON c.`ID Client` = p.`ID Client`
GROUP BY c.`ID Client`, c.`Date Inscription`;

-- 7. Extraction des dates de passage pour l'analyse de fréquentation
-- Cette requête extrait toutes les dates de passage et les ID clients pour calculer la fréquentation
SELECT `Date Passage`, `ID Client` FROM passages;

-- 8. Analyse des types de forfaits utilisés
-- Cette requête compte le nombre d'utilisations par type de forfait
SELECT 
    `Type Forfait`, 
    COUNT(*) AS nombre_utilisations
FROM 
    passages
GROUP BY 
    `Type Forfait`
ORDER BY 
    nombre_utilisations DESC;

-- 9. Répartition des clients par tranche d'âge
-- Cette requête groupe les clients par tranches d'âge et calcule leur pourcentage
SELECT
    CASE
        WHEN age BETWEEN 17 AND 20 THEN '17-20'
        WHEN age BETWEEN 21 AND 25 THEN '21-25'
        WHEN age BETWEEN 26 AND 30 THEN '26-30'
        WHEN age BETWEEN 31 AND 35 THEN '31-35'
        WHEN age BETWEEN 36 AND 40 THEN '36-40'
        WHEN age BETWEEN 41 AND 45 THEN '41-45'
        WHEN age BETWEEN 46 AND 47 THEN '46-47'
        ELSE 'Autre'
    END AS age_group,
    COUNT(*) AS count,
    (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM clients WHERE age BETWEEN 17 AND 47)) AS percentage
FROM
    clients
WHERE
    age BETWEEN 17 AND 47
GROUP BY
    age_group
ORDER BY
    MIN(age);
