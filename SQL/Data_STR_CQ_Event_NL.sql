
 
---- �¼���  ��ʼ ----

--���۶���
/*==============================MES_CQ_DispatchList structure =============================*/
print 'dbo.MES_CQ_SO_SOMain...'
if not exists (select * from sysobjects where id = object_id('dbo.MES_CQ_SO_SOMain') and sysstat & 0xf = 3)
BEGIN
CREATE TABLE dbo.MES_CQ_SO_SOMain
(

	id  nvarchar(36),--Int  IDENTITY(1,1) not null ,-- ����ID ����ΨһKEY��
	operflag Int, -- �����ʾ 0δ���� 1����ɹ� 2����ʧ��	(�������ͱ��ں�����չ)	��/��Ĭ��Ϊ�񣬱�ʾ�������Ƿ񱻶�ȡ������߱�ҵ����á�
	createTime Datetime,	--����ʱ�� �����ݴ���ʱ��
	finishTime	Datetime, --���ʱ��	���������ʱ�䣬��Щҵ����Ҫ��д������Ҫ��ҵ���д��
	opertype Int,  -- ������ʾ	(ö��)	����/�޸�/ɾ�������ڼ�¼������¼���������޸Ļ���ɾ����
    cerrordesc nvarchar(4000) null ,  --������Ϣ
	cRemark	Nvarchar(255), --��ע	
	 
	cSoCode	Nvarchar(30), --������	ΨһKEY
	cCusCode	Nvarchar(20)	, --�ͻ�����
	cCusName	Nvarchar(98)	, --�ͻ�����
	cBusTypeID	Nvarchar(15), --ҵ������ID	
	cBusType	Nvarchar(8)	, -- ҵ����������
	cStCode	Nvarchar(2)	, --��������ID
	cStName	Nvarchar(20)	, --������������
	cDepCode	Nvarchar(12)	, --���۲���ID
	cDepName	Nvarchar(255)	,--���۲�������
	cPersonCode	Nvarchar(20)	,--ҵ��Ա����
	cPersonName	Nvarchar(40)	,--ҵ��Ա����
	cStatus	int	, --����״̬ 0=��Ч��1=��Ч��(MESֻ��Ҫ֪����Щ������Ҫ��������Щ����Ҫ)
	cSoRemark	Nvarchar(60), --��ע	  
  CONSTRAINT PK_MES_CQ_SO_SOMain PRIMARY KEY  CLUSTERED
  (
    id
  )
)
END

GO

/*==============================MES_CQ_SO_SODetails structure =============================*/
print 'dbo.MES_CQ_SO_SODetails...'
if not exists (select * from sysobjects where id = object_id('dbo.MES_CQ_SO_SODetails') and sysstat & 0xf = 3)
BEGIN
CREATE TABLE dbo.MES_CQ_SO_SODetails
(
	did	nvarchar(36),--Int IDENTITY(1,1) not null , --�ӱ�ID	���ӱ�����ΨһKEY
	id	nvarchar(36),--Int, -- ��������ID	���������¼��ID
	createTime Datetime, --����ʱ��	�����ݴ���ʱ��
	finishTime	Datetime,--���ʱ��	���������ʱ�䣬��Щҵ����Ҫ��д������Ҫ��ҵ���д��
	opertype Int,  -- ������ʾ	(ö��) 0/1/2	����/�޸�/ɾ�������ڼ�¼������¼���������޸Ļ���ɾ����
	cerrordesc nvarchar(4000) null ,  --������Ϣ
	operflag Int, -- �����ʾ	(�������ͱ��ں�����չ)	��/��
	isosid	int, --��ID
	cinvcode	Nvarchar(20), --��Ʒ���
	cinvname	Nvarchar(255), --��Ʒ����
	iquantity	Decimal(32,12), --��������


	 
  CONSTRAINT PK_MES_CQ_SO_SODetails PRIMARY KEY  CLUSTERED
  (
    did
  )
)
END

GO


