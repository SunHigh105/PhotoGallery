CREATE DATABASE photogallery;

psql -U root -d photogallery << "EOSQL"

createdb photogallery;

CREATE TABLE category(
    id SERIAL,
    name VARCHAR(255) NOT NULL,
    created TIMESTAMP NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE photo(
    id SERIAL NOT NULL,
    date_token TIMESTAMP NOT NULL,
    capture_path VARCHAR(255) NOT NULL,
    comment TEXT NOT NULL,
    is_private INTEGER NOT NULL DEFAULT 0,
    category_id INTEGER,
    PRIMARY KEY(id),
    FOREIGN KEY(category_id) REFERENCES category(id)
);

INSERT INTO category(id, name, created) VALUES(1,'自然', '2019-02-21 22:32:00');

INSERT INTO photo(date_token, capture_path, comment, category_id) VALUES('2019-01-01 07:43:00', 'IMG_1327.jpg', '地元で撮った初日の出', 1);

EOSQL