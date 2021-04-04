#进阶1 基础查询
/*
语法select 查询列表 from 表名 

特点：
	1.查询列表可以是：表中的字段，常量值，表达式，函数
	2.查询的结构是一个虚拟的表格
*/
#方式1
USE myemployees
#1.如何查询表中的单个字段
SELECT NAME FROM beauty

#2.查询表中的多个字段
SELECT first_name,last_name,email FROM employees


#方式2
#3.查询表中的所有字段 (用*号就是必须跟原表数据一样)
SELECT * FROM employees
#``用来标识字段的，表明，该字段不是关键字

#4.查询常量值
SELECT 100
SELECT 'join'

#5.查询表达式
SELECT 100/20

#6.查询函数
SELECT VERSION()

#7.起别名
/*
1.便于理解
2.如果要查询的字段由重名。可以用来区分
*/
#方式一
SELECT 100/20 AS 结果
SELECT first_name AS 姓,last_name AS 名 FROM employees

#方式二
SELECT first_name 姓,last_name 名 FROM employees
SELECT * FROM employees

#案例 查询 名字是 steven的
SELECT first_name 名 FROM employees

#8.去重
#查询：查询员工中的中设计的所有编号
SELECT  DISTINCT department_id FROM employees

#9.+号的作用
/*
java中的+号
1.运算符，两个操作数都为数值型
2.连接符，只要有一个操作数为字符串

MySQL中的+号
仅仅只有仅有一个功能：运算符

select 100 + 90  两个操作数都为数值型，则做加法运算
select '123'+90; 只要其中一方为字符串，试图将字符型数值转换成数值型
				如果转换成功，继续做加法运算
				失败，将字符型数值转换成0
select 'join'+90 如果转换失败，则将字符型转换为0

select null 只要其中为null  则结果肯定为null

*/
#案例，查询员工名和姓连接在一起
SELECT CONCAT(first_name,last_name) AS 型 FROM employees

#题目
	SELECT * FROM employees
	#起别名
	SELECT last_name,job_id,salary AS sal FROM employees
	#展示表结构
	DESC employees
	#去重查id
	SELECT DISTINCT job_id FROM employees
	#起别名
	# select ifnull()  判断一个数是否为空 懒得写数据了，很简单那的一个操作 
	SELECT CONCAT(1,2,3) AS out_put FROM employees





#进阶2：条件查询
/*

语法： select  查询列表   3  
       from 表名          1
       here  筛选条件     2
       
 分类：
	一.按条件表达式筛选
	
		条件运算符  > <  = !  <>  >=  <=
	
	二.按逻辑表达式筛选
	
		逻辑运算符 
			&& || !
			and or not
		&&和and ：两个条件满足，为真
		
	三。模糊查询
			like 
			between and
			in 
			is null
*/  
# 一.按条件表达式来筛选

#案例1：查询公司>12000的员工信息
SELECT * FROM employees WHERE salary>12000


#案例2：查询部门编号不等于90号的员工名和部门编号 
#的后面有谁 select 就查谁
SELECT CONCAT(first_name,'--',employee_id) FROM employees WHERE employee_id!=90



#二.按照逻辑表达式筛选

#案例1：查询在10000到20000的之间的员工名和工资 以及奖金
SELECT * FROM employees
SELECT first_name,salary FROM employees WHERE salary>=10000 AND salary <=20000

#案例2：查询部门编号不是在90到110之间的，或者工资高于15000的员工信息
#利用大于等于 跳过那个区间就可以
#not 用来取反
SELECT * FROM employees WHERE employee_id<90 OR employee_id>110 OR salary>15000

SELECT * FROM employees WHERE NOT(employee_id>=90 AND employee_id<=110) OR salary>15000


#三、模糊查询
/*
like	
	特点：一般和通配符使用
		1.% 包含零个和多个字符
		2._ 包含任意单个字符
between and
	特点
		1.使用between and 可以提高语句的简洁度
		2.包含临界值
		3.两个值不可以颠倒，会出现问题
		
is null 
not null
*/

#案例1：查询员工名中包含字符的员工信息
SELECT * FROM employees WHERE first_name LIKE "%a%"