--�ɹ������� �ӱ�  
/*==============================MES_CQ_PU_ArrivalVouchs structure =============================*/
print 'dbo.MES_CQ_PU_ArrivalVouchs...'   
if not exists (select * from sysobjects where id = object_id('dbo.MES_CQ_PU_ArrivalVouchs') and sysstat & 0xf = 3)
BEGIN
CREATE TABLE dbo.MES_CQ_PU_ArrivalVouchs
(
	did	nvarchar(36),--Int IDENTITY(1,1) not null , --�ӱ�ID	���ӱ�����ΨһKEY
	id	nvarchar(36),--Int, -- ��������ID	���������¼��ID
	createTime Datetime, --����ʱ��	�����ݴ���ʱ��
	finishTime	Datetime,--���ʱ��	���������ʱ�䣬��Щҵ����Ҫ��д������Ҫ��ҵ���д��
	opertype Int,  -- ������ʾ	(ö��)	0/1/2 ����/�޸�/ɾ�������ڼ�¼������¼���������޸Ļ���ɾ����
	cerrordesc nvarchar(4000) null ,  --������Ϣ
	operflag Int, -- �����ʾ	(�������ͱ��ں�����չ)	��/�� 

	dhCode	Nvarchar(20)	, --��������
	dhid	int	 , --��������ϸ�к�ID
	cPoCode	Nvarchar(20), --�ɹ�������	
	ddate	datetime	, --��������
	cVenCode	Nvarchar(20)	, --��Ӧ�̱���
	cDepCode	Nvarchar(12),--���ű���	
	cPersonCode	Nvarchar(20)	, --ҵ��Ա����
	cPTCode	Nvarchar(2)	,--�ɹ����ͱ���
	cPTName	Nvarchar(20), --�ɹ���������	
	cInvCode	Nvarchar(20)	,-- �������
	iquantity	Decimal(32,12),--����	
	cstatus	int default 1, -- ����״̬	0=��Ч��1=��Ч
	 
  CONSTRAINT PK_MES_CQ_PU_ArrivalVouchs PRIMARY KEY  CLUSTERED
  (
    did
  )
)
END

GO
  
--�ɹ��˻� ���ֲɹ���ⵥ
/*==============================MES_CQ_rdrecord01Ret structure =============================*/
print 'dbo.MES_CQ_rdrecord01Ret...'
if not exists (select * from sysobjects where id = object_id('dbo.MES_CQ_rdrecord01Ret') and sysstat & 0xf = 3)
BEGIN
CREATE TABLE dbo.MES_CQ_rdrecord01Ret
(

	id nvarchar(36),--Int  IDENTITY(1,1) not null ,-- ����ID ����ΨһKEY��
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

  CONSTRAINT PK_MES_CQ_rdrecord01Ret PRIMARY KEY  CLUSTERED
  (
    id
  )
)
END

GO

/*==============================MES_CQ_rdrecords01Ret structure =============================*/
print 'dbo.MES_CQ_rdrecord10...'
if not exists (select * from sysobjects where id = object_id('dbo.MES_CQ_rdrecords01Ret') and sysstat & 0xf = 3)
BEGIN
CREATE TABLE dbo.MES_CQ_rdrecords01Ret
(
	did	nvarchar(36),--Int IDENTITY(1,1) not null , --�ӱ�ID	���ӱ�����ΨһKEY
	id	nvarchar(36),--Int, -- ��������ID	���������¼��ID
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
	  
  CONSTRAINT PK_MES_CQ_rdrecords01Ret PRIMARY KEY  CLUSTERED
  (
    did
  )
)
END

GO
 
--�����ƻ�  MRP    MQ6303 

