
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMP WHERE TaskType = '0' AND cfrombillcardnum='' AND ctobillcardnum='0304' )  
BEGIN
 insert into MES_CQ_FIELDCMP (TaskType, ccode,cfrombillcardnum,cname,ctobillcardnum,id,iprintcount,vt_id ) values 
  ('0','0000000007','','MES���ɵ�����','0304','1000000007',null,'17')
END

GO
 
-- MES����������ⵥ
-- DELETE FROM MES_CQ_FIXVALUE WHERE DID IN (SELECT AUTOID FROM  MES_CQ_FIELDCMPS  WHERE TaskType = '0' AND id='1000000007')
-- DELETE FROM MES_CQ_FIELDCMPS  WHERE TaskType = '0' AND id='1000000007'
-- ��ͷ
IF (1=1)  
BEGIN
 
	IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='cTVCode') 
	BEGIN
	insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	('0','1','���ݺ�','T','0000000007',null,null,0,'��ͷ|���ݺ�,T|MES_cTVCode','cTVCode',null,'1000000007',1,1)
	END 
	IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='cMaker') 
	BEGIN
	insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	('0','1','�Ƶ���','T','0000000007',null,null,0,'��ͷ|�Ƶ���,T|cMaker','cMaker',null,'1000000007',1,1)
	END

	IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='dTVDate') 
	BEGIN
	insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	('0','1','����','T','0000000007',null,null,0,'��ͷ|����,T|dTVDate','dTVDate',null,'1000000007',1,1)
	END
	IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='cOWhCode') 
	BEGIN
	insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	('0','1','ת���ֿ����','T','0000000007',null,null,0,'��ͷ|ת���ֿ����,T|mes_cOWhCode','cOWhCode',null,'1000000007',1,1)
	END
	IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='cIWhCode') 
	BEGIN
	insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	('0','1','ת��ֿ����','T','0000000007',null,null,0,'��ͷ|ת��ֿ����,T|mes_cIWhCode','cIWhCode',null,'1000000007',1,1)
	END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='cODepCode') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','ת�����ű���','T','0000000007',null,null,0,'��ͷ|ת�����ű���,T|cODepCode','cODepCode',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='cIDepCode') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','ת�벿�ű���','T','0000000007',null,null,0,'��ͷ|ת�벿�ű���,T|cIDepCode','cIDepCode',null,'1000000007',1,1)
	--END

	IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='cIRdCode') 
	BEGIN
	insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	('0','1','���������','T','0000000007',null,null,0,'��ͷ|���������,T|mes_cIRdCode','cIRdCode',null,'1000000007',1,1)
	END
	IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='cORdCode') 
	BEGIN
	insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	('0','1','����������','T','0000000007',null,null,0,'��ͷ|����������,T|mes_cORdCode','cORdCode',null,'1000000007',1,1)
	END
	IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='cTVMemo') 
	BEGIN
	insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	('0','1','��ע','T','0000000007',null,null,0,'��ͷ|��ע,T|mes_cTVMemo','cTVMemo',null,'1000000007',1,1)
	END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='cDefine1') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','��ͷ�Զ�����1','T','0000000007',null,null,0,'��ͷ|��ͷ�Զ�����1,T|cDefine1','cDefine1',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='cDefine2') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','��ͷ�Զ�����2','T','0000000007',null,null,0,'��ͷ|��ͷ�Զ�����2,T|cDefine2','cDefine2',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='cDefine3') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','��ͷ�Զ�����3','T','0000000007',null,null,0,'��ͷ|��ͷ�Զ�����3,T|cDefine3','cDefine3',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='cDefine4') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','��ͷ�Զ�����4','T','0000000007',null,null,0,'��ͷ|��ͷ�Զ�����4,T|cDefine4','cDefine4',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='cDefine5') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','��ͷ�Զ�����5','T','0000000007',null,null,0,'��ͷ|��ͷ�Զ�����5,T|cDefine5','cDefine5',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='cDefine6') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','��ͷ�Զ�����6','T','0000000007',null,null,0,'��ͷ|��ͷ�Զ�����6,T|cDefine6','cDefine6',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='cDefine7') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','��ͷ�Զ�����7','T','0000000007',null,null,0,'��ͷ|��ͷ�Զ�����7,T|cDefine7','cDefine7',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='cDefine8') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','��ͷ�Զ�����8','T','0000000007',null,null,0,'��ͷ|��ͷ�Զ�����8,T|cDefine8','cDefine8',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='cDefine9') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','��ͷ�Զ�����9','T','0000000007',null,null,0,'��ͷ|��ͷ�Զ�����9,T|cDefine9','cDefine9',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='cDefine10') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','��ͷ�Զ�����10','T','0000000007',null,null,0,'��ͷ|��ͷ�Զ�����10,T|cDefine10','cDefine10',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='cDefine11') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','��ͷ�Զ�����11','T','0000000007',null,null,0,'��ͷ|��ͷ�Զ�����11,T|cDefine11','cDefine11',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='cDefine12') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','��ͷ�Զ�����12','T','0000000007',null,null,0,'��ͷ|��ͷ�Զ�����12,T|cDefine12','cDefine12',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='cDefine13') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','��ͷ�Զ�����13','T','0000000007',null,null,0,'��ͷ|��ͷ�Զ�����13,T|cDefine13','cDefine13',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='cDefine14') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','��ͷ�Զ�����14','T','0000000007',null,null,0,'��ͷ|��ͷ�Զ�����14,T|cDefine14','cDefine14',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='cDefine15') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','��ͷ�Զ�����15','T','0000000007',null,null,0,'��ͷ|��ͷ�Զ�����15,T|cDefine15','cDefine15',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='cDefine16') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','��ͷ�Զ�����16','T','0000000007',null,null,0,'��ͷ|��ͷ�Զ�����16,T|cDefine16','cDefine16',null,'1000000007',1,1)
	--END
	
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='cPersonCode') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','�����˱���','T','0000000007',null,null,0,'��ͷ|�����˱���,T|cPersonCode','cPersonCode',null,'1000000007',1,1)
	--END
	
	
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='cAccounter') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','������','T','0000000007',null,null,0,'��ͷ|������,T|cAccounter','cAccounter',null,'1000000007',1,1)
	--END
	
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='ID') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','Զ�̱��','T','0000000007',null,null,0,'��ͷ|Զ�̱��,T|ID','ID',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='VT_ID') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','ģ���','T','0000000007',null,null,0,'��ͷ|ģ���,T|VT_ID','VT_ID',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='cVerifyPerson') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','�����','T','0000000007',null,null,0,'��ͷ|�����,T|cVerifyPerson','cVerifyPerson',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='dVerifyDate') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','�������','T','0000000007',null,null,0,'��ͷ|�������,T|dVerifyDate','dVerifyDate',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='cPSPCode') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','��Ʒ�ṹ','T','0000000007',null,null,0,'��ͷ|��Ʒ�ṹ,T|cPSPCode','cPSPCode',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='cMPoCode') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','������','T','0000000007',null,null,0,'��ͷ|������,T|cMPoCode','cMPoCode',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='iQuantity') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','����','T','0000000007',null,null,0,'��ͷ|����,T|iQuantity','iQuantity',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='bTransFlag') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','�Ƿ񴫵�','T','0000000007',null,null,0,'��ͷ|�Ƿ񴫵�,T|bTransFlag','bTransFlag',null,'1000000007',1,1)
	--END
	
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='ufts') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','ʱ���','T','0000000007',null,null,0,'��ͷ|ʱ���,T|ufts','ufts',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='iproorderid') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','��������ID','T','0000000007',null,null,0,'��ͷ|��������ID,T|iproorderid','iproorderid',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='cOrderType') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','��������','T','0000000007',null,null,0,'��ͷ|��������,T|cOrderType','cOrderType',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='cTranRequestCode') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','�������뵥��','T','0000000007',null,null,0,'��ͷ|�������뵥��,T|cTranRequestCode','cTranRequestCode',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='cVersion') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','�汾��/�����ʶ','T','0000000007',null,null,0,'��ͷ|�汾��/�����ʶ,T|cVersion','cVersion',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='BomId') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','bomid','T','0000000007',null,null,0,'��ͷ|bomid,T|BomId','BomId',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='cFree1') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','������1','T','0000000007',null,null,0,'��ͷ|������1,T|cFree1','cFree1',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='cFree2') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','������2','T','0000000007',null,null,0,'��ͷ|������2,T|cFree2','cFree2',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='cFree3') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','������3','T','0000000007',null,null,0,'��ͷ|������3,T|cFree3','cFree3',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='cFree4') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','������4','T','0000000007',null,null,0,'��ͷ|������4,T|cFree4','cFree4',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='cFree5') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','������5','T','0000000007',null,null,0,'��ͷ|������5,T|cFree5','cFree5',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='cFree6') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','������6','T','0000000007',null,null,0,'��ͷ|������6,T|cFree6','cFree6',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='cFree7') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','������7','T','0000000007',null,null,0,'��ͷ|������7,T|cFree7','cFree7',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='cFree8') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','������8','T','0000000007',null,null,0,'��ͷ|������8,T|cFree8','cFree8',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='cFree9') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','������9','T','0000000007',null,null,0,'��ͷ|������9,T|cFree9','cFree9',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='cFree10') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','������10','T','0000000007',null,null,0,'��ͷ|������10,T|cFree10','cFree10',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='csource') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','������Դ','T','0000000007',null,null,0,'��ͷ|������Դ,T|csource','csource',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='itransflag') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','��������','T','0000000007',null,null,0,'��ͷ|��������,T|itransflag','itransflag',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='cModifyPerson') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','�޸���','T','0000000007',null,null,0,'��ͷ|�޸���,T|cModifyPerson','cModifyPerson',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='dModifyDate') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','�޸�����','T','0000000007',null,null,0,'��ͷ|�޸�����,T|dModifyDate','dModifyDate',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='dnmaketime') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','�Ƶ�ʱ��','T','0000000007',null,null,0,'��ͷ|�Ƶ�ʱ��,T|dnmaketime','dnmaketime',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='dnmodifytime') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','�޸�ʱ��','T','0000000007',null,null,0,'��ͷ|�޸�ʱ��,T|dnmodifytime','dnmodifytime',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='dnverifytime') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','���ʱ��','T','0000000007',null,null,0,'��ͷ|���ʱ��,T|dnverifytime','dnverifytime',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='ireturncount') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','ireturncount','T','0000000007',null,null,0,'��ͷ|ireturncount,T|ireturncount','ireturncount',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='iverifystate') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','iverifystate','T','0000000007',null,null,0,'��ͷ|iverifystate,T|iverifystate','iverifystate',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='iswfcontrolled') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','iswfcontrolled','T','0000000007',null,null,0,'��ͷ|iswfcontrolled,T|iswfcontrolled','iswfcontrolled',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='cbustype') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','ҵ������','T','0000000007',null,null,0,'��ͷ|ҵ������,T|cbustype','cbustype',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='cSourceCodeLs') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','������Դ����','T','0000000007',null,null,0,'��ͷ|������Դ����,T|cSourceCodeLs','cSourceCodeLs',null,'1000000007',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'T' AND fieldname='csysbarcode') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','��������','T','0000000007',null,null,0,'��ͷ|��������,T|csysbarcode','csysbarcode',null,'1000000007',1,1)
	--END
 
