
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMP WHERE TaskType = '0' AND cfrombillcardnum='17' AND ctobillcardnum='03' )  
BEGIN
 insert into MES_CQ_FIELDCMP (TaskType, ccode,cfrombillcardnum,cname,ctobillcardnum,id,iprintcount,vt_id ) values 
  ('0','0000000009','17','���۶������������˻���','03','1000000009',null,'17')
END

GO
 

-- ���۶����������۷�����
-- DELETE FROM MES_CQ_FIXVALUE WHERE DID IN (SELECT AUTOID FROM  MES_CQ_FIELDCMPS  WHERE TaskType = '0' AND id='1000000009')
-- DELETE FROM MES_CQ_FIELDCMPS  WHERE TaskType = '0' AND id='1000000009'   DELETE FROM MES_CQ_FIXVALUE
-- ��ͷ
IF (1=1)  
BEGIN

IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cDefine1') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','��ͷ�Զ�����1','T','0000000009',null,null,0,'��ͷ|��ͷ�Զ�����1,T|cDefine1','cDefine1',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cDefine2') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','��ͷ�Զ�����2','T','0000000009',null,null,0,'��ͷ|��ͷ�Զ�����2,T|cDefine2','cDefine2',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cDefine3') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','��ͷ�Զ�����3','T','0000000009',null,null,0,'��ͷ|��ͷ�Զ�����3,T|cDefine3','cDefine3',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cDefine4') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','��ͷ�Զ�����4','T','0000000009',null,null,0,'��ͷ|��ͷ�Զ�����4,T|cDefine4','cDefine4',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cDefine5') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','��ͷ�Զ�����5','T','0000000009',null,null,0,'��ͷ|��ͷ�Զ�����5,T|cDefine5','cDefine5',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cDefine6') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','��ͷ�Զ�����6','T','0000000009',null,null,0,'��ͷ|��ͷ�Զ�����6,T|cDefine6','cDefine6',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cDefine7') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','��ͷ�Զ�����7','T','0000000009',null,null,0,'��ͷ|��ͷ�Զ�����7,T|cDefine7','cDefine7',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cDefine8') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','��ͷ�Զ�����8','T','0000000009',null,null,0,'��ͷ|��ͷ�Զ�����8,T|cDefine8','cDefine8',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cDefine9') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','��ͷ�Զ�����9','T','0000000009',null,null,0,'��ͷ|��ͷ�Զ�����9,T|cDefine9','cDefine9',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cDefine10') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','��ͷ�Զ�����10','T','0000000009',null,null,0,'��ͷ|��ͷ�Զ�����10,T|cDefine10','cDefine10',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cDefine11') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','��ͷ�Զ�����11','T','0000000009',null,null,0,'��ͷ|��ͷ�Զ�����11,T|cDefine11','cDefine11',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cDefine12') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','��ͷ�Զ�����12','T','0000000009',null,null,0,'��ͷ|��ͷ�Զ�����12,T|cDefine12','cDefine12',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cDefine13') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','��ͷ�Զ�����13','T','0000000009',null,null,0,'��ͷ|��ͷ�Զ�����13,T|cDefine13','cDefine13',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cDefine14') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','��ͷ�Զ�����14','T','0000000009',null,null,0,'��ͷ|��ͷ�Զ�����14,T|cDefine14','cDefine14',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cDefine15') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','��ͷ�Զ�����15','T','0000000009',null,null,0,'��ͷ|��ͷ�Զ�����15,T|cDefine15','cDefine15',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cDefine16') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','��ͷ�Զ�����16','T','0000000009',null,null,0,'��ͷ|��ͷ�Զ�����16,T|cDefine16','cDefine16',null,'1000000009',1,1)
END

IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cMaker') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�Ƶ���','T','0000000009',null,null,0,'��ͷ|�Ƶ���,T|cMaker','cMaker',null,'1000000009',1,1)
END

IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='DLID') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','autoid','T','0000000009',null,null,1,'111','DLID',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cDLCode') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','��������','T','0000000009',null,null,1,'111','cDLCode',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cVouchType') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�������ͱ���','T','0000000009',null,null,1,'05','cVouchType',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='ccreditcuscode') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','���õ�λ����','T','0000000009',null,null,1,'NULL','ccreditcuscode',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cSTCode') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�������ͱ���','T','0000000009',null,null,0,'��ͷ|�������ͱ���,T|cSTCode','cSTCode',null,'1000000009',1,1)
END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='dDate') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������','T','0000000009',null,null,0,'��ͷ|��������,T|dDate','dDate',null,'1000000009',1,1)
--END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cDepCode') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','���ű���','T','0000000009',null,null,0,'��ͷ|���ű���,T|cDepCode','cDepCode',null,'1000000009',1,1)
END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cPersonCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','ҵ��Ա����','T','0000000009',null,null,0,'��ͷ|ҵ��Ա����,T|cPersonCode','cPersonCode',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='SBVID') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���۷�ƱID','T','0000000009',null,null,0,'��ͷ|���۷�ƱID,T|SBVID','SBVID',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cSBVCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ʊ��','T','0000000009',null,null,0,'��ͷ|��Ʊ��,T|cSBVCode','cSBVCode',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cSOCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','������','T','0000000009',null,null,0,'��ͷ|������,T|cSOCode','cSOCode',null,'1000000009',1,1)
--END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cCusCode') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�ͻ�����','T','0000000009',null,null,0,'��ͷ|�ͻ�����,T|cCusCode','cCusCode',null,'1000000009',1,1)
END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cPayCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','������������','T','0000000009',null,null,0,'��ͷ|������������,T|cPayCode','cPayCode',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cSCCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���˷�ʽ����','T','0000000009',null,null,0,'��ͷ|���˷�ʽ����,T|cSCCode','cSCCode',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cShipAddress') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','������ַ','T','0000000009',null,null,0,'��ͷ|������ַ,T|cShipAddress','cShipAddress',null,'1000000009',1,1)
--END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cexch_name') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','����','T','0000000009',null,null,0,'��ͷ|����,T|cexch_name','cexch_name',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='iExchRate') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','����','T','0000000009',null,null,0,'��ͷ|����,T|iExchRate','iExchRate',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='iTaxRate') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','˰��','T','0000000009',null,null,0,'��ͷ|˰��,T|iTaxRate','iTaxRate',null,'1000000009',1,1)
END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='bFirst') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�ڳ���־','T','0000000009',null,null,0,'��ͷ|�ڳ���־,T|bFirst','bFirst',null,'1000000009',1,1)
--END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='bReturnFlag') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�˻���ʶ','T','0000000009',null,null,1,'1','bReturnFlag',null,'1000000009',1,1)
END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cMemo') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��    ע','T','0000000009',null,null,0,'��ͷ|��    ע,T|cMemo','cMemo',null,'1000000009',1,1)
--END


