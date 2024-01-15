# More complex SELECT statements on the Hotels database

Let's tackle each of these complex SELECT statement exercises for my Hotels database, involving subselects, grouping, and joins. 

### Exercise 16: Price and Type of Rooms at the Astoria Hotel

```sql
SELECT Room.price, Room.type FROM Room
JOIN Hotel ON Room.hotelNo = Hotel.hotelNo
WHERE Hotel.hotelName = 'Astoria';
```

### Exercise 17: List All Guests Currently Staying at the Hotel ‘Astoria’

Assuming we use a specific date as the current date:

```sql
SELECT Guest.guestName FROM Guest
JOIN Booking ON Guest.guestNo = Booking.guestNo
JOIN Hotel ON Booking.hotelNo = Hotel.hotelNo
WHERE Hotel.hotelName = 'Astoria'
AND Booking.dateFrom <= '2024-01-15'
AND (Booking.dateTo >= '2024-01-15' OR Booking.dateTo IS NULL);
```

### Exercise 18: Total Income from Bookings for the Hotel ‘Astoria’ Today

```sql
SELECT SUM(Room.price) as TotalIncome FROM Booking
JOIN Room ON Booking.roomNo = Room.roomNo
JOIN Hotel ON Room.hotelNo = Hotel.hotelNo
WHERE Hotel.hotelName = 'Astoria'
AND Booking.dateFrom <= '2024-01-15'
AND (Booking.dateTo >= '2024-01-15' OR Booking.dateTo IS NULL);
```

### Exercise 19: List Rooms Currently Free/Unoccupied at the Astoria

```sql
SELECT Room.* FROM Room
LEFT JOIN Booking ON Room.roomNo = Booking.roomNo AND Room.hotelNo = Booking.hotelNo
JOIN Hotel ON Room.hotelNo = Hotel.hotelNo
WHERE Hotel.hotelName = 'Astoria'
AND (Booking.dateFrom > '2024-01-15' OR Booking.dateTo < '2024-01-15' OR Booking.dateFrom IS NULL);
```

### Exercise 20: Lost Income from Unoccupied Rooms at the Astoria

```sql
SELECT SUM(Room.price) as LostIncome FROM Room
LEFT JOIN Booking ON Room.roomNo = Booking.roomNo AND Room.hotelNo = Booking.hotelNo
JOIN Hotel ON Room.hotelNo = Hotel.hotelNo
WHERE Hotel.hotelName = 'Astoria'
AND (Booking.dateFrom > '2024-01-15' OR Booking.dateTo < '2024-01-15' OR Booking.dateFrom IS NULL);
```

### Exercise 21: Number of Rooms in Each Hotel

```sql
SELECT Hotel.hotelName, COUNT(Room.roomNo) as NumberOfRooms FROM Hotel
JOIN Room ON Hotel.hotelNo = Room.hotelNo
GROUP BY Hotel.hotelNo;
```

### Exercise 22: Number of Rooms in Each Hotel in Berlin

```sql
SELECT Hotel.hotelName, COUNT(Room.roomNo) as NumberOfRooms FROM Hotel
JOIN Room ON Hotel.hotelNo = Room.hotelNo
WHERE Hotel.city = 'Berlin'
GROUP BY Hotel.hotelNo;
```

### Exercise 23: Lost Income from Unoccupied Rooms at Each Hotel Today

```sql
SELECT Hotel.hotelName, SUM(Room.price) as LostIncome FROM Hotel
JOIN Room ON Hotel.hotelNo = Room.hotelNo
LEFT JOIN Booking ON Room.roomNo = Booking.roomNo AND Room.hotelNo = Booking.hotelNo
WHERE (Booking.dateFrom > '2024-01-15' OR Booking.dateTo < '2024-01-15' OR Booking

.dateFrom IS NULL)
GROUP BY Hotel.hotelNo;
```

### Exercise 24: Details of All Rooms at the Astoria, Including Occupying Guest Name

This is a more complex query using a LEFT JOIN:

```sql
SELECT Room.*, Guest.guestName FROM Room
LEFT JOIN (SELECT Booking.roomNo, Booking.hotelNo, Guest.guestName FROM Booking
           JOIN Guest ON Booking.guestNo = Guest.guestNo
           WHERE Booking.dateFrom <= '2024-01-15' AND (Booking.dateTo >= '2024-01-15' OR Booking.dateTo IS NULL)) AS CurrentBookings
ON Room.roomNo = CurrentBookings.roomNo AND Room.hotelNo = CurrentBookings.hotelNo
JOIN Hotel ON Room.hotelNo = Hotel.hotelNo
WHERE Hotel.hotelName = 'Astoria';
```

In this query, if a room is unoccupied, `Guest.guestName` will be NULL.

Feel free to create a similar database to my Hotels database in the file 'hotels_tables.md' and to test these SQL queries in your database and play arround with them as necessary based on your actual data and database setup. 