/*==============================MES_CQ_mps_netdemand structure =============================*/
print 'dbo.MES_CQ_mps_netdemand...'
if not exists (select * from sysobjects where id = object_id('dbo.MES_CQ_mps_netdemand') and sysstat & 0xf = 3)
BEGIN
CREATE TABLE dbo.MES_CQ_mps_netdemand
(
	did	nvarchar(36),--Int IDENTITY(1,1) not null , --�ӱ�ID	���ӱ�����ΨһKEY
	id	nvarchar(36),--Int, -- ��������ID	���������¼��ID
	createTime Datetime, --����ʱ��	�����ݴ���ʱ��
	finishTime	Datetime,--���ʱ��	���������ʱ�䣬��Щҵ����Ҫ��д������Ҫ��ҵ���д��
	opertype Int,  -- ������ʾ	(ö��) 0/1/2	����/�޸�/ɾ�������ڼ�¼������¼���������޸Ļ���ɾ����
	cerrordesc nvarchar(4000) null ,  --������Ϣ
	operflag Int, -- �����ʾ 0δ���� 1����ɹ� 2����ʧ��	(�������ͱ��ں�����չ)	��/��
 
	PlanCode	Nvarchar(30), --�ƻ���	
	DemandId	int	, --�ƻ����к�
	cInvCode	Nvarchar(20)	, --��Ʒ����
	iquantity	Decimal(32,12)	, --����
	cSoCode	Nvarchar(30), --���۶�����	
	cForCode	Nvarchar(30)	, --Ԥ�ⶩ����
	PStartDate	datetime	,--�ƻ���ʼ����
	PDueDate	datetime	,--�ƻ���������
	DmandDate	datetime	, --��������
	cRemark	Nvarchar(255)	, --��ע

	  
  CONSTRAINT PK_MES_CQ_mps_netdemand PRIMARY KEY  CLUSTERED
  (
    did
  )
)
END

GO



--��������
/*==============================MES_CQ_mom_order structure =============================*/
print 'dbo.MES_CQ_mom_order...'
if not exists (select * from sysobjects where id = object_id('dbo.MES_CQ_mom_order') and sysstat & 0xf = 3)
BEGIN
CREATE TABLE dbo.MES_CQ_mom_order  
(

	id nvarchar(36),--Int  IDENTITY(1,1) not null ,-- ����ID ����ΨһKEY��
	operflag Int, -- �����ʾ	(�������ͱ��ں�����չ)	��/��Ĭ��Ϊ�񣬱�ʾ�������Ƿ񱻶�ȡ������߱�ҵ����á�
	createTime Datetime,	--����ʱ�� �����ݴ���ʱ��
	finishTime	Datetime, --���ʱ��	���������ʱ�䣬��Щҵ����Ҫ��д������Ҫ��ҵ���д��
	opertype Int,  -- ������ʾ	(ö��)	0/1/2 ����/�޸�/ɾ�������ڼ�¼������¼���������޸Ļ���ɾ����
    cerrordesc nvarchar(4000) null ,  --������Ϣ

	PlanCode	Nvarchar(30), --�ƻ���	
	MoCode	Nvarchar(30)	, --����������
	cWcCode	Nvarchar(8)	, --��������
	cInvCode	Nvarchar(20)	, --��Ʒ����
	iquantity	Decimal(32,12)	, --����
	cSoCode	Nvarchar(30)	, --���۶�����
	cForCode	Nvarchar(30)	, --Ԥ�ⶩ����
	PStartDate	datetime	, --�ƻ���ʼ����
	PDueDate	datetime	, --�ƻ���������
	DmandDate	datetime	, --��������
	MoType	int	, --�������� 0/1/2 (����/����/����)id
	cremark	NVarchar(255)	, -- ��ע
   

  CONSTRAINT PK_MES_CQ_mom_order PRIMARY KEY  CLUSTERED
  (
    id
  )
)
END

GO

