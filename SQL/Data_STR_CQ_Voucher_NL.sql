
---- �м��  ��ʼ ----

--���۷�����
/*==============================MES_CQ_DispatchList structure =============================*/
print 'dbo.MES_CQ_DispatchList...'
if not exists (select * from sysobjects where id = object_id('dbo.MES_CQ_DispatchList') and sysstat & 0xf = 3)
BEGIN
CREATE TABLE dbo.MES_CQ_DispatchList
(

	id nvarchar(36), --Int  IDENTITY(1,1) not null ,-- ����ID ����ΨһKEY��
	operflag Int, -- �����ʾ	0/1/2/3 δ����/�������/������/���� ,(�������ͱ��ں�����չ)	��/��Ĭ��Ϊ�񣬱�ʾ�������Ƿ񱻶�ȡ������߱�ҵ����á�
	createTime Datetime,	--����ʱ�� �����ݴ���ʱ��
	finishTime	Datetime, --���ʱ��	���������ʱ�䣬��Щҵ����Ҫ��д������Ҫ��ҵ���д��
	opertype Int,  -- ������ʾ	(ö��)	����/�޸�/ɾ�������ڼ�¼������¼���������޸Ļ���ɾ����
    cerrordesc nvarchar(4000) null ,  --������Ϣ
	cRemark	Nvarchar(255), --��ע	
	 
	cdlcode	Nvarchar(30) , --��������	�����ɹ��󣬻������ɵ���ⵥ��
	ddate	datetime, --��������
	cRdCode	Nvarchar(5), --�շ����	���ֶ��Ǳ����ֶ�
	cBusTypeID	Nvarchar(15)	, -- ҵ������ID
	cBusType	Nvarchar(8)	, -- ҵ����������
	cSTCode	Nvarchar(2)	, -- ��������ID
	cSTName	Nvarchar(20), -- ������������	
	cSoCode	Nvarchar(30), -- ������	
	cCusCode	Nvarchar(20)	, -- �ͻ�����
	cDepCode	Nvarchar(12)	, -- ���۲��Ŵ���
	cPersonCode	Nvarchar(20)	, -- ҵ��Ա����
	cAddress	Nvarchar(255)	, -- ������ַ �ͻ�������ȡ�ã����޸�
	cSCCode	Nvarchar(2), -- ���˷�ʽ	�ͻ�������ȡ�ã����޸ġ����˷�ʽ˫��ϵͳ����ά������������һ�¼��ɡ�
 	
  CONSTRAINT PK_MES_CQ_DispatchList PRIMARY KEY  CLUSTERED
  (
    id
  )
)
END

GO

/*==============================MES_CQ_DispatchLists structure =============================*/
print 'dbo.MES_CQ_DispatchLists...'
if not exists (select * from sysobjects where id = object_id('dbo.MES_CQ_DispatchLists') and sysstat & 0xf = 3)
BEGIN
CREATE TABLE dbo.MES_CQ_DispatchLists
(
	did	nvarchar(36),-- Int IDENTITY(1,1) not null , --�ӱ�ID	���ӱ�����ΨһKEY
	id nvarchar(36),-- Int, -- ��������ID	���������¼��ID
	createTime Datetime, --����ʱ��	�����ݴ���ʱ��
	finishTime	Datetime,--���ʱ��	���������ʱ�䣬��Щҵ����Ҫ��д������Ҫ��ҵ���д��
	opertype Int,  -- ������ʾ	(ö��) 0/1/2	����/�޸�/ɾ�������ڼ�¼������¼���������޸Ļ���ɾ����
	cerrordesc nvarchar(4000) null ,  --������Ϣ
	operflag Int, -- �����ʾ 	0/1/2/3 δ����/�������/������/���� ,	(�������ͱ��ں�����չ)	��/��

	isosid	Int	, -- ���۶����ӱ��к�ID
	mesid nvarchar(36), -- ��ϸ�к�ID			MES��ϸ�к�
	cWhCode	Nvarchar(10), --�ֿ�	�ֿ����
	cinvcode	Nvarchar(20)	, --�������
	iquantity	Decimal(32,12)	, -- ����
	cVenCode	Nvarchar(20), -- ��Ӧ�̱��	���ϳ���ʱȡ���ϵĹ�Ӧ�̣���Ʒ����ʱΪ�ա�
	 
  CONSTRAINT PK_MES_CQ_DispatchLists PRIMARY KEY  CLUSTERED
  (
    did
  )
)
END

