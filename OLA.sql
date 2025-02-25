--Retrieve all successful bookings

CREATE VIEW Successful_Bookings As
SELECT * FROM booking
WHERE booking_status='Success'

SELECT * FROM Successful_Bookings ;

--Find the average ride distance for each vehicle type:

CREATE VIEW Vehicle_Category As
SELECT vehicle_type,AVG(ride_distance)
FROM booking
GROUP BY vehicle_type

SELECT * FROM Vehicle_Category ;

-- Get the total number of cancelled rides by customers:

select * from booking
CREATE VIEW cancelled_rides As
SELECT COUNT(booking_status)
FROM booking
WHERE booking_status = 'Canceled by Customer'

SELECT * FROM cancelled_rides ;

--List the top 5 customers who booked the highest number of rides

CREATE VIEW Rides As
SELECT customer_id,COUNT(booking_id) AS total_rides
FROM booking
GROUP BY customer_id
ORDER BY total_rides DESC 
LIMIT 5 ;

SELECT * FROM Rides ;

--Get the number of rides cancelled by drivers due to personal and car-related issues:

CREATE VIEW Cancelled_Rides_by_driver As 
SELECT COUNT(canceled_rides_by_driver)
FROM booking
WHERE canceled_rides_by_driver = 'Personal & Car related issue'

SELECT * FROM Cancelled_Rides_by_driver ;

--Find the maximum and minimum driver ratings for Prime Sedan bookings:

CREATE VIEW MAX_MIN_DRIVER_RATING As
SELECT MAX(driver_ratings) As MAX_RATING ,
MIN(driver_ratings) As MIN_RATING
FROM booking
WHERE vehicle_type = 'Prime Sedan'

SELECT * FROM MAX_MIN_DRIVER_RATING ;

--Retrieve all rides where payment was made using UPI

CREATE VIEW Payment_Method_UPI As
SELECT * FROM booking
WHERE payment_method = 'UPI'

SELECT * FROM Payment_Method_UPI ;

--Find the average customer rating per vehicle type:

CREATE VIEW Customer_Rating_Per_Vehicle As
SELECT vehicle_type , ROUND (AVG(customer_rating),2)  As Customer_Rating
FROM booking
GROUP BY vehicle_type

SELECT * FROM Customer_Rating_Per_Vehicle ;

--Calculate the total booking value of rides completed successfully:

CREATE VIEW Successfull_Booking As
SELECT SUM(booking_value) as total_successful_value
FROM booking
WHERE booking_status = 'Success';

SELECT * FROM Successfull_Booking ;

--List all incomplete rides along with the reason:

CREATE VIEW incomplete_rides As
SELECT booking_id, incomplete_rides_reason
FROM booking 
WHERE incomplete_rides ='Yes';

SELECT * FROM incomplete_rides ;

