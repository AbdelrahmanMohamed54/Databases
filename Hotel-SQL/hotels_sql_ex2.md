# SELECT statements on the Hotels Database

I'll be addressing each of the following SELECT tasks for my Hotels database explained earlier in the other files.

### Exercise 6: List Full Details of All Hotels

```sql
SELECT * FROM Hotel;
```

### Exercise 7: List Full Details of All Hotels in a Given City


```sql
SELECT * FROM Hotel WHERE city = 'Washington';
```

### Exercise 8: List Names and Addresses of All Guests in a Specific City

```sql
SELECT guestName, guestAddress FROM Guest
WHERE guestAddress LIKE '%Washington%'
ORDER BY guestName ASC;
```

For descending order, change `ASC` to `DESC`.

### Exercise 9: List All Double or Family Rooms with Price Below a Certain Value

Assuming 'f' is used to denote family rooms:

```sql
SELECT * FROM Room
WHERE (type = 'd' OR type = 'f') AND price < 40.00
ORDER BY price ASC;
```

### Exercise 10: List the Bookings for Which No dateTo Has Been Specified

```sql
SELECT * FROM Booking WHERE dateTo IS NULL;
```

### Exercise 11: Count the Number of Hotels

```sql
SELECT COUNT(*) FROM Hotel;
```

### Exercise 12: Calculate the Average Price of a Room

```sql
SELECT AVG(price) FROM Room;
```

### Exercise 13: Total Revenue Per Night from All Double Rooms

```sql
SELECT SUM(price) AS TotalRevenue FROM Room WHERE type = 'd';
```

### Exercise 14: Count Different Guests Who Made Bookings for August

Assuming the format for dates is YYYY-MM-DD:

```sql
SELECT COUNT(DISTINCT guestNo) FROM Booking
WHERE MONTH(dateFrom) = 8 OR MONTH(dateTo) = 8;
```

### Exercise 15: Average Price of Rooms of Hotel Number 1

```sql
SELECT AVG(price) FROM Room WHERE hotelNo = 1;
```

Feel free to create a similar database and to test these SQL queries in your database and adjust them as necessary based on your actual data and database setup. You can also refer to other files in this directory as it contains many other SQL commands to apply and learn on your DB. :)
