--Get all customers and their addresses.
SELECT "customers".first_name, "customers".last_name, "addresses".street, "addresses".city, "addresses".state, "addresses".zip FROM "customers"
JOIN "addresses" ON "customers".id = "addresses".customer_id;

--Get all orders and their line items (orders, quantity and product).
SELECT "orders".id, "line_items".quantity, "line_items".product_id FROM "orders" 
JOIN "line_items" ON "orders".id = "line_items".order_id;

--Which warehouses have cheetos?
SELECT "products".description, "warehouse".warehouse FROM "products"
JOIN "warehouse_product" ON "products".id = "warehouse_product".product_id
JOIN "warehouse" ON "warehouse_product".warehouse_id = "warehouse".id
WHERE "products".id = 5;

--delta

--Which warehouses have diet pepsi?
SELECT "products".description, "warehouse".warehouse FROM "products"
JOIN "warehouse_product" ON "products".id = "warehouse_product".product_id
JOIN "warehouse" ON "warehouse_product".warehouse_id = "warehouse".id
WHERE "products".id = 6;

--alpha
--delta
--gamma

--Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "customers".first_name, "customers".last_name, COUNT("orders".address_id) FROM "customers"
JOIN "addresses" ON "customers".id = "addresses".customer_id
JOIN "orders" ON "addresses".id = "orders".address_id
GROUP BY "customers".first_name, "customers".last_name;

--How many customers do we have?
SELECT COUNT(*) FROM "customers";

--4

--How many products do we carry?
SELECT COUNT(*) FROM "products"; 

--7

--What is the total available on-hand quantity of diet pepsi?
SELECT SUM("warehouse_product".on_hand) FROM "warehouse_product"
WHERE "product_id" = 6;

--92