/*==============================MES_CQ_mom_orderdetail structure =============================*/
print 'dbo.MES_CQ_mom_orderdetail...'
if not exists (select * from sysobjects where id = object_id('dbo.MES_CQ_mom_orderdetail') and sysstat & 0xf = 3)
BEGIN
CREATE TABLE dbo.MES_CQ_mom_orderdetail  
(
	did	nvarchar(36),--Int IDENTITY(1,1) not null , --�ӱ�ID	���ӱ�����ΨһKEY
	id	nvarchar(36),--Int, -- ��������ID	���������¼��ID
	createTime Datetime, --����ʱ��	�����ݴ���ʱ��
	finishTime	Datetime,--���ʱ��	���������ʱ�䣬��Щҵ����Ҫ��д������Ҫ��ҵ���д��
	opertype Int,  -- ������ʾ	(ö��)	����/�޸�/ɾ�������ڼ�¼������¼���������޸Ļ���ɾ����
	cerrordesc nvarchar(4000) null ,  --������Ϣ
	operflag Int, -- �����ʾ	(�������ͱ��ں�����չ)	��/��

  	MoCode	Varchar(32)	, --������
	BomID	Varchar(32), --BOM���	ȡ����BOM��ID��
	cInvCode	Nvarchar(20), --���ϱ��	
	iquantity	float,-- ����(����)	���������

	  
  CONSTRAINT PK_MES_CQ_mom_orderdetail PRIMARY KEY  CLUSTERED
  (
    did
  )
)
END
GO


--BOM
/*==============================MES_CQ_bom_bom structure =============================*/
print 'dbo.MES_CQ_bom_bom...'
if not exists (select * from sysobjects where id = object_id('dbo.MES_CQ_bom_bom') and sysstat & 0xf = 3)
BEGIN
CREATE TABLE dbo.MES_CQ_bom_bom
(

	id nvarchar(36),--Int  IDENTITY(1,1) not null ,-- ����ID ����ΨһKEY��
	operflag Int, -- �����ʾ	(�������ͱ��ں�����չ)	��/��Ĭ��Ϊ�񣬱�ʾ�������Ƿ񱻶�ȡ������߱�ҵ����á�
	createTime Datetime,	--����ʱ�� �����ݴ���ʱ��
	finishTime	Datetime, --���ʱ��	���������ʱ�䣬��Щҵ����Ҫ��д������Ҫ��ҵ���д��
	opertype Int,  -- ������ʾ	(ö��)	0/1/2 ����/�޸�/ɾ�������ڼ�¼������¼���������޸Ļ���ɾ����
    cerrordesc nvarchar(4000) null ,  --������Ϣ

	bomid	Int	, --BOM���
	[Version]	Int	, --�汾��
	VersionEffDate	datetime, --�汾ʱ��	
	cInvCode	Nvarchar(20), --��Ʒ���	
	status	int, --״̬	0=��Ч��1=��Ч 

  CONSTRAINT PK_MES_CQ_bom_bom PRIMARY KEY  CLUSTERED
  (
    id
  )
)
END

GO

/*==============================MES_CQ_bom_opcomponent structure =============================*/
print 'dbo.MES_CQ_bom_opcomponent...'
if not exists (select * from sysobjects where id = object_id('dbo.MES_CQ_bom_opcomponent') and sysstat & 0xf = 3)
BEGIN
CREATE TABLE dbo.MES_CQ_bom_opcomponent
(
	did	nvarchar(36),--Int IDENTITY(1,1) not null , --�ӱ�ID	���ӱ�����ΨһKEY
	id	nvarchar(36),--Int, -- ��������ID	���������¼��ID
	createTime Datetime, --����ʱ��	�����ݴ���ʱ��
	finishTime	Datetime,--���ʱ��	���������ʱ�䣬��Щҵ����Ҫ��д������Ҫ��ҵ���д��
	opertype Int,  -- ������ʾ	(ö��)	����/�޸�/ɾ�������ڼ�¼������¼���������޸Ļ���ɾ����
	cerrordesc nvarchar(4000) null ,  --������Ϣ
	operflag Int, -- �����ʾ	(�������ͱ��ں�����չ)	��/��

	cInvCode	Nvarchar(20), --���ϱ��	
	BaseQtyN	float, --��׼����	�Ӽ�����
	BaseQtyD	float, --��׼����	ĸ������
	 
  CONSTRAINT PK_MES_CQ_bom_opcomponent PRIMARY KEY  CLUSTERED
  (
    did
  )
)
END
GO





