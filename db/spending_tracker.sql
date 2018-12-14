DROP TABLE users_purchases;
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
  amount DECIMAL(9,2),
  purchase_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE users
(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  budget DECIMAL(9,2)
);

CREATE TABLE users_purchases
(
  id SERIAL4 PRIMARY KEY,
  user_id INT8 REFERENCES users(id) ON DELETE CASCADE,
  purchase_id INT8 REFERENCES purchases(id) ON DELETE CASCADE
);
