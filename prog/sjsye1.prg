&&----------------------------------------------------------------------------
&&这是一个生成登记公司备付金余额程序
&&作者 limq
&&----------------------------------------------------------------------------
DELETE FILE  djgsbfj1.txt
DELETE FILE 备付金余额1.xls
DELETE FILE ZJYEDZ.DBF
DELETE FILE djgsbfj1.dbf
DELETE FILE  *.BAK
&&----------------------------------------------------------------------------
&&合并为一个文件
&&创建合并余额表ZJYEDZ（资金余额对账）
&&----------------------------------------------------------------------------
USE ZJYE_FZ
COPY STRUCTURE TO ZJYEDZ FIELDS ZJZH,ZJYE,RQ 
CLOSE ALL
USE ZJYEDZ 
ALTER table ZJYEDZ  alter zjye  n(17,2)

SELECT zjzh,VAL(zjye) zjye ,rq FROM zjye_fz   UNION  ALL  SELECT zjzh,VAL(zjye) zjye,rq FROM zjye_mz ;
union all select yemxzh,yedqye, ("20"+SUBSTR(dtoc(yejzrq),1,2)+SUBSTR(dtoc(yejzrq),4,2)+SUBSTR(dtoc(yejzrq),7,2)) FROM bjsye_fz ;
UNION ALL  SELECT yemxzh,yedqye, ("20"+SUBSTR(dtoc(yejzrq),1,2)+SUBSTR(dtoc(yejzrq),4,2)+SUBSTR(dtoc(yejzrq),7,2))  FROM bjsye_mz;
union all select yezjzh,yedqye,yefsrq FROM sjsye_fz   UNION ALL  select yezjzh,yedqye,yefsrq FROM sjsye_mz  INTO  ARRAY  dd
CLOSE all
USE zjyedz
APPEND FROM arra  dd
USE zjyedz
close all 
&&----------------------------------------------------------------------------
&&资金余额对账增加两列JSZT(结算帐套) BFJMC(备付金名称)
&&
USE ZJYEDZ
ALTER TABLE ZJYEDZ ADD JSZT  C(4)
ALTER TABLE ZJYEDZ ADD BFJMC C(20)
CLOSE ALL 
&&----------------------------------------------------------------------------
&&资金余额对账文件结算帐套与备付金名称更新，根据提前准备ZJYEDZGX好的对照关系更新
&&----------------------------------------------------------------------------
USE ZJYEDZ 
REPLACE zjzh with ALLTRIM(zjzh)
UPDATE ZJYEDZ SET ZJYEDZ.JSZT=ZJYEDZGX.JSZT  FROM ZJYEDZGX WHERE ZJYEDZGX.ZJZH=ZJYEDZ.ZJZH
UPDATE ZJYEDZ SET ZJYEDZ.BFJMC=ZJYEDZGX.BFJMC  FROM ZJYEDZGX WHERE ZJYEDZGX.ZJZH=ZJYEDZ.ZJZH
CLOSE ALL
&&----------------------------------------------------------------------------
&&格式化和输出
&&----------------------------------------------------------------------------
SELECT jszt,bfjmc,zjzh,zjye,rq  FROM ZJYEDZ WHERE BFJMC LIKE '%自营备付金%'  ORDER BY jszt into cursor temp1
COPY TO djgsbfj1.dbf
SELECT jszt as 主体,bfjmc as 名称,zjzh as 账户,zjye as 余额 ,rq as 日期  FROM ZJYEDZ WHERE BFJMC LIKE '%自营备付金%'  ORDER BY jszt into cursor temp2
COPY TO 备付金余额1.xls TYPE XL5
SELECT jszt,bfjmc,'余额是 ',zjye,' 元。' FROM ZJYEDZ WHERE BFJMC LIKE '%自营备付金%' ORDER BY jszt into cursor temp3
COPY TO djgsbfj1.txt DELIMITED WITH " " WITH CHAR BLANK
CLOSE ALL

&&----------------------------------------------------------------------------
&&退出
&&----------------------------------------------------------------------------
DELETE FILE  *.BAK
QUIT
QUIT 

&&round(val(thisform.combel1.value),3)
&&SELECT ("20"+SUBSTR(dtoc(yejzrq),1,2)+SUBSTR(dtoc(yejzrq),4,2)+SUBSTR(dtoc(yejzrq),7,2)) FROM bjsye_fz
&&SELECT ("20"+SUBSTR(dtoc(yejzrq),1,2)+SUBSTR(dtoc(yejzrq),4,2)+SUBSTR(dtoc(yejzrq),7,2)) FROM bjsye_fz