# Host: 127.0.0.1  (Version 8.0.13)
# Date: 2022-07-18 17:30:27
# Generator: MySQL-Front 6.1  (Build 1.26)


#
# Structure for table "movie_list"
#

DROP TABLE IF EXISTS `movie_list`;
CREATE TABLE `movie_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `director` varchar(20) DEFAULT NULL,
  `actor` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Data for table "movie_list"
#

INSERT INTO `movie_list` VALUES (1,'燃烧','李沧东','刘亚仁'),(2,'东邪西毒','王家卫','张国荣'),(3,'重庆森林','王家卫','梁朝伟'),(4,'海街日记','是枝裕和','绫濑遥'),(5,'低俗小说','昆汀','乌玛瑟曼'),(6,'星际穿越','诺兰','马修麦康纳'),(7,'电锯惊魂','温子仁','雷沃纳尔'),(9,'2','1','1'),(10,'1','1','1'),(11,'3','3','3');

#
# Structure for table "user_info"
#

DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `username` varchar(256) NOT NULL DEFAULT '',
  `userpwd` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `balance` double(10,2) DEFAULT NULL,
  `birthday` date DEFAULT '0000-00-00',
  `nickname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#
# Data for table "user_info"
#

INSERT INTO `user_info` VALUES ('1','123','123@qq.com',200.00,'2021-11-01','shuang123'),('123','123','123@qq.com',0.00,'2021-01-01','nick'),('2','2','123@whut.edu.cn',0.00,'1970-01-01','2'),('321','321','123@gmail.com',0.00,'2021-11-19','user'),('test2','1234','123@qq.com',100.00,'2000-12-31','test3'),('tom','123','123@qq.com',100000.00,'2000-09-21','timeNB');
