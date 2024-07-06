1. What is the total number of reservations in the dataset?

SELECT count(*) AS Total_no_of_reservation 
FROM hotel_reservation;


2. Which meal plan is the most popular among guests?

SELECT type_of_meal_plan, COUNT(type_of_meal_plan) AS Total
FROM hotel_reservation
GROUP BY type_of_meal_plan
ORDER BY Total DESC;


3. What is the average price per room for reservations involving children?

SELECT AVG(avg_price_per_room) 
FROM hotel_reservation
WHERE no_of_children!=0;


4. How many reservations were made for the year 20XX (replace XX with the desired year)?

SELECT COUNT(*) AS all_booking_in_2018
FROM hotel_reservation
WHERE YEAR(STR_TO_DATE(arrival_date, '%d-%m-%Y')) = 2018;


5. What is the most commonly booked room type?

SELECT room_type_reserved, COUNT(room_type_reserved) AS Total
FROM hotel_reservation
GROUP BY room_type_reserved
ORDER BY Total DESC;



6. How many reservations fall on a weekend?

SELECT COUNT(booking_id) AS no_of_weekend_nights
FROM hotel_reservation
WHERE no_of_weekend_nights > 0;



7. What is the highest and lowest lead time for reservations?

SELECT MAX(lead_time) AS highest_lead_time, MIN(lead_time) AS lowest_lead_time
FROM hotel_reservation;




8. What is the most common market segment type for reservations?

 SELECT market_segment_type, COUNT(market_segment_type) AS Total
 FROM hotel_reservation
 GROUP BY market_segment_type
 ORDER BY Total DESC;



9. How many reservations have a booking status of "Confirmed"?

 SELECT COUNT(Booking_ID) AS all_booking_confirmed
 FROM hotel_reservation
 WHERE booking_status = 'Not_Canceled';




10. What is the total number of adults and children across all reservations?

 SELECT SUM(no_of_adults) AS no_of_adults, SUM(no_of_children) AS no_of_children
 FROM hotel_reservation;




11. What is the average number of weekend nights for reservations involving children?
  
  SELECT AVG(no_of_weekend_nights) AS avg_of_weekend_nights
  FROM hotel_reservation
  WHERE no_of_children != 0;




12. How many reservations were made in each month of the year?

  SELECT SUM(CASE WHEN MONTH(STR_TO_DATE(arrival_date , "%d-%m-%Y")) = 1 THEN 1 ELSE 0 END) AS January,
         SUM(CASE WHEN MONTH(STR_TO_DATE(arrival_date , "%d-%m-%Y")) = 2 THEN 1 ELSE 0 END) AS February,
         SUM(CASE WHEN MONTH(STR_TO_DATE(arrival_date , "%d-%m-%Y")) = 3 THEN 1 ELSE 0 END) AS March,
         SUM(CASE WHEN MONTH(STR_TO_DATE(arrival_date , "%d-%m-%Y")) = 4 THEN 1 ELSE 0 END) AS April,
         SUM(CASE WHEN MONTH(STR_TO_DATE(arrival_date , "%d-%m-%Y")) = 5 THEN 1 ELSE 0 END) AS May,
         SUM(CASE WHEN MONTH(STR_TO_DATE(arrival_date , "%d-%m-%Y")) = 6 THEN 1 ELSE 0 END) AS June,
         SUM(CASE WHEN MONTH(STR_TO_DATE(arrival_date , "%d-%m-%Y")) = 7 THEN 1 ELSE 0 END) AS July,
         SUM(CASE WHEN MONTH(STR_TO_DATE(arrival_date , "%d-%m-%Y")) = 8 THEN 1 ELSE 0 END) AS August,
         SUM(CASE WHEN MONTH(STR_TO_DATE(arrival_date , "%d-%m-%Y")) = 9 THEN 1 ELSE 0 END) AS Septemper,
         SUM(CASE WHEN MONTH(STR_TO_DATE(arrival_date , "%d-%m-%Y")) = 10 THEN 1 ELSE 0 END) AS October,
         SUM(CASE WHEN MONTH(STR_TO_DATE(arrival_date , "%d-%m-%Y")) = 11 THEN 1 ELSE 0 END) AS Novamber,
         SUM(CASE WHEN MONTH(STR_TO_DATE(arrival_date , "%d-%m-%Y")) = 12 THEN 1 ELSE 0 END) AS December
  FROM hotel_reservation;
  

  

13. What is the average number of nights (both weekend and weekday) spent by guests for each room type?

  SELECT room_type_reserved, AVG(no_of_weekend_nights) AS avg_weekend_nights, AVG(no_of_week_nights) AS avg_week_nights
  FROM hotel_reservation
  GROUP BY room_type_reserved;




14. For reservations involving children, what is the most common room type, and what is the average price for that room type?

 SELECT room_type_reserved, COUNT(room_type_reserved) AS max_times_reserved, AVG(avg_price_per_room) AS avg_price_of_room
 FROM hotel_reservation
 GROUP BY room_type_reserved
 ORDER BY max_times_reserved DESC;



15. Find the market segment type that generates the highest average price per room?

 SELECT market_segment_type, MAX(avg_price_per_room) AS highest_of_avg_price
 FROM hotel_reservation
 GROUP BY market_segment_type
 ORDER BY highest_of_avg_price DESC;