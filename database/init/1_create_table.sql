-- Project Name : nrm_cyc
-- Date/Time    : 2023/11/08 17:02:41
-- Author       : higuchi
-- RDBMS Type   : PostgreSQL
-- Application  : A5:SQL Mk-2

drop schema public cascade;
create schema public;

-- 利用者情報変更
drop table if exists change_requests cascade;

create table change_requests (
  user_id character varying(10) not null
  , login_id character varying(255)
  , login_pass character varying(255)
  , f_name character varying(50)
  , l_name character varying(50)
  , f_name_kana character varying(50)
  , l_name_kana character varying(50)
  , mail character varying(255)
  , age character varying(3)
  , post_code character varying(10)
  , address_1 character varying(255)
  , address_2 character varying(255)
  , address_3 character varying(255)
  , tell_number character varying(20)
  , tell_number_phone character varying(20)
  , user_category_id character varying(3)
  , regist_status_id character varying(3) not null
  , payment_id character varying(10)
  , payment_type character varying(3)
  , cycle character varying(3)
  , convenience_flg character varying(1)
  , credit_number character varying(255)
  , credit_result character varying(255)
  , process_id character varying(255)
  , process_pass character varying(255)
  , bank_id character varying(4)
  , branch_code character varying(3)
  , bank_account_number character varying(20)
  , bank_account_name character varying(100)
  , bank_deposit_item character varying(4)
  , school_name character varying(255)
  , grade character varying(6)
  , term character varying(6)
  , credit_result_date character varying(100)
  , change_request_date character varying(100)
  , constraint change_requests_PKC primary key (user_id)
) ;

create unique index change_requests_IX1
  on change_requests(user_id);

-- 利用者情報変更
drop table if exists change_requests_previous cascade;

create table change_requests_previous (
  user_id character varying(10) not null
  , login_id character varying(255)
  , login_pass character varying(255)
  , f_name character varying(50)
  , l_name character varying(50)
  , f_name_kana character varying(50)
  , l_name_kana character varying(50)
  , mail character varying(255)
  , age character varying(3)
  , post_code character varying(10)
  , address_1 character varying(255)
  , address_2 character varying(255)
  , address_3 character varying(255)
  , tell_number character varying(20)
  , tell_number_phone character varying(20)
  , user_category_id character varying(3)
  , regist_status_id character varying(3) not null
  , payment_id character varying(10)
  , payment_type character varying(3)
  , cycle character varying(3)
  , convenience_flg character varying(1)
  , credit_number character varying(255)
  , credit_result character varying(255)
  , process_id character varying(255)
  , process_pass character varying(255)
  , bank_id character varying(4)
  , branch_code character varying(3)
  , bank_account_number character varying(20)
  , bank_account_name character varying(100)
  , bank_deposit_item character varying(4)
  , school_name character varying(255)
  , grade character varying(6)
  , term character varying(6)
  , credit_result_date character varying(100)
  , change_request_date character varying(100)
  , constraint change_requests_previous_PKC primary key (user_id)
) ;

create unique index change_requests_previous_IX1
  on change_requests_previous(user_id);

-- エクスポート許可判定
drop table if exists export_bln cascade;

create table export_bln (
  export_bln boolean not null
) ;

-- 脱退者
drop table if exists leavers cascade;

create table leavers (
  user_id character varying(10) not null
  , leaver_number character varying(10) not null
  , leaver_name_f character varying(50) not null
  , leaver_name_l character varying(50) not null
  , leaver_name_kana_f character varying(50) not null
  , leaver_name_kana_l character varying(50) not null
  , return_bank_id character varying(4) not null
  , return_branch_code character varying(3) not null
  , return_account_number character varying(10) not null
  , return_account_name character varying(100) not null
  , return_deposit_item character varying(10) not null
  , facility_id character varying(3) not null
  , floor_id character varying(3) not null
  , car_model_id character varying(3) not null
  , request_date character varying(100) not null
) ;

-- 利用サイクルマスタ
drop table if exists m_cycles cascade;

create table m_cycles (
  use_cycle integer not null
  , constraint m_cycles_PKC primary key (use_cycle)
) ;

-- 郵便番号マスタ
drop table if exists m_post_codes cascade;

create table m_post_codes (
  post_code character varying(7) not null
  , prefecture character varying(255) not null
  , prefecture_kana character varying(255) not null
  , city character varying(255) not null
  , city_kana character varying(255) not null
  , aza character varying(255) not null
  , aza_kaza character varying(255) not null
) ;

