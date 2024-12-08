-- Create samsBills View
CREATE VIEW samsBills AS
SELECT 
    waiters.first_name,
    waiters.surname,
    bills.bill_date,
    bills.cust_name,
    bills.bill_total
FROM 
    waiters
JOIN 
    bills ON waiters.waiter_id = bills.waiter_id
WHERE 
    waiters.first_name = 'Sam' AND waiters.surname = 'Pitt';

-- Query to retrieve bills over £400 from samsBills
SELECT * 
FROM samsBills
WHERE bill_total > 400;

-- Create roomTotals View
CREATE VIEW roomTotals AS
SELECT 
    rooms.room_name,
    SUM(bills.bill_total) AS total_sum
FROM 
    rooms
JOIN 
    bills ON rooms.room_id = bills.room_id
GROUP BY 
    rooms.room_name;

-- Create teamTotals View
CREATE VIEW teamTotals AS
SELECT 
    CONCAT(waiters.first_name, ' ', waiters.surname) AS headwaiter_name,
    SUM(bills.bill_total) AS total_sum
FROM 
    waiters
JOIN 
    bills ON waiters.waiter_id = bills.waiter_id
GROUP BY 
    waiters.waiter_id, headwaiter_name;