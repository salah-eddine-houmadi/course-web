
CREATE TABLE IF NOT EXISTS chai_store (
  id SERIAL PRIMARY KEY,
  chai_name VARCHAR(50) NOT NULL,
  price DECIMAL(5,2) NOT NULL,
  chai_type VARCHAR(30),
  available BOOLEAN DEFAULT TRUE
);

INSERT INTO chai_store (chai_name, price, chai_type, available)
VALUES 
('Masala Chai', 12.50, 'Spiced', TRUE),
('Green Chai', 10.00, 'Herbal', TRUE),
('Iced Chai', 15.00, 'Cold', FALSE)
ON CONFLICT DO NOTHING;

CREATE TABLE IF NOT EXISTS inventory (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  price DECIMAL(12,2),
  stock INT DEFAULT 0,
  product_name VARCHAR(100)
);

INSERT INTO inventory (name, price, stock, product_name)
VALUES 
('TSHIRT', 500.00, 10, 'TSHIRT'),
('HAT', 200.00, 5, 'HAT')
ON CONFLICT DO NOTHING;


CREATE TABLE IF NOT EXISTS customers (
  customer_id SERIAL PRIMARY KEY,
  name VARCHAR(50)
);

INSERT INTO customers (name) VALUES
('Alice'),
('Bob'),
('Charlie')
ON CONFLICT DO NOTHING;


CREATE TABLE IF NOT EXISTS orders (
  order_id SERIAL PRIMARY KEY,
  customer_id INT,
  product VARCHAR(50),
  quantity INT
);

INSERT INTO orders (customer_id, product, quantity) VALUES
(1, 'T-shirt', 2),
(2, 'Hat', 1),
(3, 'Green Chai', 3)
ON CONFLICT DO NOTHING;


DO $$
BEGIN
   IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'hitesh') THEN
      CREATE ROLE hitesh LOGIN PASSWORD 'hitesh123';
   END IF;

   IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'sales_team') THEN
      CREATE ROLE sales_team LOGIN PASSWORD 'sales123';
   END IF;
END $$;


GRANT SELECT ON inventory TO hitesh;
GRANT INSERT, UPDATE ON inventory TO sales_team;

GRANT SELECT ON chai_store TO hitesh;
GRANT INSERT, UPDATE ON chai_store TO sales_team;

GRANT SELECT ON orders TO hitesh;
GRANT INSERT, UPDATE ON orders TO sales_team;



SELECT c.name AS customer_name, o.product, o.quantity
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;


SELECT c.name AS customer_name, o.product, o.quantity
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

BEGIN;


INSERT INTO inventory (name, price, stock)
VALUES ('salah', 3000.00, 5);


UPDATE inventory
SET stock = stock - 5
WHERE name = 'salah';

COMMIT;