--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cVerifier') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����','T','0000000009',null,null,0,'��ͷ|�����,T|cVerifier','cVerifier',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cMaker') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�Ƶ���','T','0000000009',null,null,0,'��ͷ|�Ƶ���,T|cMaker','cMaker',null,'1000000009',1,1)
--END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='iSale') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�Ƿ��ȷ���','T','0000000009',null,null,1,'0','iSale',null,'1000000009',1,1)
END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cCusName') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�ͻ�����','T','0000000009',null,null,0,'��ͷ|�ͻ�����,T|cCusName','cCusName',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='iVTid') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','����ģ���','T','0000000009',null,null,0,'��ͷ|����ģ���,T|iVTid','iVTid',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='ufts') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','ʱ���','T','0000000009',null,null,0,'��ͷ|ʱ���,T|ufts','ufts',null,'1000000009',1,1)
--END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cBusType') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','ҵ������','T','0000000009',null,null,0,'��ͷ|ҵ������,T|cBusType','cBusType',null,'1000000009',1,1)
END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cCloser') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�ر���','T','0000000009',null,null,0,'��ͷ|�ر���,T|cCloser','cCloser',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cCreChpName') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���������','T','0000000009',null,null,0,'��ͷ|���������,T|cCreChpName','cCreChpName',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cDefine11') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��ͷ�Զ�����11','T','0000000009',null,null,0,'��ͷ|��ͷ�Զ�����11,T|cDefine11','cDefine11',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cDefine12') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��ͷ�Զ�����12','T','0000000009',null,null,0,'��ͷ|��ͷ�Զ�����12,T|cDefine12','cDefine12',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cDefine13') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��ͷ�Զ�����13','T','0000000009',null,null,0,'��ͷ|��ͷ�Զ�����13,T|cDefine13','cDefine13',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cDefine14') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��ͷ�Զ�����14','T','0000000009',null,null,0,'��ͷ|��ͷ�Զ�����14,T|cDefine14','cDefine14',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cDefine15') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��ͷ�Զ�����15','T','0000000009',null,null,0,'��ͷ|��ͷ�Զ�����15,T|cDefine15','cDefine15',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cDefine16') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��ͷ�Զ�����16','T','0000000009',null,null,0,'��ͷ|��ͷ�Զ�����16,T|cDefine16','cDefine16',null,'1000000009',1,1)
--END


