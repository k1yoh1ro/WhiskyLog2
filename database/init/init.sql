-- DB作成
CREATE DATABASE WLDB;

-- 作成したDBに接続

drop table if exists users;
create table users (
  id SERIAL PRIMARY KEY,
  password character varying(255),
  username character varying(100),
  mailaddress character varying(255)
);

drop table if exists whiskeys;
CREATE TABLE whiskeys (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  country VARCHAR(50),
  type VARCHAR(50),
  alcoVol VARCHAR(3),
  price VARCHAR(255),
  rate1 VARCHAR(255),
  rate2 VARCHAR(255),
  rate3 VARCHAR(255),
  rate4 VARCHAR(255),
  rate5 VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

drop table if exists whiskey_image;
create table whiskey_image (
  id SERIAL PRIMARY KEY,
  whiskey_id INT NOT NULL,
  name VARCHAR(100),
  image_data BYTEA NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (whiskey_id) REFERENCES whiskeys(id) ON DELETE CASCADE
);


INSERT INTO users (password, username, mailaddress)
VALUES
  ('hoge01', 'user01', '01ex@example.com'),
  ('hoge02', 'user02', '02ex@example.com'),
  ('hoge03', 'user03', '03ex@example.com'),
  ('hoge04', 'user04', '04ex@example.com'),
  ('hoge05', 'user05', '05ex@example.com'),
  ('hoge06', 'user06', '06ex@example.com'),
  ('hoge07', 'user07', '07ex@example.com'),
  ('hoge08', 'user08', '08ex@example.com'),
  ('hoge09', 'user09', '09ex@example.com'),
  ('hoge10', 'user10', '10ex@example.com'),
  ('hoge11', 'user11', '11ex@example.com'),
  ('hoge12', 'user12', '12ex@example.com'),
  ('hoge13', 'user13', '13ex@example.com'),
  ('hoge14', 'user14', '14ex@example.com'),
  ('hoge15', 'user15', '15ex@example.com'),
  ('hoge16', 'user16', '16ex@example.com'),
  ('hoge17', 'user17', '17ex@example.com'),
  ('hoge18', 'user18', '18ex@example.com'),
  ('hoge19', 'user19', '19ex@example.com'),
  ('hoge20', 'user20', '20ex@example.com');

-- INSERT INTO whiskeys (name, country, type) VALUES
--   ('Yamazaki 12 Years', 'Japan', 'Single Malt'),
--   ('Macallan 18 Years', 'Scotland', 'Single Malt'),
--   ('Jack Daniel''s Old No. 7', 'USA', 'Tennessee Whiskey'),
--   ('Jameson Irish Whiskey', 'Ireland', 'Irish Whiskey'),
--   ('Glenfiddich 12 Years', 'Scotland', 'Single Malt'),
--   ('Ardbeg 10 Years', 'Scotland', 'Single Malt'),
--   ('Bushmills Original', 'Ireland', 'Irish Whiskey'),
--   ('Laphroaig 10 Years', 'Scotland', 'Single Malt'),
--   ('Talisker 10 Years', 'Scotland', 'Single Malt'),
--   ('Glenlivet 12 Years', 'Scotland', 'Single Malt'),
--   ('Glenmorangie Original 10 Years', 'Scotland', 'Single Malt'),
--   ('Lagavulin 16 Years', 'Scotland', 'Single Malt'),
--   ('Balvenie DoubleWood 12 Years', 'Scotland', 'Single Malt'),
--   ('Redbreast 12 Years', 'Ireland', 'Irish Whiskey'),
--   ('Oban 14 Years', 'Scotland', 'Single Malt'),
--   ('Highland Park 12 Years', 'Scotland', 'Single Malt'),
--   ('Knob Creek Bourbon', 'USA', 'Bourbon'),
--   ('Woodford Reserve Bourbon', 'USA', 'Bourbon'),
--   ('Buffalo Trace Bourbon', 'USA', 'Bourbon'),
--   ('Chivas Regal 12 Years', 'Scotland', 'Blended Scotch'),
--   ('Johnnie Walker Blue Label', 'Scotland', 'Blended Scotch'),
--   ('The GlenDronach 18 Years', 'Scotland', 'Single Malt'),
--   ('Bulleit Bourbon', 'USA', 'Bourbon'),
--   ('The Macallan 12 Years Sherry Oak', 'Scotland', 'Single Malt'),
--   ('Balvenie Caribbean Cask 14 Years', 'Scotland', 'Single Malt'),
--   ('Glenfiddich 15 Years', 'Scotland', 'Single Malt'),
--   ('Glenlivet 18 Years', 'Scotland', 'Single Malt'),
--   ('Hakushu Distiller''s Reserve', 'Japan', 'Single Malt'),
--   ('Redbreast 15 Years', 'Ireland', 'Irish Whiskey'),
--   ('Blanton''s Single Barrel', 'USA', 'Bourbon'),
--   ('Dalmore 18 Years', 'Scotland', 'Single Malt'),
--   ('Springbank 15 Years', 'Scotland', 'Single Malt'),
--   ('Macallan 12 Years Sherry Oak', 'Scotland', 'Single Malt'),
--   ('Glenfiddich 21 Years', 'Scotland', 'Single Malt'),
--   ('Aberlour 12 Years', 'Scotland', 'Single Malt'),
--   ('Glenmorangie 18 Years', 'Scotland', 'Single Malt'),
--   ('Chivas Regal 18 Years', 'Scotland', 'Blended Scotch'),
--   ('Old Forester 1920', 'USA', 'Bourbon'),
--   ('Yamazaki 18 Years', 'Japan', 'Single Malt'),
--   ('Lagavulin Distillers Edition', 'Scotland', 'Single Malt'),
--   ('Laphroaig Lore', 'Scotland', 'Single Malt'),
--   ('Glenlivet 21 Years', 'Scotland', 'Single Malt'),
--   ('Buffalo Trace Experimental Collection', 'USA', 'Bourbon'),
--   ('Pappy Van Winkle''s Family Reserve 15 Years', 'USA', 'Bourbon'),
--   ('The GlenDronach 21 Years', 'Scotland', 'Single Malt'),
--   ('Glenfiddich 18 Years', 'Scotland', 'Single Malt'),
--   ('Glenmorangie Quinta Ruban 14 Years', 'Scotland', 'Single Malt'),
--   ('Glenfiddich 30 Years', 'Scotland', 'Single Malt'),
--   ('Talisker Distillers Edition', 'Scotland', 'Single Malt'),
--   ('Clynelish 14 Years', 'Scotland', 'Single Malt'),
--   ('Jameson Black Barrel', 'Ireland', 'Irish Whiskey'),
--   ('Glenlivet Founder''s Reserve', 'Scotland', 'Single Malt'),
--   ('Johnnie Walker Green Label', 'Scotland', 'Blended Scotch'),
--   ('Bowmore 12 Years', 'Scotland', 'Single Malt'),
--   ('Glendronach 12 Years', 'Scotland', 'Single Malt'),
--   ('Tullamore D.E.W. Original', 'Ireland', 'Irish Whiskey'),
--   ('Glenfiddich Project XX', 'Scotland', 'Single Malt'),
--   ('Kilchoman Machir Bay', 'Scotland', 'Single Malt'),
--   ('Glenlivet Archive 21 Years', 'Scotland', 'Single Malt'),
--   ('Glenmorangie Signet', 'Scotland', 'Single Malt'),
--   ('Brora 30 Years', 'Scotland', 'Single Malt'),
--   ('Glenfiddich 50 Years', 'Scotland', 'Single Malt'),
--   ('Ardbeg Uigeadail', 'Scotland', 'Single Malt'),
--   ('Macallan 25 Years Sherry Oak', 'Scotland', 'Single Malt'),
--   ('Glenfarclas 21 Years', 'Scotland', 'Single Malt'),
--   ('Compass Box The Spice Tree', 'Scotland', 'Blended Scotch'),
--   ('Johnnie Walker Red Label', 'Scotland', 'Blended Scotch'),
--   ('Bulleit Rye', 'USA', 'Rye Whiskey'),
--   ('Four Roses Single Barrel', 'USA', 'Bourbon'),
--   ('Suntory Hibiki 17 Years', 'Japan', 'Blended Whiskey'),
--   ('GlenDronach 18 Years', 'Scotland', 'Single Malt'),
--   ('Cardhu 12 Years', 'Scotland', 'Single Malt'),
--   ('Knob Creek Single Barrel', 'USA', 'Bourbon'),
--   ('Lagavulin 8 Years', 'Scotland', 'Single Malt'),
--   ('Blanton''s Gold Edition', 'USA', 'Bourbon'),
--   ('Laphroaig 18 Years', 'Scotland', 'Single Malt'),
--   ('The Macallan Rare Cask', 'Scotland', 'Single Malt'),
--   ('Glenfiddich Snow Phoenix', 'Scotland', 'Single Malt'),
--   ('Aberlour A''bunadh', 'Scotland', 'Single Malt'),
--   ('Yamazaki Distiller''s Reserve', 'Japan', 'Single Malt'),
--   ('Balvenie PortWood 21 Years', 'Scotland', 'Single Malt'),
--   ('Hakushu 18 Years', 'Japan', 'Single Malt'),
--   ('Glenlivet 25 Years', 'Scotland', 'Single Malt'),
--   ('WhistlePig Rye 12 Years', 'USA', 'Rye Whiskey'),
--   ('Knob Creek 9 Years', 'USA', 'Bourbon'),
--   ('Suntory Hakushu Distiller''s Reserve', 'Japan', 'Single Malt'),
--   ('The Glenlivet 21 Years Archive', 'Scotland', 'Single Malt'),
--   ('Scapa 16 Years', 'Scotland', 'Single Malt'),
--   ('Chivas Regal 25 Years', 'Scotland', 'Blended Scotch'),
--   ('Suntory Hibiki 21 Years', 'Japan', 'Blended Whiskey'),
--   ('Macallan 30 Years', 'Scotland', 'Single Malt'),
--   ('Laphroaig 10 Years Cask Strength', 'Scotland', 'Single Malt'),
--   ('Glenfiddich IPA Experiment', 'Scotland', 'Single Malt'),
--   ('Glenmorangie 10 Years Original', 'Scotland', 'Single Malt'),
--   ('Bulleit Bourbon 10 Years', 'USA', 'Bourbon'),
--   ('Glenlivet 12 Years French Oak', 'Scotland', 'Single Malt'),
--   ('Aberfeldy 12 Years', 'Scotland', 'Single Malt'),
--   ('Tullamore D.E.W. 12 Years', 'Ireland', 'Irish Whiskey'),
--   ('Tomintoul 16 Years', 'Scotland', 'Single Malt'),
--   ('Glenfarclas 25 Years', 'Scotland', 'Single Malt'),
--   ('Glenlivet XXV', 'Scotland', 'Single Malt');
