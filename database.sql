use mysql;
create database task_backend default character set utf8 default collate utf8_general_ci;

use task_backend;
-- account : email address
-- powerflag : 0 is normal, 1 is admin
-- delflag : 0 is active
CREATE TABLE `work_account` (
  `aid` VARCHAR( 50 ) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `account` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `powerflag` int(1) NOT NULL default 0 COMMENT '授權旗標', 
  `delflag` int(1) NOT NULL default 0 COMMENT '刪除旗標', 
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TRIGGER t_work_account
  BEFORE INSERT ON work_account
  FOR EACH ROW
  SET new.aid = uuid();
  
CREATE TABLE `work_system` (
  `sid` VARCHAR( 50 ) NOT NULL,
  `sysname` varchar(255) NOT NULL COMMENT '系統別', 
  `controler` varchar(255) NOT NULL COMMENT '控制項識別', 
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TRIGGER t_work_system
  BEFORE INSERT ON work_system
  FOR EACH ROW
  SET new.sid = uuid();
  
CREATE TABLE `work_permissions` (
  `aid` VARCHAR( 50 ) NOT NULL,
  `sid` VARCHAR( 50 ) NOT NULL,
  PRIMARY KEY (`aid`,`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