-- 料金マスタ
drop table if exists m_prices cascade;

create table m_prices (
  unit_price_id character varying(3) not null
  , user_category character varying(1) not null
  , use_cycle integer not null
  , bank boolean not null
  , price integer not null
  , constraint m_prices_PKC primary key (unit_price_id,user_category,use_cycle,bank)
) ;

-- 単価テーブル
drop table if exists m_unit_prices cascade;

create table m_unit_prices (
  facility_id character varying(3) not null
  , floor_id character varying(3) not null
  , unit_price_id character varying(3) not null
  , constraint m_unit_prices_PKC primary key (facility_id,floor_id)
) ;

-- メール履歴
drop table if exists mail_logs cascade;

create table mail_logs (
  manager character varying(255) not null
  , send_to character varying(255) not null
  , subject character varying(255)
  , content text
) ;

-- 管理者ユーザー
drop table if exists managers cascade;

create table managers (
  manager_id character varying(50) not null
  , manager_pass character varying(50) not null
  , manager_name character varying(50) not null
  , constraint managers_PKC primary key (manager_id)
) ;

create unique index managers_IX1
  on managers(manager_id);

-- 口座情報
drop table if exists payment_banks cascade;

create table payment_banks (
  payment_id character varying(10) not null
  , bank_id character varying(4) not null
  , branch_code character varying(3) not null
  , account_name character varying(100) not null
  , deposit_item character varying(4) not null
  , account_number character varying(20) not null
  , constraint payment_banks_PKC primary key (payment_id)
) ;

create unique index payment_banks_IX1
  on payment_banks(payment_id);

-- コンビニ情報
drop table if exists payment_conveniences cascade;

create table payment_conveniences (
  payment_id character varying(10) not null
  , convenience_flg character varying(1) not null
  , constraint payment_conveniences_PKC primary key (payment_id)
) ;

create unique index payment_conveniences_IX1
  on payment_conveniences(payment_id);

-- クレジット情報
drop table if exists payment_credits cascade;

create table payment_credits (
  payment_id character varying(10) not null
  , cradit_number character varying(255) not null
  , credit_result character varying(10) not null
  , process_id character varying(255) not null
  , process_pass character varying(255) not null
  , constraint payment_credits_PKC primary key (payment_id)
) ;

create unique index payment_credits_IX1
  on payment_credits(payment_id);

-- 利用者支払方法
drop table if exists payment_methods cascade;

create table payment_methods (
  user_id character varying(10) not null
  , payment_id character varying(10) not null
  , payment_type character varying(3) not null
  , constraint payment_methods_PKC primary key (user_id)
) ;

create unique index payment_methods_IX1
  on payment_methods(user_id);

-- 学生証情報
drop table if exists student_cards cascade;

create table student_cards (
  user_id character varying(10) not null
  , student_card_f character varying(255) not null
  , student_card_b character varying(255)
  , student_card_check boolean not null
  , check_status boolean not null
  , regist_date character varying(255)
  , note text
  , constraint student_cards_PKC primary key (user_id)
) ;

create unique index student_cards_IX1
  on student_cards(user_id);

-- 学生情報
drop table if exists students cascade;

create table students (
  user_id character varying(10) not null
  , school_name character varying(255) not null
  , grade character varying(6) not null
  , term character varying(6) not null
  , constraint students_PKC primary key (user_id)
) ;

create unique index students_IX1
  on students(user_id);

-- ユニーク番号
drop table if exists uni_nums cascade;

create table uni_nums (
  payment_id character varying(10) not null
  , service_num character varying(10) not null
  , constraint uni_nums_PKC primary key (payment_id)
) ;

-- 利用者支払料金
drop table if exists user_payments cascade;

create table user_payments (
  user_id character varying(10) not null
  , use_cycle integer not null
  , car_model_id character varying(3) not null
  , user_category_id character varying(3) not null
  , floor_id character varying(3) not null
  , facility_id character varying(3) not null
  , constraint user_payments_PKC primary key (user_id)
) ;

create unique index user_payments_IX1
  on user_payments(user_id);

-- 利用者
drop table if exists users cascade;

