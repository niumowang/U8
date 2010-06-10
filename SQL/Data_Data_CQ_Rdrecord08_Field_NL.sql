
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMP WHERE TaskType = '0' AND cfrombillcardnum='' AND ctobillcardnum='0301' )  
BEGIN
 insert into MES_CQ_FIELDCMP (TaskType, ccode,cfrombillcardnum,cname,ctobillcardnum,id,iprintcount,vt_id ) values 
  ('0','0000000004','','MES����������ⵥ','0301','1000000004',null,'17')
END

GO
 
-- MES����������ⵥ
-- DELETE FROM MES_CQ_FIXVALUE WHERE DID IN (SELECT AUTOID FROM  MES_CQ_FIELDCMPS  WHERE TaskType = '0' AND id='1000000004')
-- DELETE FROM MES_CQ_FIELDCMPS  WHERE TaskType = '0' AND id='1000000004'
-- ��ͷ
IF (1=1)  
BEGIN
	
	
	IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000004' AND cardsection = 'T' AND fieldname='dDate') 
	BEGIN
	insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	('0','1','�������','T','0000000004',null,null,0,'��ͷ|�������,T|dDate','dDate',null,'1000000004',1,1)
	END
	IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000004' AND cardsection = 'T' AND fieldname='dnmaketime') 
	BEGIN
	insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	('0','1','�Ƶ�ʱ��','T','0000000004',null,null,0,'��ͷ|�Ƶ�ʱ��,T|dnmaketime','dnmaketime',null,'1000000004',1,1)
	END 
	
 
	IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000004' AND cardsection = 'T' AND fieldname='cWhCode') 
	BEGIN
	insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	('0','1','�ֿ����','T','0000000004',null,null,0,'��ͷ|�ֿ����,T|MES_cWhCode','cWhCode',null,'1000000004',1,1)
	END

	IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000004' AND cardsection = 'T' AND fieldname='cDepCode') 
	BEGIN
	insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	('0','1','���ű���','T','0000000004',null,null,0,'��ͷ|���ű���,T|MES_cDepCode','cDepCode',null,'1000000004',1,1)
	END
	 
	IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000004' AND cardsection = 'T' AND fieldname='cVouchType') 
	BEGIN
	insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	('0','1','��������','T','0000000004',null,null,1,'08','cVouchType',null,'1000000004',1,1)
	END
	
	IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000004' AND cardsection = 'T' AND fieldname='cSource') 
	BEGIN
	insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	('0','1','������Դ','T','0000000004',null,null,1,'���','cSource',null,'1000000004',1,1)
	END	
	IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000004' AND cardsection = 'T' AND fieldname='cBusType') 
	BEGIN
	insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	('0','1','ҵ������','T','0000000004',null,null,1,'�������','cBusType',null,'1000000004',1,1)
	END
	IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000004' AND cardsection = 'T' AND fieldname='cCode') 
	BEGIN
	insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	('0','1','��ⵥ��','T','0000000004',null,null,0,'��ͷ|��ⵥ��,T|cCode','cCode',null,'1000000004',1,1)
	END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000004' AND cardsection = 'T' AND fieldname='cVenCode') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','������λ����','T','0000000004',null,null,0,'��ͷ|������λ����,T|MES_cVenCode','cVenCode',null,'1000000004',1,1)
	--END 
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000004' AND cardsection = 'T' AND fieldname='cPersonCode') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','ҵ��Ա����','T','0000000004',null,null,0,'��ͷ|ҵ��Ա����,T|MES_cPersonCode','cPersonCode',null,'1000000004',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000004' AND cardsection = 'T' AND fieldname='iTaxRate') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','˰��','T','0000000004',null,null,0,'��ͷ|˰��,T|iTaxRate','iTaxRate',null,'1000000004',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000004' AND cardsection = 'T' AND fieldname='iExchRate') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','����','T','0000000004',null,null,1,'1','iExchRate',null,'1000000004',1,1)
	--END  
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000004' AND cardsection = 'T' AND fieldname='iFlowId') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','����ģʽID','T','0000000004',null,null,1,NULL,'iFlowId',null,'1000000004',1,1)
	--END
	--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000004' AND cardsection = 'T' AND fieldname='cExch_Name') 
	--BEGIN
	--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	--('0','1','����','T','0000000004',null,null,1,'�����','cExch_Name',null,'1000000004',1,1)
	--END 
 
END
GO
 
-- ����
IF (1=1)   
BEGIN  
	   
	IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000004' AND cardsection = 'B' AND fieldname='cInvCode') 
	BEGIN
	insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	('0','1','�������','B','0000000004',null,null,0,'����|�������,B|mes_cInvCode','cInvCode',null,'1000000004',1,1)
	END
	IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000004' AND cardsection = 'B' AND fieldname='iQuantity') 
	BEGIN
	insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	('0','1','����','B','0000000004',null,null,0,'����|����,B|mes_iquantity','iQuantity',null,'1000000004',1,1)
	END
	IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000004' AND cardsection = 'B' AND fieldname='editprop') 
	BEGIN
	insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	('0','1','������ʶ','B','0000000004',null,null,0,'����|������ʶ,B|editprop','editprop',null,'1000000004',1,1)
	END
	IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000004' AND cardsection = 'B' AND fieldname='cMassUnit') 
	BEGIN
	insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	('0','1','�����ڵ�λ','B','0000000004',null,null,1,'0','cMassUnit',null,'1000000004',1,1)
	END
	IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000004' AND cardsection = 'B' AND fieldname='cvmivencode') 
	BEGIN
	insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	('0','1','�����̱���','B','0000000004',null,null,0,'����|�����̱���,B|mes_cvencode','cvmivencode',null,'1000000004',1,1)
	END 
	IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000004' AND cardsection = 'B' AND fieldname='iExpiratDateCalcu') 
	BEGIN
	insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	('0','1','��Ч�����㷽ʽ','B','0000000004',null,null,1,0,'iExpiratDateCalcu',null,'1000000004',1,1)
	END
	IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000004' AND cardsection = 'B' AND fieldname='dExpirationdate') 
	BEGIN
	insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	('0','1','��Ч�ڼ�����','B','0000000004',null,null,1,null,'dExpirationdate',null,'1000000004',1,1)
	END 
 
END

GO
 
    