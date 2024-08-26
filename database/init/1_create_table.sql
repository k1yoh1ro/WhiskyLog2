-- Project Name : nrm_cyc
-- Date/Time    : 2023/11/08 17:02:41
-- Author       : higuchi
-- RDBMS Type   : PostgreSQL
-- Application  : A5:SQL Mk-2

drop schema public cascade;
create schema public;

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


-- alter table payment_banks
--   add constraint payment_banks_FK1 foreign key (payment_id) references payment_methods(payment_id)
--   on delete no action
--   on update cascade;