create table users (
  user_id character varying(10) not null
  , login_id character varying(255)
  , login_pass character varying(255)
  , usid character varying(255)
  , f_applicant_name character varying(255)
  , l_applicant_name character varying(255)
  , f_applicant_name_kana character varying(255)
  , l_applicant_name_kana character varying(255)
  , f_name character varying(255)
  , l_name character varying(255)
  , f_name_kana character varying(255)
  , l_name_kana character varying(255)
  , mail character varying(255)
  , age character varying(3)
  , post_code character varying(10)
  , adress1 character varying(255)
  , adress2 character varying(255)
  , adress3 character varying(255)
  , tell_number character varying(20)
  , tell_number_phone character varying(20)
  , regist_status_id character varying(3) not null
  , limit_date character varying(100)
  , use_start_date character varying(100)
  , constraint users_PKC primary key (user_id)
) ;

create unique index users_IX1
  on users(user_id);

create index users_IX2
  on users(f_name);

create index users_IX3
  on users(regist_status_id);

create index users_IX4
  on users(post_code);

-- 銀行マスタ
drop table if exists m_banks cascade;

create table m_banks (
  bank_id character varying(4) not null
  , branch_code character varying(3) not null
  , bank_name character varying(255) not null
  , short_name character varying(255)
  , short_name_kana character varying(255) not null
  , branch_name character varying(255) not null
  , branch_name_kana character varying(255) not null
  , yucho_code character varying(4)
  , constraint m_banks_PKC primary key (bank_id,branch_code)
) ;

-- 車種マスタ
drop table if exists m_car_models cascade;

create table m_car_models (
  car_model_id character varying(3) not null
  , car_model_name character varying(255) not null
  , constraint m_car_models_PKC primary key (car_model_id)
) ;

create unique index m_car_models_IX1
  on m_car_models(car_model_id);

-- 施設マスタ
drop table if exists m_facilities cascade;

create table m_facilities (
  facility_id character varying(3) not null
  , facility_name character varying(255) not null
  , constraint m_facilities_PKC primary key (facility_id)
) ;

create unique index m_facilities_IX1
  on m_facilities(facility_id);

-- 階層マスタ
drop table if exists m_floors cascade;

create table m_floors (
  floor_id character varying(3) not null
  , floor_name character varying(255) not null
  , constraint m_floors_PKC primary key (floor_id)
) ;

create unique index m_floors_IX1
  on m_floors(floor_id);

-- 支払方法マスタ
drop table if exists m_payment_types cascade;

create table m_payment_types (
  payment_type character varying(3) not null
  , type_name character varying(255) not null
  , constraint m_payment_types_PKC primary key (payment_type)
) ;

create unique index m_payment_types_IX1
  on m_payment_types(payment_type);

-- 利用者登録状況マスタ
drop table if exists m_regist_status cascade;

create table m_regist_status (
  regist_status_id character varying(3) not null
  , status_name character varying(255) not null
  , constraint m_regist_status_PKC primary key (regist_status_id)
) ;

create unique index m_regist_status_IX1
  on m_regist_status(regist_status_id);

-- 利用者区分マスタ
drop table if exists m_user_categories cascade;

create table m_user_categories (
  user_category_id character varying(1) not null
  , category_name character varying(255) not null
  , constraint m_user_categories_PKC primary key (user_category_id)
) ;

create unique index m_user_categories_IX1
  on m_user_categories(user_category_id);

alter table change_requests
  add constraint user_id_FKID foreign key (user_id) references users(user_id)
  on delete no action
  on update cascade;

create unique index payment_methods_IX2
  on payment_methods(payment_id);

alter table payment_banks
  add constraint payment_banks_FK1 foreign key (payment_id) references payment_methods(payment_id)
  on delete no action
  on update cascade;

alter table payment_banks
  add constraint payment_banks_FK2 foreign key (bank_id,branch_code) references m_banks(bank_id,branch_code)
  on delete no action
  on update cascade;

alter table payment_conveniences
  add constraint payment_conveniences_FK1 foreign key (payment_id) references payment_methods(payment_id)
  on delete no action
  on update cascade;

alter table payment_credits
  add constraint payment_credits_FK1 foreign key (payment_id) references payment_methods(payment_id)
  on delete no action
  on update cascade;

alter table payment_methods
  add constraint payment_methods_FK1 foreign key (user_id) references users(user_id)
  on delete no action
  on update cascade;

alter table payment_methods
  add constraint payment_type_FK foreign key (payment_type) references m_payment_types(payment_type)
  on delete no action
  on update cascade;

