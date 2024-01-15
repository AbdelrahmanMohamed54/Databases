# Insert, Update, Delete operations on the Hotels Database

I'll be addressing each of the tasks for my Hotels database exercise using SQL commands. 

### Exercise 1: Insert Data into Tables

We'll insert the required data based on the specifications:

1. **Insert a Hotel named 'Astoria' and Hotels in specified cities:**

    ```sql
    INSERT INTO Hotel (hotelNo, hotelName, city) VALUES
    (1, 'Astoria', 'Berlin'),
    (2, 'Hotel B', 'Washington'),
    (3, 'Hotel C', 'Deggendorf');
    ```

2. **Insert Rooms of different types and prices, including some under $40:**

    ```sql
    INSERT INTO Room (roomNo, hotelNo, type, price) VALUES
    ('r101', 1, 's', 35.00),
    ('r102', 1, 'd', 50.00),
    ('r103', 1, 'a', 60.00),
    ('r201', 2, 's', 45.00),
    ('r202', 2, 'd', 55.00),
    ('r301', 3, 's', 39.00),
    ('r302', 3, 'd', 60.00);
    ```

3. **Insert Guests (dummy data for demonstration):**

    ```sql
    INSERT INTO Guest (guestNo, guestName, guestAddress) VALUES
    (101, 'John Doe', '123 Street, City'),
    (102, 'Jane Doe', '456 Avenue, City');
    ```

4. **Insert Bookings with open-ended dates (dateTo is null):**

    ```sql
    INSERT INTO Booking (hotelNo, guestNo, dateFrom, dateTo, roomNo) VALUES
    (1, 101, '2024-01-01', NULL, 'r101'),
    (2, 102, '2024-01-02', NULL, 'r201');
    ```

### Exercise 2: Export Data into a CSV File Using PHPMyAdmin

Since PHPMyAdmin is a web interface, follow these general steps:

1. Log into PHPMyAdmin.
2. Select your database and then the table you want to export.
3. Go to the "Export" tab.
4. Choose the format as CSV.
5. For options, use either `;` or `,` as a separator. This depends on your requirements or regional settings (e.g., some regions use `,` as the decimal separator, so `;` might be preferable).
6. Click on "Go" to download the CSV file.


### Exercise 3: Delete a Booking for a Given Day

To delete a booking for a specific guest on a specific day, you would use a DELETE command. Assuming you know the `guestNo` and the `dateFrom`, the command would look like this:

```sql
DELETE FROM Booking WHERE guestNo = 101 AND dateFrom = '2024-01-01';
```


### Exercise 4: Update the Price of All Rooms by Incrementing it by 5%

To increase the price of all rooms by 5%, use the UPDATE command:

```sql
UPDATE Room SET price = price * 1.05;
```

### Exercise 5: Decrement the Price of Rooms in a Specific Hotel by 5%

To decrease the price of rooms in a specific hotel by 5%, you need the `hotelNo` of that hotel:

```sql
UPDATE Room SET price = price * 0.95 WHERE hotelNo = 2;
```


Feel free to create a similar database and to test these commands in your database environment and adjust as necessary based on your database setup and data.
