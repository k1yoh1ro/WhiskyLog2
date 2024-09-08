-- DB作成
CREATE DATABASE WLDB;

-- 作成したDBに接続
\c WLDB;

drop table if exists users;
create table users (
  user_id character varying(10) not null
  , login_pass character varying(255)
  , user_name_f character varying(100)
  , user_name_l character varying(100)
  , age character varying(3)
  , mail_address character varying(255)
  , constraint change_requests_PKC primary key (user_id)
);

create unique index users_IX1
  on users(user_id);

INSERT INTO users (user_id, login_pass, user_name_f, user_name_l, age, mail_address)
VALUES
('00000001', 'hogehoge', '申請', '太郎', '33', 'ex@example.com'),
('00000002', 'hogehoge', '申請', '太郎', '33', 'ex@example.com'),
('00000003', 'hogehoge', '申請', '太郎', '33', 'ex@example.com'),
('00000004', 'hogehoge', '申請', '太郎', '33', 'ex@example.com'),
('00000005', 'hogehoge', '申請', '太郎', '33', 'ex@example.com'),
('00000006', 'hogehoge', '申請', '太郎', '33', 'ex@example.com'),
('00000007', 'hogehoge', '申請', '太郎', '33', 'ex@example.com'),
('00000008', 'hogehoge', '申請', '太郎', '33', 'ex@example.com'),
('00000009', 'hogehoge', '申請', '太郎', '33', 'ex@example.com'),
('00000010', 'hogehoge', '申請', '太郎', '33', 'ex@example.com'),
('00000011', 'hogehoge', '申請', '太郎', '33', 'ex@example.com'),
('00000012', 'hogehoge', '申請', '太郎', '33', 'ex@example.com'),
('00000013', 'hogehoge', '申請', '太郎', '33', 'ex@example.com'),
('00000014', 'hogehoge', '申請', '太郎', '33', 'ex@example.com'),
('00000015', 'hogehoge', '申請', '太郎', '33', 'ex@example.com'),
('00000016', 'hogehoge', '申請', '太郎', '33', 'ex@example.com'),
('00000017', 'hogehoge', '申請', '太郎', '33', 'ex@example.com'),
('00000018', 'hogehoge', '申請', '太郎', '33', 'ex@example.com'),
('00000019', 'hogehoge', '申請', '太郎', '33', 'ex@example.com'),
('00000020', 'hogehoge', '申請', '太郎', '33', 'ex@example.com');

