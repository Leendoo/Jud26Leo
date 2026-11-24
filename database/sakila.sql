select * from actor;
select actor.first_name, actor.last_name
from actor;

explain select* from actor where last_name LIKE 'JO%';

select * from actor limit 10;
update actor set first_name= 'KALLE' where actor_id = 2;
select * from actor where actor_id =2;

select count(*) from actor where actor_id =17;

select sum(amount) from payment;
select sum(first_name) from actor;

-- Find unique first_names with more than 1 occurrence

select first_name, count(first_name) from actor group by first_name having count(first_name) >1;

-- Find the number of unique firts_name with more than 1 occurrence
-- subquery
select count(*) from(
select first_name, count(first_name) from actor group by first_name having count(first_name) >1) as subquery;

-- with
with aggreageted_data as ( select first_name, count(first_name)
from actor
group by first_name
having count(first_name) >1)
select count(*) from aggreageted_data;


select * from film limit 10;