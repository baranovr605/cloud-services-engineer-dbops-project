-- Create index by order_id in table order_product
CREATE INDEX order_product_order_id_idx ON order_product (order_id);

-- Create index by status and date_created in table orders
CREATE INDEX orders_status_date_idx ON orders (status, date_created);
