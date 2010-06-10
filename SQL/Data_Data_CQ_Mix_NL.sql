/*======================= table data: MES_CQ_DLLReflect ========================*/
print 'dbo.MES_CQ_DLLReflect data...' 
  
IF NOT EXISTS (SELECT 1 FROM MES_Comm_DLLReflect WHERE TaskType =0 AND cvouchertype = '0411' AND ClassType='op')  
BEGIN
insert into MES_Comm_DLLReflect (TaskType,ClassName,ClassType,cvouchertype,Dllpath,Namespace ) values 
  (0,'RdRecord10','op','0411','U8.Interface.Bus.ApiService.Voucher','U8.Interface.Bus.ApiService.Voucher')
END
IF NOT EXISTS (SELECT 1 FROM MES_Comm_DLLReflect WHERE TaskType =0 AND  cvouchertype = '0411' AND ClassType='data')  
BEGIN
insert into MES_Comm_DLLReflect ( TaskType,ClassName,ClassType,cvouchertype,Dllpath,Namespace ) values 
  (0,'APIData','data','0411','U8.Interface.Bus.ApiService','U8.Interface.Bus.ApiService.Model')
END
----���۷�����
IF NOT EXISTS (SELECT 1 FROM MES_Comm_DLLReflect WHERE TaskType =0 AND  cvouchertype = '01' AND ClassType='op')  
BEGIN
insert into MES_Comm_DLLReflect (TaskType, ClassName,ClassType,cvouchertype,Dllpath,Namespace ) values 
  (0,'Consignment','op','01','U8.Interface.Bus.ApiService.Voucher','U8.Interface.Bus.ApiService.Voucher.CQ')
END
IF NOT EXISTS (SELECT 1 FROM MES_Comm_DLLReflect WHERE TaskType =0 AND  cvouchertype = '01' AND ClassType='data')  
BEGIN
insert into MES_Comm_DLLReflect ( TaskType,ClassName,ClassType,cvouchertype,Dllpath,Namespace ) values 
  (0,'APIData','data','01','U8.Interface.Bus.ApiService','U8.Interface.Bus.ApiService.Model')
END
----�����˻���   
IF NOT EXISTS (SELECT 1 FROM MES_Comm_DLLReflect WHERE TaskType =0 AND  cvouchertype = '03' AND ClassType='op' AND TaskType =0)  
BEGIN
insert into MES_Comm_DLLReflect (TaskType, ClassName,ClassType,cvouchertype,Dllpath,Namespace ) values 
  (0,'DispatchList','op','03','U8.Interface.Bus.ApiService.Voucher.OP.Factory.CQ','U8.Interface.Bus.ApiService.Voucher.OP.Factory.CQ')
END    
IF NOT EXISTS (SELECT 1 FROM MES_Comm_DLLReflect WHERE TaskType =0 AND  cvouchertype = '03' AND ClassType='data')  
BEGIN
insert into MES_Comm_DLLReflect (TaskType, ClassName,ClassType,cvouchertype,Dllpath,Namespace ) values 
  (0,'APIData','data','03','U8.Interface.Bus.ApiService','U8.Interface.Bus.ApiService.Model')
END
----�ɹ���ⵥ
IF NOT EXISTS (SELECT 1 FROM MES_Comm_DLLReflect WHERE TaskType =0 AND  cvouchertype = '24' AND ClassType='op')  
BEGIN
insert into MES_Comm_DLLReflect (TaskType,ClassName,ClassType,cvouchertype,Dllpath,Namespace ) values 
  (0,'PuStoreIn','op','24','U8.Interface.Bus.ApiService.Voucher','U8.Interface.Bus.ApiService.Voucher.CQ')
END
IF NOT EXISTS (SELECT 1 FROM MES_Comm_DLLReflect WHERE TaskType =0 AND  cvouchertype = '24' AND ClassType='data')  
BEGIN
insert into MES_Comm_DLLReflect (TaskType, ClassName,ClassType,cvouchertype,Dllpath,Namespace ) values 
  (0,'APIData','data','24','U8.Interface.Bus.ApiService','U8.Interface.Bus.ApiService.Model')
END
----������ⵥ
IF NOT EXISTS (SELECT 1 FROM MES_Comm_DLLReflect WHERE TaskType =0 AND  cvouchertype = '0301' AND ClassType='op')  
BEGIN
insert into MES_Comm_DLLReflect ( TaskType,ClassName,ClassType,cvouchertype,Dllpath,Namespace ) values 
  (0,'RdRecord08','op','0301','U8.Interface.Bus.ApiService.Voucher','U8.Interface.Bus.ApiService.Voucher.CQ')
