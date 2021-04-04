USE stu_book
SHOW TABLES
/*
		#SELECT FLOOR( 500 + ( RAND( ) *4500 ) )
		#字符串拼接  
		#字符串截取，第一个参数，是需要查询得内容,第二个参数，是从哪截图，第三个参数是截取几个
*/
DELIMITER //
CREATE FUNCTION rander(N INT)RETURNS VARCHAR(255)
BEGIN
	#存放字符串
	DECLARE rand_str VARCHAR(255) CHARACTER SET utf8 DEFAULT '123456789';
	#返回的结果返回
	DECLARE rand_return VARCHAR(255) DEFAULT '';
	DECLARE i INT DEFAULT 0;
	WHILE i<N
	DO		
		SET rand_return = CONCAT(rand_return,SUBSTRING(rand_str,0,FLOOR(1+RAND()*10)),1+RAND()*10);		
	#自增条件
	SET i = i + 1;
	END WHILE;
	RETURN rand_return;
END //
DROP FUNCTION rander
SELECT rander(5)


DELIMITER $$
CREATE FUNCTION genePhone() RETURNS VARCHAR(20)
BEGIN    
	# 定义一个变量用来保存    
	DECLARE head CHAR(3);
	
    #定义一个变量用来保存最后生成的手机号    
    DECLARE phone VARCHAR(20);
    
    #定义一个变量用来存储常用的手机号开头    
    DECLARE bodys VARCHAR(100) DEFAULT "130 131 132 133 134 135 136 137 138 139 186 187 189 151 157";
    
    #定义一个变量用来存储开始截取的手机开头    
    DECLARE STARTS INT;    
    
    #随机获取一个手机号开头索引    
    SET STARTS = 1 + FLOOR(RAND() * 15) * 4;
    
    #使用substring截取手机开头    
    SET head = TRIM(SUBSTRING(bodys, STARTS, 3));
    
    #将head与刚刚定义的存储过程进行拼接将最终的结果发值给phone    
    SET phone = TRIM(CONCAT(head, randNumber(8)));
    
    #数据返回    
    RETURN phone;
END 
$$
DELIMITER ;



#创建随机字符串和随机时间的函数
DELIMITER $$
CREATE FUNCTION randString(N INT) RETURNS VARCHAR(255) CHARSET utf8mb4
DETERMINISTIC

BEGIN  

#定义一个字符串用来存储常用的字符与字母与数字 
DECLARE chars_str VARCHAR(100) DEFAULT 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+}{":?<,./>?<?';

 #定义一个字符串将要返回的字符串 
 DECLARE return_str VARCHAR(255) DEFAULT '' ;
 
 #定义一个用来保存每个循环的次数 
 DECLARE i INT DEFAULT 0;
 
 WHILE i < n DO   
 	#随机从chars_str 获取一个字符串追加到return_str  
 	SET return_str = CONCAT(return_str, SUBSTRING(chars_str, FLOOR(1 + RAND() * 79), 1));
 
  	SET i = i + 1;
 END WHILE;
 
 #最终结果返回 
 RETURN return_str; 
 
 END
 $$ 
 DELIMITER;
 
 
 
 
 
 
 
 
 
 
 
 
 
 DELIMITER $$CREATE PROCEDURE `add_user_memory`(IN N INT)
 BEGIN 
 DECLARE i INT DEFAULT 1;
 WHILE (i <= n) DO
  	INSERT INTO user_memory (user_id, user_name, phone, lan_id,region_id, create_time) VALUES (UUID(), randString(20), genePhone(), FLOOR(RAND() * 1000), FLOOR(RAND() * 100), NOW());
  	SET i = i + 1;
 	END WHILE; 
END 
$$ 
DELIMITER ;






DELIMITER $$ 
CREATE PROCEDURE `add_user_memory_to_outside`(IN n INT, IN COUNT INT)
BEGIN 
	DECLARE i INT DEFAULT 1;
 	WHILE (i <= n) DO
  		CALL add_user_memory(COUNT);
 		INSERT INTO USER SELECT * FROM test_user_memory; 
 		DELETE FROM ser_memory;
 		SET i = i + 1;
 	END WHILE; 
 END 
 $$ 
 DELIMITER ;
CALL add_user_memory(10000);
INSERT INTO USER SELECT * FROM user_memory;
CALL add_user_memory_to_outside(1000,10000)