--��װ��     0308
print 'dbo.MES_CQ_AssemVouch...'
if not exists (select * from sysobjects where id = object_id('dbo.MES_CQ_AssemVouch') and sysstat & 0xf = 3)
BEGIN
CREATE TABLE dbo.MES_CQ_AssemVouch
(

	id nvarchar(36),--Int  IDENTITY(1,1) not null ,-- ����ID ����ΨһKEY��
	operflag Int, -- �����ʾ	(�������ͱ��ں�����չ)	��/��Ĭ��Ϊ�񣬱�ʾ�������Ƿ񱻶�ȡ������߱�ҵ����á�
	createTime Datetime,	--����ʱ�� �����ݴ���ʱ��
	finishTime	Datetime, --���ʱ��	���������ʱ�䣬��Щҵ����Ҫ��д������Ҫ��ҵ���д��
	opertype Int,  -- ������ʾ	(ö��)	0/1/2 ����/�޸�/ɾ�������ڼ�¼������¼���������޸Ļ���ɾ����
    cerrordesc nvarchar(4000) null ,  --������Ϣ

    cAVCode	Nvarchar(30)	, --����
	dAVDate	Datetime	, --����
	cIRdCode	Nvarchar(5), --������	��װ��
	cDepCode	Nvarchar(12), --����	
	cORdCode	Nvarchar(5), --��������	�������ⵥ���
	cODepCode	Nvarchar(12), --����	����������ⲿ��

	 
  CONSTRAINT PK_MES_CQ_AssemVouch PRIMARY KEY  CLUSTERED
  (
    id
  )
)
END

GO

/*==============================MES_CQ_AssemVouchs structure =============================*/
print 'dbo.MES_CQ_AssemVouchs...'
if not exists (select * from sysobjects where id = object_id('dbo.MES_CQ_AssemVouchs') and sysstat & 0xf = 3)
BEGIN
CREATE TABLE dbo.MES_CQ_AssemVouchs
(
	did	nvarchar(36),--Int IDENTITY(1,1) not null , --�ӱ�ID	���ӱ�����ΨһKEY
	id	nvarchar(36),--Int, -- ��������ID	���������¼��ID
	createTime Datetime, --����ʱ��	�����ݴ���ʱ��
	finishTime	Datetime,--���ʱ��	���������ʱ�䣬��Щҵ����Ҫ��д������Ҫ��ҵ���д��
	opertype Int,  -- ������ʾ	(ö��) 0/1/2	����/�޸�/ɾ�������ڼ�¼������¼���������޸Ļ���ɾ����
	cerrordesc nvarchar(4000) null ,  --������Ϣ
	operflag Int, -- �����ʾ	(�������ͱ��ں�����չ)	��/��

	cAVDID	int, --�ӱ��к�	ERP
	bAVType	Nvarchar(20), --����	ֵ��ɢ�����׼����׼���Ϊ���������ϸ��ɢ����Ϊ����������ϸ��
	cInvCode	Nvarchar(20)	, --�������
	cWhCode	Nvarchar(10), --�ֿ�	��Ϊ���������Ĳֿ�
	iquantity	Decimal(32,12)	, --����


  CONSTRAINT PK_MES_CQ_AssemVouchs PRIMARY KEY  CLUSTERED
  (
    did
  )
)
END

GO

  

--��ж��     0309
print 'dbo.MES_CQ_AssemVouchRet...'
if not exists (select * from sysobjects where id = object_id('dbo.MES_CQ_AssemVouchRet') and sysstat & 0xf = 3)
BEGIN
CREATE TABLE dbo.MES_CQ_AssemVouchRet
(

	id nvarchar(36),--Int  IDENTITY(1,1) not null ,-- ����ID ����ΨһKEY��
	operflag Int, -- �����ʾ	(�������ͱ��ں�����չ)	��/��Ĭ��Ϊ�񣬱�ʾ�������Ƿ񱻶�ȡ������߱�ҵ����á�
	createTime Datetime,	--����ʱ�� �����ݴ���ʱ��
	finishTime	Datetime, --���ʱ��	���������ʱ�䣬��Щҵ����Ҫ��д������Ҫ��ҵ���д��
	opertype Int,  -- ������ʾ	(ö��)	0/1/2 ����/�޸�/ɾ�������ڼ�¼������¼���������޸Ļ���ɾ����
    cerrordesc nvarchar(4000) null ,  --������Ϣ

    cAVCode	Nvarchar(30)	, --����
	dAVDate	Datetime	, --����
	cIRdCode	Nvarchar(5), --������	��װ��
	cDepCode	Nvarchar(12), --����	
	cORdCode	Nvarchar(5), --��������	�������ⵥ���
	cODepCode	Nvarchar(12), --����	����������ⲿ��
   
  CONSTRAINT PK_MES_CQ_AssemVouchRet PRIMARY KEY  CLUSTERED
  (
    id
  )
)
END

