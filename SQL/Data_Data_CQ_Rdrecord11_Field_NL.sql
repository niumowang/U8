
 /*======================= table data: MES_CQ_FIELDCMP ========================*/
print 'dbo.MES_CQ_FIELDCMP data...' 
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMP WHERE TaskType = '0' AND cfrombillcardnum='MO21' AND ctobillcardnum='0412' )  
BEGIN
 INSERT INTO MES_CQ_FIELDCMP (TaskType, ccode,cfrombillcardnum,cname,ctobillcardnum,id,iprintcount,vt_id ) values 
  ('0','0000000005','MO21','�����������ɲ��ϳ��ⵥ','0412','1000000005',null,'17')
END 
GO
 
 /*======================= table data: MES_CQ_FIELDCMPS ========================*/
print 'dbo.MES_CQ_FIELDCMPS data...' 
 -- DELETE FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005'
        --///��Դ����
        --public const int Fieldcmps_Ctype_Source = 0;
        --///�̶�ֵ
        --public const int Fieldcmps_Ctype_Const = 1;
        --///����
        --public const int Fieldcmps_Ctype_Funtion = 2;
        --///������
        --public const int Fieldcmps_Ctype_MutiValue = 3;
   

-- �����������ɲ��ϳ��ⵥ
IF (1=1)  
BEGIN
  
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND fieldname='id' )  
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType,autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable ) values 
  (0,'1000000084','ID','T','0000000005',null,null,1,null,'id',null,'1000000005','0','0')
END 
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='cSource') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','������Դ','T','0000000005',null,null,1,'��������','cSource',null,'1000000005',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='cWhCode') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�ֿ����','T','0000000005',null,null,0,'��ͷ|�ֿ����,T|mes_cWhCode','cWhCode',null,'1000000005',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='ccode') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','���ⵥ��','T','0000000005',null,null,1,'001','cCode',null,'1000000005',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='ddate') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�������','T','0000000005',null,null,0,'��ͷ|�������,T|dDate','dDate',null,'1000000005',1,1)
END

IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='csysbarcode') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','��������','T','0000000005',null,null,1,null,'csysbarcode',null,'1000000005',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='cdepcode') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','���ű���','T','0000000005',null,null,0,'��ͷ|���ű���,T|mes_cdepcode','cdepcode',null,'1000000005',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='cBusType') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','ҵ������','T','0000000005',null,null,1,'����','cBusType',null,'1000000005',1,1)
END 
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='cvencode') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','��Ӧ�̱���','T','0000000005',null,null,0,'��ͷ|��Ӧ�̱���,T|mes_cvencode','cvencode',null,'1000000005',1,1)
END


--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='id') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����������','T','0000000005',null,null,0,'��ͷ|�����������,T|id','ID',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='ID') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�Զ����','T','0000000005',null,null,0,'��ͷ|�Զ����,T|ID','ID',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='bRdFlag') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�շ���־','T','0000000005',null,null,0,'��ͷ|�շ���־,T|bRdFlag','bRdFlag',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='cVouchType') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������','T','0000000005',null,null,0,'��ͷ|��������,T|cVouchType','cVouchType',null,'1000000005',1,1)
--END 
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='cBusCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','cBusCode','T','0000000005',null,null,0,'��ͷ|cBusCode,T|cBusCode','cBusCode',null,'1000000005',1,1)
--END

--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='cRdCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���������','T','0000000005',null,null,0,'��ͷ|���������,T|cRdCode','cRdCode',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='cDepCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���ű���','T','0000000005',null,null,0,'��ͷ|���ű���,T|cDepCode','cDepCode',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='cPersonCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','ҵ��Ա����','T','0000000005',null,null,0,'��ͷ|ҵ��Ա����,T|cPersonCode','cPersonCode',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='cPTCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','cPTCode','T','0000000005',null,null,0,'��ͷ|cPTCode,T|cPTCode','cPTCode',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='cSTCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','cSTCode','T','0000000005',null,null,0,'��ͷ|cSTCode,T|cSTCode','cSTCode',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='cCusCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','cCusCode','T','0000000005',null,null,0,'��ͷ|cCusCode,T|cCusCode','cCusCode',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='cVenCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','cVenCode','T','0000000005',null,null,0,'��ͷ|cVenCode,T|cVenCode','cVenCode',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='cOrderCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','cOrderCode','T','0000000005',null,null,0,'��ͷ|cOrderCode,T|cOrderCode','cOrderCode',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='cARVCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','cARVCode','T','0000000005',null,null,0,'��ͷ|cARVCode,T|cARVCode','cARVCode',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='cBillCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','cBillCode','T','0000000005',null,null,0,'��ͷ|cBillCode,T|cBillCode','cBillCode',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='cDLCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','cDLCode','T','0000000005',null,null,0,'��ͷ|cDLCode,T|cDLCode','cDLCode',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='cProBatch') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������','T','0000000005',null,null,0,'��ͷ|��������,T|cProBatch','cProBatch',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='cHandler') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����','T','0000000005',null,null,0,'��ͷ|�����,T|cHandler','cHandler',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='cMemo') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��ע','T','0000000005',null,null,0,'��ͷ|��ע,T|cMemo','cMemo',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='bTransFlag') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','bTransFlag','T','0000000005',null,null,0,'��ͷ|bTransFlag,T|bTransFlag','bTransFlag',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='cAccounter') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','������','T','0000000005',null,null,0,'��ͷ|������,T|cAccounter','cAccounter',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='cMaker') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�Ƶ���','T','0000000005',null,null,0,'��ͷ|�Ƶ���,T|cMaker','cMaker',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='cDefine1') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��ͷ�Զ�����1','T','0000000005',null,null,0,'��ͷ|��ͷ�Զ�����1,T|cDefine1','cDefine1',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='cDefine2') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��ͷ�Զ�����2','T','0000000005',null,null,0,'��ͷ|��ͷ�Զ�����2,T|cDefine2','cDefine2',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='cDefine3') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��ͷ�Զ�����3','T','0000000005',null,null,0,'��ͷ|��ͷ�Զ�����3,T|cDefine3','cDefine3',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='cDefine4') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��ͷ�Զ�����4','T','0000000005',null,null,0,'��ͷ|��ͷ�Զ�����4,T|cDefine4','cDefine4',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='cDefine5') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��ͷ�Զ�����5','T','0000000005',null,null,0,'��ͷ|��ͷ�Զ�����5,T|cDefine5','cDefine5',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='cDefine6') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��ͷ�Զ�����6','T','0000000005',null,null,0,'��ͷ|��ͷ�Զ�����6,T|cDefine6','cDefine6',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='cDefine7') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��ͷ�Զ�����7','T','0000000005',null,null,0,'��ͷ|��ͷ�Զ�����7,T|cDefine7','cDefine7',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='cDefine8') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��ͷ�Զ�����8','T','0000000005',null,null,0,'��ͷ|��ͷ�Զ�����8,T|cDefine8','cDefine8',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='cDefine9') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��ͷ�Զ�����9','T','0000000005',null,null,0,'��ͷ|��ͷ�Զ�����9,T|cDefine9','cDefine9',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='cDefine10') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��ͷ�Զ�����10','T','0000000005',null,null,0,'��ͷ|��ͷ�Զ�����10,T|cDefine10','cDefine10',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='dKeepDate') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','dKeepDate','T','0000000005',null,null,0,'��ͷ|dKeepDate,T|dKeepDate','dKeepDate',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='dVeriDate') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�������','T','0000000005',null,null,0,'��ͷ|�������,T|dVeriDate','dVeriDate',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='bpufirst') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','bpufirst','T','0000000005',null,null,0,'��ͷ|bpufirst,T|bpufirst','bpufirst',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='biafirst') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','biafirst','T','0000000005',null,null,0,'��ͷ|biafirst,T|biafirst','biafirst',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='iMQuantity') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','iMQuantity','T','0000000005',null,null,0,'��ͷ|iMQuantity,T|iMQuantity','iMQuantity',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='dARVDate') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','dARVDate','T','0000000005',null,null,0,'��ͷ|dARVDate,T|dARVDate','dARVDate',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='cChkCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','cChkCode','T','0000000005',null,null,0,'��ͷ|cChkCode,T|cChkCode','cChkCode',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='dChkDate') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������','T','0000000005',null,null,0,'��ͷ|��������,T|dChkDate','dChkDate',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='cChkPerson') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','����Ա','T','0000000005',null,null,0,'��ͷ|����Ա,T|cChkPerson','cChkPerson',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='VT_ID') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','ģ���','T','0000000005',null,null,0,'��ͷ|ģ���,T|VT_ID','VT_ID',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='bIsSTQc') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','bIsSTQc','T','0000000005',null,null,0,'��ͷ|bIsSTQc,T|bIsSTQc','bIsSTQc',null,'1000000005',1,1)
--END

--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='cMPoCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','����������','T','0000000005',null,null,0,'��ͷ|����������,T|cMPoCode','cMPoCode',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='gspcheck') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','gspcheck','T','0000000005',null,null,0,'��ͷ|gspcheck,T|gspcheck','gspcheck',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='ipurorderid') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','ipurorderid','T','0000000005',null,null,0,'��ͷ|ipurorderid,T|ipurorderid','ipurorderid',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='iproorderid') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������ID','T','0000000005',null,null,0,'��ͷ|��������ID,T|iproorderid','iproorderid',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='ufts') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','ʱ���','T','0000000005',null,null,0,'��ͷ|ʱ���,T|ufts','ufts',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='iExchRate') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','iExchRate','T','0000000005',null,null,0,'��ͷ|iExchRate,T|iExchRate','iExchRate',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='cExch_Name') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','cExch_Name','T','0000000005',null,null,0,'��ͷ|cExch_Name,T|cExch_Name','cExch_Name',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='bOMFirst') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','bOMFirst','T','0000000005',null,null,0,'��ͷ|bOMFirst,T|bOMFirst','bOMFirst',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='bFromPreYear') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','bFromPreYear','T','0000000005',null,null,0,'��ͷ|bFromPreYear,T|bFromPreYear','bFromPreYear',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='bIsLsQuery') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','bIsLsQuery','T','0000000005',null,null,0,'��ͷ|bIsLsQuery,T|bIsLsQuery','bIsLsQuery',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='bIsComplement') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','bIsComplement','T','0000000005',null,null,0,'��ͷ|bIsComplement,T|bIsComplement','bIsComplement',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='iDiscountTaxType') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','iDiscountTaxType','T','0000000005',null,null,0,'��ͷ|iDiscountTaxType,T|iDiscountTaxType','iDiscountTaxType',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='ireturncount') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','ireturncount','T','0000000005',null,null,0,'��ͷ|ireturncount,T|ireturncount','ireturncount',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='iverifystate') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','iverifystate','T','0000000005',null,null,0,'��ͷ|iverifystate,T|iverifystate','iverifystate',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='iswfcontrolled') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','iswfcontrolled','T','0000000005',null,null,0,'��ͷ|iswfcontrolled,T|iswfcontrolled','iswfcontrolled',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='cModifyPerson') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�޸���','T','0000000005',null,null,0,'��ͷ|�޸���,T|cModifyPerson','cModifyPerson',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='dModifyDate') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�޸�����','T','0000000005',null,null,0,'��ͷ|�޸�����,T|dModifyDate','dModifyDate',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='dnmaketime') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�Ƶ�ʱ��','T','0000000005',null,null,0,'��ͷ|�Ƶ�ʱ��,T|dnmaketime','dnmaketime',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='dnmodifytime') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�޸�ʱ��','T','0000000005',null,null,0,'��ͷ|�޸�ʱ��,T|dnmodifytime','dnmodifytime',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='dnverifytime') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���ʱ��','T','0000000005',null,null,0,'��ͷ|���ʱ��,T|dnverifytime','dnverifytime',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='bredvouch') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','bredvouch','T','0000000005',null,null,0,'��ͷ|bredvouch,T|bredvouch','bredvouch',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='iFlowId') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','iFlowId','T','0000000005',null,null,0,'��ͷ|iFlowId,T|iFlowId','iFlowId',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='cPZID') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','cPZID','T','0000000005',null,null,0,'��ͷ|cPZID,T|cPZID','cPZID',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='cSourceLs') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','cSourceLs','T','0000000005',null,null,0,'��ͷ|cSourceLs,T|cSourceLs','cSourceLs',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='cSourceCodeLs') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','cSourceCodeLs','T','0000000005',null,null,0,'��ͷ|cSourceCodeLs,T|cSourceCodeLs','cSourceCodeLs',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='iPrintCount') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','iPrintCount','T','0000000005',null,null,0,'��ͷ|iPrintCount,T|iPrintCount','iPrintCount',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'T' AND fieldname='cCurrentAuditor') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','cCurrentAuditor','T','0000000005',null,null,0,'��ͷ|cCurrentAuditor,T|cCurrentAuditor','cCurrentAuditor',null,'1000000005',1,1)
--END
--GO



 
END 
GO
 
IF (1=1) 
BEGIN


IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cmocode') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','����������','B','0000000005',null,null,0,'����|����������,B|mes_mocode','cmocode',null,'1000000005',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='iopseq') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�����к�','B','0000000005',null,null,0,'����|�����к�,B|opseq','iopseq',null,'1000000005',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='impoids') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','�Ӽ����ϱ�id','B','0000000005',null,null,0,'����|�Ӽ����ϱ�id,B|AllocateId','impoids',null,'1000000005',1,1)
END 
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='bLPUseFree') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','bLPUseFree','B','0000000005',null,null,1,'0','bLPUseFree',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='iOriTrackID') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','iOriTrackID','B','0000000005',null,null,1,'0','iOriTrackID',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='bCosting') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','bCosting','B','0000000005',null,null,1,'1','bCosting',null,'1000000005',1,1)
--END 

IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='invcode') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','��Ʒ����','B','0000000005',null,null,0,'����|��Ʒ����,B|mes_cPInvCode','invcode',null,'1000000005',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cInvCode') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','���ϱ���','B','0000000005',null,null,0,'����|���ϱ���,B|mes_cInvCode','cInvCode',null,'1000000005',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='iQuantity') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','����','B','0000000005',null,null,0,'����|����,B|mes_iQuantity','iQuantity',null,'1000000005',1,1)
END  
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cFree1') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','���������1','B','0000000005',null,null,0,'����|���������1,B|Free1','cFree1',null,'1000000005',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cFree2') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','���������2','B','0000000005',null,null,0,'����|���������2,B|Free2','cFree2',null,'1000000005',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cFree3') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','���������3','B','0000000005',null,null,0,'����|���������3,B|Free3','cFree3',null,'1000000005',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cFree4') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','���������4','B','0000000005',null,null,0,'����|���������4,B|Free4','cFree4',null,'1000000005',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cFree5') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','���������5','B','0000000005',null,null,0,'����|���������5,B|Free5','cFree5',null,'1000000005',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cFree6') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','���������6','B','0000000005',null,null,0,'����|���������6,B|Free6','cFree6',null,'1000000005',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cFree7') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','���������7','B','0000000005',null,null,0,'����|���������7,B|Free7','cFree7',null,'1000000005',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cFree8') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','���������8','B','0000000005',null,null,0,'����|���������8,B|Free8','cFree8',null,'1000000005',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cFree9') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','���������9','B','0000000005',null,null,0,'����|���������9,B|Free9','cFree9',null,'1000000005',1,1)
END
IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cFree10') 
BEGIN
insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
('0','1','���������10','B','0000000005',null,null,0,'����|���������10,B|Free10','cFree10',null,'1000000005',1,1)
END

--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='AutoID') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�ӱ�ID��','B','0000000005',null,null,0,'����|�ӱ�ID��,B|AutoID','AutoID',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='ID') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����������','B','0000000005',null,null,0,'����|�����������,B|ID','ID',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='ID') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�Զ����','B','0000000005',null,null,0,'����|�Զ����,B|ID','ID',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='iNum') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','����','B','0000000005',null,null,0,'����|����,B|iNum','iNum',null,'1000000005',1,1)
--END

--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='iUnitCost') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','����','B','0000000005',null,null,0,'����|����,B|iUnitCost','iUnitCost',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='iPrice') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���','B','0000000005',null,null,0,'����|���,B|iPrice','iPrice',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='iAPrice') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','iAPrice','B','0000000005',null,null,0,'����|iAPrice,B|iAPrice','iAPrice',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='iPUnitCost') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�ƻ�����','B','0000000005',null,null,0,'����|�ƻ�����,B|iPUnitCost','iPUnitCost',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='iPPrice') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�ƻ����','B','0000000005',null,null,0,'����|�ƻ����,B|iPPrice','iPPrice',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cBatch') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','����','B','0000000005',null,null,0,'����|����,B|cBatch','cBatch',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cVouchCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ӧ��ⵥid','B','0000000005',null,null,0,'����|��Ӧ��ⵥid,B|cVouchCode','cVouchCode',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cInVouchCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ӧ��ⵥ��','B','0000000005',null,null,0,'����|��Ӧ��ⵥ��,B|cInVouchCode','cInVouchCode',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cinvouchtype') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ӧ��ⵥ����','B','0000000005',null,null,0,'����|��Ӧ��ⵥ����,B|cinvouchtype','cinvouchtype',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='iSOutQuantity') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�ۼƳ�������','B','0000000005',null,null,0,'����|�ۼƳ�������,B|iSOutQuantity','iSOutQuantity',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='iSOutNum') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�ۼƳ������','B','0000000005',null,null,0,'����|�ۼƳ������,B|iSOutNum','iSOutNum',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='iFlag') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','iFlag','B','0000000005',null,null,0,'����|iFlag,B|iFlag','iFlag',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='iFNum') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','ʵ�ʼ���','B','0000000005',null,null,0,'����|ʵ�ʼ���,B|iFNum','iFNum',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='iFQuantity') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','ʵ������','B','0000000005',null,null,0,'����|ʵ������,B|iFQuantity','iFQuantity',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='dVDate') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','ʧЧ����','B','0000000005',null,null,0,'����|ʧЧ����,B|dVDate','dVDate',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cPosition') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��λ����','B','0000000005',null,null,0,'����|��λ����,B|cPosition','cPosition',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cDefine22') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����1','B','0000000005',null,null,0,'����|�����Զ�����1,B|cDefine22','cDefine22',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cDefine23') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����2','B','0000000005',null,null,0,'����|�����Զ�����2,B|cDefine23','cDefine23',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cDefine24') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����3','B','0000000005',null,null,0,'����|�����Զ�����3,B|cDefine24','cDefine24',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cDefine25') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����4','B','0000000005',null,null,0,'����|�����Զ�����4,B|cDefine25','cDefine25',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cDefine26') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����5','B','0000000005',null,null,0,'����|�����Զ�����5,B|cDefine26','cDefine26',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cDefine27') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����6','B','0000000005',null,null,0,'����|�����Զ�����6,B|cDefine27','cDefine27',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cItem_class') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ŀ�������','B','0000000005',null,null,0,'����|��Ŀ�������,B|cItem_class','cItem_class',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cItemCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ŀ����','B','0000000005',null,null,0,'����|��Ŀ����,B|cItemCode','cItemCode',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cName') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ŀ','B','0000000005',null,null,0,'����|��Ŀ,B|cName','cName',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cItemCName') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ŀ��������','B','0000000005',null,null,0,'����|��Ŀ��������,B|cItemCName','cItemCName',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cBarCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','������','B','0000000005',null,null,0,'����|������,B|cBarCode','cBarCode',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='iNQuantity') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','Ӧ������','B','0000000005',null,null,0,'����|Ӧ������,B|iNQuantity','iNQuantity',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='iNNum') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','Ӧ�ռ���','B','0000000005',null,null,0,'����|Ӧ�ռ���,B|iNNum','iNNum',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cAssUnit') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��浥λ��','B','0000000005',null,null,0,'����|��浥λ��,B|cAssUnit','cAssUnit',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='dMadeDate') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������','B','0000000005',null,null,0,'����|��������,B|dMadeDate','dMadeDate',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='iMassDate') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','������','B','0000000005',null,null,0,'����|������,B|iMassDate','iMassDate',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cDefine28') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����7','B','0000000005',null,null,0,'����|�����Զ�����7,B|cDefine28','cDefine28',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cDefine29') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����8','B','0000000005',null,null,0,'����|�����Զ�����8,B|cDefine29','cDefine29',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cDefine30') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����9','B','0000000005',null,null,0,'����|�����Զ�����9,B|cDefine30','cDefine30',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cDefine31') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����10','B','0000000005',null,null,0,'����|�����Զ�����10,B|cDefine31','cDefine31',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cDefine32') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����11','B','0000000005',null,null,0,'����|�����Զ�����11,B|cDefine32','cDefine32',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cDefine33') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����12','B','0000000005',null,null,0,'����|�����Զ�����12,B|cDefine33','cDefine33',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cDefine34') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����13','B','0000000005',null,null,0,'����|�����Զ�����13,B|cDefine34','cDefine34',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cDefine35') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����14','B','0000000005',null,null,0,'����|�����Զ�����14,B|cDefine35','cDefine35',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cDefine36') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����15','B','0000000005',null,null,0,'����|�����Զ�����15,B|cDefine36','cDefine36',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cDefine37') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����Զ�����16','B','0000000005',null,null,0,'����|�����Զ�����16,B|cDefine37','cDefine37',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='iMPoIds') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���������ӱ�ID','B','0000000005',null,null,0,'����|���������ӱ�ID,B|iMPoIds','iMPoIds',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='iCheckIds') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���鵥�ӱ�ID','B','0000000005',null,null,0,'����|���鵥�ӱ�ID,B|iCheckIds','iCheckIds',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cBVencode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ӧ�̱���','B','0000000005',null,null,0,'����|��Ӧ�̱���,B|cBVencode','cBVencode',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='bGsp') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','bGsp','B','0000000005',null,null,0,'����|bGsp,B|bGsp','bGsp',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cGspState') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','cGspState','B','0000000005',null,null,0,'����|cGspState,B|cGspState','cGspState',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cCheckCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���鵥��','B','0000000005',null,null,0,'����|���鵥��,B|cCheckCode','cCheckCode',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='iCheckIdBaks') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���鵥�ӱ�id','B','0000000005',null,null,0,'����|���鵥�ӱ�id,B|iCheckIdBaks','iCheckIdBaks',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cRejectCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','����Ʒ������','B','0000000005',null,null,0,'����|����Ʒ������,B|cRejectCode','cRejectCode',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='iRejectIds') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','����Ʒ����id','B','0000000005',null,null,0,'����|����Ʒ����id,B|iRejectIds','iRejectIds',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cCheckPersonCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','����Ա����','B','0000000005',null,null,0,'����|����Ա����,B|cCheckPersonCode','cCheckPersonCode',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='dCheckDate') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������','B','0000000005',null,null,0,'����|��������,B|dCheckDate','dCheckDate',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cMassUnit') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����ڵ�λ','B','0000000005',null,null,0,'����|�����ڵ�λ,B|cMassUnit','cMassUnit',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cMoLotCode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������','B','0000000005',null,null,0,'����|��������,B|cMoLotCode','cMoLotCode',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='bChecked') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','bChecked','B','0000000005',null,null,0,'����|bChecked,B|bChecked','bChecked',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='bRelated') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�Ƿ�������Ʒ','B','0000000005',null,null,0,'����|�Ƿ�������Ʒ,B|bRelated','bRelated',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cmworkcentercode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�������ı���','B','0000000005',null,null,0,'����|�������ı���,B|cmworkcentercode','cmworkcentercode',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='bLPUseFree') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','bLPUseFree','B','0000000005',null,null,0,'����|bLPUseFree,B|bLPUseFree','bLPUseFree',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='iRSRowNO') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','iRSRowNO','B','0000000005',null,null,0,'����|iRSRowNO,B|iRSRowNO','iRSRowNO',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='iOriTrackID') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','iOriTrackID','B','0000000005',null,null,0,'����|iOriTrackID,B|iOriTrackID','iOriTrackID',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='coritracktype') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','coritracktype','B','0000000005',null,null,0,'����|coritracktype,B|coritracktype','coritracktype',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cbaccounter') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','������','B','0000000005',null,null,0,'����|������,B|cbaccounter','cbaccounter',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='dbKeepDate') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','dbKeepDate','B','0000000005',null,null,0,'����|dbKeepDate,B|dbKeepDate','dbKeepDate',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='bCosting') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�Ƿ����','B','0000000005',null,null,0,'����|�Ƿ����,B|bCosting','bCosting',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='bVMIUsed') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�������ı�ʶ','B','0000000005',null,null,0,'����|�������ı�ʶ,B|bVMIUsed','bVMIUsed',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='iVMISettleQuantity') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���ܹ���ȷ�ϵ�����','B','0000000005',null,null,0,'����|���ܹ���ȷ�ϵ�����,B|iVMISettleQuantity','iVMISettleQuantity',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='iVMISettleNum') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���ܹ���ȷ�ϵ�����','B','0000000005',null,null,0,'����|���ܹ���ȷ�ϵ�����,B|iVMISettleNum','iVMISettleNum',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cvmivencode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����̴���','B','0000000005',null,null,0,'����|�����̴���,B|cvmivencode','cvmivencode',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='iInvSNCount') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��ָ�����к���','B','0000000005',null,null,0,'����|��ָ�����к���,B|iInvSNCount','iInvSNCount',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cwhpersoncode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','cwhpersoncode','B','0000000005',null,null,0,'����|cwhpersoncode,B|cwhpersoncode','cwhpersoncode',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cwhpersonname') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','cwhpersonname','B','0000000005',null,null,0,'����|cwhpersonname,B|cwhpersonname','cwhpersonname',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cserviceoid') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','cserviceoid','B','0000000005',null,null,0,'����|cserviceoid,B|cserviceoid','cserviceoid',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cbserviceoid') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','cbserviceoid','B','0000000005',null,null,0,'����|cbserviceoid,B|cbserviceoid','cbserviceoid',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='iinvexchrate') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','������','B','0000000005',null,null,0,'����|������,B|iinvexchrate','iinvexchrate',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='corufts') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ӧ����ʱ���','B','0000000005',null,null,0,'����|��Ӧ����ʱ���,B|corufts','corufts',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cmocode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','����������','B','0000000005',null,null,0,'����|����������,B|cmocode','cmocode',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='imoseq') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���������к�','B','0000000005',null,null,0,'����|���������к�,B|imoseq','imoseq',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='iopseq') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�����к�','B','0000000005',null,null,0,'����|�����к�,B|iopseq','iopseq',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='copdesc') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','����˵��','B','0000000005',null,null,0,'����|����˵��,B|copdesc','copdesc',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='strContractGUID') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','strContractGUID','B','0000000005',null,null,0,'����|strContractGUID,B|strContractGUID','strContractGUID',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='iExpiratDateCalcu') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ч�����㷽ʽ','B','0000000005',null,null,0,'����|��Ч�����㷽ʽ,B|iExpiratDateCalcu','iExpiratDateCalcu',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cExpirationdate') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ч����','B','0000000005',null,null,0,'����|��Ч����,B|cExpirationdate','cExpirationdate',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='dExpirationdate') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Ч�ڼ�����','B','0000000005',null,null,0,'����|��Ч�ڼ�����,B|dExpirationdate','dExpirationdate',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cciqbookcode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�ֲ��','B','0000000005',null,null,0,'����|�ֲ��,B|cciqbookcode','cciqbookcode',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='iBondedSumQty') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�ۼƱ�˰�����ȡ����','B','0000000005',null,null,0,'����|�ۼƱ�˰�����ȡ����,B|iBondedSumQty','iBondedSumQty',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='productinids') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','productinids','B','0000000005',null,null,0,'����|productinids,B|productinids','productinids',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='iorderdid') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Դ�����ӱ�ID','B','0000000005',null,null,0,'����|��Դ�����ӱ�ID,B|iorderdid','iorderdid',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='iordertype') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Դ��������','B','0000000005',null,null,0,'����|��Դ��������,B|iordertype','iordertype',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='iordercode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Դ������','B','0000000005',null,null,0,'����|��Դ������,B|iordercode','iordercode',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='iorderseq') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��Դ�����к�','B','0000000005',null,null,0,'����|��Դ�����к�,B|iorderseq','iorderseq',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='isodid') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���۶����ӱ�ID','B','0000000005',null,null,0,'����|���۶����ӱ�ID,B|isodid','isodid',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='isotype') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','������ٷ�ʽ','B','0000000005',null,null,0,'����|������ٷ�ʽ,B|isotype','isotype',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='csocode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','������ٺ�','B','0000000005',null,null,0,'����|������ٺ�,B|csocode','csocode',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='isoseq') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������к�','B','0000000005',null,null,0,'����|��������к�,B|isoseq','isoseq',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cBatchProperty1') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������1','B','0000000005',null,null,0,'����|��������1,B|cBatchProperty1','cBatchProperty1',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cBatchProperty2') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������2','B','0000000005',null,null,0,'����|��������2,B|cBatchProperty2','cBatchProperty2',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cBatchProperty3') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������3','B','0000000005',null,null,0,'����|��������3,B|cBatchProperty3','cBatchProperty3',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cBatchProperty4') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������4','B','0000000005',null,null,0,'����|��������4,B|cBatchProperty4','cBatchProperty4',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cBatchProperty5') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������5','B','0000000005',null,null,0,'����|��������5,B|cBatchProperty5','cBatchProperty5',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cBatchProperty6') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������6','B','0000000005',null,null,0,'����|��������6,B|cBatchProperty6','cBatchProperty6',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cBatchProperty7') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������7','B','0000000005',null,null,0,'����|��������7,B|cBatchProperty7','cBatchProperty7',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cBatchProperty8') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������8','B','0000000005',null,null,0,'����|��������8,B|cBatchProperty8','cBatchProperty8',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cBatchProperty9') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������9','B','0000000005',null,null,0,'����|��������9,B|cBatchProperty9','cBatchProperty9',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cBatchProperty10') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��������10','B','0000000005',null,null,0,'����|��������10,B|cBatchProperty10','cBatchProperty10',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cbMemo') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','��ע','B','0000000005',null,null,0,'����|��ע,B|cbMemo','cbMemo',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='irowno') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�к�','B','0000000005',null,null,0,'����|�к�,B|irowno','irowno',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='strowguid') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','rowguid','B','0000000005',null,null,0,'����|rowguid,B|strowguid','strowguid',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cservicecode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','���񵥺�','B','0000000005',null,null,0,'����|���񵥺�,B|cservicecode','cservicecode',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='rowufts') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','rowufts','B','0000000005',null,null,0,'����|rowufts,B|rowufts','rowufts',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='ipreuseqty') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','ipreuseqty','B','0000000005',null,null,0,'����|ipreuseqty,B|ipreuseqty','ipreuseqty',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='ipreuseinum') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','ipreuseinum','B','0000000005',null,null,0,'����|ipreuseinum,B|ipreuseinum','ipreuseinum',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='OutCopiedQuantity') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�Ѹ�������','B','0000000005',null,null,0,'����|�Ѹ�������,B|OutCopiedQuantity','OutCopiedQuantity',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cbsysbarcode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','����������','B','0000000005',null,null,0,'����|����������,B|cbsysbarcode','cbsysbarcode',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='cplanlotcode') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�ƻ�����','B','0000000005',null,null,0,'����|�ƻ�����,B|cplanlotcode','cplanlotcode',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='bmergecheck') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','bmergecheck','B','0000000005',null,null,0,'����|bmergecheck,B|bmergecheck','bmergecheck',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='imergecheckautoid') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','imergecheckautoid','B','0000000005',null,null,0,'����|imergecheckautoid,B|imergecheckautoid','imergecheckautoid',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='iposflag') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','�ѷ����λ','B','0000000005',null,null,0,'����|�ѷ����λ,B|iposflag','iposflag',null,'1000000005',1,1)
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_FIELDCMPS WHERE TaskType = '0' AND id='1000000005' AND cardsection = 'B' AND fieldname='iorderdetailid') 
--BEGIN
--insert into MES_CQ_FIELDCMPS ( TaskType, autoid,carditemname,cardsection,ccode,cfunid,cremark,ctype,cvalue,fieldname,guid,id,isnull,isvisable  ) values 
--('0','1','iorderdetailid','B','0000000005',null,null,0,'����|iorderdetailid,B|iorderdetailid','iorderdetailid',null,'1000000005',1,1)
--END

END
GO