END
GO
 
-- ����
IF (1=1)   
BEGIN  

IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cInvCode') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�������','B','0000000007',null,null,0,'����|�������,B|mes_cInvCode','cInvCode',null,'1000000007',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='iTVQuantity') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','����','B','0000000007',null,null,0,'����|����,B|mes_iQuantity','iTVQuantity',null,'1000000007',1,1)
END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cTVCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���ݺ�','B','0000000007',null,null,0,'����|���ݺ�,B|cTVCode','cTVCode',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='RdsID') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ӧ��ⵥid','B','0000000007',null,null,0,'����|��Ӧ��ⵥid,B|RdsID','RdsID',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='iTVNum') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','����','B','0000000007',null,null,0,'����|����,B|iTVNum','iTVNum',null,'1000000007',1,1)
--END


--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='invcode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ʒ����','B','0000000007',null,null,0,'����|��Ʒ����,B|mes_cinvcode','invcode',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='iMassDate') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','������','B','0000000007',null,null,0,'����|������,B|iMassDate','iMassDate',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cBarCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','������','B','0000000007',null,null,0,'����|������,B|cBarCode','cBarCode',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cAssUnit') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��浥λ��','B','0000000007',null,null,0,'����|��浥λ��,B|cAssUnit','cAssUnit',null,'1000000007',1,1)
--END