alter table students
  add constraint students_FK1 foreign key (user_id) references users(user_id)
  on delete no action
  on update cascade;

alter table user_payments
  add constraint user_payments_FK1 foreign key (user_id) references users(user_id)
  on delete no action
  on update cascade;

alter table user_payments
  add constraint user_payments_FK2 foreign key (floor_id) references m_floors(floor_id)
  on delete no action
  on update cascade;

alter table user_payments
  add constraint car_model_FK foreign key (car_model_id) references m_car_models(car_model_id)
  on delete no action
  on update cascade;

alter table user_payments
  add constraint facility_FKID foreign key (facility_id) references m_facilities(facility_id)
  on delete no action
  on update cascade;

alter table user_payments
  add constraint user_category_FK foreign key (user_category_id) references m_user_categories(user_category_id)
  on delete no action
  on update cascade;

alter table users
  add constraint regist_status_FKID foreign key (regist_status_id) references m_regist_status(regist_status_id)
  on delete no action
  on update cascade;

comment on table change_requests is '利用者情報変更';
comment on column change_requests.user_id is '利用者ID';
comment on column change_requests.login_id is 'ログインID';
comment on column change_requests.login_pass is 'パスワード';
comment on column change_requests.f_name is '利用者姓';
comment on column change_requests.l_name is '利用者名';
comment on column change_requests.f_name_kana is '利用者姓(カナ)';
comment on column change_requests.l_name_kana is '利用者名(カナ)';
comment on column change_requests.mail is 'メールアドレス';
comment on column change_requests.age is '年齢';
comment on column change_requests.post_code is '郵便番号';
comment on column change_requests.address_1 is '住所1';
comment on column change_requests.address_2 is '住所2';
comment on column change_requests.address_3 is '住所3';
comment on column change_requests.tell_number is '電話番号';
comment on column change_requests.tell_number_phone is '電話番号(携帯)';
comment on column change_requests.user_category_id is '区分ID';
comment on column change_requests.regist_status_id is '登録ステータスID';
comment on column change_requests.payment_id is '支払ID';
comment on column change_requests.payment_type is '支払方法ID';
comment on column change_requests.cycle is '支払いサイクル';
comment on column change_requests.convenience_flg is 'コンビニフラグ';
comment on column change_requests.credit_number is 'クレジット管理番号';
comment on column change_requests.credit_result is 'クレジット与信結果';
comment on column change_requests.process_id is 'プロセスID';
comment on column change_requests.process_pass is 'プロセスPass';
comment on column change_requests.bank_id is '金融機関識別キー';
comment on column change_requests.branch_code is '支店コード';
comment on column change_requests.bank_account_number is '口座番号';
comment on column change_requests.bank_account_name is '口座名義';
comment on column change_requests.bank_deposit_item is '口座預金種目';
comment on column change_requests.school_name is '学校名';
comment on column change_requests.grade is '学年';
comment on column change_requests.term is '年限';
comment on column change_requests.credit_result_date is 'クレジット与信結果日';
comment on column change_requests.change_request_date is '変更申請日';

comment on table change_requests_previous is '利用者情報変更';
comment on column change_requests_previous.user_id is '利用者ID';
comment on column change_requests_previous.login_id is 'ログインID';
comment on column change_requests_previous.login_pass is 'パスワード';
comment on column change_requests_previous.f_name is '利用者姓';
comment on column change_requests_previous.l_name is '利用者名';
comment on column change_requests_previous.f_name_kana is '利用者姓(カナ)';
comment on column change_requests_previous.l_name_kana is '利用者名(カナ)';
comment on column change_requests_previous.mail is 'メールアドレス';
comment on column change_requests_previous.age is '年齢';
comment on column change_requests_previous.post_code is '郵便番号';
comment on column change_requests_previous.address_1 is '住所1';
comment on column change_requests_previous.address_2 is '住所2';
comment on column change_requests_previous.address_3 is '住所3';
comment on column change_requests_previous.tell_number is '電話番号';
comment on column change_requests_previous.tell_number_phone is '電話番号(携帯)';
comment on column change_requests_previous.user_category_id is '区分ID';
comment on column change_requests_previous.regist_status_id is '登録ステータスID';
comment on column change_requests_previous.payment_id is '支払ID';
comment on column change_requests_previous.payment_type is '支払方法ID';
comment on column change_requests_previous.cycle is '支払いサイクル';
comment on column change_requests_previous.convenience_flg is 'コンビニフラグ';
comment on column change_requests_previous.credit_number is 'クレジット管理番号';
comment on column change_requests_previous.credit_result is 'クレジット与信結果';
comment on column change_requests_previous.process_id is 'プロセスID';
comment on column change_requests_previous.process_pass is 'プロセスPass';
comment on column change_requests_previous.bank_id is '金融機関識別キー';
comment on column change_requests_previous.branch_code is '支店コード';
comment on column change_requests_previous.bank_account_number is '口座番号';
comment on column change_requests_previous.bank_account_name is '口座名義';
comment on column change_requests_previous.bank_deposit_item is '口座預金種目';
comment on column change_requests_previous.school_name is '学校名';
comment on column change_requests_previous.grade is '学年';
comment on column change_requests_previous.term is '年限';
comment on column change_requests_previous.credit_result_date is 'クレジット与信結果日';
comment on column change_requests_previous.change_request_date is '変更申請日';

