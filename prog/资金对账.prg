CLOSE ALL 
ALTER table  JJYE  alter xtlx c(8)
ALTER table  JJYE  alter jszt c(14)
ALTER table  JJYE  alter kmmc c(40)
ALTER table  JJYE  alter drye n(17,2)
ALTER table  JJYE  alter srye n(17,2)
ALTER table  JJYE  alter kmdm c(12)
ALTER table  JJYE  ADD  bfjzh c(25)
ALTER table  ZYYE  alter xtlx c(8)
ALTER table  ZYYE  alter jszt c(14)
ALTER table  ZYYE  alter kmmc c(40)
ALTER table  ZYYE  alter drye n(17,2)
ALTER table  ZYYE  alter srye n(17,2)
ALTER table  ZYYE  alter kmdm c(12)
ALTER table  ZYYE  ADD  bfjzh c(25)

&&去除字符型字段前后空格
CLOSE ALL
USE djgsbfj
REPLACE 备付金账户 with ALLTRIM(备付金账户)
REPLACE  机构 with ALLTRIM(机构)
CLOSE ALL
USE zyye
REPLACE bfjzh with ALLTRIM(bfjzh)
REPLACE jszt with ALLTRIM(jszt)
REPLACE kmmc  with ALLTRIM(kmmc)
REPLACE kmdm   with ALLTRIM(kmdm)
CLOSE ALL
USE dzgx
REPLACE kmdm   with ALLTRIM(kmdm)
REPLACE jszt with ALLTRIM(jszt)
REPLACE bfjzh with ALLTRIM(bfjzh)
CLOSE ALL
USE dzgx
REPLACE bfjzh with ALLTRIM(bfjzh)
REPLACE jszt with ALLTRIM(jszt)
REPLACE kmdm   with ALLTRIM(kmdm)
CLOSE ALL
USE jjye
REPLACE bfjzh with ALLTRIM(bfjzh)
REPLACE jszt with ALLTRIM(jszt)
REPLACE kmmc  with ALLTRIM(kmmc)
REPLACE kmdm   with ALLTRIM(kmdm)
CLOSE ALL

UPDATE   JJYE     SET    JJYE.BFJZH=DZGX.bfjzh     FROM   DZGX     WHERE DZGX.JSZT=JJYE.JSZT     AND   DZGX.KMDM=JJYE.KMDM
UPDATE   ZYYE   SET    ZYYE.BFJZH=DZGX.bfjzh   FROM   DZGX     WHERE DZGX.JSZT=ZYYE.JSZT   AND   DZGX.KMDM=ZYYE.KMDM
UPDATE   ZYYE   SET    srye=drye from ZYYE     WHERE  ZYYE.kmdm='102103001' AND jszt='民族人民币'
UPDATE   JJYE   SET    srye=srye+109615.66+220208.87  from   JJYE        WHERE JJYE.kmdm='10210100101'  AND  JJYE.jszt='民族证券人民币'
UPDATE   JJYE   SET    srye=srye-5000000   from   JJYE        WHERE JJYE.kmdm='10210100101'  AND  JJYE.jszt='方正证券人民币'
CLOSE ALL 
SELECT  a.机构,a.备付金账户 ,A.余额 as 登记公司余额,c.srye  as 经纪法人系统余额,b.srye as 自营法人系统余额, (b.srye+c.srye) as 合计, A.余额-(b.srye+c.srye) as 差异 FROM   djgsbfj a  ,  ZYYE    b ,  JJYE     c    WHERE   a.备付金账户=b.bfjzh AND b.bfjzh=c.bfjzh AND c.bfjzh=a.备付金账户 INTO TABLE ZJDZ
CLOSE ALL 
USE ZJDZ
REPLACE 备付金账户 with ALLTRIM(备付金账户)
REPLACE  机构 with ALLTRIM(机构)
CLOSE ALL



SELECT * FROM zjdz   WHERE   机构 like '方正%' into cursor temp1
COPY TO d:\zjdz\方正备付金余额对账.xls   TYPE XL5
SELECT * FROM zjdz WHERE 机构 like '民族%'   into cursor temp2
COPY  TO  d:\zjdz\民族备付金余额对账.xls  TYPE  XL5
SELECT a.机构, '差异为' as z ,a.差异 ,'元。' AS C FROM zjdz a   into cursor temp3
COPY TO ZJDZ.txt DELIMITED WITH " " WITH CHAR BLANK
CLOSE ALL

QUIT
quit