GO



--�����˻���
/*==============================MES_CQ_DispatchListRet structure =============================*/
print 'dbo.MES_CQ_DispatchListRet...'
if not exists (select * from sysobjects where id = object_id('dbo.MES_CQ_DispatchListRet') and sysstat & 0xf = 3)
BEGIN
CREATE TABLE dbo.MES_CQ_DispatchListRet
(

	id  nvarchar(36),-- Int  IDENTITY(1,1) not null ,-- ����ID ����ΨһKEY��
	operflag Int, -- �����ʾ	0/1/2/3 δ����/�������/������/����  (�������ͱ��ں�����չ)	��/��Ĭ��Ϊ�񣬱�ʾ�������Ƿ񱻶�ȡ������߱�ҵ����á�
	createTime Datetime,	--����ʱ�� �����ݴ���ʱ��
	finishTime	Datetime, --���ʱ��	���������ʱ�䣬��Щҵ����Ҫ��д������Ҫ��ҵ���д��
	opertype Int,  -- ������ʾ	(ö��)	����/�޸�/ɾ�������ڼ�¼������¼���������޸Ļ���ɾ����
    cerrordesc nvarchar(4000) null ,  --������Ϣ
	cRemark	Nvarchar(255), --��ע	
	 
	cdlcode	Nvarchar(30) , --��������	�����ɹ��󣬻������ɵ���ⵥ��
	ddate	datetime, --�˻�����
	cRdCode	Nvarchar(5), --�շ����	���ֶ��Ǳ����ֶ�
	cBusTypeID	Nvarchar(15)	, -- ҵ������ID
	cBusType	Nvarchar(8)	, -- ҵ����������
	cSTCode	Nvarchar(2)	, -- ��������ID
	cSTName	Nvarchar(20), -- ������������	
	cSoCode	Nvarchar(30), -- ������	
	cCusCode	Nvarchar(20)	, -- �ͻ�����
	cDepCode	Nvarchar(12)	, -- ���۲��Ŵ���
	cPersonCode	Nvarchar(20)	, -- ҵ��Ա����
	cAddress	Nvarchar(255)	, -- ������ַ �ͻ�������ȡ�ã����޸�
	cSCCode	Nvarchar(2), -- ���˷�ʽ	�ͻ�������ȡ�ã����޸ġ����˷�ʽ˫��ϵͳ����ά������������һ�¼��ɡ�
	tdlcode	Nvarchar(30)	, -- �˻�����   

 	
  CONSTRAINT PK_MES_CQ_DispatchListRet PRIMARY KEY  CLUSTERED
  (
    id
  )
)
END

GO

/*==============================MES_CQ_DispatchListRets structure =============================*/
print 'dbo.MES_CQ_DispatchListRets...'
if not exists (select * from sysobjects where id = object_id('dbo.MES_CQ_DispatchListRets') and sysstat & 0xf = 3)
BEGIN
CREATE TABLE dbo.MES_CQ_DispatchListRets
(
	did	 nvarchar(36),-- Int IDENTITY(1,1) not null , --�ӱ�ID	���ӱ�����ΨһKEY
	id	 nvarchar(36),-- Int, -- ��������ID	���������¼��ID
	createTime Datetime, --����ʱ��	�����ݴ���ʱ��
	finishTime	Datetime,--���ʱ��	���������ʱ�䣬��Щҵ����Ҫ��д������Ҫ��ҵ���д��
	opertype Int,  -- ������ʾ	(ö��) 0/1/2	����/�޸�/ɾ�������ڼ�¼������¼���������޸Ļ���ɾ����
	cerrordesc nvarchar(4000) null ,  --������Ϣ
	operflag Int, -- �����ʾ  0/1/2/3 δ����/�������/������/����	(�������ͱ��ں�����չ)	��/��

	isosid	Int	, -- ���۶����ӱ��к�ID
	mesid nvarchar(36), -- ��ϸ�к�ID			MES��ϸ�к�
	cWhCode	Nvarchar(10), --�ֿ�	�ֿ����
	cinvcode	Nvarchar(20)	, --�������
	iquantity	Decimal(32,12)	, -- ����
	cVenCode	Nvarchar(20), -- ��Ӧ�̱��	���ϳ���ʱȡ���ϵĹ�Ӧ�̣���Ʒ����ʱΪ�ա�
	  
  CONSTRAINT PK_MES_CQ_DispatchListRets PRIMARY KEY  CLUSTERED
  (
    did
  )
)
END

