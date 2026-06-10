--some more DDL

alter table payment 
add column gst numeric(10,2)
generated always as (amount*0.18) stored;

select * from payment;

alter table payment 
drop column gst;

select * from payment;

--Renaming a column
alter table hotel
rename column hotel_rating to
rating;

select destination_name,city,hotel_name ,rating
from hotel join destination on hotel.destination_id =destination.destination_id;

--adding a check constraint 
alter table hotel 
add constraint check_rating check(rating between 0 and 5);

--Rename a table
alter table destination
rename to destinations;

--truncate a table
--truncate deletes all the data from a table very quickly 
truncate table users; --but we cannot truncate it cause FK dependency

--so we use cascade 

truncate table users
cascade; --lets see what all was altered
select * from payment;
select * from hotel;
select * from booking; --okay so wherever users were mentioned has been truncated, great