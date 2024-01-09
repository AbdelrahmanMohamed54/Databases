## Complex SQL Query Tasks on the Messenger database

**To do these tasks we need to add more data to my 'Messenger database'**

### Part 01: Count of Messages Stored
```sql
SELECT COUNT(*) FROM messages;
```

### Part 02: Count of Messages to Every Single Receiver
```sql
SELECT contactID, COUNT(*) AS message_count 
FROM messages 
GROUP BY contactID;
```

### Part 03: Count of Messages Stored in Each Chat
```sql
SELECT chatID, COUNT(*) AS message_count 
FROM messages 
GROUP BY chatID;
```

### Part 04: Length of the Longest Message
```sql
SELECT MAX(CHAR_LENGTH(msgtext)) AS longest_message_length 
FROM messages;
```

### Part 05: Messages Longer Than Average Text Length
```sql
SELECT msgtext 
FROM messages 
WHERE CHAR_LENGTH(msgtext) > (SELECT AVG(CHAR_LENGTH(msgtext)) FROM messages);
```

### Part 06: Messages to Bob
Assuming Bob's `coid` is known and we're identifying him by name.
```sql
SELECT m.msgtext, m.sendtimestamp 
FROM messages m
JOIN contact c ON m.contactID = c.coid
WHERE c.name = 'Bob';
```

### Part 07: Messages of the Chat "Database Engineering"
```sql
SELECT m.msgtext 
FROM messages m
JOIN chat c ON m.chatID = c.cid
WHERE c.title = 'Database Engineering';
```

### Part 08: Contacts in "Database Engineering" Chat
```sql
SELECT co.name, co.univemail 
FROM contact co
JOIN contact_chat cc ON co.coid = cc.contactID
JOIN chat c ON cc.chatID = c.cid
WHERE c.title = 'Database Engineering';
```

**These queries assume a direct relationship between messages and contacts, and between messages and chats. In a real-world scenario, relationships might be more complex, requiring more intricate joins and perhaps different table structures. Additionally, replace any placeholder names or titles with actual values from your database where necessary.**