GO



--����Ʒ��ⵥ
/*==============================MES_CQ_rdrecord10 structure =============================*/
print 'dbo.MES_CQ_rdrecord10...'
if not exists (select * from sysobjects where id = object_id('dbo.MES_CQ_rdrecord10') and sysstat & 0xf = 3)
BEGIN
CREATE TABLE dbo.MES_CQ_rdrecord10
(

	id  nvarchar(36),-- Int  IDENTITY(1,1) not null ,-- ����ID ����ΨһKEY��
	operflag Int, -- �����ʾ	(�������ͱ��ں�����չ)	��/��Ĭ��Ϊ�񣬱�ʾ�������Ƿ񱻶�ȡ������߱�ҵ����á�
	createTime Datetime,	--����ʱ�� �����ݴ���ʱ��
	finishTime	Datetime, --���ʱ��	���������ʱ�䣬��Щҵ����Ҫ��д������Ҫ��ҵ���д��
	opertype Int,  -- ������ʾ	(ö��)	0/1/2 ����/�޸�/ɾ�������ڼ�¼������¼���������޸Ļ���ɾ����
    cerrordesc nvarchar(4000) null ,  --������Ϣ

	cRdCode	Nvarchar(30),	--��ⵥ��
	ddate	datetime,       --�������	
	cWhCode	Nvarchar(10),   --�ֿ�	�ֿ����
	cRdStyleCode	Nvarchar(5),    --�շ����	���ֶ��Ǳ����ֶ�
    cDepCode	Nvarchar(12), --����(��������)		
	cRemark	Nvarchar(255), --��ע	

  CONSTRAINT PK_MES_CQ_rdrecord10 PRIMARY KEY  CLUSTERED
  (
    id
  )
)
END

GO

/*==============================MES_CQ_rdrecords10 structure =============================*/
print 'dbo.MES_CQ_rdrecord10...'
if not exists (select * from sysobjects where id = object_id('dbo.MES_CQ_rdrecords10') and sysstat & 0xf = 3)
BEGIN
CREATE TABLE dbo.MES_CQ_rdrecords10
(
	did	 nvarchar(36),-- Int IDENTITY(1,1) not null , --�ӱ�ID	���ӱ�����ΨһKEY
	id	 nvarchar(36),-- Int, -- ��������ID	���������¼��ID
	createTime Datetime, --����ʱ��	�����ݴ���ʱ��
	finishTime	Datetime,--���ʱ��	���������ʱ�䣬��Щҵ����Ҫ��д������Ҫ��ҵ���д��
	opertype Int,  -- ������ʾ	(ö��)	0/1/2 ����/�޸�/ɾ�������ڼ�¼������¼���������޸Ļ���ɾ����
	cerrordesc nvarchar(4000) null ,  --������Ϣ
	operflag Int, -- �����ʾ	(�������ͱ��ں�����չ)	��/��

  	MoCode	Nvarchar(30), -- ����������	
	cInvCode	Nvarchar(20), -- ��Ʒ����	
	iquantity	Decimal(32,12), -- ����	�������������źͲ�Ʒ�������

  CONSTRAINT PK_MES_CQ_rdrecords10 PRIMARY KEY  CLUSTERED
  (
    did
  )
)
END

