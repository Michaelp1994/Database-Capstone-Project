import mysql.connector as connector


# Task 1
connection = connector.connect(user="mysql", password="password", db="little_lemon")
cursor = connection.cursor()

# Task 2
show_tables_query = "SHOW tables"
cursor.execute(show_tables_query)
results = cursor.fetchall()
print(cursor.column_names)
print(results)

# Task 3
creating_joins = """
SELECT customers.FullName, 
customers.contactDetails, 
orders.TotalCost
FROM customers
INNER JOIN orders ON customers.customerID = orders.customerID
WHERE orders.TotalCost > 60;

"""

cursor.execute(creating_joins)
results = cursor.fetchall()
print(cursor.column_names)
print(results)