--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='iTVACost') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','����','B','0000000007',null,null,0,'����|����,B|iTVACost','iTVACost',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='iTVAPrice') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���','B','0000000007',null,null,0,'����|���,B|iTVAPrice','iTVAPrice',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='iTVPCost') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�ƻ�����/�ۼ�','B','0000000007',null,null,0,'����|�ƻ�����/�ۼ�,B|iTVPCost','iTVPCost',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='iTVPPrice') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�ƻ����/�ۼ۽��','B','0000000007',null,null,0,'����|�ƻ����/�ۼ۽��,B|iTVPPrice','iTVPPrice',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cTVBatch') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','����','B','0000000007',null,null,0,'����|����,B|cTVBatch','cTVBatch',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='dDisDate') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','ʧЧ����','B','0000000007',null,null,0,'����|ʧЧ����,B|dDisDate','dDisDate',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cFree1') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���������1','B','0000000007',null,null,0,'����|���������1,B|cFree1','cFree1',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cFree2') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���������2','B','0000000007',null,null,0,'����|���������2,B|cFree2','cFree2',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cDefine22') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����1','B','0000000007',null,null,0,'����|�����Զ�����1,B|cDefine22','cDefine22',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cDefine23') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����2','B','0000000007',null,null,0,'����|�����Զ�����2,B|cDefine23','cDefine23',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cDefine24') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����3','B','0000000007',null,null,0,'����|�����Զ�����3,B|cDefine24','cDefine24',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cDefine25') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����4','B','0000000007',null,null,0,'����|�����Զ�����4,B|cDefine25','cDefine25',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cDefine26') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����5','B','0000000007',null,null,0,'����|�����Զ�����5,B|cDefine26','cDefine26',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cDefine27') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����6','B','0000000007',null,null,0,'����|�����Զ�����6,B|cDefine27','cDefine27',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cItemCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ŀ����','B','0000000007',null,null,0,'����|��Ŀ����,B|cItemCode','cItemCode',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cItem_class') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ŀ�������','B','0000000007',null,null,0,'����|��Ŀ�������,B|cItem_class','cItem_class',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='fSaleCost') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���۵���','B','0000000007',null,null,0,'����|���۵���,B|fSaleCost','fSaleCost',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='fSalePrice') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���۽��','B','0000000007',null,null,0,'����|���۽��,B|fSalePrice','fSalePrice',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cName') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ŀ','B','0000000007',null,null,0,'����|��Ŀ,B|cName','cName',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cItemCName') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ŀ��������','B','0000000007',null,null,0,'����|��Ŀ��������,B|cItemCName','cItemCName',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='autoID') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�Զ����','B','0000000007',null,null,0,'����|�Զ����,B|autoID','autoID',null,'1000000007',1,1)
--END

