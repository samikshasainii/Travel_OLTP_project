insert into users(username,first_name,last_name,phone_number,email_id)
values
('hshu12','harshit','singh',+917899080897, 'hrshutxz@gmail.com'),
('samiksha123','samiksha','saini',+91234567892,'sks4ini@gmail.com'),
('yonnyawns','yonna','bisht',+91738724393,'yonna123@gmail.com');

select * from users;

insert into destination(destination_name,country,state,city)
values
('Goa beach trip','India','Goa','Panaji'),
('Bangalore tech tour','India','Karnataka','Bengaluru'),
('Mumbai bolly tour','India','Maharashtra','Mumbai');

select * from destination;

insert into flight(airline_name,flight_number,departure_airport,arrival_airport)
values 
('Indigo',10304,'Delhi','Goa'),
('Air India',10305,'Kolkata','Bangalore'),
('SpiceJet','99008','Chennai','Mumbai');

insert into hotel(hotel_name,destination_id,hotel_rating)
values 
('Ultimate Goan Villa',1,4.2),
('Airbnb in Bengaluru',2,3.2),
('Amitabh''s residence',3,5);

insert into hotel(hotel_name,destination_id,hotel_rating)
values 
('Manyata housing',2,4.5);

insert into trip(user_id,destination_id,trip_name)
VALUES
(1, 1, 'Goa Vacation'),
(1, 2, 'Bangalore Adventure'); 

insert into booking(trip_id,flight_id,hotel_id)
values
(1,2,4),
(1,3,3);

insert into payment(booking_id,amount,payment_method,payment_status,payment_date)
values
(1,1000,'UPI','Completed',current_timestamp),
(2,2000,'UPI','Refunded',current_timestamp);