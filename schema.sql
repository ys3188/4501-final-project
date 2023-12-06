
CREATE TABLE IF NOT EXISTS zipcode (
    id INTEGER PRIMARY KEY,
    zipcode VARCHAR(10),
    geometry GEOMETRY(Point, 4326)
);

DROP INDEX IF EXISTS idx_zipcode_geometry;
CREATE INDEX idx_zipcode_geometry ON zipcode USING GIST (geometry);

CREATE TABLE IF NOT EXISTS complaint (
    id INTEGER PRIMARY KEY,
    created_date TIMESTAMP,
    incident_zip VARCHAR(15),
    complaint_type VARCHAR(100),
    latitude DECIMAL,
    longitude DECIMAL,
    geometry GEOMETRY(Point, 4326)
);

DROP INDEX IF EXISTS idx_zipcode_geometry;
CREATE INDEX IF NOT EXISTS idx_complaint_geometry ON complaint USING GIST (geometry);

CREATE TABLE IF NOT EXISTS tree (
    tree_id INTEGER PRIMARY KEY,
    status VARCHAR(50),
    health VARCHAR(50),
    zipcode VARCHAR(10),
    spc_common VARCHAR(100),
    latitude DECIMAL,
    longitude DECIMAL,
    geometry GEOMETRY(Point, 4326)
);

DROP INDEX IF EXISTS idx_tree_geometry;
CREATE INDEX idx_tree_geometry ON tree USING GIST (geometry);

CREATE TABLE IF NOT EXISTS rent (
    id INTEGER PRIMARY KEY,
    RegionName VARCHAR(10),
    City VARCHAR(50),
    CountyName VARCHAR(50),
    Date DATE,
    Rent DECIMAL(10, 2)
);
