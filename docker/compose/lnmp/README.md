Fork from https://github.com/micooz/docker-lnmp

Dependence: docker-compose

Run: docker-compose up

修改php中的数据库地址为: mysql.host, 用户名root, 密码root

导入数据库:
 cd sql/mysql
 sh import.sh

导出数据库:
 cd sql/mysql
 sh dump.sh
