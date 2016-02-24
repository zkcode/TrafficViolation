English      中文
=======      ===

#Traffic Violation Query
Traffic Violation Query implemented with golang and revel 

English Description
-------------------

####Audience
if you need a sample with limited but runnable features to practice knowledge on GoLang and web framework
or
if you need customize some existing golang code to realize your requirement 

**That is it! :sparkles:**

####Context
1.traffic violation query
2.handreds of trucks to query 
3.when submit query, one dynamic captcha code have to be recognized and filled manually
4.data source is owned by other organization, any query have to be relied on remotely parameters sending and result fetching


####Involved Code or Package
1. revel web framework (github.com/revel/revel, github.com/revel/modules,github.com/revel/cmd)
2. ddliu go-httpclient (github.com/ddliu/go-httpclient)
3. jquery,bootstrap,jqClock


####Test&Run Package
* get revel web framework code
```
go get github.com/revel/revel
go get github.com/revel/cmd/revel
go get github.com/revel/samples (options)
```
* get go-httpclient code
```
go get github.com/ddliu/go-httpclient
```

* run traffic violation query
```
revel run github.com/zkocde/TrafficViolation
```

* open brower, input access address
```
http://localhost:9000
```

####key Information
* basic truck information used for query string batch input 
	location:
		github.com/zkcode/TrafficViolation/data/trucks.csv

	data structure:
		车牌号,车辆类型,车辆识别代码,机动车登记证书编号,发动机编号,类别
		A69991,01,LGAGDKVF053014530,440008111023,EQB2102069346179,主车
		AC2020,01,LFWNDULD461F05985,440008156039,CA6DE22201163022,主车

* main reference web server for traffic violation query
	location:
		http://210.76.69.58/wfcx/query.jsp

* web http communication
	file:
		github.com/zkcode/TrafficViolation/data/getImageCookies.txt
	purpose:
		used for parsing communication information when directly connect public service web.
		capture the cookies information when get first captcha image remotely

	file:
		github.com/zkcode/TrafficViolation/data/queryCookies.txt
	purpose:
		used for parsing communication information when directly connect public service web
		capture the cookies information when access query.jsp page on public service web

> ####Notes:
> **current code is**
> > 1. good for learning purpose
> > 2. really runnable
> > 3. still can be extenable and optimized

>**curernt code is not**
> > 1. contain more features like query results export etc.>
> > 2. edit and manage truck information by GUI
> > 3. etc...

#交通违章查询
用golang和revel框架实现的交通违章查询应用 

中文描述
-------
####适用者
如果你需要一个功能有限但可执行的代码，用于go语言和web框架的学习
或者
如果你想利用一个现成的违章查询程序，实现个人特定的需求 

**这个应用就是你需要的！它值得你花些时间研究一番！:sp arkles:**

####背景
1. 实现交通违章的（半）自动化查询
2. 需要对上百辆车辆进行依次查询 
3. 在查询过程中，需要识别和输入公共服务网站提供的动态识别码（captcha code）
4. 查询的数据源属于公共服务网站，违章查询需要不断地重复完成上百台车辆的数百个查询参数的录入
５．工作效率低，花费时间较长

####涉及到的技术点（包）:
1. revel web framework (github.com/revel/revel, github.com/revel/modules,github.com/revel/cmd)
2. ddliu go-httpclient (github.com/ddliu/go-httpclient)
3. jquery,bootstrap,jqClock,json,html,JavaScript

####软件包测试和运行
- 获取revel web框架的代码
 	
```
go get github.com/revel/revel
go get github.com/revel/cmd/revel
go get github.com/revel/samples (options)
```

- 获取go-httpclient的代码
```
go get github.com/ddliu/go-httpclient
```

- 执行违章查询应用的服务器端
```
revel run github.com/zkcode/TrafficViolation
```

- 执行违章查询的客户端，打开浏览器（最好是firefox或者chrome）, 输入访问地址
```
http://localhost:9000
```

####关键（可定制）信息
- 预查询违章信息的车辆信息 
	文件位置: 
		github.com/zkcode/TrafficViolation/data/trucks.csv

	数据结构（csv格式）:
		车牌号,车辆类型,车辆识别代码,机动车登记证书编号,发动机编号,类别
		A69991,01,LGAGDKVF053014530,440008111023,EQB2102069346179,主车
		AC2020,01,LFWNDULD461F05985,440008156039,CA6DE22201163022,主车

- 提供交通违章查询的公共服务网站（本应用基于中国广东省的某个网站完成。如果访问其他的服务网站，需要根据对方网站的页面数据结构，调整应用的代码）
	基本网址:
		http://210.76.69.58/wfcx/query.jsp		

- web http communication
	文件:
		github.com/zkcode/TrafficViolation/data/getImageCookies.txt
	目的:
		用于解析直接访问公共服务网站时的通讯信息（测试使用，删除对本应用无影响）
		捕捉第一次获取captcha校验码图片时返回的cookies信息

	文件:
		github.com/zkcode/TrafficViolation/data/queryCookies.txt
	目的:
		用于解析直接访问公共服务网站时的通讯信息（测试使用，删除对本应用无影响）
		捕捉第一次访问query.jsp页面时返回的cookies信息

> ####备注
> **当前代码的确可以**
> > 1. 用于学习目的
> > 2. 真实可运行
> > 3. 根据需要被扩展和优化

> **当前代码的确没有**
> > 1. 包含更多的特性，例如查询结果的导出
> > 2. 通过前段界面完成被查询车辆信息的编辑
> > 3. 等等...
