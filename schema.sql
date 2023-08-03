DROP TABLE IF EXISTS card_holder CASCADE;
DROP TABLE IF EXISTS credit_card CASCADE;
DROP TABLE IF EXISTS merchant CASCADE;
DROP TABLE IF EXISTS merchant_category CASCADE;
DROP TABLE IF EXISTS transaction CASCADE;

-- 1. Create a Card Holder table
CREATE TABLE card_holder (
    id INT,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

-- 2. Create Credit Card table
CREATE TABLE credit_card (
    card VARCHAR(20),
    cardholder_id INT NOT NULL,
    PRIMARY KEY (card),
    FOREIGN KEY (cardholder_id) REFERENCES card_holder(id)
);

-- 3. Create Merchant Category table
CREATE TABLE merchant_category (
    id INT,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

-- 4. Create Merchant table
CREATE TABLE merchant (
    id INT,
    name VARCHAR(50) NOT NULL,
    id_merchant_category INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_merchant_category) REFERENCES merchant_category(id)
);

-- 5. Create Transaction table
CREATE TABLE transaction (
	id INT,
	date TIMESTAMP,
	amount FLOAT,
	card VARCHAR(20),
	id_merchant INT,
	PRIMARY KEY (id),
	FOREIGN KEY (card) REFERENCES credit_card(card),
	FOREIGN KEY (id_merchant) REFERENCES merchant(id)
)