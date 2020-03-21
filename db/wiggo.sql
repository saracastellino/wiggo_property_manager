DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS properties;
DROP TABLE IF EXISTS booking_platforms;
DROP TABLE IF EXISTS guests;

CREATE TABLE guests (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  last_name VARCHAR(255),
  nationality VARCHAR(255),
  dob DATE,
  documents VARCHAR(255),
  contacts VARCHAR(255)
);

CREATE TABLE booking_platforms (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  url VARCHAR(255)
);

CREATE TABLE properties (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  category VARCHAR(255),
  address VARCHAR(255),
  place VARCHAR(255),
  booking_platform_id INT REFERENCES booking_platforms(id) ON DELETE CASCADE,
  sleeps INT,
  daily_fee INT,
  contacts VARCHAR(255)
);

CREATE TABLE bookings (
  id SERIAL PRIMARY KEY,
  guest_id INT REFERENCES guests(id) ON DELETE CASCADE,
  property_id INT REFERENCES properties(id) ON DELETE CASCADE,
  pax INT,
  check_in_date DATE,
  check_out_date DATE,
  nights INT
);