#案例2：查询员工名中第三个字符为e，第五个字符为a的员工名和工资
SELECT first_name,salary FROM employees WHERE first_name LIKE '__e_a%'

#2.between and 
#案例1：查询员工编号在100到120之间的员工信息
SELECT * FROM employees WHERE employee_id BETWEEN 90 AND 120

#3.in
/* 
含义：判断某字段的值是否属于in列表中的某一项
特点：
	1.使用in比使用or提高语句简洁度
	2.in列表的值类型必须同意，或兼容
*/
#案例：查询员工的工中编号是 AD_PRES、IT_PROG AD_VP 中的一个员工名和工种编号
#in 中 必须要加单引号！！！！
SELECT first_name,job_id FROM employees WHERE job_id IN('AD_PRES','IT_PROG','AD_VP')

#4.is null
/*
=或<> 不能用于判断null值

*/

#案例1:查询没有奖金得员工名和奖金率
SELECT * FROM employees
SELECT first_name,salary FROM employees WHERE commission_pct IS NULL


#安全等于  <=>
#案例1:查询没有奖金得员工名和奖金率
SELECT  first_name,salary FROM employees WHERE commission_pct <=> NULL

#案例2：查询工资为12000得员工信息
SELECT * FROM employees WHERE salary <=> 12000

#is null pk <=>
#is null ：仅仅可以判断null值，可读性较高，建议使用
# <=> :既可以判断null值，又可以判断普通得数值，可读性较低

#案例3：查询员工号为176得员工得姓名和部门号和年薪
#年薪计算，月工资*12*奖金率
SELECT CONCAT(first_name,last_name),department_id,salary*12*(1+IFNULL(commission_pct,0)) AS 年薪 
FROM employees WHERE employee_id<=>176


#测试 
	SELECT first_name,salary FROM employees WHERE salary>12000
	SELECT CONCAT(first_name,last_name),department_id,salary*12*(1+IFNULL(commission_pct,0)) AS 年薪 
FROM employees WHERE employee_id<=>176
	
	SELECT * FROM employees
	SELECT first_name,salary FROM employees WHERE NOT(salary>5000 AND salary<12000)
	SELECT first_name,department_id FROM employees WHERE employee_id BETWEEN 100 AND 120
	SELECT first_name,job_id,manager_id FROM employees WHERE manager_id IS NULL 
	SELECT first_name,salary,commission_pct FROM employees WHERE salary IS NOT NULL
	SELECT CONCAT(first_name,'----',last_name) FROM employees WHERE first_name LIKE '__a%'
	SELECT first_name FROM employees WHERE first_name LIKE '%ae%'
	SELECT first_name FROM employees WHERE first_name LIKE '%e'
	SELECT first_name,job_id FROM employees WHERE employee_id BETWEEN 80 AND 100
	

SELECT salary,last_name FROM employees WHERE commission_pct IS NULL AND salary<18000
SELECT * FROM employees WHERE job_id != 'IT' OR salary = 12000
DESC employees



#进阶3：排序查询
/*
语法：
	select 查询列表  
	from 表名 
	【where 筛选条件】 
	order by 排序列表 【asc/desc】
	
特点：
	1.asc代表的是升序，desc是降序
	2.默认是升序、
	3.order by子句中支持，单个字段，多个字段，表达式，函数，别名
	4.order by子句一般放在查询语句的最后面，limit 子句除外
*/
#案例1：查询员工信息，要求工资从高到低
#asc  升序 从
#desc 降序
SELECT * FROM employees ORDER BY salary DESC

#案例3：查询部门部门编号>=90 的员工信息，按入职时间的先后进行排序
SELECT * FROM employees
SELECT * FROM employees WHERE department_id>=90 ORDER BY hiredate 

#案例3：按年薪的高低显示员工的信息和年薪【按表达式排序】
SELECT salary*12*(1+IFNULL(commission_pct,0)) FROM employees ORDER BY salary*12 DESC

#案例4；按年薪的高低显示员工的信息和年薪【按别名排序】
SELECT salary*12*(1+IFNULL(commission_pct,0))AS 年薪 FROM employees ORDER BY 年薪 DESC