--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cgatheringplan') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�ո���Э�����','T','0000000009',null,null,0,'��ͷ|�ո���Э�����,T|cgatheringplan','cgatheringplan',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='dCreditStart') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','������','T','0000000009',null,null,0,'��ͷ|������,T|dCreditStart','dCreditStart',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='dGatheringDate') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','������','T','0000000009',null,null,0,'��ͷ|������,T|dGatheringDate','dGatheringDate',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='icreditdays') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','����','T','0000000009',null,null,0,'��ͷ|����,T|icreditdays','icreditdays',null,'1000000009',1,1)
--END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='bCredit') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�Ƿ�Ϊ���˵���','T','0000000009',null,null,1,'��','bCredit',null,'1000000009',1,1)
END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='caddcode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�ջ���ַ����','T','0000000009',null,null,0,'��ͷ|�ջ���ַ����,T|caddcode','caddcode',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='iverifystate') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','iverifystate','T','0000000009',null,null,0,'��ͷ|iverifystate,T|iverifystate','iverifystate',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='ireturncount') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','ireturncount','T','0000000009',null,null,0,'��ͷ|ireturncount,T|ireturncount','ireturncount',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='iswfcontrolled') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','iswfcontrolled','T','0000000009',null,null,0,'��ͷ|iswfcontrolled,T|iswfcontrolled','iswfcontrolled',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='icreditstate') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','icreditstate','T','0000000009',null,null,0,'��ͷ|icreditstate,T|icreditstate','icreditstate',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cmodifier') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�޸���','T','0000000009',null,null,0,'��ͷ|�޸���,T|cmodifier','cmodifier',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='dmoddate') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�޸�����','T','0000000009',null,null,0,'��ͷ|�޸�����,T|dmoddate','dmoddate',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='dverifydate') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�������','T','0000000009',null,null,0,'��ͷ|�������,T|dverifydate','dverifydate',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='ccusperson') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��ϵ��','T','0000000009',null,null,0,'��ͷ|��ϵ��,T|ccusperson','ccusperson',null,'1000000009',1,1)
--END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='dcreatesystime') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�Ƶ�ʱ��','T','0000000009',null,null,0,'��ͷ|�Ƶ�ʱ��,T|dcreatesystime','dcreatesystime',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='ddate') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�������','T','0000000009',null,null,0,'��ͷ|�������,T|ddate','ddate',null,'1000000009',1,1)
END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='dverifysystime') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���ʱ��','T','0000000009',null,null,0,'��ͷ|���ʱ��,T|dverifysystime','dverifysystime',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='dmodifysystime') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�޸�ʱ��','T','0000000009',null,null,0,'��ͷ|�޸�ʱ��,T|dmodifysystime','dmodifysystime',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='csvouchtype') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','csvouchtype','T','0000000009',null,null,0,'��ͷ|csvouchtype,T|csvouchtype','csvouchtype',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='iflowid') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','����id','T','0000000009',null,null,0,'��ͷ|����id,T|iflowid','iflowid',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='bsigncreate') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','ǩ����ʧ����','T','0000000009',null,null,0,'��ͷ|ǩ����ʧ����,T|bsigncreate','bsigncreate',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='bcashsale') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�ֿ����','T','0000000009',null,null,0,'��ͷ|�ֿ����,T|bcashsale','bcashsale',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cgathingcode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�տ��','T','0000000009',null,null,0,'��ͷ|�տ��,T|cgathingcode','cgathingcode',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cChanger') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����','T','0000000009',null,null,0,'��ͷ|�����,T|cChanger','cChanger',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cChangeMemo') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���ԭ��','T','0000000009',null,null,0,'��ͷ|���ԭ��,T|cChangeMemo','cChangeMemo',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='bmustbook') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���ж���','T','0000000009',null,null,0,'��ͷ|���ж���,T|bmustbook','bmustbook',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='baccswitchflag') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������л�ѡ��','T','0000000009',null,null,0,'��ͷ|��������л�ѡ��,T|baccswitchflag','baccswitchflag',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='ccuspersoncode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��ϵ�˱���','T','0000000009',null,null,0,'��ͷ|��ϵ�˱���,T|ccuspersoncode','ccuspersoncode',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cSourceCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Դ���ݺ�','T','0000000009',null,null,0,'��ͷ|��Դ���ݺ�,T|cSourceCode','cSourceCode',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='bsaleoutcreatebill') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���ⵥ����Ʊ','T','0000000009',null,null,0,'��ͷ|���ⵥ����Ʊ,T|bsaleoutcreatebill','bsaleoutcreatebill',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cSysBarCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������','T','0000000009',null,null,0,'��ͷ|��������,T|cSysBarCode','cSysBarCode',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='csscode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���㷽ʽ����','T','0000000009',null,null,0,'��ͷ|���㷽ʽ����,T|csscode','csscode',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cinvoicecompany') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ʊ��λ����','T','0000000009',null,null,0,'��ͷ|��Ʊ��λ����,T|cinvoicecompany','cinvoicecompany',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='fEBweight') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','����','T','0000000009',null,null,0,'��ͷ|����,T|fEBweight','fEBweight',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cEBweightUnit') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','������λ','T','0000000009',null,null,0,'��ͷ|������λ,T|cEBweightUnit','cEBweightUnit',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cEBExpressCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��ݵ���','T','0000000009',null,null,0,'��ͷ|��ݵ���,T|cEBExpressCode','cEBExpressCode',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='iEBExpressCoID') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','������˾ID','T','0000000009',null,null,0,'��ͷ|������˾ID,T|iEBExpressCoID','iEBExpressCoID',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='SeparateID') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�ּ��','T','0000000009',null,null,0,'��ͷ|�ּ��,T|SeparateID','SeparateID',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='bNotToGoldTax') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','bNotToGoldTax','T','0000000009',null,null,0,'��ͷ|bNotToGoldTax,T|bNotToGoldTax','bNotToGoldTax',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cEBTrnumber') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���ױ��','T','0000000009',null,null,0,'��ͷ|���ױ��,T|cEBTrnumber','cEBTrnumber',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cEBBuyer') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�������','T','0000000009',null,null,0,'��ͷ|�������,T|cEBBuyer','cEBBuyer',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cEBBuyerNote') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���ұ�ע','T','0000000009',null,null,0,'��ͷ|���ұ�ע,T|cEBBuyerNote','cEBBuyerNote',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='ccontactname') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�ջ���ϵ��','T','0000000009',null,null,0,'��ͷ|�ջ���ϵ��,T|ccontactname','ccontactname',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cEBprovince') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�ջ���ʡ','T','0000000009',null,null,0,'��ͷ|�ջ���ʡ,T|cEBprovince','cEBprovince',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cEBcity') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�ջ�����','T','0000000009',null,null,0,'��ͷ|�ջ�����,T|cEBcity','cEBcity',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cEBdistrict') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�ջ�����','T','0000000009',null,null,0,'��ͷ|�ջ�����,T|cEBdistrict','cEBdistrict',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cmobilephone') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�ջ���ϵ���ֻ�','T','0000000009',null,null,0,'��ͷ|�ջ���ϵ���ֻ�,T|cmobilephone','cmobilephone',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cInvoiceCusName') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ʊ̧ͷ','T','0000000009',null,null,0,'��ͷ|��Ʊ̧ͷ,T|cInvoiceCusName','cInvoiceCusName',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='cweighter') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','������','T','0000000009',null,null,0,'��ͷ|������,T|cweighter','cweighter',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'T' AND fieldname='dweighttime') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','����ʱ��','T','0000000009',null,null,0,'��ͷ|����ʱ��,T|dweighttime','dweighttime',null,'1000000009',1,1)
--END
END 

GO


-- ����
IF (1=1)   
BEGIN 


IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cDefine28') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�����Զ�����28','B','0000000009',null,null,0,'����|�����Զ�����28,B|cDefine28','cDefine28',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cDefine29') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�����Զ�����29','B','0000000009',null,null,0,'����|�����Զ�����29,B|cDefine29','cDefine29',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cDefine30') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�����Զ�����30','B','0000000009',null,null,0,'����|�����Զ�����30,B|cDefine30','cDefine30',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cDefine31') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�����Զ�����31','B','0000000009',null,null,0,'����|�����Զ�����31,B|cDefine31','cDefine31',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cDefine32') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�����Զ�����32','B','0000000009',null,null,0,'����|�����Զ�����32,B|cDefine32','cDefine32',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cDefine33') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�����Զ�����33','B','0000000009',null,null,0,'����|�����Զ�����33,B|cDefine33','cDefine33',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cDefine34') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�����Զ�����34','B','0000000009',null,null,0,'����|�����Զ�����34,B|cDefine34','cDefine34',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cDefine35') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�����Զ�����35','B','0000000009',null,null,0,'����|�����Զ�����35,B|cDefine35','cDefine35',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cDefine36') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�����Զ�����36','B','0000000009',null,null,0,'����|�����Զ�����36,B|cDefine36','cDefine36',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cFree1') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','������1','B','0000000009',null,null,0,'����|������1,B|cFree1','cFree1',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cFree2') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','������2','B','0000000009',null,null,0,'����|������2,B|cFree2','cFree2',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cFree1') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','������1','B','0000000009',null,null,0,'����|������1,B|cFree1','cFree1',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cFree2') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','������2','B','0000000009',null,null,0,'����|������2,B|cFree2','cFree2',null,'1000000009',1,1)
END

IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cFree3') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','������3','B','0000000009',null,null,0,'����|������3,B|cFree3','cFree3',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cFree4') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','������4','B','0000000009',null,null,0,'����|������4,B|cFree4','cFree4',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cFree5') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','������5','B','0000000009',null,null,0,'����|������5,B|cFree5','cFree5',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cFree6') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','������6','B','0000000009',null,null,0,'����|������6,B|cFree6','cFree6',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cFree7') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','������7','B','0000000009',null,null,0,'����|������7,B|cFree7','cFree7',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cFree8') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','������8','B','0000000009',null,null,0,'����|������8,B|cFree8','cFree8',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cFree9') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','������9','B','0000000009',null,null,0,'����|������9,B|cFree9','cFree9',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cFree10') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','������10','B','0000000009',null,null,0,'����|������10,B|cFree10','cFree10',null,'1000000009',1,1)
END

-- IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='AutoID') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�Զ����','B','0000000009',null,null,0,'����|�Զ����,B|AutoID','AutoID',null,'1000000009',1,1)
--END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='DLID') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','������ 38','B','0000000009',null,null,1,'','DLID',null,'1000000009',1,1)
END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='iCorID') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','ԭ������ID','B','0000000009',null,null,0,'����|ԭ������ID,B|iCorID','iCorID',null,'1000000009',1,1)
--END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cWhCode') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�ֿ����','B','0000000009',null,null,0,'����|�ֿ����,B|mes_cWhCode','cWhCode',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cInvCode') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�������','B','0000000009',null,null,0,'����|�������,B|cInvCode','cInvCode',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='iQuantity') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','����','B','0000000009',null,null,0,'����|����,B|mes_iquantity','iQuantity',null,'1000000009',1,1)
END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='iNum') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','����','B','0000000009',null,null,0,'����|����,B|iNum','iNum',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='iQuotedPrice') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','����','B','0000000009',null,null,0,'����|����,B|iQuotedPrice','iQuotedPrice',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='iUnitPrice') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��˰����','B','0000000009',null,null,0,'����|��˰����,B|iUnitPrice','iUnitPrice',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='iTaxUnitPrice') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��˰����','B','0000000009',null,null,0,'����|��˰����,B|iTaxUnitPrice','iTaxUnitPrice',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='iMoney') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��˰���','B','0000000009',null,null,0,'����|��˰���,B|iMoney','iMoney',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='iTax') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','˰��','B','0000000009',null,null,0,'����|˰��,B|iTax','iTax',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='iSum') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��˰�ϼ�','B','0000000009',null,null,0,'����|��˰�ϼ�,B|iSum','iSum',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='iDisCount') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�ۿ۶�','B','0000000009',null,null,0,'����|�ۿ۶�,B|iDisCount','iDisCount',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='iNatUnitPrice') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���ҵ���','B','0000000009',null,null,0,'����|���ҵ���,B|iNatUnitPrice','iNatUnitPrice',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='iNatMoney') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���ҽ��','B','0000000009',null,null,0,'����|���ҽ��,B|iNatMoney','iNatMoney',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='iNatTax') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','����˰��','B','0000000009',null,null,0,'����|����˰��,B|iNatTax','iNatTax',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='iNatSum') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���Ҽ�˰�ϼ�','B','0000000009',null,null,0,'����|���Ҽ�˰�ϼ�,B|iNatSum','iNatSum',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='iNatDisCount') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����ۿ۶�','B','0000000009',null,null,0,'����|�����ۿ۶�,B|iNatDisCount','iNatDisCount',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='iSettleNum') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ʊ���','B','0000000009',null,null,0,'����|��Ʊ���,B|iSettleNum','iSettleNum',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='iSettleQuantity') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ʊ����','B','0000000009',null,null,0,'����|��Ʊ����,B|iSettleQuantity','iSettleQuantity',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='iBatch') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','����','B','0000000009',null,null,0,'����|����,B|iBatch','iBatch',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cBatch') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','����','B','0000000009',null,null,0,'����|����,B|cBatch','cBatch',null,'1000000009',1,1)
--END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='bSettleAll') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�����־','B','0000000009',null,null,1,'False','bSettleAll',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cMemo') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','��ע','B','0000000009',null,null,0,'����|��ע,B|cMemo','cMemo',null,'1000000009',1,1)
END

IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='iTB') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�˲���־','B','0000000009',null,null,1,'����','iTB',null,'1000000009',1,1)
END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='dvDate') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','ʧЧ����','B','0000000009',null,null,0,'����|ʧЧ����,B|dvDate','dvDate',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='iSOsID') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ӧ�����ӱ�ID','B','0000000009',null,null,0,'����|��Ӧ�����ӱ�ID,B|iSOsID','iSOsID',null,'1000000009',1,1)
--END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='iDLsID') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�ӱ�id','B','0000000009',null,null,1,'','iDLsID',null,'1000000009',1,1)
END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='KL') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���ʣ�%��','B','0000000009',null,null,0,'����|���ʣ�%��,B|KL','KL',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='KL2') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','����2��%��','B','0000000009',null,null,0,'����|����2��%��,B|KL2','KL2',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cInvName') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�������','B','0000000009',null,null,0,'����|�������,B|cInvName','cInvName',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='iTaxRate') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','˰�ʣ�%��','B','0000000009',null,null,0,'����|˰�ʣ�%��,B|iTaxRate','iTaxRate',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cDefine22') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����1','B','0000000009',null,null,0,'����|�����Զ�����1,B|cDefine22','cDefine22',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cDefine23') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����2','B','0000000009',null,null,0,'����|�����Զ�����2,B|cDefine23','cDefine23',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cDefine24') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����3','B','0000000009',null,null,0,'����|�����Զ�����3,B|cDefine24','cDefine24',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cDefine25') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����4','B','0000000009',null,null,0,'����|�����Զ�����4,B|cDefine25','cDefine25',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cDefine26') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����5','B','0000000009',null,null,0,'����|�����Զ�����5,B|cDefine26','cDefine26',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cDefine27') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����6','B','0000000009',null,null,0,'����|�����Զ�����6,B|cDefine27','cDefine27',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cItemCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ŀ����','B','0000000009',null,null,0,'����|��Ŀ����,B|cItemCode','cItemCode',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cItem_class') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ŀ�������','B','0000000009',null,null,0,'����|��Ŀ�������,B|cItem_class','cItem_class',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='fSaleCost') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���۵���','B','0000000009',null,null,0,'����|���۵���,B|fSaleCost','fSaleCost',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='fSalePrice') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���۽��','B','0000000009',null,null,0,'����|���۽��,B|fSalePrice','fSalePrice',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cVenAbbName') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','����','B','0000000009',null,null,0,'����|����,B|cVenAbbName','cVenAbbName',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cItemName') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ŀ����','B','0000000009',null,null,0,'����|��Ŀ����,B|cItemName','cItemName',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cItem_CName') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ŀ��������','B','0000000009',null,null,0,'����|��Ŀ��������,B|cItem_CName','cItem_CName',null,'1000000009',1,1)
--END

IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='bIsSTQc') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','����ڳ�','B','0000000009',null,null,1,'False','bIsSTQc',null,'1000000009',1,1)
END

--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��ⵥ��','B','0000000009',null,null,0,'����|��ⵥ��,B|cCode','cCode',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cDefine28') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����7','B','0000000009',null,null,0,'����|�����Զ�����7,B|cDefine28','cDefine28',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cDefine29') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����8','B','0000000009',null,null,0,'����|�����Զ�����8,B|cDefine29','cDefine29',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cDefine30') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����9','B','0000000009',null,null,0,'����|�����Զ�����9,B|cDefine30','cDefine30',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cDefine31') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����10','B','0000000009',null,null,0,'����|�����Զ�����10,B|cDefine31','cDefine31',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cDefine32') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����11','B','0000000009',null,null,0,'����|�����Զ�����11,B|cDefine32','cDefine32',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cDefine33') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����12','B','0000000009',null,null,0,'����|�����Զ�����12,B|cDefine33','cDefine33',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cDefine34') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����13','B','0000000009',null,null,0,'����|�����Զ�����13,B|cDefine34','cDefine34',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cDefine35') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����14','B','0000000009',null,null,0,'����|�����Զ�����14,B|cDefine35','cDefine35',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cDefine36') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����15','B','0000000009',null,null,0,'����|�����Զ�����15,B|cDefine36','cDefine36',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cDefine37') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����16','B','0000000009',null,null,0,'����|�����Զ�����16,B|cDefine37','cDefine37',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='dMDate') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������','B','0000000009',null,null,0,'����|��������,B|dMDate','dMDate',null,'1000000009',1,1)
--END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='bGsp') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�Ƿ�gsp����','B','0000000009',null,null,1,'��','bGsp',null,'1000000009',1,1)
END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cSoCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','������','B','0000000009',null,null,0,'����|������,B|cSoCode','cSoCode',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='iPPartSeqID') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','ѡ�����','B','0000000009',null,null,0,'����|ѡ�����,B|iPPartSeqID','iPPartSeqID',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='iPPartID') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','ĸ������ID','B','0000000009',null,null,0,'����|ĸ������ID,B|iPPartID','iPPartID',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cContractID') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��ͬ����','B','0000000009',null,null,0,'����|��ͬ����,B|cContractID','cContractID',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cContractTagCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��ͬ��ı���','B','0000000009',null,null,0,'����|��ͬ��ı���,B|cContractTagCode','cContractTagCode',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cContractRowGuid') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��ͬ���RowGuid','B','0000000009',null,null,0,'����|��ͬ���RowGuid,B|cContractRowGuid','cContractRowGuid',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='iMassDate') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','������','B','0000000009',null,null,0,'����|������,B|iMassDate','iMassDate',null,'1000000009',1,1)
--END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cMassUnit') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�����ڵ�λ','B','0000000009',null,null,1,'0','cMassUnit',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='bQANeedCheck') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�Ƿ���������','B','0000000009',null,null,1,'��','bQANeedCheck',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='bQAUrgency') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�Ƿ���','B','0000000009',null,null,1,'��','bQAUrgency',null,'1000000009',1,1)
END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='bQAChecking') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�Ƿ��ڼ�','B','0000000009',null,null,1,'��','bQAChecking',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='bQAChecked') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�Ƿ񱨼�','B','0000000009',null,null,1,'��','bQAChecked',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='iQAQuantity') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','����ϸ�����','B','0000000009',null,null,1,'0.0','iQAQuantity',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='iQANum') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','����ϸ����','B','0000000009',null,null,1,'0.0','iQANum',null,'1000000009',1,1)
--END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='editprop') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','������ʶ','B','0000000009',null,null,0,'����|������ʶ,B|editprop','editprop',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='csettleall') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�رձ�ʶ','B','0000000009',null,null,1,'δ�ر�','csettleall',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='batomodel') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�Ƿ�ATO��','B','0000000009',null,null,1,'��','batomodel',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='csrpolicy') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','��������','B','0000000009',null,null,1,'PE','csrpolicy',null,'1000000009',1,1)
END

