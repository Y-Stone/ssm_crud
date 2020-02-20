

# SSM_CRUD项目

## 1、技术选择

前端：jquery-1.12.4、bootstrap-3.3.7

后端：Spring4.3.7+SpringMVC4.3.7+MyBatis3.4.2

数据库：MySQL 5.7.3

IDE： IDEA2018



## 2、注意事项

### 1、SQL文件在sql目录下，直接导入，记得修改jbdc的属性文件

### 2、bootstrap、jquery引入顺序

```html
<!--引入bootstrap和jquery，注意顺序问题-->
<!--bootstrap会借助jquery，所以jquery在前，而css样式得放在js前面-->
<link href="static/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"><script type="text/javascript" src="static/js/jquery-1.12.4.min.js"/>
<script src="static/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
```