#案例5：按姓名的长度显示员工的姓名和工资（用到一个函数）
SELECT LENGTH(first_name),salary AS 姓 FROM employees ORDER BY 姓 DESC

#案例6：查询员工信息，要求先按工资排序，再按照员工编号排序
#order by 排序子句，可以支持多个字段排序，中间用逗号隔开
SELECT * FROM employees
SELECT * FROM employees ORDER BY salary,employee_id DESC


#测试
	SELECT first_name a,department_id,salary*12*(1+IFNULL(commission_pct,0)) AS b
	FROM employees ORDER BY b DESC,a
	
	SELECT first_name,salary FROM employees WHERE NOT(salary>8000 AND salary<17000)ORDER BY salary DESC
	
	SELECT * FROM employees
	SELECT * FROM employees WHERE first_name LIKE '%e%' ORDER BY LENGTH(first_name) DESC,department_id



#进阶4 常见函数
/*
功能：类似位Java的方法：将一组逻辑语句封装在方法中等，对外暴漏方法名
好处 
	1.隐藏实现细节
	2.提高代码的重复用
调用
	select 函数名(实参列表) 【from 表名】
特点
	1.叫什么（函数名）
	2.干什么（函数功能）
	
分类
	1.单行函数   【传过去一个函数，返回一个值】
		concat 
		length
		ifnull1
	2.分组函数：做统计使用，聚合函数，组函数 【传过去一组值，返回一个值】
		字符函数
			lenght
		数学函数
		其他函数
		流程控制函数
*/
#一.字符函数，length
SELECT LENGTH('join')
SELECT LENGTH('zhangsanfeng33')
#查询字符集
SHOW VARIABLES LIKE '%char%'

#2.concat 拼接字符串
SELECT * FROM employees
SELECT CONCAT(first_name,last_name) FROM employees

#3.uppar 函数变成大写
SELECT UPPER('join')
SELECT LOWER('join')
#案例 1：将名字变小写，姓变大写
SELECT CONCAT(UPPER(first_name),LOWER(last_name)) FROM employees

#4.subtr 截取字符串 索引从1开始 两个参数，就是从第二参数开始截取
SELECT SUBSTR('杨幂爱上了李导演',1,3)

#案例1：姓名中首字符大写，其他字符小写。
#假设从1开始截取，姓名中不会超过10个长度
SELECT CONCAT(UPPER(SUBSTR(first_name,1,1)),LOWER(SUBSTR(first_name,2,10)),LOWER(last_name)) FROM employees

#5.insert,返回字符串返回的启示索引位置
SELECT INSERT('张爱上了母猪','母猪')

#6.trim 去掉前后空格
SELECT TRIM('       张翠山      ')
SELECT TRIM('a' FROM 'aaaaaaaa张翠山') AS out_put


#7.lpad左填充指定长度
SELECT LPAD('秦素素',10,'*') AS out_put



#二、数学函数
#round
SELECT ROUND(1.65,3)

#向上去整
SELECT CEIL(-1.02)

#向下取整
SELECT FLOOR(-9.99)

#truncate 小数点之后，保留一位
SELECT TRUNCATE(1.65,1)

#mod取余  10/-3
SELECT MOD(10,-3)

#三、日期函数
#四、其他函数   看菜鸟教程 有很多函数


#五、流程控制函数
SELECT IF('10'>5,'大','小')
#1.if函数 查看表中什么人有没有奖金
SELECT * FROM employees
SELECT first_name,IF(commission_pct IS NULL,'没有奖金','有奖金') FROM employees WHERE commission_pct IS  NULL

#2.case函数的使用一
/*
case 要判断的字段或表达式
when 常量1 then 要显示的值1或语句2
when 常量2 then 要显示的值2或语句2
.。。。
else 要显示的值或语句
*/
#案例：查询员工的工资，要求 部门号=30 工资位1.1被  以此类推
USE myemployees
SELECT * FROM employees

