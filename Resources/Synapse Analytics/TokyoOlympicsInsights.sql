
-- Number of atheletes from each country
SELECT Country, count(PersonName) as num_athletes
FROM  athletes
GROUP BY Country
ORDER by 2 DESC;

-- Participating Athletes
SELECT
    SUM(Male) as Males,
    SUM(Female) as Females,
    SUM(Total) as TotalAthletes
FROM
    entriesgender;

-- Athletes who participated in multiple events
SELECT  PersonName, count(PersonName) as cnt
FROM athletes
GROUP BY PersonName
ORDER BY cnt DESC


-- Disciplines
SELECT
    count(DISTINCT Discipline) as Disciplines
FROM
    athletes

-- Disciplines by Gender
SELECT
    Discipline,
    Male,
    Female
FROM
    entriesgender

-- Percentage entries by gender for each disciplines;
SELECT 
    Discipline,
    ROUND((CAST(Female as float)/Total)*100,2) as 'F%',
    ROUND((CAST(Male as float)/Total)*100,2) as 'M%'
FROM entriesgender

-- Different coach Events 
SELECT
    DISTINCT Event 
FROM
    coaches

-- Top 10 Countries winning maximum golds
SELECT TOP 10
    TeamCountry,
    Gold
FROM
    medals
ORDER BY
    GOld DESC

-- Top 10 Countries winning maximum Silvers
SELECT TOP 10
    TeamCountry,
    Silver
FROM
    medals
ORDER BY
    Silver DESC


-- Top 10 Countries winning maximum Bronze
SELECT TOP 10
    TeamCountry,
    Bronze
FROM
    medals
ORDER BY
    Bronze DESC