GO
  
--�ɹ���ⵥ
/*==============================MES_CQ_rdrecord01 structure =============================*/
print 'dbo.MES_CQ_rdrecord01...'
if not exists (select * from sysobjects where id = object_id('dbo.MES_CQ_rdrecord01') and sysstat & 0xf = 3)
BEGIN
CREATE TABLE dbo.MES_CQ_rdrecord01
(

	id  nvarchar(36),-- Int  IDENTITY(1,1) not null ,-- ����ID ����ΨһKEY��
	operflag Int, -- �����ʾ	(�������ͱ��ں�����չ)	��/��Ĭ��Ϊ�񣬱�ʾ�������Ƿ񱻶�ȡ������߱�ҵ����á�
	createTime Datetime,	--����ʱ�� �����ݴ���ʱ��
	finishTime	Datetime, --���ʱ��	���������ʱ�䣬��Щҵ����Ҫ��д������Ҫ��ҵ���д��
	opertype Int,  -- ������ʾ	(ö��)	0/1/2 ����/�޸�/ɾ�������ڼ�¼������¼���������޸Ļ���ɾ����
    cerrordesc nvarchar(4000) null ,  --������Ϣ

	cRdCode	Nvarchar(30),	--��ⵥ��
	ddate	datetime,       --�������	
	cWhCode	Nvarchar(10),   --�ֿ�	�ֿ����
	cRdStyleCode	Nvarchar(5),    --�շ����	���ֶ��Ǳ����ֶ�
    cDepCode	Nvarchar(12), --����(��������)	
	cVenCode	Nvarchar(20), -- ��Ӧ��	 
	cPersonCode	Nvarchar(20), -- ҵ��Ա	 	
	cRemark	Nvarchar(255), --��ע	   

  CONSTRAINT PK_MES_CQ_rdrecord01 PRIMARY KEY  CLUSTERED
  (
    id
  )
)
END

GO

/*==============================MES_CQ_rdrecords01 structure =============================*/
print 'dbo.MES_CQ_rdrecord10...'
if not exists (select * from sysobjects where id = object_id('dbo.MES_CQ_rdrecords01') and sysstat & 0xf = 3)
BEGIN
CREATE TABLE dbo.MES_CQ_rdrecords01
(
	did	 nvarchar(36),-- Int IDENTITY(1,1) not null , --�ӱ�ID	���ӱ�����ΨһKEY
	id	 nvarchar(36),-- Int, -- ��������ID	���������¼��ID
	createTime Datetime, --����ʱ��	�����ݴ���ʱ��
	finishTime	Datetime,--���ʱ��	���������ʱ�䣬��Щҵ����Ҫ��д������Ҫ��ҵ���д��
	opertype Int,  -- ������ʾ	(ö��)	����/�޸�/ɾ�������ڼ�¼������¼���������޸Ļ���ɾ����
	cerrordesc nvarchar(4000) null ,  --������Ϣ
	operflag Int, -- �����ʾ	(�������ͱ��ں�����չ)	��/��

  	dhCode	Nvarchar(20), -- ��������	
	cPoCode	Nvarchar(20), -- ������
	dhid int , -- �������к�ID		 
	cInvCode	Nvarchar(20), -- ������� 
	iquantity	Decimal(32,12), -- ���� 
	  
  CONSTRAINT PK_MES_CQ_rdrecords01 PRIMARY KEY  CLUSTERED
  (
    did
  )
)
END

GO