GO

/*==============================MES_CQ_AssemVouchRets structure =============================*/
print 'dbo.MES_CQ_AssemVouchRets...'
if not exists (select * from sysobjects where id = object_id('dbo.MES_CQ_AssemVouchRets') and sysstat & 0xf = 3)
BEGIN
CREATE TABLE dbo.MES_CQ_AssemVouchRets
(
	did	nvarchar(36),--Int IDENTITY(1,1) not null , --�ӱ�ID	���ӱ�����ΨһKEY
	id	nvarchar(36),--Int, -- ��������ID	���������¼��ID
	createTime Datetime, --����ʱ��	�����ݴ���ʱ��
	finishTime	Datetime,--���ʱ��	���������ʱ�䣬��Щҵ����Ҫ��д������Ҫ��ҵ���д��
	opertype Int,  -- ������ʾ	(ö��) 0/1/2	����/�޸�/ɾ�������ڼ�¼������¼���������޸Ļ���ɾ����
	cerrordesc nvarchar(4000) null ,  --������Ϣ
	operflag Int, -- �����ʾ	(�������ͱ��ں�����չ)	��/��
	 
	cAVDID	int, --�ӱ��к�	ERP
	bAVType	Nvarchar(20), --����	ֵ��ɢ�����׼����׼���Ϊ���������ϸ��ɢ����Ϊ����������ϸ��
	cInvCode	Nvarchar(20)	, --�������
	cWhCode	Nvarchar(10), --�ֿ�	��Ϊ���������Ĳֿ�
	iquantity	Decimal(32,12)	, --����
	 
  CONSTRAINT PK_MES_CQ_AssemVouchRets PRIMARY KEY  CLUSTERED
  (
    did
  )
)
END

GO


/*==============================MES_CQ_Department structure =============================*/
print 'dbo.MES_CQ_Department...'
if not exists (select * from sysobjects where id = object_id('dbo.MES_CQ_Department') and sysstat & 0xf = 3)
BEGIN
CREATE TABLE dbo.MES_CQ_Department
(
	id	nvarchar(36),--Int IDENTITY(1,1) not null , --��ID	���ӱ�����ΨһKEY 
	operflag Int, -- �����ʾ 0δ���� 1����ɹ� 2����ʧ��	(�������ͱ��ں�����չ)	��/��Ĭ��Ϊ�񣬱�ʾ�������Ƿ񱻶�ȡ������߱�ҵ����á�
	createTime Datetime,	--����ʱ�� �����ݴ���ʱ��
	finishTime	Datetime, --���ʱ��	���������ʱ�䣬��Щҵ����Ҫ��д������Ҫ��ҵ���д��
	opertype Int,  -- ������ʾ	(ö��)	����/�޸�/ɾ�������ڼ�¼������¼���������޸Ļ���ɾ����
	cerrordesc nvarchar(4000) null ,  --������Ϣ

	cDepCode	Nvarchar(12),--���ű��
	cDepName	Nvarchar(255), --��������
	cLDepCode	Nvarchar(12), --�ϼ����� 
  CONSTRAINT PK_MES_CQ_Department PRIMARY KEY  CLUSTERED
  (
    id
  )
)
END

GO