END
IF NOT EXISTS (SELECT 1 FROM MES_Comm_DLLReflect WHERE TaskType =0 AND  cvouchertype = '0301' AND ClassType='data')  
BEGIN
insert into MES_Comm_DLLReflect ( TaskType,ClassName,ClassType,cvouchertype,Dllpath,Namespace ) values 
  (0,'APIData','data','0301','U8.Interface.Bus.ApiService','U8.Interface.Bus.ApiService.Model')
END

----���ϳ��ⵥ
IF NOT EXISTS (SELECT 1 FROM MES_Comm_DLLReflect WHERE TaskType =0 AND  cvouchertype = '0412' AND ClassType='op')  
BEGIN
insert into MES_Comm_DLLReflect ( TaskType,ClassName,ClassType,cvouchertype,Dllpath,Namespace ) values 
  (0,'RdRecord11','op','0412','U8.Interface.Bus.ApiService.Voucher','U8.Interface.Bus.ApiService.Voucher.CQ')
END
IF NOT EXISTS (SELECT 1 FROM MES_Comm_DLLReflect WHERE TaskType =0 AND  cvouchertype = '0412' AND ClassType='data')  
BEGIN
insert into MES_Comm_DLLReflect ( TaskType,ClassName,ClassType,cvouchertype,Dllpath,Namespace ) values 
  (0,'APIData','data','0412','U8.Interface.Bus.ApiService','U8.Interface.Bus.ApiService.Model')
END

----�������ⵥ
IF NOT EXISTS (SELECT 1 FROM MES_Comm_DLLReflect WHERE TaskType =0 AND  cvouchertype = '0302' AND ClassType='op')  
BEGIN
insert into MES_Comm_DLLReflect ( TaskType,ClassName,ClassType,cvouchertype,Dllpath,Namespace ) values 
  (0,'RdRecord09','op','0302','U8.Interface.Bus.ApiService.Voucher','U8.Interface.Bus.ApiService.Voucher.CQ')
END
IF NOT EXISTS (SELECT 1 FROM MES_Comm_DLLReflect WHERE TaskType =0 AND  cvouchertype = '0302' AND ClassType='data')  
BEGIN
insert into MES_Comm_DLLReflect (TaskType, ClassName,ClassType,cvouchertype,Dllpath,Namespace ) values 
  (0,'APIData','data','0302','U8.Interface.Bus.ApiService','U8.Interface.Bus.ApiService.Model')
END
 
----������
IF NOT EXISTS (SELECT 1 FROM MES_Comm_DLLReflect WHERE TaskType =0 AND  cvouchertype = '0304' AND ClassType='op')  
BEGIN
insert into MES_Comm_DLLReflect ( TaskType,ClassName,ClassType,cvouchertype,Dllpath,Namespace ) values 
  (0,'TransVouch','op','0304','U8.Interface.Bus.ApiService.Voucher','U8.Interface.Bus.ApiService.Voucher.CQ')
END
IF NOT EXISTS (SELECT 1 FROM MES_Comm_DLLReflect WHERE TaskType =0 AND  cvouchertype = '0304' AND ClassType='data')  
BEGIN
insert into MES_Comm_DLLReflect ( TaskType,ClassName,ClassType,cvouchertype,Dllpath,Namespace ) values 
  (0,'APIData','data','0304','U8.Interface.Bus.ApiService','U8.Interface.Bus.ApiService.Model')
END
 
----�̵㵥
IF NOT EXISTS (SELECT 1 FROM MES_Comm_DLLReflect WHERE TaskType =0 AND  cvouchertype = '0307' AND ClassType='op')  
BEGIN
insert into MES_Comm_DLLReflect ( TaskType,ClassName,ClassType,cvouchertype,Dllpath,Namespace ) values 
  (0,'CheckVouch','op','0307','U8.Interface.Bus.ApiService.Voucher','U8.Interface.Bus.ApiService.Voucher.CQ')
END
IF NOT EXISTS (SELECT 1 FROM MES_Comm_DLLReflect WHERE TaskType =0 AND  cvouchertype = '0307' AND ClassType='data')  
BEGIN
insert into MES_Comm_DLLReflect ( TaskType,ClassName,ClassType,cvouchertype,Dllpath,Namespace ) values 
  (0,'APIData','data','0307','U8.Interface.Bus.ApiService','U8.Interface.Bus.ApiService.Model')