--������ⵥ
/*==============================MES_CQ_rdrecord08 structure =============================*/
print 'dbo.MES_CQ_rdrecord08...'
if not exists (select * from sysobjects where id = object_id('dbo.MES_CQ_rdrecord08') and sysstat & 0xf = 3)
BEGIN
CREATE TABLE dbo.MES_CQ_rdrecord08
(

	id  nvarchar(36),-- Int  IDENTITY(1,1) not null ,-- ����ID ����ΨһKEY��
	operflag Int, -- �����ʾ	(�������ͱ��ں�����չ)	��/��Ĭ��Ϊ�񣬱�ʾ�������Ƿ񱻶�ȡ������߱�ҵ����á�
	createTime Datetime,	--����ʱ�� �����ݴ���ʱ��
	finishTime	Datetime, --���ʱ��	���������ʱ�䣬��Щҵ����Ҫ��д������Ҫ��ҵ���д��
	opertype Int,  -- ������ʾ	(ö��)	0/1/2 ����/�޸�/ɾ�������ڼ�¼������¼���������޸Ļ���ɾ����
    cerrordesc nvarchar(4000) null ,  --������Ϣ

	cRdCode	Nvarchar(30),	--��ⵥ��
	ddate	datetime,       --�������	
	cWhCode	Nvarchar(10),   --�ֿ�	�ֿ����
	cRdStyleCode	Nvarchar(5),    --�շ����	���ֶ��Ǳ����ֶ�
    cDepCode	Nvarchar(12), --����(��������)	
	cVenCode	Nvarchar(20), -- ��Ӧ��	 
	--cPersonCode	Nvarchar(20), -- ҵ��Ա	 	
	cRemark	Nvarchar(255), --��ע	   

  CONSTRAINT PK_MES_CQ_rdrecord08 PRIMARY KEY  CLUSTERED
  (
    id
  )
)
END

GO

/*==============================MES_CQ_rdrecords08 structure =============================*/
print 'dbo.MES_CQ_rdrecords08...'
if not exists (select * from sysobjects where id = object_id('dbo.MES_CQ_rdrecords08') and sysstat & 0xf = 3)
BEGIN
CREATE TABLE dbo.MES_CQ_rdrecords08
(
	did	 nvarchar(36),-- Int IDENTITY(1,1) not null , --�ӱ�ID	���ӱ�����ΨһKEY
	id	 nvarchar(36),-- Int, -- ��������ID	���������¼��ID
	createTime Datetime, --����ʱ��	�����ݴ���ʱ��
	finishTime	Datetime,--���ʱ��	���������ʱ�䣬��Щҵ����Ҫ��д������Ҫ��ҵ���д��
	opertype Int,  -- ������ʾ	(ö��)	����/�޸�/ɾ�������ڼ�¼������¼���������޸Ļ���ɾ����
	cerrordesc nvarchar(4000) null ,  --������Ϣ
	operflag Int, -- �����ʾ	(�������ͱ��ں�����չ)	��/��
	 
	cVenCode	Nvarchar(20), -- ��Ӧ��	  
	cInvCode	Nvarchar(20), -- ������� 
	iquantity	Decimal(32,12), -- ���� 
	  
  CONSTRAINT PK_MES_CQ_rdrecords08 PRIMARY KEY  CLUSTERED
  (
    did
  )
)
END

GO


--���ϳ��ⵥ  
print 'dbo.MES_CQ_RdRecord11...'
if not exists (select * from sysobjects where id = object_id('dbo.MES_CQ_RdRecord11') and sysstat & 0xf = 3)
BEGIN
CREATE TABLE dbo.MES_CQ_RdRecord11
( 
	id  nvarchar(36),-- Int  IDENTITY(1,1) not null ,-- ����ID ����ΨһKEY��
	operflag Int, -- �����ʾ	(�������ͱ��ں�����չ)	��/��Ĭ��Ϊ�񣬱�ʾ�������Ƿ񱻶�ȡ������߱�ҵ����á�
	createTime Datetime,	--����ʱ�� �����ݴ���ʱ��
	finishTime	Datetime, --���ʱ��	���������ʱ�䣬��Щҵ����Ҫ��д������Ҫ��ҵ���д��
	opertype Int,  -- ������ʾ	(ö��)	0/1/2 ����/�޸�/ɾ�������ڼ�¼������¼���������޸Ļ���ɾ����
    cerrordesc nvarchar(4000) null ,  --������Ϣ

	cRdCode	Nvarchar(30),	--���ⵥ����
	ddate	datetime,       --��������	
	cWhCode	Nvarchar(10),   --�ֿ�	�ֿ����
	cRdStyleCode	Nvarchar(5),    --�շ����	���ֶ��Ǳ����ֶ�
    cDepCode	Nvarchar(12), --����(��������)	
	cVenCode	Nvarchar(20), -- ��Ӧ��	  	
	cRemark	Nvarchar(255), --��ע	   
	 
  CONSTRAINT PK_MES_CQ_RdRecord11 PRIMARY KEY  CLUSTERED
  (
    id
  )
)
END

