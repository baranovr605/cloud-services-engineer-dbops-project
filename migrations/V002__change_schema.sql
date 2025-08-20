-- Add PIMARY KEY for Table product
ALTER TABLE product ADD CONSTRAINT product_primary_key PRIMARY KEY (id);

-- Add column price for Table product
ALTER TABLE product ADD COLUMN price DOUBLE PRECISION;

-- Drop Table product_info (after last ALTER dont need)
DROP TABLE IF EXISTS product_info;

-- Add PRIMARY KEY for Table orders
ALTER TABLE orders ADD CONSTRAINT orders_primary_key PRIMARY KEY (id);

-- Add column date_created for Table orders
ALTER TABLE orders ADD COLUMN date_created DATE DEFAULT CURRENT_DATE;

-- Drop Table orders_date (after last ALTER dont need)
DROP TABLE IF EXISTS orders_date;

-- Add foreign keys
ALTER TABLE order_product ADD CONSTRAINT foreign_key_order_id FOREIGN KEY (order_id) REFERENCES orders(id),
ADD CONSTRAINT foreign_key_product_id FOREIGN KEY (product_id) REFERENCES product(id);