END

----��װ��
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_DLLReflect WHERE cvouchertype = '0308' AND ClassType='op')  
--BEGIN
--insert into MES_CQ_DLLReflect ( ClassName,ClassType,cvouchertype,Dllpath,Namespace ) values 
--  ('AssemVouch','op','0308','U8.Interface.Bus.ApiService.Voucher','U8.Interface.Bus.ApiService.Voucher.CQ')
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_DLLReflect WHERE cvouchertype = '0308' AND ClassType='data')  
--BEGIN
--insert into MES_CQ_DLLReflect ( ClassName,ClassType,cvouchertype,Dllpath,Namespace ) values 
--  ('APIData','data','0308','U8.Interface.Bus.ApiService','U8.Interface.Bus.ApiService.Model')
--END

------��ж��
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_DLLReflect WHERE cvouchertype = '0309' AND ClassType='op')  
--BEGIN
--insert into MES_CQ_DLLReflect ( ClassName,ClassType,cvouchertype,Dllpath,Namespace ) values 
--  ('AssemVouch','op','0309','U8.Interface.Bus.ApiService.Voucher','U8.Interface.Bus.ApiService.Voucher.CQ')
--END
--IF NOT EXISTS (SELECT 1 FROM MES_CQ_DLLReflect WHERE cvouchertype = '0309' AND ClassType='data')  
--BEGIN
--insert into MES_CQ_DLLReflect ( ClassName,ClassType,cvouchertype,Dllpath,Namespace ) values 
--  ('APIData','data','0309','U8.Interface.Bus.ApiService','U8.Interface.Bus.ApiService.Model')
--END

GO


 
----  ������  ��ʼ  ----

/*======================= table data: MES_CQ_FUNCTION ========================*/
print 'dbo.MES_CQ_FUNCTION data...' 