SELECT salary 原始数据,employee_id,
CASE department_id
WHEN 50 THEN salary*1.1
WHEN 60 THEN salary*1.2
WHEN 70 THEN salary*1.3
WHEN 90 THEN salary*1.4
END AS 新数据
FROM employees


#case 函数的使用2 类似于 多重if
/*
	case 
	when 条件1 then 要显示的值1或语句1
	when 条件2 then 要显示的值1或语句2
	.。。。。
	else 要显示的值n或语句n
	end
*/
#案例：查询员工的工资的情况
/*
	>11000  C级别
	>15000  B
	>20000  A
*/
SELECT first_name,employee_id,
CASE 
WHEN salary>20000 THEN 'a'
WHEN salary>15000 THEN 'B'
WHEN salary>10000 THEN 'c'
ELSE 'D'
END
FROM employees


#测试
SELECT NOW()
SELECT * FROM employees
SELECT employee_id,first_name,salary,salary*1.2 FROM employees
SELECT first_name,LENGTH(first_name) FROM employees GROUP BY first_name
#不不想写，一个简单的字符串拼接
SELECT <laset_name> earns

SELECT * FROM employees


#查询部门的所有人的个数，可以找他们相同的字段，就可以找到他们的个数了
SELECT job_id,first_name,COUNT(*) FROM employees GROUP BY department_id

SELECT job_id,
CASE job_id
WHEN 'SA_REP' THEN 'A'
WHEN 'AD_ASST' THEN 'B'
WHEN 'IT_PROG' THEN 'C'
END AS 级别 FROM employees WHERE first_name='king'



#分组函数
/*
功能：用做统计使用，又称为聚合函数或统计函数或组函数
分类‘
sum vag max min count
特点、
	1.sum avg 一般用来出来数值型
           max min count  可以处理任何类型
        2。所有的分组函数都区分null值
        3。聚合函数和distinct关键字使用，实现去重的操作
		
*/
#1.简单使用(就调函数，理清逻辑就行)
SELECT SUM(salary) FROM employees
#sum avg 适合数值型

#3测试是否忽略null值
SELECT SUM(commission_pct),AVG(commission_pct) FROM employees

#sum和distinct 搭配使用,都可以任何聚合函数使用
SELECT SUM(DISTINCT salary),SUM(salary) FROM employees

#4count函数的详细介绍
/*
1.count 返回查询的总行数（在count（*）的时候只要任一字段不为null 那么就会增加1）
2.count同时会搭配 分组用，记住分组的时候要 明确区分一下，分隔的条件
3.

*/
#为什么count之后 job_id 是19  department_id是11
SELECT COUNT(DISTINCT department_id)  FROM employees

#count(1),就是在左边增加1列，然后统计1的个数
SELECT  COUNT(1) FROM employees

#测试 myisam 存储引擎上，count(*)效率搞
#innnodb 存储引擎下，count（*） count（1）比count(字段) 效率高

#和分组函数一同查询的字段有限制
SELECT AVG(salary) FROM employees 


#测试
SELECT MAX(salary),MIN(salary),AVG(salary),SUM(salary) FROM employees
SELECT * FROM employees
SELECT MAX(hiredate),MIN(hiredate),SUBSTR(MAX(hiredate)-MIN(hiredate),1,4)AS 相差时间 FROM employees
SELECT * FROM employees
SELECT MAX(hiredate),MIN(hiredate),DATEDIFF(MAX(hiredate),MIN(hiredate)) FROM employees
SELECT COUNT(*) FROM employees WHERE department_id=90




#进阶5，分组查询
/*语法
	select 分组函数 （要求出现group by 的后面）
	from 表名
	【where 筛选条件】
	group by 分组的列表
	【order by 子句】
注意：
	查询列表必须特殊，要求是分组函数和group by 后出现的字段
特点：		数据源    	位置			关键字 
	分组前  原始表单       group by 子句的前面	group by
	分组后   分组后的结果集    group by 子句的后面   having
	
	1.分组函数做条件肯定是放在having子句中
	2.尽量考虑在分组前筛选，有一个性能的问题
  2.group by 子句支持单个字段分组，多个字段分组，（多个字段分组用逗号隔开，没有顺序要求表达式或函数
*/
#查询分组前的筛选
#查询每个部门的平均工资
SELECT job_id,AVG(salary),COUNT(*) 部门人数 FROM employees GROUP BY department_id

 
#案例1：查询每个工种的最高工资
SELECT MAX(salary),job_id FROM employees GROUP BY job_id

