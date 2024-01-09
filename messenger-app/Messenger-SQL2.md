## Basic SQL operations on my 'Messenger database'

- Using SQL commands to update, delete, and select data in my Messenger database:

### Update

1. **Update all contacts to set the lastsync to the current time:**
   ```sql
   UPDATE contact
   SET lastsync = CURRENT_TIMESTAMP;
   ```

2. **Update your contact (assuming your `coid` is 1) and set the lastsync to the current time:**
   ```sql
   UPDATE contact
   SET lastsync = CURRENT_TIMESTAMP
   WHERE coid = 1;
   ```

### List

1. **List all chats:**
   ```sql
   SELECT * FROM chat;
   ```

2. **List all messages:**
   ```sql
   SELECT * FROM messages;
   ```

### Delete

1. **Delete a chat with a specific id (e.g., `cid` 1):**
   ```sql
   DELETE FROM chat
   WHERE cid = 1;
   ```

2. **Delete a message with a specific id (assuming `mid` is the identifier for messages):**
   ```sql
   DELETE FROM messages
   WHERE mid = 2;
   ```


### List Specific Messages

1. **List all messages from a contact with a specific id (e.g., `contactID` 1):**
   ```sql
   SELECT * FROM messages
   WHERE contactID = 1;
   ```

2. **List all messages with “lecture” in the title:**
   This requires a join between the `messages` and `chat` tables, assuming the title is in the `chat` table.
   ```sql
   SELECT messages.* 
   FROM messages
   JOIN chat ON messages.chatID = chat.cid
   WHERE chat.title LIKE '%lecture%';
   ```

**Ensure that your database's SQL dialect supports these functions and commands, as there can be slight variations between different SQL database systems.**