--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cFree3') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���������3','B','0000000007',null,null,0,'����|���������3,B|cFree3','cFree3',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cFree4') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���������4','B','0000000007',null,null,0,'����|���������4,B|cFree4','cFree4',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cFree5') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���������5','B','0000000007',null,null,0,'����|���������5,B|cFree5','cFree5',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cFree6') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���������6','B','0000000007',null,null,0,'����|���������6,B|cFree6','cFree6',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cFree7') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���������7','B','0000000007',null,null,0,'����|���������7,B|cFree7','cFree7',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cFree8') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���������8','B','0000000007',null,null,0,'����|���������8,B|cFree8','cFree8',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cFree9') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���������9','B','0000000007',null,null,0,'����|���������9,B|cFree9','cFree9',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cFree10') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���������10','B','0000000007',null,null,0,'����|���������10,B|cFree10','cFree10',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cDefine28') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����7','B','0000000007',null,null,0,'����|�����Զ�����7,B|cDefine28','cDefine28',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cDefine29') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����8','B','0000000007',null,null,0,'����|�����Զ�����8,B|cDefine29','cDefine29',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cDefine30') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����9','B','0000000007',null,null,0,'����|�����Զ�����9,B|cDefine30','cDefine30',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cDefine31') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����10','B','0000000007',null,null,0,'����|�����Զ�����10,B|cDefine31','cDefine31',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cDefine32') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����11','B','0000000007',null,null,0,'����|�����Զ�����11,B|cDefine32','cDefine32',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cDefine33') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����12','B','0000000007',null,null,0,'����|�����Զ�����12,B|cDefine33','cDefine33',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cDefine34') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����13','B','0000000007',null,null,0,'����|�����Զ�����13,B|cDefine34','cDefine34',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cDefine35') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����14','B','0000000007',null,null,0,'����|�����Զ�����14,B|cDefine35','cDefine35',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cDefine36') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����15','B','0000000007',null,null,0,'����|�����Զ�����15,B|cDefine36','cDefine36',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cDefine37') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����16','B','0000000007',null,null,0,'����|�����Զ�����16,B|cDefine37','cDefine37',null,'1000000007',1,1)
--END