/*==============================MES_CQ_WorkCenter structure =============================*/
print 'dbo.MES_CQ_WorkCenter...'   
if not exists (select * from sysobjects where id = object_id('dbo.MES_CQ_WorkCenter') and sysstat & 0xf = 3)
BEGIN
CREATE TABLE dbo.MES_CQ_WorkCenter
(
	id	nvarchar(36),--Int IDENTITY(1,1) not null , --��ID	���ӱ�����ΨһKEY 
	operflag Int, -- �����ʾ 0δ���� 1����ɹ� 2����ʧ��	(�������ͱ��ں�����չ)	��/��Ĭ��Ϊ�񣬱�ʾ�������Ƿ񱻶�ȡ������߱�ҵ����á�
	createTime Datetime,	--����ʱ�� �����ݴ���ʱ��
	finishTime	Datetime, --���ʱ��	���������ʱ�䣬��Щҵ����Ҫ��д������Ҫ��ҵ���д��
	opertype Int,  -- ������ʾ	(ö��)	����/�޸�/ɾ�������ڼ�¼������¼���������޸Ļ���ɾ����
	cerrordesc nvarchar(4000) null ,  --������Ϣ

	WcCode	Nvarchar(8), --���	
	[Description]	Nvarchar(60), --����	
	iType	Nvarchar(10), --������������	�������ġ��ֿ�,��������ڲ��ű���,������������,����ٲֿ⵵����,���ǲֿ�

  CONSTRAINT PK_MES_CQ_WorkCenter PRIMARY KEY  CLUSTERED
  (
    id
  )
)
END

GO

--�ͻ�����
/*==============================MES_CQ_Customer structure =============================*/
print 'dbo.MES_CQ_Customer...'
if not exists (select * from sysobjects where id = object_id('dbo.MES_CQ_Customer') and sysstat & 0xf = 3)
BEGIN
	CREATE TABLE dbo.MES_CQ_Customer
	(
		id	nvarchar(36),--Int IDENTITY(1,1) not null , --��ID	���ӱ�����ΨһKEY 
		operflag Int, -- �����ʾ 0δ���� 1����ɹ� 2����ʧ��	(�������ͱ��ں�����չ)	��/��Ĭ��Ϊ�񣬱�ʾ�������Ƿ񱻶�ȡ������߱�ҵ����á�
		createTime Datetime,	--����ʱ�� �����ݴ���ʱ��
		finishTime	Datetime, --���ʱ��	���������ʱ�䣬��Щҵ����Ҫ��д������Ҫ��ҵ���д��
		opertype Int,  -- ������ʾ	(ö��)	����/�޸�/ɾ�������ڼ�¼������¼���������޸Ļ���ɾ����
		cerrordesc nvarchar(4000) null ,  --������Ϣ

		cCusCode	Nvarchar(20), --���
		cCusName	Nvarchar(98), --����
		cCCCode	Nvarchar(12), --�ͻ�����
		cCusAddress	Nvarchar(255),--�ͻ���ַ
		cCusOType	Nvarchar(10), --���˷�ʽ���
	  CONSTRAINT PK_MES_CQ_Customer PRIMARY KEY  CLUSTERED
	  (
		id
	  )
	)
END

GO

--��Ӧ�̵���
/*==============================MES_CQ_Vendor structure =============================*/
print 'dbo.MES_CQ_Vendor...'
if not exists (select * from sysobjects where id = object_id('dbo.MES_CQ_Vendor') and sysstat & 0xf = 3)
BEGIN
	CREATE TABLE dbo.MES_CQ_Vendor
	(
		id	nvarchar(36),--Int IDENTITY(1,1) not null , --��ID	���ӱ�����ΨһKEY 
		operflag Int, -- �����ʾ 0δ���� 1����ɹ� 2����ʧ��	(�������ͱ��ں�����չ)	��/��Ĭ��Ϊ�񣬱�ʾ�������Ƿ񱻶�ȡ������߱�ҵ����á�
		createTime Datetime,	--����ʱ�� �����ݴ���ʱ��
		finishTime	Datetime, --���ʱ��	���������ʱ�䣬��Щҵ����Ҫ��д������Ҫ��ҵ���д��
		opertype Int,  -- ������ʾ	(ö��)	����/�޸�/ɾ�������ڼ�¼������¼���������޸Ļ���ɾ����
		cerrordesc nvarchar(4000) null ,  --������Ϣ

		cVenCode	Nvarchar(20), --���
		cVenName	Nvarchar(98), --����
		cVCCode	Nvarchar(12), --��Ӧ�����
		cVenContact	Nvarchar(20),--��ϵ��
		cVenContactPhone	Nvarchar(30), --��ϵ�绰
	  CONSTRAINT PK_MES_CQ_Vendor PRIMARY KEY  CLUSTERED
	  (
		id
	  )
	)