GO

/*==============================MES_CQ_rdrecords11 structure =============================*/
print 'dbo.MES_CQ_RdRecords11...'
if not exists (select * from sysobjects where id = object_id('dbo.MES_CQ_RdRecords11') and sysstat & 0xf = 3)
BEGIN
CREATE TABLE dbo.MES_CQ_RdRecords11
(
	did	 nvarchar(36),-- Int IDENTITY(1,1) not null , --�ӱ�ID	���ӱ�����ΨһKEY
	id	 nvarchar(36),-- Int, -- ��������ID	���������¼��ID
	createTime Datetime, --����ʱ��	�����ݴ���ʱ��
	finishTime	Datetime,--���ʱ��	���������ʱ�䣬��Щҵ����Ҫ��д������Ҫ��ҵ���д��
	opertype Int,  -- ������ʾ	(ö��)	����/�޸�/ɾ�������ڼ�¼������¼���������޸Ļ���ɾ����
	cerrordesc nvarchar(4000) null ,  --������Ϣ 
	operflag Int, -- �����ʾ	(�������ͱ��ں�����չ)	��/��

	MESDID	Nvarchar(20), --MES�к� 
	MoCode	Nvarchar(30)	, --����������
	cPInvCode	Nvarchar(20), --��Ʒ����	
	cInvCode	Nvarchar(20), --���ϱ���
	iquantity	Decimal(32,12), --����	
	cVenCode	Nvarchar(20),--��Ӧ�̱���	

	  
  CONSTRAINT PK_MES_CQ_RdRecords11 PRIMARY KEY  CLUSTERED
  (
    did
  )
)
END

GO



--�������ⵥ  
print 'dbo.MES_CQ_RdRecord09...'
if not exists (select * from sysobjects where id = object_id('dbo.MES_CQ_RdRecord09') and sysstat & 0xf = 3)
BEGIN
CREATE TABLE dbo.MES_CQ_RdRecord09
(

	id nvarchar(36),--  Int  IDENTITY(1,1) not null ,-- ����ID ����ΨһKEY��
	operflag Int, -- �����ʾ	(�������ͱ��ں�����չ)	��/��Ĭ��Ϊ�񣬱�ʾ�������Ƿ񱻶�ȡ������߱�ҵ����á�
	createTime Datetime,	--����ʱ�� �����ݴ���ʱ��
	finishTime	Datetime, --���ʱ��	���������ʱ�䣬��Щҵ����Ҫ��д������Ҫ��ҵ���д��
	opertype Int,  -- ������ʾ	(ö��)	0/1/2 ����/�޸�/ɾ�������ڼ�¼������¼���������޸Ļ���ɾ����
    cerrordesc nvarchar(4000) null ,  --������Ϣ

	cRdCode	Nvarchar(30),	--���ⵥ����
	ddate	datetime,       --��������	
	cWhCode	Nvarchar(10),   --�ֿ�	�ֿ����
	cRdStyleCode	Nvarchar(5),    --��������	ERP�ṩ,����
    cDepCode	Nvarchar(12), --����(��������)	
	cVenCode	Nvarchar(20), -- ��Ӧ��	  	
	cRemark	Nvarchar(255), --��ע	  

  CONSTRAINT PK_MES_CQ_RdRecord09 PRIMARY KEY  CLUSTERED
  (
    id
  )
)
END

GO