comment on table export_bln is 'エクスポート許可判定';
comment on column export_bln.export_bln is 'エクスポート許可';

comment on table leavers is '脱退者';
comment on column leavers.user_id is '申請者ID';
comment on column leavers.leaver_number is '脱退者利用番号';
comment on column leavers.leaver_name_f is '脱退者姓';
comment on column leavers.leaver_name_l is '脱退者名';
comment on column leavers.leaver_name_kana_f is '脱退者姓カナ';
comment on column leavers.leaver_name_kana_l is '脱退者名カナ';
comment on column leavers.return_bank_id is '識別キー';
comment on column leavers.return_branch_code is '還付先支店コード';
comment on column leavers.return_account_number is '還付先口座番号';
comment on column leavers.return_account_name is '還付先口座名義';
comment on column leavers.return_deposit_item is '還付先預金種目';
comment on column leavers.facility_id is '施設_id';
comment on column leavers.floor_id is '階層_id';
comment on column leavers.car_model_id is '車種_id';
comment on column leavers.request_date is '申請日';

comment on table m_cycles is '利用サイクルマスタ';
comment on column m_cycles.use_cycle is '利用サイクル';

comment on table m_post_codes is '郵便番号マスタ';
comment on column m_post_codes.post_code is '郵便番号';
comment on column m_post_codes.prefecture is '都道府県名';
comment on column m_post_codes.prefecture_kana is '都道府県名カナ';
comment on column m_post_codes.city is '市区町村名';
comment on column m_post_codes.city_kana is '市区町村名カナ';
comment on column m_post_codes.aza is '番地名';
comment on column m_post_codes.aza_kaza is '番地名カナ';

comment on table m_prices is '料金マスタ';
comment on column m_prices.unit_price_id is '単価ID';
comment on column m_prices.user_category is '利用者区分';
comment on column m_prices.use_cycle is '利用サイクル';
comment on column m_prices.bank is '口座';
comment on column m_prices.price is '料金';

comment on table m_unit_prices is '単価テーブル';
comment on column m_unit_prices.facility_id is '施設ID';
comment on column m_unit_prices.floor_id is '階層ID';
comment on column m_unit_prices.unit_price_id is '単価ID';

comment on table mail_logs is 'メール履歴';
comment on column mail_logs.manager is '送信者';
comment on column mail_logs.send_to is '送信先';
comment on column mail_logs.subject is '件名';
comment on column mail_logs.content is '内容';

comment on table managers is '管理者ユーザー';
comment on column managers.manager_id is '管理者ID';
comment on column managers.manager_pass is 'パスワード';
comment on column managers.manager_name is '管理者名';

comment on table payment_banks is '口座情報';
comment on column payment_banks.payment_id is '支払ID';
comment on column payment_banks.bank_id is '金融機関識別キー';
comment on column payment_banks.branch_code is '支店コード';
comment on column payment_banks.account_name is '口座名義';
comment on column payment_banks.deposit_item is '預金種目';
comment on column payment_banks.account_number is '口座番号';

comment on table payment_conveniences is 'コンビニ情報';
comment on column payment_conveniences.payment_id is '支払ID';
comment on column payment_conveniences.convenience_flg is 'コンビニフラグ';

