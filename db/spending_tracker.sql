DROP TABLE purchases;
DROP TABLE tags;
DROP TABLE merchants;
DROP TABLE users;

CREATE TABLE merchants
(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE tags
(
  id SERIAL4 PRIMARY KEY,
  type VARCHAR(255)
);

CREATE TABLE purchases
(
  id SERIAL4 PRIMARY KEY,
  merchant_id INT8 REFERENCES merchants(id) ON DELETE CASCADE,
  tag_id INT8 REFERENCES tags(id) ON DELETE CASCADE,
  amount DECIMAL(14,2),
  purchase_date DATE DEFAULT CURRENT_DATE 
);

CREATE TABLE users
(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  budget DECIMAL(14,2)
);