/*==============================MES_CQ_rdrecords08 structure =============================*/
print 'dbo.MES_CQ_RdRecords09...'
if not exists (select * from sysobjects where id = object_id('dbo.MES_CQ_RdRecords09') and sysstat & 0xf = 3)
BEGIN
CREATE TABLE dbo.MES_CQ_RdRecords09
(
	did	 nvarchar(36),-- Int IDENTITY(1,1) not null , --�ӱ�ID	���ӱ�����ΨһKEY
	id	 nvarchar(36),-- Int, -- ��������ID	���������¼��ID
	createTime Datetime, --����ʱ��	�����ݴ���ʱ��
	finishTime	Datetime,--���ʱ��	���������ʱ�䣬��Щҵ����Ҫ��д������Ҫ��ҵ���д��
	opertype Int,  -- ������ʾ	(ö��) 0/1/2	����/�޸�/ɾ�������ڼ�¼������¼���������޸Ļ���ɾ����
	cerrordesc nvarchar(4000) null ,  --������Ϣ
	operflag Int, -- �����ʾ	(�������ͱ��ں�����չ)	��/��
	 
	cVenCode	Nvarchar(20), -- ��Ӧ��	  
	cInvCode	Nvarchar(20), -- ������� 
	iquantity	Decimal(32,12), -- ����  

  CONSTRAINT PK_MES_CQ_RdRecords09 PRIMARY KEY  CLUSTERED
  (
    did
  )
)
END

GO

--������  0304
print 'dbo.MES_CQ_TransVouch...'
if not exists (select * from sysobjects where id = object_id('dbo.MES_CQ_TransVouch') and sysstat & 0xf = 3)
BEGIN
CREATE TABLE dbo.MES_CQ_TransVouch
(

	id  nvarchar(36),-- Int  IDENTITY(1,1) not null ,-- ����ID ����ΨһKEY��
	operflag Int, -- �����ʾ  0/1/2 δ����/�Ѵ���/�������	(�������ͱ��ں�����չ)	��/��Ĭ��Ϊ�񣬱�ʾ�������Ƿ񱻶�ȡ������߱�ҵ����á�
	createTime Datetime,	--����ʱ�� �����ݴ���ʱ��
	finishTime	Datetime, --���ʱ��	���������ʱ�䣬��Щҵ����Ҫ��д������Ҫ��ҵ���д��
	opertype Int,  -- ������ʾ	(ö��)	0/1/2 ����/�޸�/ɾ�������ڼ�¼������¼���������޸Ļ���ɾ����
    cerrordesc nvarchar(4000) null ,  --������Ϣ

	cTVCode	Nvarchar(30), --�ƿⵥ��	
	dTVDate	Datetime, --�ƿ�����	��������
	cOWhCode	Nvarchar(10), --��Դ�ֿ�	����
	cIWhCode	Nvarchar(10), --Ŀ��ֿ�	����
	cIRdCode	Nvarchar(5), --������	����
	cORdCode	Nvarchar(5),-- �������	����
	cRemark	Nvarchar(255), --��ע	
  

  CONSTRAINT PK_MES_CQ_TransVouch PRIMARY KEY  CLUSTERED
  (
    id
  )
)
END

GO

/*==============================MES_CQ_TransVouchs structure =============================*/
print 'dbo.MES_CQ_TransVouchs...'
if not exists (select * from sysobjects where id = object_id('dbo.MES_CQ_TransVouchs') and sysstat & 0xf = 3)
BEGIN
CREATE TABLE dbo.MES_CQ_TransVouchs
(
	did	 nvarchar(36),-- Int IDENTITY(1,1) not null , --�ӱ�ID	���ӱ�����ΨһKEY
	id	 nvarchar(36),-- Int, -- ��������ID	���������¼��ID
	createTime Datetime, --����ʱ��	�����ݴ���ʱ��
	finishTime	Datetime,--���ʱ��	���������ʱ�䣬��Щҵ����Ҫ��д������Ҫ��ҵ���д��
	opertype Int,  -- ������ʾ	(ö��) 0/1/2	����/�޸�/ɾ�������ڼ�¼������¼���������޸Ļ���ɾ����
	cerrordesc nvarchar(4000) null ,  --������Ϣ
	operflag Int, -- �����ʾ	(�������ͱ��ں�����չ)	��/��
	 
	MESDid	Varchar(32)	, --MES�к�
	cInvCode	Nvarchar(20)	, --�������
	iquantity	Decimal(32,12)	, --����
	cVenCode	Nvarchar(20)	, --��Ӧ�� 
  CONSTRAINT PK_MES_CQ_TransVouchs PRIMARY KEY  CLUSTERED
  (
    did
  )
)
END