if not exists (SELECT 1 FROM MES_CQ_FUNCTION WHERE cfunid = '010') 
begin
insert into MES_CQ_FUNCTION ( accid,cfunclass,cfunesc,cfunid,cfunname,cfunobject,cfunsql,cfuntype,cfunvba,excdatabase ) values 
  (null,null,'���ݴ����ȡ������λ��Ϣ','010','GetComUnitCodeByInvCode',null,'select iChangRate,iGroupType ,i.cGroupCode ,i.cComUnitCode ,cAssComUnitCode ,cSAComUnitCode ,cPUComUnitCode ,cSTComUnitCode ,cCAComUnitCode 
 from inventory i left join  ComputationUnit c on i.cComUnitCode=c.cComunitCode  where i.cinvcode=''{0}''','1',null,'D')
end
--DELETE FROM MES_CQ_FUNCTIONS WHERE cfunid = '010'
if not exists (SELECT 1 FROM MES_CQ_FUNCTIONS WHERE cfunid = '010') 
begin
	insert into MES_CQ_FUNCTIONS ( cfunid,cfunparareturn,cfunparareturndesc,cno,ctype,cvaluetype ) values 
	  ('010','igrouptype','������λ�����',2,'1','String')
	insert into MES_CQ_FUNCTIONS ( cfunid,cfunparareturn,cfunparareturndesc,cno,ctype,cvaluetype ) values 
	  ('010','ccomunitcode','��������λ����',3,'1','String')
	insert into MES_CQ_FUNCTIONS ( cfunid,cfunparareturn,cfunparareturndesc,cno,ctype,cvaluetype ) values 
	  ('010','casscomunitcode','��������λ����',4,'1','String')
	insert into MES_CQ_FUNCTIONS ( cfunid,cfunparareturn,cfunparareturndesc,cno,ctype,cvaluetype ) values 
	  ('010','csacomunitcode','����Ĭ�ϼ�����λ����',5,'1','String')
	insert into MES_CQ_FUNCTIONS ( cfunid,cfunparareturn,cfunparareturndesc,cno,ctype,cvaluetype ) values 
	  ('010','cpucomunitcode','�ɹ�Ĭ�ϼ�����λ����',6,'1','String')
	insert into MES_CQ_FUNCTIONS ( cfunid,cfunparareturn,cfunparareturndesc,cno,ctype,cvaluetype ) values 
	  ('010','cstcomunitcode','���Ĭ�ϼ�����λ����',7,'1','String')
	insert into MES_CQ_FUNCTIONS ( cfunid,cfunparareturn,cfunparareturndesc,cno,ctype,cvaluetype ) values 
	  ('010','ccacomunitcode','�ɱ�Ĭ�ϼ�����λ����',8,'1','String')
	insert into MES_CQ_FUNCTIONS ( cfunid,cfunparareturn,cfunparareturndesc,cno,ctype,cvaluetype ) values 
	  ('010','cinvcode','�������',1,'0','String')
	insert into MES_CQ_FUNCTIONS ( cfunid,cfunparareturn,cfunparareturndesc,cno,ctype,cvaluetype ) values 
	  ('010','cgroupcode','������λ�����',9,'1','String')
end 
go

if not exists (SELECT 1 FROM MES_CQ_FUNCTION WHERE cfunid = '019') 
begin
insert into MES_CQ_FUNCTION ( accid,cfunclass,cfunesc,cfunid,cfunname,cfunobject,cfunsql,cfuntype,cfunvba,excdatabase ) values 
  (null,'U8.Interface.Bus.Function.Compelete','��¼����������Ϣ','019','GetDidTraceInfo','FunctionDLL',null,'2',null,null)
end 
--DELETE FROM MES_CQ_FUNCTIONS WHERE cfunid = '019'
if not exists (SELECT 1 FROM MES_CQ_FUNCTIONS WHERE cfunid = '019') 
begin
	--����
	insert into MES_CQ_FUNCTIONS ( cfunid,cfunparareturn,cfunparareturndesc,cno,ctype,cvaluetype ) values 
	  ('019','s_accid','��Դ��������ID',1,'1','string')
	insert into MES_CQ_FUNCTIONS ( cfunid,cfunparareturn,cfunparareturndesc,cno,ctype,cvaluetype ) values 
	  ('019','d_accid','Ŀ�굥������ID',2,'1','String')
	insert into MES_CQ_FUNCTIONS ( cfunid,cfunparareturn,cfunparareturndesc,cno,ctype,cvaluetype ) values 
	  ('019','s_vouchertype','��Դ��������',3,'1','String')
	insert into MES_CQ_FUNCTIONS ( cfunid,cfunparareturn,cfunparareturndesc,cno,ctype,cvaluetype ) values 
	  ('019','d_vouchertype','Ŀ�굥������',4,'1','String')
	insert into MES_CQ_FUNCTIONS ( cfunid,cfunparareturn,cfunparareturndesc,cno,ctype,cvaluetype ) values 
	  ('019','s_did','��Դ���ݱ���ID',5,'1','String')
	--����  
	insert into MES_CQ_FUNCTIONS ( cfunid,cfunparareturn,cfunparareturndesc,cno,ctype,cvaluetype ) values 
	  ('019','s_accid','��Դ��������ID',1,'0','string')
	insert into MES_CQ_FUNCTIONS ( cfunid,cfunparareturn,cfunparareturndesc,cno,ctype,cvaluetype ) values 
	  ('019','d_accid','Ŀ�굥������ID',2,'0','String')
	insert into MES_CQ_FUNCTIONS ( cfunid,cfunparareturn,cfunparareturndesc,cno,ctype,cvaluetype ) values 
	  ('019','s_vouchertype','��Դ��������',3,'0','String')
	insert into MES_CQ_FUNCTIONS ( cfunid,cfunparareturn,cfunparareturndesc,cno,ctype,cvaluetype ) values 
	  ('019','d_vouchertype','Ŀ����Դ��������',4,'0','String')
	insert into MES_CQ_FUNCTIONS ( cfunid,cfunparareturn,cfunparareturndesc,cno,ctype,cvaluetype ) values 
	  ('019','s_did','��Դ���ݱ���ID',5,'0','String')
end 
GO


if not exists (SELECT 1 FROM MES_CQ_FUNCTION WHERE cfunid = '020') 
begin
insert into MES_CQ_FUNCTION ( accid,cfunclass,cfunesc,cfunid,cfunname,cfunobject,cfunsql,cfuntype,cfunvba,excdatabase ) values 
  (null,'U8.Interface.Bus.Function.Compelete','��ȡ���ε��ݵ��ֶ�ֵ','020','GetValueByAccVouchnoItemname','FunctionDLL',null,'2',null,null)
end 
--delete MES_CQ_FUNCTIONS WHERE cfunid = '020'
if not exists (SELECT 1 FROM MES_CQ_FUNCTIONS WHERE cfunid = '020') 
begin
	--����
	insert into MES_CQ_FUNCTIONS ( cfunid,cfunparareturn,cfunparareturndesc,cno,ctype,cvaluetype ) values 
	  ('020','b_res','�ֶ�ֵ',1,'1','string')
	--����  
	insert into MES_CQ_FUNCTIONS ( cfunid,cfunparareturn,cfunparareturndesc,cno,ctype,cvaluetype ) values 
	  ('020','c_routeid','��ǰ·�ߺ�',1,'0','string')
	insert into MES_CQ_FUNCTIONS ( cfunid,cfunparareturn,cfunparareturndesc,cno,ctype,cvaluetype ) values 
	  ('020','b_accid','���ε�������ID',2,'0','String')
	insert into MES_CQ_FUNCTIONS ( cfunid,cfunparareturn,cfunparareturndesc,cno,ctype,cvaluetype ) values 
	  ('020','b_vouchertype','���ε�������',3,'0','String')
	insert into MES_CQ_FUNCTIONS ( cfunid,cfunparareturn,cfunparareturndesc,cno,ctype,cvaluetype ) values 
	  ('020','b_fieldname','�ֶ�����',4,'0','String') 
end 
GO

--��ȡ���������Ϣ
if not exists (SELECT 1 FROM MES_CQ_FUNCTION WHERE cfunid = '021') 
begin
insert into MES_CQ_FUNCTION ( accid,cfunclass,cfunesc,cfunid,cfunname,cfunobject,cfunsql,cfuntype,cfunvba,excdatabase ) values 
  (null,'U8.Interface.Bus.Function.Compelete','��ȡ���������Ϣ','021','GetSRPolicy','FunctionDLL',null,'2',null,null)
end 
--delete MES_CQ_FUNCTIONS WHERE cfunid = '021'
if not exists (SELECT 1 FROM MES_CQ_FUNCTIONS WHERE cfunid = '021') 
begin
	--����
	insert into MES_CQ_FUNCTIONS ( cfunid,cfunparareturn,cfunparareturndesc,cno,ctype,cvaluetype ) values 
	  ('021','ipesotype','pe������ٷ�ʽ',1,'1','string')
	insert into MES_CQ_FUNCTIONS ( cfunid,cfunparareturn,cfunparareturndesc,cno,ctype,cvaluetype ) values 
	  ('021','cpesocode','pe������ٺ�',2,'1','string')
	insert into MES_CQ_FUNCTIONS ( cfunid,cfunparareturn,cfunparareturndesc,cno,ctype,cvaluetype ) values 
	  ('021','ipesoseq','pe��������к�',3,'1','string') 
	--����   
	insert into MES_CQ_FUNCTIONS ( cfunid,cfunparareturn,cfunparareturndesc,cno,ctype,cvaluetype ) values 
	  ('021','d_accid','Ŀ�굥������ID',1,'0','String')
	insert into MES_CQ_FUNCTIONS ( cfunid,cfunparareturn,cfunparareturndesc,cno,ctype,cvaluetype ) values 
	  ('021','cinvcode','�������',2,'0','String') 
end 

GO 

--�˻�ר�ú���,������Դ���ײɹ������ӱ�ID��ȡĿ���������۶�����Ϣ
if not exists (SELECT 1 FROM MES_CQ_FUNCTION WHERE cfunid = '030') 
begin
insert into MES_CQ_FUNCTION ( accid,cfunclass,cfunesc,cfunid,cfunname,cfunobject,cfunsql,cfuntype,cfunvba,excdatabase ) values 
  (null,'U8.Interface.Bus.Function.Compelete','������Դ���ײɹ������ӱ�ID��ȡĿ���������۶�����Ϣ','030','GetSoInfoForReturnOrder','FunctionDLL',null,'2',null,null)
end 
--delete MES_CQ_FUNCTIONS WHERE cfunid = '030'
if not exists (SELECT 1 FROM MES_CQ_FUNCTIONS WHERE cfunid = '030') 
begin
	--����
	insert into MES_CQ_FUNCTIONS ( cfunid,cfunparareturn,cfunparareturndesc,cno,ctype,cvaluetype ) values 
	  ('030','b_res','�ֶ�ֵ',1,'1','string')
	--����  
	insert into MES_CQ_FUNCTIONS ( cfunid,cfunparareturn,cfunparareturndesc,cno,ctype,cvaluetype ) values 
	  ('030','so_fieldname','���۶����ֶ�����',5,'0','String') 
end 

GO



----  ������  ����  ----


--����ȡֵ��
