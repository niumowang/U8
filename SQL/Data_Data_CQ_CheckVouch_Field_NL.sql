
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMP WHERE TaskType = '0' AND cfrombillcardnum='' AND ctobillcardnum='0307' )  
BEGIN
 insert into MES_CQ_FIELDCMP (TaskType, ccode,cfrombillcardnum,cname,ctobillcardnum,id,iprintcount,vt_id ) values 
  ('0','0000000008','','MES�����̵㵥','0307','1000000008',null,'17')
END
 
GO
 
-- MES�����̵㵥
-- DELETE FROM MES_CQ_FIXVALUE WHERE DID IN (SELECT AUTOID FROM  MES_CQ_FIELDCMPS  WHERE TaskType = '0' AND id='1000000008')
-- DELETE FROM MES_CQ_FIELDCMPS  WHERE TaskType = '0' AND id='1000000008'
-- ��ͷ
IF (1=1)  
BEGIN
  
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='cMaker') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�Ƶ���','T','0000000008',null,null,0,'��ͷ|�Ƶ���,T|mes_cPersonCode','cMaker',null,'1000000008',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='cCVCode') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�̵㵥��','T','0000000008',null,null,0,'��ͷ|�̵㵥��,T|mes_cCVCode','cCVCode',null,'1000000008',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='dCVDate') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�̵�����','T','0000000008',null,null,0,'��ͷ|�̵�����,T|mes_dCVDate','dCVDate',null,'1000000008',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='dACDate') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','��������','T','0000000008',null,null,0,'��ͷ|��������,T|mes_dACDate','dACDate',null,'1000000008',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='cDepCode') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','���ű��','T','0000000008',null,null,0,'��ͷ|���ű��,T|mes_cDepCode','cDepCode',null,'1000000008',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='cPersonCode') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�����˱���','T','0000000008',null,null,0,'��ͷ|�����˱���,T|mes_cPersonCode','cPersonCode',null,'1000000008',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='cWhCode') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�̵�ֿ����','T','0000000008',null,null,0,'��ͷ|�̵�ֿ����,T|mes_cWhCode','cWhCode',null,'1000000008',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='dnmaketime') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�Ƶ�ʱ��','T','0000000008',null,null,0,'��ͷ|�Ƶ�ʱ��,T|dnmaketime','dnmaketime',null,'1000000008',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='csource') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','������Դ','T','0000000008',null,null,1,'1','csource',null,'1000000008',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='bTransFlag') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�Ƿ񴫵�','T','0000000008',null,null,1,'0','bTransFlag',null,'1000000008',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='cCvType') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�̵�����','T','0000000008',null,null,1,'��ͨ�ֿ��̵�','cCvType',null,'1000000008',1,1)
END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='cIRdCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���������','T','0000000008',null,null,0,'��ͷ|���������,T|cIRdCode','cIRdCode',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='cORdCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','����������','T','0000000008',null,null,0,'��ͷ|����������,T|cORdCode','cORdCode',null,'1000000008',1,1)
--END

--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='cCVBatch') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�̵�����','T','0000000008',null,null,0,'��ͷ|�̵�����,T|cCVBatch','cCVBatch',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='cCVMemo') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��ע','T','0000000008',null,null,0,'��ͷ|��ע,T|cCVMemo','cCVMemo',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='cDefine1') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��ͷ�Զ�����1','T','0000000008',null,null,0,'��ͷ|��ͷ�Զ�����1,T|cDefine1','cDefine1',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='cDefine2') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��ͷ�Զ�����2','T','0000000008',null,null,0,'��ͷ|��ͷ�Զ�����2,T|cDefine2','cDefine2',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='cDefine3') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��ͷ�Զ�����3','T','0000000008',null,null,0,'��ͷ|��ͷ�Զ�����3,T|cDefine3','cDefine3',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='cDefine4') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��ͷ�Զ�����4','T','0000000008',null,null,0,'��ͷ|��ͷ�Զ�����4,T|cDefine4','cDefine4',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='cDefine5') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��ͷ�Զ�����5','T','0000000008',null,null,0,'��ͷ|��ͷ�Զ�����5,T|cDefine5','cDefine5',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='cDefine6') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��ͷ�Զ�����6','T','0000000008',null,null,0,'��ͷ|��ͷ�Զ�����6,T|cDefine6','cDefine6',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='cDefine7') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��ͷ�Զ�����7','T','0000000008',null,null,0,'��ͷ|��ͷ�Զ�����7,T|cDefine7','cDefine7',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='cDefine8') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��ͷ�Զ�����8','T','0000000008',null,null,0,'��ͷ|��ͷ�Զ�����8,T|cDefine8','cDefine8',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='cDefine9') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��ͷ�Զ�����9','T','0000000008',null,null,0,'��ͷ|��ͷ�Զ�����9,T|cDefine9','cDefine9',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='cDefine10') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��ͷ�Զ�����10','T','0000000008',null,null,0,'��ͷ|��ͷ�Զ�����10,T|cDefine10','cDefine10',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='cAccounter') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����','T','0000000008',null,null,0,'��ͷ|�����,T|cAccounter','cAccounter',null,'1000000008',1,1)
--END

--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='cPosition') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��λ����','T','0000000008',null,null,0,'��ͷ|��λ����,T|cPosition','cPosition',null,'1000000008',1,1)
--END

--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='ID') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','����ID','T','0000000008',null,null,0,'��ͷ|����ID,T|ID','ID',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='VT_ID') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','����ģ���','T','0000000008',null,null,0,'��ͷ|����ģ���,T|VT_ID','VT_ID',null,'1000000008',1,1)
--END

--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='cDefine11') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��ͷ�Զ�����11','T','0000000008',null,null,0,'��ͷ|��ͷ�Զ�����11,T|cDefine11','cDefine11',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='cDefine12') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��ͷ�Զ�����12','T','0000000008',null,null,0,'��ͷ|��ͷ�Զ�����12,T|cDefine12','cDefine12',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='cDefine13') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��ͷ�Զ�����13','T','0000000008',null,null,0,'��ͷ|��ͷ�Զ�����13,T|cDefine13','cDefine13',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='cDefine14') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��ͷ�Զ�����14','T','0000000008',null,null,0,'��ͷ|��ͷ�Զ�����14,T|cDefine14','cDefine14',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='cDefine15') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��ͷ�Զ�����15','T','0000000008',null,null,0,'��ͷ|��ͷ�Զ�����15,T|cDefine15','cDefine15',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='cDefine16') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��ͷ�Զ�����16','T','0000000008',null,null,0,'��ͷ|��ͷ�Զ�����16,T|cDefine16','cDefine16',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='ufts') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','ʱ���','T','0000000008',null,null,0,'��ͷ|ʱ���,T|ufts','ufts',null,'1000000008',1,1)
--END

--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='cCvPeriod') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�̵����ڼ�','T','0000000008',null,null,0,'��ͷ|�̵����ڼ�,T|cCvPeriod','cCvPeriod',null,'1000000008',1,1)
--END

--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='bPosCheck') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�Ƿ��λ��ϸ�̵�','T','0000000008',null,null,0,'��ͷ|�Ƿ��λ��ϸ�̵�,T|bPosCheck','bPosCheck',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='ireturncount') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','ireturncount','T','0000000008',null,null,0,'��ͷ|ireturncount,T|ireturncount','ireturncount',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='iverifystate') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','iverifystate','T','0000000008',null,null,0,'��ͷ|iverifystate,T|iverifystate','iverifystate',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='iswfcontrolled') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','iswfcontrolled','T','0000000008',null,null,0,'��ͷ|iswfcontrolled,T|iswfcontrolled','iswfcontrolled',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='cModifyPerson') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�޸���','T','0000000008',null,null,0,'��ͷ|�޸���,T|cModifyPerson','cModifyPerson',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='dModifyDate') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�޸�����','T','0000000008',null,null,0,'��ͷ|�޸�����,T|dModifyDate','dModifyDate',null,'1000000008',1,1)
--END

--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='dnmodifytime') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�޸�ʱ��','T','0000000008',null,null,0,'��ͷ|�޸�ʱ��,T|dnmodifytime','dnmodifytime',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='dnverifytime') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���ʱ��','T','0000000008',null,null,0,'��ͷ|���ʱ��,T|dnverifytime','dnverifytime',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='dveridate') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�������','T','0000000008',null,null,0,'��ͷ|�������,T|dveridate','dveridate',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='cbustype') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','ҵ������','T','0000000008',null,null,0,'��ͷ|ҵ������,T|cbustype','cbustype',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='cSourceCodeLs') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','������Դ����','T','0000000008',null,null,0,'��ͷ|������Դ����,T|cSourceCodeLs','cSourceCodeLs',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='csysbarcode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������','T','0000000008',null,null,0,'��ͷ|��������,T|csysbarcode','csysbarcode',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='CheckVouchType') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�̵㵥����','T','0000000008',null,null,0,'��ͷ|�̵㵥����,T|CheckVouchType','CheckVouchType',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'T' AND fieldname='bUploaded') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���ϴ�','T','0000000008',null,null,0,'��ͷ|���ϴ�,T|bUploaded','bUploaded',null,'1000000008',1,1)
--END

 
END
GO
 
-- ����
IF (1=1)   
BEGIN

IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cBVencode') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','��Ӧ�̱���','B','0000000008',null,null,0,'����|��Ӧ�̱���,B|mes_cvencode','cBVencode',null,'1000000008',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cInvCode') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�������','B','0000000008',null,null,0,'����|�������,B|mes_cInvCode','cInvCode',null,'1000000008',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='iCVCQuantity') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�̵�����','B','0000000008',null,null,0,'����|�̵�����,B|MES_iquantity','iCVCQuantity',null,'1000000008',1,1)
END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cCVCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�̵㵥��','B','0000000008',null,null,0,'����|�̵㵥��,B|cCVCode','cCVCode',null,'1000000008',1,1)
--END 
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='RdsID') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ӧ��ⵥid','B','0000000008',null,null,0,'����|��Ӧ��ⵥid,B|RdsID','RdsID',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='iCVNum') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�������','B','0000000008',null,null,0,'����|�������,B|iCVNum','iCVNum',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='iCVQuantity') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������','B','0000000008',null,null,0,'����|��������,B|iCVQuantity','iCVQuantity',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='iCVCNum') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�̵����','B','0000000008',null,null,0,'����|�̵����,B|iCVCNum','iCVCNum',null,'1000000008',1,1)
--END

--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cCVBatch') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','����','B','0000000008',null,null,0,'����|����,B|cCVBatch','cCVBatch',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cFree1') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���������1','B','0000000008',null,null,0,'����|���������1,B|cFree1','cFree1',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cFree2') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���������2','B','0000000008',null,null,0,'����|���������2,B|cFree2','cFree2',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cCVReason') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','ԭ��','B','0000000008',null,null,0,'����|ԭ��,B|cCVReason','cCVReason',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='dDisDate') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','ʧЧ����','B','0000000008',null,null,0,'����|ʧЧ����,B|dDisDate','dDisDate',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='iJhdj') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','����','B','0000000008',null,null,0,'����|����,B|iJhdj','iJhdj',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='iJhJe') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','������','B','0000000008',null,null,0,'����|������,B|iJhJe','iJhJe',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='iSjDJ') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�̵���','B','0000000008',null,null,0,'����|�̵���,B|iSjDJ','iSjDJ',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='iSjJe') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','ӯ�����','B','0000000008',null,null,0,'����|ӯ�����,B|iSjJe','iSjJe',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cPosition') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��λ����','B','0000000008',null,null,0,'����|��λ����,B|cPosition','cPosition',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cDefine22') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����1','B','0000000008',null,null,0,'����|�����Զ�����1,B|cDefine22','cDefine22',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cDefine23') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����2','B','0000000008',null,null,0,'����|�����Զ�����2,B|cDefine23','cDefine23',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cDefine24') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����3','B','0000000008',null,null,0,'����|�����Զ�����3,B|cDefine24','cDefine24',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cDefine25') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����4','B','0000000008',null,null,0,'����|�����Զ�����4,B|cDefine25','cDefine25',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cDefine26') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����5','B','0000000008',null,null,0,'����|�����Զ�����5,B|cDefine26','cDefine26',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cDefine27') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����6','B','0000000008',null,null,0,'����|�����Զ�����6,B|cDefine27','cDefine27',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cItemCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ŀ����','B','0000000008',null,null,0,'����|��Ŀ����,B|cItemCode','cItemCode',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cItem_class') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ŀ�������','B','0000000008',null,null,0,'����|��Ŀ�������,B|cItem_class','cItem_class',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cName') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ŀ','B','0000000008',null,null,0,'����|��Ŀ,B|cName','cName',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cItemCName') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ŀ��������','B','0000000008',null,null,0,'����|��Ŀ��������,B|cItemCName','cItemCName',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='autoID') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�Զ����','B','0000000008',null,null,0,'����|�Զ����,B|autoID','autoID',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cBarCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','������','B','0000000008',null,null,0,'����|������,B|cBarCode','cBarCode',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='iAdInQuantity') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����������','B','0000000008',null,null,0,'����|�����������,B|iAdInQuantity','iAdInQuantity',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='iAdInNum') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','����������','B','0000000008',null,null,0,'����|����������,B|iAdInNum','iAdInNum',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='iAdOutQuantity') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','������������','B','0000000008',null,null,0,'����|������������,B|iAdOutQuantity','iAdOutQuantity',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='iAdOutNum') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����������','B','0000000008',null,null,0,'����|�����������,B|iAdOutNum','iAdOutNum',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='iAllowWaste') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���������','B','0000000008',null,null,0,'����|���������,B|iAllowWaste','iAllowWaste',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='iActualWaste') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','ӯ������(%)','B','0000000008',null,null,0,'����|ӯ������(%),B|iActualWaste','iActualWaste',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cFree3') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���������3','B','0000000008',null,null,0,'����|���������3,B|cFree3','cFree3',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cFree4') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���������4','B','0000000008',null,null,0,'����|���������4,B|cFree4','cFree4',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cFree5') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���������5','B','0000000008',null,null,0,'����|���������5,B|cFree5','cFree5',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cFree6') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���������6','B','0000000008',null,null,0,'����|���������6,B|cFree6','cFree6',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cFree7') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���������7','B','0000000008',null,null,0,'����|���������7,B|cFree7','cFree7',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cFree8') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���������8','B','0000000008',null,null,0,'����|���������8,B|cFree8','cFree8',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cFree9') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���������9','B','0000000008',null,null,0,'����|���������9,B|cFree9','cFree9',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cFree10') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���������10','B','0000000008',null,null,0,'����|���������10,B|cFree10','cFree10',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cDefine28') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����7','B','0000000008',null,null,0,'����|�����Զ�����7,B|cDefine28','cDefine28',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cDefine29') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����8','B','0000000008',null,null,0,'����|�����Զ�����8,B|cDefine29','cDefine29',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cDefine30') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����9','B','0000000008',null,null,0,'����|�����Զ�����9,B|cDefine30','cDefine30',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cDefine31') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����10','B','0000000008',null,null,0,'����|�����Զ�����10,B|cDefine31','cDefine31',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cDefine32') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����11','B','0000000008',null,null,0,'����|�����Զ�����11,B|cDefine32','cDefine32',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cDefine33') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����12','B','0000000008',null,null,0,'����|�����Զ�����12,B|cDefine33','cDefine33',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cDefine34') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����13','B','0000000008',null,null,0,'����|�����Զ�����13,B|cDefine34','cDefine34',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cDefine35') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����14','B','0000000008',null,null,0,'����|�����Զ�����14,B|cDefine35','cDefine35',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cDefine36') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����15','B','0000000008',null,null,0,'����|�����Զ�����15,B|cDefine36','cDefine36',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cDefine37') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����16','B','0000000008',null,null,0,'����|�����Զ�����16,B|cDefine37','cDefine37',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cAssUnit') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��浥λ��','B','0000000008',null,null,0,'����|��浥λ��,B|cAssUnit','cAssUnit',null,'1000000008',1,1)
--END

--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cInVouchCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ӧ��ⵥ��','B','0000000008',null,null,0,'����|��Ӧ��ⵥ��,B|cInVouchCode','cInVouchCode',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='iMassDate') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','������','B','0000000008',null,null,0,'����|������,B|iMassDate','iMassDate',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='dMadeDate') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������','B','0000000008',null,null,0,'����|��������,B|dMadeDate','dMadeDate',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cMassUnit') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����ڵ�λ','B','0000000008',null,null,0,'����|�����ڵ�λ,B|cMassUnit','cMassUnit',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='iSoType') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','������ٷ�ʽ','B','0000000008',null,null,0,'����|������ٷ�ʽ,B|iSoType','iSoType',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='iSodid') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���۶����ӱ�ID','B','0000000008',null,null,0,'����|���۶����ӱ�ID,B|iSodid','iSodid',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cvmivencode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����̴���','B','0000000008',null,null,0,'����|�����̴���,B|cvmivencode','cvmivencode',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='iinvexchrate') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','������','B','0000000008',null,null,0,'����|������,B|iinvexchrate','iinvexchrate',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='iExpiratDateCalcu') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ч�����㷽ʽ','B','0000000008',null,null,0,'����|��Ч�����㷽ʽ,B|iExpiratDateCalcu','iExpiratDateCalcu',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cExpirationdate') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ч����','B','0000000008',null,null,0,'����|��Ч����,B|cExpirationdate','cExpirationdate',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='dExpirationdate') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ч�ڼ�����','B','0000000008',null,null,0,'����|��Ч�ڼ�����,B|dExpirationdate','dExpirationdate',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cBatchProperty1') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������1','B','0000000008',null,null,0,'����|��������1,B|cBatchProperty1','cBatchProperty1',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cBatchProperty2') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������2','B','0000000008',null,null,0,'����|��������2,B|cBatchProperty2','cBatchProperty2',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cBatchProperty3') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������3','B','0000000008',null,null,0,'����|��������3,B|cBatchProperty3','cBatchProperty3',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cBatchProperty4') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������4','B','0000000008',null,null,0,'����|��������4,B|cBatchProperty4','cBatchProperty4',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cBatchProperty5') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������5','B','0000000008',null,null,0,'����|��������5,B|cBatchProperty5','cBatchProperty5',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cBatchProperty6') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������6','B','0000000008',null,null,0,'����|��������6,B|cBatchProperty6','cBatchProperty6',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cBatchProperty7') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������7','B','0000000008',null,null,0,'����|��������7,B|cBatchProperty7','cBatchProperty7',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cBatchProperty8') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������8','B','0000000008',null,null,0,'����|��������8,B|cBatchProperty8','cBatchProperty8',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cBatchProperty9') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������9','B','0000000008',null,null,0,'����|��������9,B|cBatchProperty9','cBatchProperty9',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cBatchProperty10') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������10','B','0000000008',null,null,0,'����|��������10,B|cBatchProperty10','cBatchProperty10',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cciqbookcode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�ֲ��','B','0000000008',null,null,0,'����|�ֲ��,B|cciqbookcode','cciqbookcode',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cbMemo') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��ע','B','0000000008',null,null,0,'����|��ע,B|cbMemo','cbMemo',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cwhpersoncode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���Ա����','B','0000000008',null,null,0,'����|���Ա����,B|cwhpersoncode','cwhpersoncode',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cwhpersonname') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���Ա','B','0000000008',null,null,0,'����|���Ա,B|cwhpersonname','cwhpersonname',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='irowno') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�к�','B','0000000008',null,null,0,'����|�к�,B|irowno','irowno',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cinvouchtype') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ӧ��ⵥ����','B','0000000008',null,null,0,'����|��Ӧ��ⵥ����,B|cinvouchtype','cinvouchtype',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cbsysbarcode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','����������','B','0000000008',null,null,0,'����|����������,B|cbsysbarcode','cbsysbarcode',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='cbufts') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','ʱ���','B','0000000008',null,null,0,'����|ʱ���,B|cbufts','cbufts',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='bNeedRecheck') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�踴��','B','0000000008',null,null,0,'����|�踴��,B|bNeedRecheck','bNeedRecheck',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='ReCheckStatus') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','����״̬','B','0000000008',null,null,0,'����|����״̬,B|ReCheckStatus','ReCheckStatus',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='checkcode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�̵㵥��','B','0000000008',null,null,0,'����|�̵㵥��,B|checkcode','checkcode',null,'1000000008',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000008' AND cardsection = 'B' AND fieldname='checkautoid') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�̵㵥�к�','B','0000000008',null,null,0,'����|�̵㵥�к�,B|checkautoid','checkautoid',null,'1000000008',1,1)
--END

END
GO
 
    