SELECT * FROM employees
#案例2：查询每个工种的最高工资，和每个个数
/*
job_id
	:每个工种的名称，但是他不会显示，每个工种的具体人数，
department_id
	:而这个department_id就是在每个工种的基础上，的具体人数，他是以每个工种来分类的

总结
	job_id  <  demployee_id     (当deployee_id相同的时候
	，就可以查询出，每个部门的人数 了)
*/

SELECT COUNT(*) FROM employees WHERE department_id=80;
SELECT department_id,job_id,COUNT(*),MAX(salary) FROM employees GROUP BY department_id
SELECT MAX(salary),job_id,COUNT(*) FROM employees GROUP BY job_Id

#案例3；查询姓名中包含a字符的每个部门的平均工资
SELECT * FROM employees
SELECT AVG(salary),job_id FROM employees WHERE first_name LIKE '%a%'
GROUP BY department_id

#案例3：查询有奖金的每个领导的手下员工的最高工资
SELECT * FROM employees
SELECT first_name,commission_pct,manager_id,MAX(salary) 最高工资 FROM employees
WHERE commission_pct IS NOT NULL GROUP BY manager_id

#写一下更复杂的案例
#分组后筛选
#案例1：查询每个部门的员工个数>2
SELECT first_name,job_id,department_id,COUNT(*)AS a FROM employees 
GROUP BY department_id HAVING a>2

#案例2：查询每个工种有奖金的员工的最高工资》12000的工种编号和最高工资
SELECT * FROM employees
SELECT first_name,MAX(salary)AS a,department_id,job_id  FROM employees WHERE commission_pct IS NOT NULL 
GROUP BY job_id HAVING a>12000


#案例3：查询领导编号 >120的每个领导手下的最低工资>5000的领导编号是哪个，以及最低工资
SELECT * FROM employees
SELECT first_name,manager_id,MIN(salary)AS a,job_id FROM employees
WHERE manager_id > 102 GROUP BY manager_id HAVING a>5000 

#group by 按表达式或函数分组
#案例：按照员工姓名的长度分组，查询每一个组的员工个数，筛选员工个数>5的有哪些
SELECT LENGTH(first_name),job_id,COUNT(*)AS a FROM employees
GROUP BY LENGTH(first_name) HAVING a>5

#按多个字段分组
#查询每个部门每个公众的员工的平均工资
SELECT * FROM employees
SELECT first_name,job_id,department_id,AVG(salary),COUNT(*) FROM employees
GROUP BY job_id,department_id

#添加排序
#查询每个部门每个公众的员工的平均工资  高低显示
SELECT first_name,job_id,department_id,AVG(salary),COUNT(*) FROM employees
GROUP BY job_id,department_id ORDER BY AVG(salary) DESC


#测试
	SELECT * FROM employees
	SELECT MAX(salary),MIN(salary),AVG(salary),SUM(salary),job_id FROM employees
	GROUP BY job_id ORDER BY job_id ASC
	
	SELECT MAX(salary)-MIN(salary) FROM employees
	#这句话是求得是 有管理者得员工的最低工资
	SELECT first_name,manager_id,job_id,MIN(salary) FROM employees 
	WHERE manager_id IS NOT NULL
	GROUP BY manager_id HAVING MIN(salary)>6000
	
	SELECT * FROM employees
	SELECT first_name,AVG(salary),department_id,COUNT(*) FROM employees WHERE department_id IS NOT NULL
	GROUP BY department_id ORDER BY AVG(salary) DESC
	
	SELECT COUNT(*) FROM employees
	WHERE job_id IS NOT NULL GROUP BY job_id
	

