USE `my_database(tourism)`;
show tables;

CREATE TABLE Country (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    region VARCHAR(100)
);

CREATE TABLE Clients (
    client_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL,
    phone VARCHAR(30)
);

CREATE TABLE TourTypes (
    tour_type_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

CREATE TABLE Services (
    service_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(120) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE NOT NULL,
    people_count INT,
    total_price DECIMAL(10,2),

    client_id INT,
    country_id INT,
    tour_type_id INT,
    service_id INT,

    FOREIGN KEY (client_id) REFERENCES Clients(client_id),
    FOREIGN KEY (country_id) REFERENCES Country(country_id),
    FOREIGN KEY (tour_type_id) REFERENCES TourTypes(tour_type_id),
    FOREIGN KEY (service_id) REFERENCES Services(service_id)
);

INSERT INTO Country (name, region)
VALUES ('Tailand', 'Asia'),
       ('France', 'Europe');

INSERT INTO Clients (full_name, phone)
VALUES ('Ivan Petrov', '+79990000000'),
       ('Anna Smirnova', '+79991111111');

INSERT INTO TourTypes (name, description)
VALUES ('Beach Tour', 'Relax'),
       ('Excursion Tour', 'City');

INSERT INTO Services (name, price)
VALUES ('Insurance', 500.00),
       ('Transfer', 1000.00);

INSERT INTO Orders (order_date, people_count, total_price,
                    client_id, country_id, tour_type_id, service_id)
VALUES (CURDATE(), 2, 51500.00, 1, 1, 1, 1),
       (CURDATE(), 1, 20000.00, 2, 2, 2, 2);


SELECT 
    o.order_id,
    o.order_date,
    c.full_name,
    co.name AS country,
    t.name AS tour_type,
    s.name AS service,
    o.total_price
FROM Orders o
JOIN Clients c ON o.client_id = c.client_id
JOIN Country co ON o.country_id = co.country_id
JOIN TourTypes t ON o.tour_type_id = t.tour_type_id
JOIN Services s ON o.service_id = s.service_id