GO




--�̵㵥  0307
print 'dbo.MES_CQ_CheckVouch...'
if not exists (select * from sysobjects where id = object_id('dbo.MES_CQ_CheckVouch') and sysstat & 0xf = 3)
BEGIN
CREATE TABLE dbo.MES_CQ_CheckVouch
(

	id nvarchar(36),--  Int  IDENTITY(1,1) not null ,-- ����ID ����ΨһKEY��
	operflag Int, -- �����ʾ	(�������ͱ��ں�����չ)	��/��Ĭ��Ϊ�񣬱�ʾ�������Ƿ񱻶�ȡ������߱�ҵ����á�
	createTime Datetime,	--����ʱ�� �����ݴ���ʱ��
	finishTime	Datetime, --���ʱ��	���������ʱ�䣬��Щҵ����Ҫ��д������Ҫ��ҵ���д��
	opertype Int,  -- ������ʾ	(ö��)	0/1/2 ����/�޸�/ɾ�������ڼ�¼������¼���������޸Ļ���ɾ����
    cerrordesc nvarchar(4000) null ,  --������Ϣ

	cCVCode	Nvarchar(30), --�̵����񵥺�	
	dCVDate	datetime, --�ƻ��̵�����	ȡ�ƻ��̵�����
	dACDate	datetime,--ʵ���̵�����	ȡ�̵�����ʵ���������
	cDepCode	Nvarchar(12), --�̵㲿��	ȡ�̵����������ڲ���
	cPersonCode	Nvarchar(20), --�̵���	ȡ�̵�������
	cWhCode	Nvarchar(10)	, --�ֿ�
	 
  CONSTRAINT PK_MES_CQ_CheckVouch PRIMARY KEY  CLUSTERED
  (
    id
  )
)
END

GO

/*==============================MES_CQ_CheckVouchs structure =============================*/
print 'dbo.MES_CQ_CheckVouchs...'
if not exists (select * from sysobjects where id = object_id('dbo.MES_CQ_CheckVouchs') and sysstat & 0xf = 3)
BEGIN
CREATE TABLE dbo.MES_CQ_CheckVouchs
(
	did	 nvarchar(36),-- Int IDENTITY(1,1) not null , --�ӱ�ID	���ӱ�����ΨһKEY
	id	 nvarchar(36),-- Int, -- ��������ID	���������¼��ID
	createTime Datetime, --����ʱ��	�����ݴ���ʱ��
	finishTime	Datetime,--���ʱ��	���������ʱ�䣬��Щҵ����Ҫ��д������Ҫ��ҵ���д��
	opertype Int,  -- ������ʾ	(ö��) 0/1/2	����/�޸�/ɾ�������ڼ�¼������¼���������޸Ļ���ɾ����
	cerrordesc nvarchar(4000) null ,  --������Ϣ
	operflag Int, -- �����ʾ	(�������ͱ��ں�����չ)	��/��
	 
	cInvCode	Nvarchar(20), --�������	
	iquantity	Decimal(32,12), --����	���մ�����롢��Ӧ�������ܣ�����������ֵ��
	cVenCode	Nvarchar(20), --��Ӧ��	

  CONSTRAINT PK_MES_CQ_CheckVouchs PRIMARY KEY  CLUSTERED
  (
    did
  )
)
END

GO



---- �м����� ----