DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS properties;
DROP TABLE IF EXISTS guests;


CREATE TABLE properties (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  category VARCHAR(255),
  address VARCHAR(255),
  place VARCHAR(255),
  booking_platform VARCHAR(255),
  sleeps VARCHAR(255),
  daily_fee INT,
  contacts VARCHAR(255)
);

CREATE TABLE guests (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  last_name VARCHAR(255),
  nationality VARCHAR(255),
  dob VARCHAR(255),
  documents VARCHAR(255),
  contacts VARCHAR(255)
);

CREATE TABLE bookings (
  id SERIAL PRIMARY KEY,
  guest_id INT REFERENCES guests(id) ON DELETE CASCADE,
  property_id INT REFERENCES properties(id) ON DELETE CASCADE,
  pax INT,
  check_in_date VARCHAR(255),
  check_out_date VARCHAR(255),
  nights INT,
  total_earning INT
);