--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cCusInvCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�ͻ��������','B','0000000009',null,null,0,'����|�ͻ��������,B|cCusInvCode','cCusInvCode',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cCusInvName') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�ͻ��������','B','0000000009',null,null,0,'����|�ͻ��������,B|cCusInvName','cCusInvName',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='fsumsignquantity') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�ۼ�ǩ������','B','0000000009',null,null,0,'����|�ۼ�ǩ������,B|fsumsignquantity','fsumsignquantity',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='fsumsignnum') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�ۼ�ǩ�ؼ���','B','0000000009',null,null,0,'����|�ۼ�ǩ�ؼ���,B|fsumsignnum','fsumsignnum',null,'1000000009',1,1)
--END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cbaccounter') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','������','B','0000000009',null,null,1,null,'cbaccounter',null,'1000000009',1,1)
END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cordercode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','������','B','0000000009',null,null,0,'����|������,B|cordercode','cordercode',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='iorderrowno') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����к�','B','0000000009',null,null,0,'����|�����к�,B|iorderrowno','iorderrowno',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='fcusminprice') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','����ۼ�','B','0000000009',null,null,0,'����|����ۼ�,B|fcusminprice','fcusminprice',null,'1000000009',1,1)
--END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cvmivencode') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�����̱���','B','0000000009',null,null,1,null,'cvmivencode',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='iexchsum') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�ۼ�ԭ���տ���','B','0000000009',null,null,1,null,'iexchsum',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='imoneysum') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�ۼƱ����տ���','B','0000000009',null,null,1,null,'imoneysum',null,'1000000009',1,1)
END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='irowno') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�к�','B','0000000009',null,null,0,'����|�к�,B|irowno','irowno',null,'1000000009',1,1)
--END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='iExpiratDateCalcu') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','��Ч�����㷽ʽ','B','0000000009',null,null,1,0,'iExpiratDateCalcu',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='dExpirationdate') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','��Ч�ڼ�����','B','0000000009',null,null,1,null,'dExpirationdate',null,'1000000009',1,1)
END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cExpirationdate') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ч����','B','0000000009',null,null,0,'����|��Ч����,B|cExpirationdate','cExpirationdate',null,'1000000009',1,1)
--END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cbatchproperty1') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','��������1','B','0000000009',null,null,1,null,'cbatchproperty1',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cbatchproperty2') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','��������2','B','0000000009',null,null,1,null,'cbatchproperty2',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cbatchproperty3') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','��������3','B','0000000009',null,null,1,null,'cbatchproperty3',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cbatchproperty4') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','��������4','B','0000000009',null,null,1,null,'cbatchproperty4',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cbatchproperty5') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','��������5','B','0000000009',null,null,1,null,'cbatchproperty5',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cbatchproperty6') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','��������6','B','0000000009',null,null,1,null,'cbatchproperty6',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cbatchproperty7') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','��������7','B','0000000009',null,null,1,null,'cbatchproperty7',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cbatchproperty8') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','��������8','B','0000000009',null,null,1,null,'cbatchproperty8',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cbatchproperty9') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','��������9','B','0000000009',null,null,1,null,'cbatchproperty9',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cbatchproperty10') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','��������10','B','0000000009',null,null,1,null,'cbatchproperty10',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='idemandtype') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','������ٷ�ʽ','B','0000000009',null,null,1,null,'idemandtype',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cdemandcode') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','������ٺ�','B','0000000009',null,null,1,null,'cdemandcode',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cdemandmemo') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�������˵��','B','0000000009',null,null,1,null,'cdemandmemo',null,'1000000009',1,1)
END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cdemandid') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�������id','B','0000000009',null,null,0,'����|�������id,B|cdemandid','cdemandid',null,'1000000009',1,1)
--END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='idemandseq') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','��������к�','B','0000000009',null,null,1,null,'idemandseq',null,'1000000009',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cvencode') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','��ⵥ��Ӧ�̱���','B','0000000009',null,null,0,'����|��ⵥ��Ӧ�̱���,B|mes_cvencode','cvencode',null,'1000000009',1,1)
END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cReasonCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�˻�ԭ�����','B','0000000009',null,null,0,'����|�˻�ԭ�����,B|cReasonCode','cReasonCode',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='iInvSNCount') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���кŸ���','B','0000000009',null,null,0,'����|���кŸ���,B|iInvSNCount','iInvSNCount',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='bneedsign') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ҫǩ��','B','0000000009',null,null,0,'����|��Ҫǩ��,B|bneedsign','bneedsign',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='bsignover') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','����ǩ�����','B','0000000009',null,null,0,'����|����ǩ�����,B|bsignover','bsignover',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='bneedloss') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ҫ��ʧ����','B','0000000009',null,null,0,'����|��Ҫ��ʧ����,B|bneedloss','bneedloss',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='flossrate') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','������������ʣ�%��','B','0000000009',null,null,0,'����|������������ʣ�%��,B|flossrate','flossrate',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='frlossqty') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����������','B','0000000009',null,null,0,'����|�����������,B|frlossqty','frlossqty',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='fulossqty') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�Ǻ����������','B','0000000009',null,null,0,'����|�Ǻ����������,B|fulossqty','fulossqty',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='isettletype') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���γе�����','B','0000000009',null,null,0,'����|���γе�����,B|isettletype','isettletype',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='crelacuscode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���οͻ�����','B','0000000009',null,null,0,'����|���οͻ�����,B|crelacuscode','crelacuscode',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cInVouchType') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','cInVouchType','B','0000000009',null,null,0,'����|cInVouchType,B|cInVouchType','cInVouchType',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='dkeepdate') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������','B','0000000009',null,null,0,'����|��������,B|dkeepdate','dkeepdate',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cSCloser') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�йر���','B','0000000009',null,null,0,'����|�йر���,B|cSCloser','cSCloser',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='bsaleprice') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���ۺ�˰','B','0000000009',null,null,0,'����|���ۺ�˰,B|bsaleprice','bsaleprice',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='bgift') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ʒ','B','0000000009',null,null,0,'����|��Ʒ,B|bgift','bgift',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='bmpforderclosed') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�Ƿ񶩵��ر�','B','0000000009',null,null,0,'����|�Ƿ񶩵��ر�,B|bmpforderclosed','bmpforderclosed',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cbSysBarCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','����������','B','0000000009',null,null,0,'����|����������,B|cbSysBarCode','cbSysBarCode',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='fxjquantity') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�Ѽ����','B','0000000009',null,null,0,'����|�Ѽ����,B|fxjquantity','fxjquantity',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='fxjnum') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�Ѽ������','B','0000000009',null,null,0,'����|�Ѽ������,B|fxjnum','fxjnum',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cParentCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���ڵ����','B','0000000009',null,null,0,'����|���ڵ����,B|cParentCode','cParentCode',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='cChildCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�ӽڵ����','B','0000000009',null,null,0,'����|�ӽڵ����,B|cChildCode','cChildCode',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='fchildqty') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','ʹ������','B','0000000009',null,null,0,'����|ʹ������,B|fchildqty','fchildqty',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='fchildrate') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','Ȩ�ر���','B','0000000009',null,null,0,'����|Ȩ�ر���,B|fchildrate','fchildrate',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='iCalcType') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','����ģʽ','B','0000000009',null,null,0,'����|����ģʽ,B|iCalcType','iCalcType',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='fappretwkpqty') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','δ��Ʊ�˻���������','B','0000000009',null,null,0,'����|δ��Ʊ�˻���������,B|fappretwkpqty','fappretwkpqty',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='fappretwkpsum') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','δ��Ʊ�˻�������','B','0000000009',null,null,0,'����|δ��Ʊ�˻�������,B|fappretwkpsum','fappretwkpsum',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='fappretykpqty') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�ѿ�Ʊ�˻���������','B','0000000009',null,null,0,'����|�ѿ�Ʊ�˻���������,B|fappretykpqty','fappretykpqty',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='fappretykpsum') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�ѿ�Ʊ�˻�������','B','0000000009',null,null,0,'����|�ѿ�Ʊ�˻�������,B|fappretykpsum','fappretykpsum',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='irtnappid') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�˻����뵥id','B','0000000009',null,null,0,'����|�˻����뵥id,B|irtnappid','irtnappid',null,'1000000009',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000009' AND cardsection = 'B' AND fieldname='crtnappcode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�˻����뵥��','B','0000000009',null,null,0,'����|�˻����뵥��,B|crtnappcode','crtnappcode',null,'1000000009',1,1)
--END
 
