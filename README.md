
## SSM-CRUD 项目简介
使用 SSM 框架搭建出一套简单的 CRUD 项目示例，主要涉及两张表：员工表和部门表，其中每个员工都对应一个部门。


### 主要实现的功能
1、分页查询所有员工信息并展示列表。

2、添加一条员工的信息。

3、新增数据需要校验：
* jQuery 前端校验用户名和邮箱是否合法。
* Ajax 请求校验用户名是否重复。
* JSR 303 后端校验用户名、邮箱是否合法以及用户名是否重复。

4、编辑修改某条员工的信息。

5、删除某条员工的信息，批量删除所选员工的信息。

6、RESTful 风格的URI。


### 涉及的技术
1、后端框架：SSM（Spring 5 + Spring MVC + MyBatis 3）+ Maven 3.6.3

2、MyBatis 分页插件：PageHelper

3、MyBatis 逆向工程：MyBatis Generator

4、数据库：MySQL 5.7 + Druid 数据库连接池

5、前端框架：BootStrap 3


### 最终效果图
![](https://s3.bmp.ovh/imgs/2021/10/404a8ab60122adeb.png)


### 项目的详细笔记
[语雀笔记](https://www.yuque.com/jyunkai/ssm/gumcba)
