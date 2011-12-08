create database if not exists `db_roseindia`;

USE `db_roseindia`;

CREATE TABLE `article` (
`article_id` bigint(20) NOT NULL auto_increment,
`article_name` varchar(20) NOT NULL,
`article_desc` text NOT NULL,
`date_added` datetime default NULL,
PRIMARY KEY (`article_id`)
)