END

GO

--��Ա����
/*==============================MES_CQ_Person structure =============================*/
print 'dbo.MES_CQ_Person...'
if not exists (select * from sysobjects where id = object_id('dbo.MES_CQ_Person') and sysstat & 0xf = 3)
BEGIN
	CREATE TABLE dbo.MES_CQ_Person
	(
		id	nvarchar(36),--Int IDENTITY(1,1) not null , --��ID	���ӱ�����ΨһKEY 
		operflag Int, -- �����ʾ 0δ���� 1����ɹ� 2����ʧ��	(�������ͱ��ں�����չ)	��/��Ĭ��Ϊ�񣬱�ʾ�������Ƿ񱻶�ȡ������߱�ҵ����á�
		createTime Datetime,	--����ʱ�� �����ݴ���ʱ��
		finishTime	Datetime, --���ʱ��	���������ʱ�䣬��Щҵ����Ҫ��д������Ҫ��ҵ���д��
		opertype Int,  -- ������ʾ	(ö��)	����/�޸�/ɾ�������ڼ�¼������¼���������޸Ļ���ɾ����
		cerrordesc nvarchar(4000) null ,  --������Ϣ

		cPersonCode	Nvarchar(20), --���
		cPersonName	Nvarchar(40), --����
		PersonType	Nvarchar(30),--��Ա���
		cDepCode	Nvarchar(12), --��������
		Sex	Nvarchar(2), --�Ա�
		dBirthDate	datetime,--��������
		cPsnEmail	Nvarchar(100), --����
	  CONSTRAINT PK_MES_CQ_Person PRIMARY KEY  CLUSTERED
	  (
		id
	  )
	)
END

GO


--�������
/*==============================MES_CQ_Inventory structure =============================*/
print 'dbo.MES_CQ_Inventory...'
if not exists (select * from sysobjects where id = object_id('dbo.MES_CQ_Inventory') and sysstat & 0xf = 3)
BEGIN
	CREATE TABLE dbo.MES_CQ_Inventory
	(
		id	nvarchar(36),--Int IDENTITY(1,1) not null , --��ID	���ӱ�����ΨһKEY 
		operflag Int, -- �����ʾ 0δ���� 1����ɹ� 2����ʧ��	(�������ͱ��ں�����չ)	��/��Ĭ��Ϊ�񣬱�ʾ�������Ƿ񱻶�ȡ������߱�ҵ����á�
		createTime Datetime,	--����ʱ�� �����ݴ���ʱ��
		finishTime	Datetime, --���ʱ��	���������ʱ�䣬��Щҵ����Ҫ��д������Ҫ��ҵ���д��
		opertype Int,  -- ������ʾ	(ö��)	����/�޸�/ɾ�������ڼ�¼������¼���������޸Ļ���ɾ����
		cerrordesc nvarchar(4000) null ,  --������Ϣ

		cInvCode	Nvarchar(20),--���ϱ���	
		cInvName	Nvarchar(255),--��������
		cInvAddCode NVARCHAR(255), --�������,	
		cInvStd	Nvarchar(255), --����ͺ�	ȡһ���ֶ�
		cWhCode	Nvarchar(10), --Ĭ�ϲֿ�	
		cInvCName	Nvarchar(255), --�������	�������ERP
		iInvType	Nvarchar(10), --��������	�ɹ�(��ͨ����)������(����Ʒ),
		cComUnitName	Nvarchar(20), --��������λ	
		bPropertyCheck	bit	,--�Ƿ��ʼ�

	  CONSTRAINT PK_MES_CQ_Inventory PRIMARY KEY  CLUSTERED
	  (
		id
	  )
	)
END

GO




	


	


 
---- �¼������ ----