#进阶6 连接查询
/*
含义:又称多表连接，当查询得字段来自于多个表时，就会用到连接查询

笛卡尔乘积现象，表1有m行，表2有n  m*n
要有一个连接条件才可以连接哦，不然会出现乘积现象
分类	
	按照年代分类
		sql92   【支持内连接】
		sql99【推荐】【仅仅不支持全外连接】
	按照功能分类
		内连接
			等值连接
			不等值连接
			自连接
		外连接
			左外连接
			右外连接
			全外连接
		交叉连接
*/	
#查询表中几个人有男朋友
SELECT * FROM boys
SELECT `name`,boyName FROM beauty,boys WHERE beauty.`id`=boys.`id`


/*
由于时间关系，我这边就写sql99标准了，具体原因有以下几种
	1.时间关系：最近时间很紧凑，所以学东西都是狠赶得。
	2.知识关系：通过上面也已经看到了，slq92仅仅支持内连接，对于现在得我们作用
	并不是很大
	3.限制关系，仔细看上边得限制，太局限了，所以以下就直接写sql99标准了
*/


#二、sql99语法
/*
语法：
	select 查询列表
	from 表1 别名【连接类型】
	join 表2 别名
	on 连接条件
	【where 筛选条件】
	【having 分组后筛选】
	【group by 筛选条件】
	【order by 排序列表】
	
	
分类
内连接 学【inner】
外连接 学 
	左外 left 【outer】
	右外 right 【outer】
	全外 full 【outer】
交叉连接
	cross
*/



#一、内连接
/*
select 查询列表 from 表1 别名  
inner join 表2 别名
on 连接条件
【where 筛选条件】
【group by 筛选条件】
【having 分组后筛选】
【order by 排序列表】

特点：
	1.添加排序，分组筛选
	2.inner 可以省略
	3.筛选条件放在where 后面，连接条件放在on 后面，提高分离性，便于阅读
*/

#1.等值连接
#案例：查询员工名 部门名
SELECT first_name,job_title,COUNT(*) FROM employees
INNER JOIN jobs ON employees.`job_id`=jobs.`job_id`
GROUP BY employees.`job_id`

#2.查询命中包含e的员工名和工种名
SELECT first_name,job_id FROM employees
WHERE first_name LIKE '%e%'

#3.查询部门个数 > 3的城市名和部门个数（分组和筛选）
/*
employees department_id  ---> departments departments_id

departments location_id  ---> locations location_id

*/

SELECT locations.`city`,COUNT(*)AS a FROM
employees INNER JOIN departments ON employees.`department_id`=departments.`department_id`
INNER JOIN locations ON departments.`location_id`=locations.`location_id`
GROUP BY employees.`job_id` HAVING a > 3


#4.查询那个部门的部门员工个数 > 3 的部门名和员工个数，并且按照个数降序（排序）
SELECT job_id,COUNT(*)AS a FROM employees
GROUP BY employees.`department_id` HAVING a > 3
ORDER BY a DESC 

#5.查询员工名。部门名，工种名字，按照部门降序
SELECT * FROM jobs
SELECT employees.`first_name`,employees.`job_id`,jobs.`job_title`
FROM employees INNER JOIN jobs ON employees.`job_id`=jobs.`job_id`
ORDER BY employees.`job_id` DESC
 	
 	
 	
#二、非等值连接
#1.查看员工的工资级别
SELECT employees.`salary`,job_grades.`grade_level`
FROM employees 
JOIN job_grades ON employees.`salary` 
BETWEEN job_grades.`lowest_sal` AND job_grades.`highest_sal`


#2.查询每个工资级别的人员个数
SELECT employees.`salary`,job_grades.`grade_level`,COUNT(*)
FROM employees 
JOIN job_grades ON employees.`salary` 
BETWEEN job_grades.`lowest_sal` AND job_grades.`highest_sal`
GROUP BY job_grades.`grade_level`
HAVING COUNT(*) > 2
ORDER BY job_grades.`grade_level` DESC


#三、自连接【自己连自己，自连】
#查询员工的名字和上级的名字
SELECT a.`first_name`,m.`first_name`
FROM employees a JOIN employees m
ON a.manager_id=m.employee_id








