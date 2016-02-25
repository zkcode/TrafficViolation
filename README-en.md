[中文][chinese] 

[chinese]: https://github.com/zkcode/TrafficViolation/blob/master/README.md

#Traffic Violation Query
Traffic Violation Query implemented with golang and revel 

English Description
----------------------------

####Audience
if you need a sample with limited but runnable features to practice knowledge on GoLang and web framework

or

if you need customize some existing golang code to realize your requirement 

**That is it! :sparkles:**

####Context
1. traffic violation query
2. handreds of trucks to query 
3. when submit query, one dynamic captcha code have to be recognized and filled manually
4. data source is owned by other organization, any query have to be relied on remotely parameters sending and result fetching


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

* get application code
```
go get github.com/zkcode/TrafficViolation
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

		capture the response cookies information when get the captcha code image remotely

	file:

		github.com/zkcode/TrafficViolation/data/queryCookies.txt

	purpose:

		used for parsing communication information when directly connect public service web
		
		capture the response cookies information when access query.jsp page on public service web

> ####Notes:
> **current code is**
> > 1. good for learning purpose
> > 2. really runnable
> > 3. still can be extenable and optimized

>**curernt code is not**
> > 1. contain more features like query results export etc.
> > 2. edit and manage truck information by GUI
> > 3. etc...