--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='iMPoIds') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���������ӱ�Id','B','0000000007',null,null,0,'����|���������ӱ�Id,B|iMPoIds','iMPoIds',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cBVencode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ӧ�̱���','B','0000000007',null,null,0,'����|��Ӧ�̱���,B|cBVencode','cBVencode',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cInVouchCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ӧ��ⵥ��','B','0000000007',null,null,0,'����|��Ӧ��ⵥ��,B|cInVouchCode','cInVouchCode',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='dMadeDate') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������','B','0000000007',null,null,0,'����|��������,B|dMadeDate','dMadeDate',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cMassUnit') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����ڵ�λ','B','0000000007',null,null,0,'����|�����ڵ�λ,B|cMassUnit','cMassUnit',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='iTRIds') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�������뵥�ӱ�ID','B','0000000007',null,null,0,'����|�������뵥�ӱ�ID,B|iTRIds','iTRIds',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='iSSoType') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','������ٷ�ʽ','B','0000000007',null,null,0,'����|������ٷ�ʽ,B|iSSoType','iSSoType',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='iSSodid') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���۶����ӱ�ID','B','0000000007',null,null,0,'����|���۶����ӱ�ID,B|iSSodid','iSSodid',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='iDSoType') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','Ŀ��������ٷ�ʽ','B','0000000007',null,null,0,'����|Ŀ��������ٷ�ʽ,B|iDSoType','iDSoType',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='iDSodid') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','Ŀ�����۶����ӱ�ID','B','0000000007',null,null,0,'����|Ŀ�����۶����ӱ�ID,B|iDSodid','iDSodid',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='bCosting') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�Ƿ����','B','0000000007',null,null,0,'����|�Ƿ����,B|bCosting','bCosting',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cvmivencode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����̴���','B','0000000007',null,null,0,'����|�����̴���,B|cvmivencode','cvmivencode',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cinposcode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����λ����','B','0000000007',null,null,0,'����|�����λ����,B|cinposcode','cinposcode',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='coutposcode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','������λ����','B','0000000007',null,null,0,'����|������λ����,B|coutposcode','coutposcode',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='iinvsncount') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���кŸ���','B','0000000007',null,null,0,'����|���кŸ���,B|iinvsncount','iinvsncount',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='iinvexchrate') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','������','B','0000000007',null,null,0,'����|������,B|iinvexchrate','iinvexchrate',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='comcode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','ί�ⶩ����','B','0000000007',null,null,0,'����|ί�ⶩ����,B|comcode','comcode',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cmocode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','����������','B','0000000007',null,null,0,'����|����������,B|cmocode','cmocode',null,'1000000007',1,1)
--END

