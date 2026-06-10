--USERS --database: travel_db

CREATE TABLE IF NOT EXISTS users (
    user_id BIGSERIAL PRIMARY KEY,
    username VARCHAR(20) UNIQUE NOT NULL
        CHECK (username ~ '^[A-Za-z0-9]+$'),
    first_name VARCHAR(15) NOT NULL,
    last_name VARCHAR(15) NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    email_id VARCHAR(100) NOT NULL
);

-- DESTINATION

CREATE TABLE IF NOT EXISTS destination (
    destination_id BIGSERIAL PRIMARY KEY,
    destination_name VARCHAR(50) NOT NULL
        CHECK (destination_name ~ '^[A-Za-z &-]+$'),
    city VARCHAR(50) NOT NULL
        CHECK (city ~ '^[A-Za-z .-]+$'),
    state VARCHAR(50)
        CHECK (state ~ '^[A-Za-z .-]+$'),
    country VARCHAR(50) NOT NULL
        CHECK (country ~ '^[A-Za-z .-]+$'),
    description VARCHAR(255)
);

-- FLIGHT

CREATE TABLE IF NOT EXISTS flight (
    flight_id BIGSERIAL PRIMARY KEY,
    airline_name VARCHAR(50) NOT NULL,
    flight_number VARCHAR(20) UNIQUE NOT NULL,
    departure_airport VARCHAR(50) NOT NULL,
    arrival_airport VARCHAR(50) NOT NULL
);

-- HOTEL

CREATE TABLE IF NOT EXISTS hotel (
    hotel_id BIGSERIAL PRIMARY KEY,
    hotel_name VARCHAR(100) NOT NULL,
    destination_id BIGINT REFERENCES destination(destination_id),
    hotel_rating NUMERIC(2,1)
);

-- TRIP

CREATE TABLE IF NOT EXISTS trip (
    trip_id BIGSERIAL PRIMARY KEY,
    user_id BIGINT REFERENCES users(user_id),
    destination_id BIGINT REFERENCES destination(destination_id),
    trip_name VARCHAR(40)
        CHECK (trip_name ~ '^[A-Za-z_& ]+$')
);

-- BOOKING

CREATE TABLE IF NOT EXISTS booking (
    booking_id BIGSERIAL PRIMARY KEY,
    trip_id BIGINT REFERENCES trip(trip_id),
    flight_id BIGINT REFERENCES flight(flight_id),
    hotel_id BIGINT REFERENCES hotel(hotel_id)
);

-- PAYMENT

CREATE TABLE IF NOT EXISTS payment (
    payment_id BIGSERIAL PRIMARY KEY,

    booking_id BIGINT UNIQUE NOT NULL
        REFERENCES booking(booking_id),

    amount NUMERIC(10,2) NOT NULL
        CHECK (amount > 0),

    payment_method VARCHAR(20) NOT NULL
        CHECK (
            payment_method IN (
                'Credit Card',
                'Debit Card',
                'UPI',
                'Net Banking',
                'Wallet'
            )
        ),

    payment_status VARCHAR(20) NOT NULL
        CHECK (
            payment_status IN (
                'Pending',
                'Completed',
                'Failed',
                'Refunded'
            )
        ),

    payment_date TIMESTAMP NOT NULL
        DEFAULT CURRENT_TIMESTAMP
);

select current_database();