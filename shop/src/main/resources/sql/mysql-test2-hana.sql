CREATE TABLE t_admin (
  id INT PRIMARY KEY,
  password varchar(255) DEFAULT NULL,
  username varchar(255) DEFAULT NULL
) ;

INSERT INTO t_admin VALUES ('1', '123456', '管理员');


CREATE TABLE t_announcement (
  id INT PRIMARY KEY,
  content varchar(255) DEFAULT NULL,
  create_time datetime DEFAULT NULL
) ;


CREATE TABLE t_news (
  id INT PRIMARY KEY,
  content varchar(255) DEFAULT NULL,
  create_time datetime DEFAULT NULL,
  title varchar(255) DEFAULT NULL
);


CREATE TABLE t_order (
  id INT PRIMARY KEY,
  create_time datetime DEFAULT NULL,
  order_number varchar(255) DEFAULT NULL,
  status INT,
  user_id INT,
  user_address INT
);


CREATE TABLE t_orderitem (
  id INT PRIMARY KEY,
  quantity INT,
  order_id INT,
  product INT
);


CREATE TABLE t_product (
  id INT PRIMARY KEY,
  code varchar(255) DEFAULT NULL,
  create_time datetime DEFAULT NULL,
  model varchar(255) DEFAULT NULL,
  note varchar(255) DEFAULT NULL,
  pic_url varchar(255) DEFAULT NULL,
  point INT,
  stock INT,
  title varchar(255) DEFAULT NULL
);


INSERT INTO t_product VALUES ('1', '2343434', '2013-07-10 15:01:26', '2a-dd-1s', '阿斯顿发楼思考点附近啦静安寺离开对方进来看撒经费等楼库萨克警方流口水京东方连空间撒离开的解放路口近代史路口附近', '/images/l_pro01.gif', '123', '3', '美的不锈钢酸奶机');
INSERT INTO t_product VALUES ('2', 'sdfsdf', '2013-07-30 15:03:29', 'df', '士大夫', '/images/l_pro02.gif', '3333', '123', '高级餐具');
INSERT INTO t_product VALUES ('3', 'sdfdsf', '2013-08-14 15:03:57', 'fddf', '进梵蒂冈', '/images/l_pro03.gif', '1000', '222', '红木茶具套装');


CREATE TABLE t_producttype (
  id INT PRIMARY KEY,
  name varchar(255) DEFAULT NULL
);


INSERT INTO t_producttype VALUES ('1', '电子电器');
INSERT INTO t_producttype VALUES ('2', '床上用品');
INSERT INTO t_producttype VALUES ('3', '厨房用具');
INSERT INTO t_producttype VALUES ('4', '运动健身');
INSERT INTO t_producttype VALUES ('5', '儿童用品');
INSERT INTO t_producttype VALUES ('6', '食品保健');


CREATE TABLE t_user (
  id INT PRIMARY KEY,
  account varchar(255) DEFAULT NULL,
  address varchar(50) DEFAULT NULL,
  password varchar(14) NOT NULL,
  phone varchar(11) DEFAULT NULL,
  point INT,
  remark varchar(50) DEFAULT NULL,
  spc varchar(255) DEFAULT NULL,
  tel_phone varchar(11) DEFAULT NULL,
  username varchar(15) DEFAULT NULL,
  zip_code varchar(6) DEFAULT NULL
);

INSERT INTO t_user VALUES ('1', 'lkewj123kf', '重庆市南岸区万达4栋29-18', '1234', '13888888888', '1239090', null, null, '02366666666', '周文滔', '400056');


CREATE TABLE t_useraddress (
  id INT PRIMARY KEY,
  address varchar(255) DEFAULT NULL,
  consignee varchar(255) DEFAULT NULL,
  phone varchar(255) DEFAULT NULL,
  zipcode varchar(255) DEFAULT NULL,
  user_id INT
);