--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='imoseq') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���������к�','B','0000000007',null,null,0,'����|���������к�,B|imoseq','imoseq',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='iomids') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','iomids','B','0000000007',null,null,0,'����|iomids,B|iomids','iomids',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='imoids') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','imoids','B','0000000007',null,null,0,'����|imoids,B|imoids','imoids',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='corufts') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ӧ����ʱ���','B','0000000007',null,null,0,'����|��Ӧ����ʱ���,B|corufts','corufts',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='iExpiratDateCalcu') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ч�����㷽ʽ','B','0000000007',null,null,0,'����|��Ч�����㷽ʽ,B|iExpiratDateCalcu','iExpiratDateCalcu',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cExpirationdate') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ч����','B','0000000007',null,null,0,'����|��Ч����,B|cExpirationdate','cExpirationdate',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='dExpirationdate') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ч�ڼ�����','B','0000000007',null,null,0,'����|��Ч�ڼ�����,B|dExpirationdate','dExpirationdate',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cBatchProperty1') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������1','B','0000000007',null,null,0,'����|��������1,B|cBatchProperty1','cBatchProperty1',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cBatchProperty2') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������2','B','0000000007',null,null,0,'����|��������2,B|cBatchProperty2','cBatchProperty2',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cBatchProperty3') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������3','B','0000000007',null,null,0,'����|��������3,B|cBatchProperty3','cBatchProperty3',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cBatchProperty4') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������4','B','0000000007',null,null,0,'����|��������4,B|cBatchProperty4','cBatchProperty4',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cBatchProperty5') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������5','B','0000000007',null,null,0,'����|��������5,B|cBatchProperty5','cBatchProperty5',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cBatchProperty6') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������6','B','0000000007',null,null,0,'����|��������6,B|cBatchProperty6','cBatchProperty6',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cBatchProperty7') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������7','B','0000000007',null,null,0,'����|��������7,B|cBatchProperty7','cBatchProperty7',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cBatchProperty8') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������8','B','0000000007',null,null,0,'����|��������8,B|cBatchProperty8','cBatchProperty8',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cBatchProperty9') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������9','B','0000000007',null,null,0,'����|��������9,B|cBatchProperty9','cBatchProperty9',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cBatchProperty10') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������10','B','0000000007',null,null,0,'����|��������10,B|cBatchProperty10','cBatchProperty10',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cciqbookcode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�ֲ��','B','0000000007',null,null,0,'����|�ֲ��,B|cciqbookcode','cciqbookcode',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cbMemo') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��ע','B','0000000007',null,null,0,'����|��ע,B|cbMemo','cbMemo',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='irowno') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�к�','B','0000000007',null,null,0,'����|�к�,B|irowno','irowno',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='strowguid') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','rowguid','B','0000000007',null,null,0,'����|rowguid,B|strowguid','strowguid',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cinvouchtype') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ӧ��ⵥ����','B','0000000007',null,null,0,'����|��Ӧ��ⵥ����,B|cinvouchtype','cinvouchtype',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cbsourcecodels') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','������Դ����','B','0000000007',null,null,0,'����|������Դ����,B|cbsourcecodels','cbsourcecodels',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cMoLotCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������','B','0000000007',null,null,0,'����|��������,B|cMoLotCode','cMoLotCode',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cInVoucherLineID') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','Դ����ID','B','0000000007',null,null,0,'����|Դ����ID,B|cInVoucherLineID','cInVoucherLineID',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cInVoucherCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','Դ����','B','0000000007',null,null,0,'����|Դ����,B|cInVoucherCode','cInVoucherCode',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cInVoucherType') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','Դ������','B','0000000007',null,null,0,'����|Դ������,B|cInVoucherType','cInVoucherType',null,'1000000007',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000007' AND cardsection = 'B' AND fieldname='cbsysbarcode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','����������','B','0000000007',null,null,0,'����|����������,B|cbsysbarcode','cbsysbarcode',null,'1000000007',1,1)
--END
 
END

GO
 
    