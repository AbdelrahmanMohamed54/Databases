
## Messenger Database (Create a Database & Tables)

**I have already installed XAMPP with PHPMyAdmin to use it when running these commands.**


### Define Tables Structure
- These following commands define the structure of my messenger database tables, their attributes, and the primary keys. Foreign keys will be added in a later part.  
- The data types used in these commands are typical for MySQL, which offers a broader range of types compared to SQLite.

- Here are the SQL commands to create each table of my messenger database:

1. **Table: messages**
   ```sql
   CREATE TABLE messages (
       mid INT,
       msgtext TEXT,
       sendtimestamp TIMESTAMP,
       contactID INT,
       chatID INT,
       PRIMARY KEY (mid)
   );
   ```

2. **Table: chat**
   ```sql
   CREATE TABLE chat (
       cid INT,
       title VARCHAR(255),
       isGroup BOOLEAN,
       PRIMARY KEY (cid)
   );
   ```

3. **Table: contact**
   ```sql
   CREATE TABLE contact (
       coid INT,
       name VARCHAR(255),
       univemail VARCHAR(255),
       lastsync TIMESTAMP,
       PRIMARY KEY (coid)
   );
   ```

4. **Table: contact_chat**
   ```sql
   CREATE TABLE contact_chat (
       ccid INT,
       lastvisit DATETIME,
       role VARCHAR(255),
       contactID INT,
       chatID INT,
       PRIMARY KEY (ccid)
   );
   ```

---

Add foreign key constraints to your tables and then insert some sample data. 

### Adding Foreign Keys

1. **Table messages**
   Add foreign keys for `contactID` and `chatID`.
   ```sql
   ALTER TABLE messages
   ADD FOREIGN KEY (contactID) REFERENCES contact(coid),
   ADD FOREIGN KEY (chatID) REFERENCES chat(cid);
   ```

2. **Table contact_chat**
   Add foreign keys for `contactID` and `chatID`.
   ```sql
   ALTER TABLE contact_chat
   ADD FOREIGN KEY (contactID) REFERENCES contact(coid),
   ADD FOREIGN KEY (chatID) REFERENCES chat(cid);
   ```

### Inserting Data

1. **Table contact**
   ```sql
   INSERT INTO contact (coid, name, univemail, lastsync) VALUES
   (1, 'Alice Smith', 'alice.smith@university.edu', '2024-01-08 09:00:00'),
   (2, 'Bob Johnson', 'bob.johnson@university.edu', '2024-01-08 09:15:00'),
   (3, 'Carol Brown', 'carol.brown@university.edu', '2024-01-08 09:30:00');
   ```

2. **Table chat**
   ```sql
   INSERT INTO chat (cid, title, isGroup) VALUES
   (1, 'Study Group', TRUE),
   (2, 'Project Team', TRUE),
   (3, 'Friends', FALSE);
   ```

3. **Table messages**
   ```sql
   INSERT INTO messages (mid, msgtext, sendtimestamp, contactID, chatID) VALUES
   (1, 'Hello everyone!', '2024-01-08 10:00:00', 1, 1),
   (2, 'When is our next meeting?', '2024-01-08 10:05:00', 2, 2),
   (3, 'Happy Birthday!', '2024-01-08 10:10:00', 3, 3);
   ```

4. **Table contact_chat**
   ```sql
   INSERT INTO contact_chat (ccid, lastvisit, role, contactID, chatID) VALUES
   (1, '2024-01-08 10:00:00', 'Member', 1, 1),
   (2, '2024-01-08 10:15:00', 'Admin', 2, 2),
   (3, '2024-01-08 10:30:00', 'Member', 3, 3);
   ```
