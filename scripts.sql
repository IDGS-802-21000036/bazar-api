CREATE TABLE dimension (
    id SERIAL PRIMARY KEY,
    width FLOAT NOT NULL,
    height FLOAT NOT NULL,
    depth FLOAT NOT NULL
);

CREATE TABLE review (
    id SERIAL PRIMARY KEY,
    rating INTEGER NOT NULL,
    comment TEXT NOT NULL,
    date TIMESTAMP NOT NULL,
    reviewer_name VARCHAR(255) NOT NULL,
    reviewer_email VARCHAR(255) NOT NULL
);

CREATE TABLE meta (
    id SERIAL PRIMARY KEY,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    barcode VARCHAR(255) NOT NULL,
    qr_code VARCHAR(255) NOT NULL
);

CREATE TABLE product (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    category VARCHAR(255) NOT NULL,
    price FLOAT NOT NULL,
    discount_percentage FLOAT NOT NULL,
    rating FLOAT NOT NULL,
    stock INTEGER NOT NULL,
    tags JSONB NOT NULL,
    brand VARCHAR(255) NOT NULL,
    sku VARCHAR(255) NOT NULL,
    weight FLOAT NOT NULL,
    dimensions_id INTEGER NOT NULL,
    warranty_information VARCHAR(255) NOT NULL,
    shipping_information VARCHAR(255) NOT NULL,
    availability_status VARCHAR(255) NOT NULL,
    return_policy VARCHAR(255) NOT NULL,
    minimum_order_quantity INTEGER NOT NULL,
    meta_id INTEGER NOT NULL,
    images JSONB NOT NULL,
    thumbnail VARCHAR(255) NOT NULL,
    FOREIGN KEY (dimensions_id) REFERENCES dimension (id) ON DELETE CASCADE,
    FOREIGN KEY (meta_id) REFERENCES meta (id) ON DELETE CASCADE
);

CREATE TABLE product_reviews (
    product_id INTEGER NOT NULL,
    review_id INTEGER NOT NULL,
    PRIMARY KEY (product_id, review_id),
    FOREIGN KEY (product_id) REFERENCES product (id) ON DELETE CASCADE,
    FOREIGN KEY (review_id) REFERENCES review (id) ON DELETE CASCADE
);

CREATE TABLE purchase (
    id SERIAL PRIMARY KEY,
    product_id INTEGER NOT NULL,
    total_price FLOAT NOT NULL,
    purchase_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES product (id) ON DELETE CASCADE
);