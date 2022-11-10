use sakila;
-- 1. How many distinct (different) actors' last names are there?
select count(distinct(first_name)) from actor;

-- 2. In how many different languages were the films originally produced? (Use the column `language_id` from the `film` table)alter
select count(distinct(language_id)) from film;

-- 3. How many movies were released with `"PG-13"` rating?
select count(case rating when 'PG-13' then 1 else null end)
from film;

-- 4. Get 10 the longest movies from 2006.
select * from film;
select title, length from film
where release_year = 2006
order by length desc
limit 10;

-- 5. How many days has been the company operating (check `DATEDIFF()` function)?
select * from rental;
select datediff(last_update,rental_date)  from rental
order by datediff(last_update,rental_date) desc;

-- 6. Show rental info with additional columns month and weekday. Get 20.
select * from rental;
select *,month(rental_date), weekday(rental_date) from rental;

-- 7. Add an additional column `day_type` with values 'weekend' and 'workday' depending on the rental day of the week.
select *, weekday(rental_date), case when weekday(rental_date) between 0 and 4 then "Workday" else "Weekend" end as day_type from rental;

-- 8. How many rentals were in the last month of activity?
select year(rental_date) from rental
order by rental_date desc;
select count(case when year(rental_date)="2006" then 1 else null end) from rental;