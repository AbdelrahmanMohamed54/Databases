# Hotels Database Exercise

To complete my database task for the 'Hotels' database, I started by identifying the foreign keys in the schema and then implementing the schema in MySQL with the appropriate data types, primary keys, foreign keys, and integrity constraints.

### Part 01: Identify Foreign Keys
Foreign keys are used to link tables together. In our schema, the following foreign keys can be identified:

1. **HotelNo in Room table:** References `HotelNo` in the Hotel table.
2. **HotelNo in Booking table:** References `HotelNo` in the Hotel table.
3. **GuestNo in Booking table:** References `GuestNo` in the Guest table.
4. **RoomNo in Booking table:** Though not explicitly stated, it is logical that `RoomNo` in the Booking table should reference `RoomNo` in the Room table.

### Part 02: Implement the Schema in MySQL/MariaDB

Now, let's implement the schema with appropriate SQL queries.

#### Data Types:
- **HotelNo, GuestNo:** Integer (INT)
- **HotelName, GuestName:** Varchar (appropriate length, e.g., VARCHAR(100))
- **City, GuestAddress:** Varchar (appropriate length)
- **RoomNo:** Varchar (since it includes letters, e.g., VARCHAR(10))
- **Type:** Char (1) (since types are single characters like 's', 'd')
- **Price:** Decimal (for monetary values, e.g., DECIMAL(10, 2))
- **DateFrom, DateTo:** Date

#### SQL Queries:

```sql
-- Assuming use of MySQL/MariaDB

-- Creating the 'Hotel' table
CREATE TABLE Hotel (
    hotelNo INT PRIMARY KEY,
    hotelName VARCHAR(100),
    city VARCHAR(100)
);

-- Creating the 'Room' table
CREATE TABLE Room (
    roomNo VARCHAR(10),
    hotelNo INT,
    type CHAR(1),
    price DECIMAL(10, 2),
    PRIMARY KEY (roomNo, hotelNo),
    FOREIGN KEY (hotelNo) REFERENCES Hotel(hotelNo)
);

-- Creating the 'Guest' table
CREATE TABLE Guest (
    guestNo INT PRIMARY KEY,
    guestName VARCHAR(100),
    guestAddress VARCHAR(200)
);

-- Creating the 'Booking' table
CREATE TABLE Booking (
    hotelNo INT,
    guestNo INT,
    dateFrom DATE,
    dateTo DATE,
    roomNo VARCHAR(10),
    PRIMARY KEY (hotelNo, guestNo, dateFrom),
    FOREIGN KEY (hotelNo) REFERENCES Hotel(hotelNo),
    FOREIGN KEY (guestNo) REFERENCES Guest(guestNo),
    FOREIGN KEY (roomNo) REFERENCES Room(roomNo)
);

-- Make sure to use InnoDB as the engine for all tables
```

#### Testing the Commands:
- Test each `CREATE TABLE` statement in your MySQL/MariaDB environment to ensure they work as expected.