#2.外连接
#引入查询没有男朋友的女神名
/*
应用场景，用于查询一个表中有，另外一个表中没有的记录
特点：
 1.外连接的查询结果为主表中的所有记录，
	如果有和他匹配，则显示匹配的值
	如果没有，则显示null
	外连接查询结果=内连接查询结果+主表中有二从表中没有的记录
  2.左外连接，
	left左边的是主表
	right join 右边的是主表
   3.左外和右外，交换两个表的顺序，可以实现同样呃效果
*/
SELECT beauty.`name`,boys.`boyName`
FROM beauty JOIN boys ON beauty.`boyfriend_id`=boys.`id`
SELECT * FROM beauty


#引入：查询男朋友不在男神表的女神名
#查询的信息，主要来自于哪个表哪个表就是主表
#左外连接
SELECT beauty.`name`
FROM beauty LEFT OUTER JOIN boys
ON beauty.`boyfriend_id`=boys.`id`
WHERE boys.id IS NULL



#查询id号大于3的女神的男朋友信息。如果有就列出，没有 用null填充
SELECT boys.*,beauty.*FROM boys LEFT OUTER JOIN beauty ON boys.`id`=beauty.`boyfriend_id`
WHERE boys.`id`>3

#查询哪个城市没有部门
SELECT * FROM employees
SELECT * FROM departments
SELECT * FROM locations
SELECT locations.`city`,departments.`department_name`
FROM locations LEFT OUTER JOIN departments
ON locations.`location_id`=departments.`location_id`
WHERE departments.`department_id` IS NULL 

#查询部门名为sal或at的员工信息
SELECT * FROM employees
INNER JOIN departments ON
employees.`department_id`=departments.`department_id`
WHERE departments.`department_name` LIKE 'SAK' OR departments.`department_name` LIKE 'IT'



#查询哪个部门没有员工（都是左外连接）
SELECT departments.*,employees.`employee_id`
FROM departments LEFT OUTER JOIN employees
ON departments.`department_id`=employees.`department_id` 
WHERE employees.`department_id` IS NULL


#交叉连接
SELECT employees.*,departments.*
FROM employees CROSS JOIN departments




#进阶7 子查询
/*
含义：
出现在其他语句中的select 语句，成为子查询或内查询
外部的查询条件，称为主查询，或外查询

分类
按子查询出现的位置，
	select 后面
		仅仅支持 标量子查询
	from 后面
		表子查询
	where 和having 后面   111
		标量子查询
		列子查询  111
		行子查询
	exists (相关子查询)
		表子查询
	
按照金结果集的行内数
	标量子查询（结果集为一列）
	列子查询（结果集只有一列多行）
	行子查询（结果集有一列多行）
	表子查询 （结果集有多列多行）
*/

#一、放在where 和having后面
#标量子查询
#列子查询
#行字查询 一般搭配单行操作符使用 in any  all

#特点
	1.都会放在小括号内
	2.子查询一般放在条件的右侧
	3.标量子查询，一般搭配着单行操作符使用
/*
执行权限，子查询的结果一定要由于主查询的结果 让子查询的结果作为主查询的结果
*/
	

#案例1.谁的工资比able高
SELECT salary,first_name FROM employees
WHERE first_name='Daniel'

SELECT * FROM employees WHERE salary > 
(SELECT salary FROM employees
WHERE first_name='Daniel')


#返回job——id和141员工相同，salary比143员工多的员工，姓名员工和job-id和工资
SELECT salary FROM employees
WHERE employee_id=143

SELECT first_name,job_id,salary
FROM employees
WHERE job_id=(
SELECT job_id FROM employees
WHERE employee_id=141
) AND salary > (
SELECT salary FROM employees
WHERE employee_id=143
)


#案例3：返回公司工资最少的员工的last_name,job_id和salary
SELECT first_name,job_id,MIN(salary) FROM employees

#查询最低工资大于60每个部门最低工资的部门id和最低工资
SELECT MIN(salary),job_id FROM employees
WHERE department_id=60

SELECT job_id,MIN(salary)AS a FROM employees
GROUP BY department_id
HAVING a > (SELECT MIN(salary) FROM employees
WHERE department_id=50)



