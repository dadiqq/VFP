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

&&ȥ���ַ����ֶ�ǰ��ո�
CLOSE ALL
USE djgsbfj
REPLACE �������˻� with ALLTRIM(�������˻�)
REPLACE  ���� with ALLTRIM(����)
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
UPDATE   ZYYE   SET    srye=drye from ZYYE     WHERE  ZYYE.kmdm='102103001' AND jszt='���������'
UPDATE   JJYE   SET    srye=srye+109615.66+220208.87  from   JJYE        WHERE JJYE.kmdm='10210100101'  AND  JJYE.jszt='����֤ȯ�����'
UPDATE   JJYE   SET    srye=srye-5000000   from   JJYE        WHERE JJYE.kmdm='10210100101'  AND  JJYE.jszt='����֤ȯ�����'
CLOSE ALL 
SELECT  a.����,a.�������˻� ,A.��� as �Ǽǹ�˾���,c.srye  as ���ͷ���ϵͳ���,b.srye as ��Ӫ����ϵͳ���, (b.srye+c.srye) as �ϼ�, A.���-(b.srye+c.srye) as ���� FROM   djgsbfj a  ,  ZYYE    b ,  JJYE     c    WHERE   a.�������˻�=b.bfjzh AND b.bfjzh=c.bfjzh AND c.bfjzh=a.�������˻� INTO TABLE ZJDZ
CLOSE ALL 
USE ZJDZ
REPLACE �������˻� with ALLTRIM(�������˻�)
REPLACE  ���� with ALLTRIM(����)
CLOSE ALL



SELECT * FROM zjdz   WHERE   ���� like '����%' into cursor temp1
COPY TO d:\zjdz\����������������.xls   TYPE XL5
SELECT * FROM zjdz WHERE ���� like '����%'   into cursor temp2
COPY  TO  d:\zjdz\���屸����������.xls  TYPE  XL5
SELECT a.����, '����Ϊ' as z ,a.���� ,'Ԫ��' AS C FROM zjdz a   into cursor temp3
COPY TO ZJDZ.txt DELIMITED WITH " " WITH CHAR BLANK
CLOSE ALL

QUIT
quit