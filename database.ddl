CREATE DATABASE INTERNETSHOP;

CREATE TABLE courier (
    id_courier INT PRIMARY KEY,
    courier_name VARCHAR(40),
    phone_number VARCHAR(20),
    transport VARCHAR(20),
    id_pick_up_point INT,
    FOREIGN KEY (id_pick_up_point) REFERENCES pick_up_point(id_pick_up_point)
);

CREATE TABLE pick_up_point (
    id_pick_up_point INT PRIMARY KEY,
    address VARCHAR(50),
    payment_types VARCHAR(50),
    storage_duration INT,
    working_time VARCHAR(20),
    id_client INT,
    FOREIGN KEY (id_client) REFERENCES client(id_client)
);

CREATE TABLE client (
    id_client INT PRIMARY KEY,
    client_name VARCHAR(40),
    gender VARCHAR(10),
    phone_number VARCHAR(20),
    clothes_size INT,
    id_pick_up_point INT,
    FOREIGN KEY (id_pick_up_point) REFERENCES pick_up_point(id_pick_up_point)
);

CREATE TABLE order_ (
    id_order INT PRIMARY KEY,
    sum FLOAT,
    discount INT,
    id_client INT,
    id_product INT,
    FOREIGN KEY (id_client) REFERENCES client(id_client),
    FOREIGN KEY (id_product) REFERENCES product(id_product)
);

CREATE TABLE shipper (
    id_shipper INT PRIMARY KEY,
    company_name VARCHAR(40),
);

CREATE TABLE storage (
    id_comment INT PRIMARY KEY,
    address VARCHAR(50),
    working_time VARCHAR(20),
    capacity INT,
    id_product INT,
    FOREIGN KEY (id_product) REFERENCES product(id_product)
);

CREATE TABLE product (
    id_product INT PRIMARY KEY,
    brand VARCHAR(20),
    season VARCHAR(20),
    size INT,
    gender VARCHAR(10),
    product_type VARCHAR(20),
    color VARCHAR(20),
    material VARCHAR(20),
    price FLOAT,
    origin_country VARCHAR(20),
    id_shipper INT,
    id_storage INT,
    id_order INT,
    FOREIGN KEY (id_shipper) REFERENCES shipper(id_shipper),
    FOREIGN KEY (id_storage) REFERENCES storage(id_storage),
    FOREIGN KEY (id_order) REFERENCES order_(id_order)
);

CREATE TABLE parcel (
    id_parcel INT PRIMARY KEY,
    payment_type VARCHAR(20),
    delivery_type VARCHAR(20),
    time_slot VARCHAR(20),
    address VARCHAR(50),
    id_courier INT,
    id_storage INT,
    id_order INT,
    FOREIGN KEY (id_courier) REFERENCES courier(id_courier),
    FOREIGN KEY (id_storage) REFERENCES storage(id_storage),
    FOREIGN KEY (id_order) REFERENCES order_(id_order)
);
