CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	email VARCHAR(100),
	phone_number VARCHAR(15),
	billing_info VARCHAR(150)
);

CREATE TABLE sales_person(
	sales_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	email VARCHAR(100),
	phone_number VARCHAR(15),
	address VARCHAR(150)
);

CREATE TABLE car_inventory(
	VIN SERIAL PRIMARY KEY,
	quantity INTEGER,
	car_cost NUMERIC(10,2),
	inventory_description VARCHAR(150)
);

CREATE TABLE invoice(
	invoice_id SERIAL PRIMARY KEY,
	purchase_date DATE DEFAULT CURRENT_DATE,
	total_amount NUMERIC(10,2),
	customer_id INTEGER,
	car_id INTEGER,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
-- 	FOREIGN KEY(car_id) REFERENCES car(car_id)
);

CREATE TABLE car(
	car_id SERIAL PRIMARY KEY,
	description VARCHAR (150),
	car_price NUMERIC(10,2),
	total_amount NUMERIC(10,2),
	invoice_id INTEGER,
	VIN VARCHAR(100),
	FOREIGN KEY(invoice_id) REFERENCES invoice(invoice_id),
	FOREIGN KEY(VIN) REFERENCES car_inventory(VIN)
);

CREATE TABLE mechanic(
	mechanic_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	email VARCHAR(100),
	phone_number VARCHAR(15),
	address VARCHAR(150)
);

CREATE TABLE customer_car(
	repair_car_id SERIAL PRIMARY KEY,
	customer_id INTEGER
);

CREATE TABLE part_inventory(
	upc SERIAL PRIMARY KEY,
	quantity INTEGER,
	part_cost NUMERIC(8,2)
);

CREATE TABLE service_part(
	part_id SERIAL PRIMARY KEY,
	part_description VARCHAR(150),
	part_price NUMERIC(8,2),
	ticket_id INTEGER,
	upc INTEGER,
	FOREIGN KEY(ticket_id) REFERENCES service_ticket(ticket_id),
	FOREIGN KEY(upc) REFERENCES part_inventory(upc)
);

CREATE TABLE service_ticket(
	ticket_id SERIAL PRIMARY KEY,
	customer_id INTEGER,
	repair_date DATE DEFAULT CURRENT_DATE,
	total_amount NUMERIC(10,2),
	part_id INTEGER,
	repair_car_id INTEGER,
	FOREIGN KEY(part_id) REFERENCES service_part(part_id),
	FOREIGN KEY(repair_car_id) REFERENCES custom_car(repair_car_id)
);