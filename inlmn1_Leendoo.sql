USE laboration1;

-- Part B: SQL

-- Task 4
-- Retrieve spacecraft, launch date and outcome for all missions.

select spacecraft, launch_date, outcome from moon_mission;

-- Task 5
-- Retrieve all missions where the outcome is Launch failure.
select * from moon_mission where outcome = 'Launch failure';

-- Task 6
-- Retrieve all missions launched before 1960, oldest first.

SELECT *
from moon_mission
where launch_date < '1960-01-01'
order by launch_date asc;

-- Task 7
-- Retrieve all missions whose names start with Luna,
-- sorted alphabetically.
select*
from moon_mission
where spacecraft like 'Luna%'
order by spacecraft asc;
-- The query returns five rows instead of four because
-- LIKE 'Luna%' also matches Lunar Orbiter 4.
-- The % wildcard allows any characters after Luna.

-- Task 8
-- Retrieve the three most recently launched missions.
select *
from moon_mission
order by launch_date desc
limit 3 ;

-- Task 9
-- Retrieve all accounts with the last name Åström or Fransson,
-- sorted by first name.
select *
from account
where last_name = 'Åström' or last_name = 'Fransson'
order by first_name asc;

-- Task 10
-- Retrieve all missions where the operator is NASA.
select *
from moon_mission
where operator = 'NASA';
-- The query returns zero rows because NASA is stored
-- with extra spaces, such as 'NAS A' and 'NA SA'.
-- These values do not match 'NASA'.

-- Task 11
-- Retrieve all missions where the mission type is Impactor.
select *
from moon_mission
where mission_type = 'Impactor'
-- The query returns one row, but it should return two.
-- One mission has an extra space before 'Impactor',
-- which prevents it from matching the condition.

-- Task 12a
-- Insert a new mission launched before the year 2000.
Insert into moon_mission (spacecraft, launch_date)
values ('Apollo 11','1969-07-16');
select * from moon_mission where spacecraft = 'Apollo 11';
-- The inserted mission received mission_id 20.

SET @new_mission_id = LAST_INSERT_ID();

-- Task 12b
-- Update the outcome of the inserted mission.
update moon_mission
set outcome = 'successful'
where mission_id =  20;

select * from moon_mission
where mission_id = 20;

-- Task 12c
-- Delete the inserted mission using its mission_id.
start transaction;
delete from moon_mission
where mission_id = 20;

commit;

select * from moon_mission
where mission_id = 20

-- Task 13
-- Update the outcome of Chandrayaan-2 to Successful.
update moon_mission
set outcome = 'successful'
where spacecraft = 'chandrayaan-2';

-- Task 14
-- Delete all missions launched in 2010 or later.
SELECT *
FROM moon_mission
WHERE launch_date >= '2010-01-01';

start transaction;
delete from moon_mission
where launch_date >= '2010-01-01';

commit;

select *
from moon_mission
where launch_date >= '2010-01-01';