comment on table payment_credits is 'クレジット情報';
comment on column payment_credits.payment_id is '支払ID';
comment on column payment_credits.cradit_number is 'クレジット管理番号';
comment on column payment_credits.credit_result is '与信結果';
comment on column payment_credits.process_id is 'プロセスID';
comment on column payment_credits.process_pass is 'プロセスPass';

comment on table payment_methods is '利用者支払方法';
comment on column payment_methods.user_id is '利用者ID';
comment on column payment_methods.payment_id is '支払ID';
comment on column payment_methods.payment_type is '支払方法ID';

comment on table student_cards is '学生証情報';
comment on column student_cards.user_id is '利用者ID';
comment on column student_cards.student_card_f is '学生証表';
comment on column student_cards.student_card_b is '学生証裏';
comment on column student_cards.student_card_check is '学生証チェック';
comment on column student_cards.check_status is 'チェックステータス';
comment on column student_cards.regist_date is '登録日';
comment on column student_cards.note is '備考';

comment on table students is '学生情報';
comment on column students.user_id is '利用者ID';
comment on column students.school_name is '学校名';
comment on column students.grade is '学年';
comment on column students.term is '年限';

comment on table uni_nums is 'ユニーク番号';
comment on column uni_nums.payment_id is '支払ID';
comment on column uni_nums.service_num is 'ユニーク番号';

comment on table user_payments is '利用者支払料金';
comment on column user_payments.user_id is '利用者ID';
comment on column user_payments.use_cycle is '利用サイクル';
comment on column user_payments.car_model_id is '車種ID';
comment on column user_payments.user_category_id is '区分ID';
comment on column user_payments.floor_id is '階層ID';
comment on column user_payments.facility_id is '施設ID';

comment on table users is '利用者';
comment on column users.user_id is '利用者ID';
comment on column users.login_id is 'ログインID';
comment on column users.login_pass is 'ログインパスワード';
comment on column users.usid is '口振で使用する15桁の一意番号';
comment on column users.f_applicant_name is '申請者姓';
comment on column users.l_applicant_name is '申請者名';
comment on column users.f_applicant_name_kana is '申請者姓(カナ)';
comment on column users.l_applicant_name_kana is '申請者名(名)';
comment on column users.f_name is '利用者姓';
comment on column users.l_name is '利用者名';
comment on column users.f_name_kana is '利用者姓(カナ)';
comment on column users.l_name_kana is '利用者名(カナ)';
comment on column users.mail is 'メールアドレス';
comment on column users.age is '年齢';
comment on column users.post_code is '郵便番号';
comment on column users.adress1 is '住所1';
comment on column users.adress2 is '住所2';
comment on column users.adress3 is '住所3';
comment on column users.tell_number is '電話番号';
comment on column users.tell_number_phone is '電話番号(携帯)';
comment on column users.regist_status_id is '登録ステータスID';
comment on column users.limit_date is '有効期限';
comment on column users.use_start_date is '利用開始日';

comment on table m_banks is '銀行マスタ';
comment on column m_banks.bank_id is '銀行ID';
comment on column m_banks.branch_code is '支店コード';
comment on column m_banks.bank_name is '金融機関名';
comment on column m_banks.short_name is '略称名';
comment on column m_banks.short_name_kana is '略称名カナ';
comment on column m_banks.branch_name is '支店名';
comment on column m_banks.branch_name_kana is '支店名カナ';
comment on column m_banks.yucho_code is 'ゆうちょコード';

comment on table m_car_models is '車種マスタ';
comment on column m_car_models.car_model_id is '車種ID';
comment on column m_car_models.car_model_name is '車種名';

comment on table m_facilities is '施設マスタ';
comment on column m_facilities.facility_id is '施設ID';
comment on column m_facilities.facility_name is '施設名';

comment on table m_floors is '階層マスタ';
comment on column m_floors.floor_id is '階層ID';
comment on column m_floors.floor_name is '階層名';

comment on table m_payment_types is '支払方法マスタ';
comment on column m_payment_types.payment_type is '支払方法';
comment on column m_payment_types.type_name is '支払方法名称';

comment on table m_regist_status is '利用者登録状況マスタ';
comment on column m_regist_status.regist_status_id is '登録ステータスID';
comment on column m_regist_status.status_name is 'ステータス名';

comment on table m_user_categories is '利用者区分マスタ';
comment on column m_user_categories.user_category_id is '利用者区分ID';
comment on column m_user_categories.category_name is '区分名';