END

GO
 

declare @fieldcmpId nvarchar(20)
declare @fieldcmpCode nvarchar(20)
declare @autoid bigint
declare @guid nvarchar(120)
declare @autoidFixvalue bigint
declare @fieldname nvarchar(20)
set @autoid=0 
set @fieldcmpCode = '0000000009'
set @fieldcmpId = '1000000009'
IF not exists (select 1 from MES_CQ_FIELDCMPS where fieldname='cUnitID' AND cardsection = 'B'  and id=@fieldcmpId )  
BEGIN 
	SELECT @autoid=isnull(max(autoid),0)+1 from MES_CQ_FIELDCMPS
	SELECT @guid = NEWID()
	INSERT INTO MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	('0',@autoid,'���۵�λ����','B',@fieldcmpCode,'010',null,2,'���ݴ����ȡ������λ��Ϣ(��Դ����.����.�������).��������λ����','cUnitID',@guid,@fieldcmpId,1,1)
	DELETE FROM MES_CQ_FIXVALUE where did = @autoid
	SELECT @autoidFixvalue =isnull(max(autoid),0)+1 from MES_CQ_FIXVALUE  
	INSERT INTO MES_CQ_FIXVALUE ( accid,autoid,cardsection,cfromortobill,cfunid,cfunparareturn,cno,ctype,cvalue,did,guid ) values 
	  ('001',@autoidFixvalue,'B','S','010','cinvcode',1,'2','��Դ����.����.�������',@autoid,@guid)
	SELECT @autoidFixvalue =max(isnull(autoid,0))+1 from MES_CQ_FIXVALUE  
	INSERT INTO MES_CQ_FIXVALUE ( accid,autoid,cardsection,cfromortobill,cfunid,cfunparareturn,cno,ctype,cvalue,did,guid ) values 
	  ('001',@autoidFixvalue,null,null,'010','cComUnitCode',7,'3','Ĭ�ϼ�����λ����',@autoid,@guid) 
