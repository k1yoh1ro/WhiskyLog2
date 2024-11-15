-- DB作成
CREATE DATABASE WLDB;

-- 作成したDBに接続

drop table if exists users;
create table users (
  id character varying(10) not null
  , password character varying(255)
  , username character varying(100)
  , mailaddress character varying(255)
  , constraint change_requests_PKC primary key (id)
);

create unique index users_IX1
  on users(id);

INSERT INTO users (id, password, username, mailaddress)
VALUES
('001', 'hoge', '太郎', 'ex@example.com'),
('002', 'hoge', '太郎', 'ex@example.com'),
('003', 'hoge', '太郎', 'ex@example.com'),
('004', 'hoge', '太郎', 'ex@example.com'),
('005', 'hoge', '太郎', 'ex@example.com'),
('006', 'hoge', '太郎', 'ex@example.com'),
('007', 'hoge', '太郎', 'ex@example.com'),
('008', 'hoge', '太郎', 'ex@example.com'),
('009', 'hoge', '太郎', 'ex@example.com'),
('010', 'hoge', '太郎', 'ex@example.com'),
('011', 'hoge', '太郎', 'ex@example.com'),
('012', 'hoge', '太郎', 'ex@example.com'),
('013', 'hoge', '太郎', 'ex@example.com'),
('014', 'hoge', '太郎', 'ex@example.com'),
('015', 'hoge', '太郎', 'ex@example.com'),
('016', 'hoge', '太郎', 'ex@example.com'),
('017', 'hoge', '太郎', 'ex@example.com'),
('018', 'hoge', '太郎', 'ex@example.com'),
('019', 'hoge', '太郎', 'ex@example.com'),
('020', 'hoge', '太郎', 'ex@example.com');

