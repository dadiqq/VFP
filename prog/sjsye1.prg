&&----------------------------------------------------------------------------
&&����һ�����ɵǼǹ�˾������������
&&���� limq
&&----------------------------------------------------------------------------
DELETE FILE  djgsbfj1.txt
DELETE FILE ���������1.xls
DELETE FILE ZJYEDZ.DBF
DELETE FILE djgsbfj1.dbf
DELETE FILE  *.BAK
&&----------------------------------------------------------------------------
&&�ϲ�Ϊһ���ļ�
&&�����ϲ�����ZJYEDZ���ʽ������ˣ�
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
&&�ʽ���������������JSZT(��������) BFJMC(����������)
&&
USE ZJYEDZ
ALTER TABLE ZJYEDZ ADD JSZT  C(4)
ALTER TABLE ZJYEDZ ADD BFJMC C(20)
CLOSE ALL 
&&----------------------------------------------------------------------------
&&�ʽ��������ļ����������뱸�������Ƹ��£�������ǰ׼��ZJYEDZGX�õĶ��չ�ϵ����
&&----------------------------------------------------------------------------
USE ZJYEDZ 
REPLACE zjzh with ALLTRIM(zjzh)
UPDATE ZJYEDZ SET ZJYEDZ.JSZT=ZJYEDZGX.JSZT  FROM ZJYEDZGX WHERE ZJYEDZGX.ZJZH=ZJYEDZ.ZJZH
UPDATE ZJYEDZ SET ZJYEDZ.BFJMC=ZJYEDZGX.BFJMC  FROM ZJYEDZGX WHERE ZJYEDZGX.ZJZH=ZJYEDZ.ZJZH
CLOSE ALL
&&----------------------------------------------------------------------------
&&��ʽ�������
&&----------------------------------------------------------------------------
SELECT jszt,bfjmc,zjzh,zjye,rq  FROM ZJYEDZ WHERE BFJMC LIKE '%��Ӫ������%'  ORDER BY jszt into cursor temp1
COPY TO djgsbfj1.dbf
SELECT jszt as ����,bfjmc as ����,zjzh as �˻�,zjye as ��� ,rq as ����  FROM ZJYEDZ WHERE BFJMC LIKE '%��Ӫ������%'  ORDER BY jszt into cursor temp2
COPY TO ���������1.xls TYPE XL5
SELECT jszt,bfjmc,'����� ',zjye,' Ԫ��' FROM ZJYEDZ WHERE BFJMC LIKE '%��Ӫ������%' ORDER BY jszt into cursor temp3
COPY TO djgsbfj1.txt DELIMITED WITH " " WITH CHAR BLANK
CLOSE ALL

&&----------------------------------------------------------------------------
&&�˳�
&&----------------------------------------------------------------------------
DELETE FILE  *.BAK
QUIT
QUIT 

&&round(val(thisform.combel1.value),3)
&&SELECT ("20"+SUBSTR(dtoc(yejzrq),1,2)+SUBSTR(dtoc(yejzrq),4,2)+SUBSTR(dtoc(yejzrq),7,2)) FROM bjsye_fz
&&SELECT ("20"+SUBSTR(dtoc(yejzrq),1,2)+SUBSTR(dtoc(yejzrq),4,2)+SUBSTR(dtoc(yejzrq),7,2)) FROM bjsye_fz