END 

set @fieldname = 'cgroupcode'
IF not exists (select 1 from MES_CQ_FIELDCMPS where fieldname= @fieldname AND cardsection = 'B'  and id=@fieldcmpId )  
BEGIN 
	SELECT @autoid=isnull(max(autoid),0)+1 from MES_CQ_FIELDCMPS
	SELECT @guid = NEWID()
	INSERT INTO MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	('0',@autoid,'���۵�λ����','B',@fieldcmpCode,'010',null,2,'���ݴ����ȡ������λ��Ϣ(��Դ����.����.�������).��������λ����',@fieldname,@guid,@fieldcmpId,1,1)
	DELETE FROM MES_CQ_FIXVALUE where did = @autoid
	SELECT @autoidFixvalue =isnull(max(autoid),0)+1 from MES_CQ_FIXVALUE  
	INSERT INTO MES_CQ_FIXVALUE ( accid,autoid,cardsection,cfromortobill,cfunid,cfunparareturn,cno,ctype,cvalue,did,guid ) values 
	  ('001',@autoidFixvalue,'B','S','010','cinvcode',1,'2','��Դ����.����.�������',@autoid,@guid)
	SELECT @autoidFixvalue =max(isnull(autoid,0))+1 from MES_CQ_FIXVALUE  
	INSERT INTO MES_CQ_FIXVALUE ( accid,autoid,cardsection,cfromortobill,cfunid,cfunparareturn,cno,ctype,cvalue,did,guid ) values 
	  ('001',@autoidFixvalue,null,null,'010','cgroupcode',7,'3','Ĭ�ϼ�����λ����',@autoid,@guid) 
END 

set @fieldname = 'cinva_unit'
IF not exists (select 1 from MES_CQ_FIELDCMPS where fieldname= @fieldname AND cardsection = 'B'  and id=@fieldcmpId )  
BEGIN 
	SELECT @autoid=isnull(max(autoid),0)+1 from MES_CQ_FIELDCMPS
	SELECT @guid = NEWID()
	INSERT INTO MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	('0',@autoid,'���۵�λ����','B',@fieldcmpCode,'010',null,2,'���ݴ����ȡ������λ��Ϣ(��Դ����.����.�������).��������λ����',@fieldname,@guid,@fieldcmpId,1,1)
	DELETE FROM MES_CQ_FIXVALUE where did = @autoid
	SELECT @autoidFixvalue =isnull(max(autoid),0)+1 from MES_CQ_FIXVALUE  
	INSERT INTO MES_CQ_FIXVALUE ( accid,autoid,cardsection,cfromortobill,cfunid,cfunparareturn,cno,ctype,cvalue,did,guid ) values 
	  ('001',@autoidFixvalue,'B','S','010','cinvcode',1,'2','��Դ����.����.�������',@autoid,@guid)
	SELECT @autoidFixvalue =max(isnull(autoid,0))+1 from MES_CQ_FIXVALUE  
	INSERT INTO MES_CQ_FIXVALUE ( accid,autoid,cardsection,cfromortobill,cfunid,cfunparareturn,cno,ctype,cvalue,did,guid ) values 
	  ('001',@autoidFixvalue,null,null,'010','csacomunitcode',7,'3','Ĭ�ϼ�����λ����',@autoid,@guid) 
END 


set @fieldname = 'igrouptype'
IF not exists (select 1 from MES_CQ_FIELDCMPS where fieldname= @fieldname AND cardsection = 'B'  and id=@fieldcmpId )  
BEGIN 
	SELECT @autoid=isnull(max(autoid),0)+1 from MES_CQ_FIELDCMPS
	SELECT @guid = NEWID()
	INSERT INTO MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
	('0',@autoid,'���۵�λ����','B',@fieldcmpCode,'010',null,2,'���ݴ����ȡ������λ��Ϣ(��Դ����.����.�������).��������λ����',@fieldname,@guid,@fieldcmpId,1,1)
	DELETE FROM MES_CQ_FIXVALUE where did = @autoid
	SELECT @autoidFixvalue =isnull(max(autoid),0)+1 from MES_CQ_FIXVALUE  
	INSERT INTO MES_CQ_FIXVALUE ( accid,autoid,cardsection,cfromortobill,cfunid,cfunparareturn,cno,ctype,cvalue,did,guid ) values 
	  ('001',@autoidFixvalue,'B','S','010','cinvcode',1,'2','��Դ����.����.�������',@autoid,@guid)
	SELECT @autoidFixvalue =max(isnull(autoid,0))+1 from MES_CQ_FIXVALUE  
	INSERT INTO MES_CQ_FIXVALUE ( accid,autoid,cardsection,cfromortobill,cfunid,cfunparareturn,cno,ctype,cvalue,did,guid ) values 
	  ('001',@autoidFixvalue,null,null,'010','igrouptype',7,'3','Ĭ�ϼ�����λ����',@autoid,@guid) 
END 


GO 
