CREATE USER 'business'@'%' IDENTIFIED BY 'business';GRANT USAGE ON *.* TO 'business'@'%' REQUIRE NONE WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;CREATE DATABASE IF NOT EXISTS `business`;GRANT ALL PRIVILEGES ON `business`.* TO 'business'@'%';
