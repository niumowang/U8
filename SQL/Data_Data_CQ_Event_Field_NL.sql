--���۶������� FOR CQ  DELETE  MES_FIELDCMP where  ctable= 'MES_CQ_SO_SOMain'
if not exists(select * from MES_FIELDCMP where cfield= 'id' and ctable= 'MES_CQ_SO_SOMain')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  1, null,  'id',  '��־����', 32,  'nvarchar',  '���۶�������',  'MES_CQ_SO_SOMain',  '���۶�������',  '871',  'main|##newguid',  5,  'ҵ����')
if not exists(select * from MES_FIELDCMP where cfield= 'cSoCode' and ctable= 'MES_CQ_SO_SOMain')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  1, null,  'cSoCode',  '������', 30,  'nvarchar',  '���۶�������',  'MES_CQ_SO_SOMain',  '���۶�������',  '871',  'cSoCode',  1,  'ҵ����')
if not exists(select * from MES_FIELDCMP where cfield= 'cCusCode' and ctable= 'MES_CQ_SO_SOMain')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  1, null,  'cCusCode',  '�ͻ�����', 20,  'nvarchar',  '���۶�������',  'MES_CQ_SO_SOMain',  '���۶�������',  '871',  'cCusCode',  1,  'ҵ����')
if not exists(select * from MES_FIELDCMP where cfield= 'cCusName' and ctable= 'MES_CQ_SO_SOMain')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  1, null,  'cCusName',  '�ͻ�����', 98,  'nvarchar',  '���۶�������',  'MES_CQ_SO_SOMain',  '���۶�������',  '871',  'cCusName',  1,  'ҵ����')
if not exists(select * from MES_FIELDCMP where cfield= 'cBusTypeID' and ctable= 'MES_CQ_SO_SOMain')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  1, null,  'cBusTypeID',  'ҵ������ID', 15,  'nvarchar',  '���۶�������',  'MES_CQ_SO_SOMain',  '���۶�������',  '871',  'cBusType',  1,  'ҵ����')
if not exists(select * from MES_FIELDCMP where cfield= 'cBusType' and ctable= 'MES_CQ_SO_SOMain')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  1, null,  'cBusType',  'ҵ����������', 8,  'nvarchar',  '���۶�������',  'MES_CQ_SO_SOMain',  '���۶�������',  '871',  'cBusType',  1,  'ҵ����')
if not exists(select * from MES_FIELDCMP where cfield= 'cStCode' and ctable= 'MES_CQ_SO_SOMain')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  1, null,  'cStCode',  '��������ID', 2,  'nvarchar',  '���۶�������',  'MES_CQ_SO_SOMain',  '���۶�������',  '871',  'cStCode',  1,  'ҵ����')
if not exists(select * from MES_FIELDCMP where cfield= 'cStName' and ctable= 'MES_CQ_SO_SOMain')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  1, null,  'cStName',  '������������', 20,  'nvarchar',  '���۶�������',  'MES_CQ_SO_SOMain',  '���۶�������',  '871',  'cStName',  1,  'ҵ����')
if not exists(select * from MES_FIELDCMP where cfield= 'cDepCode' and ctable= 'MES_CQ_SO_SOMain')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  1, null,  'cDepCode',  '���۲���ID', 12,  'nvarchar',  '���۶�������',  'MES_CQ_SO_SOMain',  '���۶�������',  '871',  'cDepCode',  1,  'ҵ����')
if not exists(select * from MES_FIELDCMP where cfield= 'cDepName' and ctable= 'MES_CQ_SO_SOMain')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  1, null,  'cDepName',  '���۲�������', 255,  'nvarchar',  '���۶�������',  'MES_CQ_SO_SOMain',  '���۶�������',  '871',  'cDepName',  1,  'ҵ����')
if not exists(select * from MES_FIELDCMP where cfield= 'cPersonCode' and ctable= 'MES_CQ_SO_SOMain')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  1, null,  'cPersonCode',  'ҵ��Ա����', 20,  'nvarchar',  '���۶�������',  'MES_CQ_SO_SOMain',  '���۶�������',  '871',  'cPersonCode',  1,  'ҵ����')
if not exists(select * from MES_FIELDCMP where cfield= 'cPersonName' and ctable= 'MES_CQ_SO_SOMain')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  1, null,  'cPersonName',  'ҵ��Ա����', 40,  'nvarchar',  '���۶�������',  'MES_CQ_SO_SOMain',  '���۶�������',  '871',  'cPersonName',  1,  'ҵ����')
--if not exists(select * from MES_FIELDCMP where cfield= 'Flag' and ctable= 'MES_CQ_SO_SOMain')
--  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
--  ('0',  0, null,  'Flag',  '������ʶ',  2,  'nvarchar',  '���۶�������',  'MES_CQ_SO_SOMain',  '���۶�������',  '861',  '1',  3,  'ҵ����')

GO
    
--���۶����ӱ� FOR CQ  DELETE  MES_FIELDCMP where  ctable= 'MES_CQ_SO_SODetails'
if not exists(select * from MES_FIELDCMP where cfield= 'id' and ctable= 'MES_CQ_SO_SODetails')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  0, null,  'id',  '����id',  32,  'nvarchar',  '���۶����ӱ�',  'MES_CQ_SO_SODetails',  '���۶����ӱ�',  '861',  'main|##newguid',  5,  'ҵ����')
if not exists(select * from MES_FIELDCMP where cfield= 'did' and ctable= 'MES_CQ_SO_SODetails')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  1, null,  'did',  '��־�ӱ�����', 32,  'nvarchar',  '���۶�������',  'MES_CQ_SO_SODetails',  '���۶�������',  '871',  '##newguid',  5,  'ҵ����')
if not exists(select * from MES_FIELDCMP where cfield= 'isosid' and ctable= 'MES_CQ_SO_SODetails')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  1, null,  'isosid',  '��ID', 32,  'nvarchar',  '���۶����ӱ�',  'MES_CQ_SO_SODetails',  '���۶����ӱ�',  '871',  'isosid',  1,  'ҵ����')
if not exists(select * from MES_FIELDCMP where cfield= 'cinvcode' and ctable= 'MES_CQ_SO_SODetails')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  1, null,  'cinvcode',  '��Ʒ����', 20,  'nvarchar',  '���۶����ӱ�',  'MES_CQ_SO_SODetails',  '���۶����ӱ�',  '871',  'cinvcode',  1,  'ҵ����')
if not exists(select * from MES_FIELDCMP where cfield= 'cinvname' and ctable= 'MES_CQ_SO_SODetails')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  1, null,  'cinvname',  '��Ʒ����', 255,  'nvarchar',  '���۶����ӱ�',  'MES_CQ_SO_SODetails',  '���۶����ӱ�',  '871',  'cinvname',  1,  'ҵ����')
if not exists(select * from MES_FIELDCMP where cfield= 'iquantity' and ctable= 'MES_CQ_SO_SODetails')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  1, null,  'iquantity',  '��������', 32,  'decimal',  '���۶����ӱ�',  'MES_CQ_SO_SODetails',  '���۶����ӱ�',  '871',  'iquantity',  1,  'ҵ����')
--if not exists(select * from MES_FIELDCMP where cfield= 'Flag' and ctable= 'MES_CQ_SO_SODetails')
--  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
--  ('0',  0, null,  'Flag',  '������ʶ',  2,  'nvarchar',  '���۶����ӱ�',  'MES_CQ_SO_SODetails',  '���۶����ӱ�',  '861',  '1',  3,  'ҵ����')

GO 
 
--�ɹ��������ӱ� FOR CQ  DELETE  MES_FIELDCMP where  ctable= 'MES_CQ_PU_ArrivalVouchs'
if not exists(select * from MES_FIELDCMP where cfield= 'did' and ctable= 'MES_CQ_PU_ArrivalVouchs')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  1, null,  'did',  '��־�ӱ�����', 32,  'nvarchar',  '�ɹ��������ӱ�',  'MES_CQ_PU_ArrivalVouchs',  '�ɹ��������ӱ�',  '871',  '##newguid',  5,  'ҵ����')

if not exists(select * from MES_FIELDCMP where cfield= 'dhCode' and ctable= 'MES_CQ_PU_ArrivalVouchs')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  0, null,  'dhCode',  '��������',  20,  'nvarchar',  '�ɹ��������ӱ�',  'MES_CQ_PU_ArrivalVouchs',  '�ɹ��������ӱ�',  '861',  'dhCode',  1,  'ҵ����')
if not exists(select * from MES_FIELDCMP where cfield= 'dhid' and ctable= 'MES_CQ_PU_ArrivalVouchs')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  0, null,  'dhid',  '��������ϸ�к�ID',  20,  'int',  '�ɹ��������ӱ�',  'MES_CQ_PU_ArrivalVouchs',  '�ɹ��������ӱ�',  '861',  'dhid',  1,  'ҵ����')
if not exists(select * from MES_FIELDCMP where cfield= 'cPoCode' and ctable= 'MES_CQ_PU_ArrivalVouchs')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  0, null,  'cPoCode',  '�ɹ�������',  20,  'nvarchar',  '�ɹ��������ӱ�',  'MES_CQ_PU_ArrivalVouchs',  '�ɹ��������ӱ�',  '861',  'cPoCode',  1,  'ҵ����')
if not exists(select * from MES_FIELDCMP where cfield= 'ddate' and ctable= 'MES_CQ_PU_ArrivalVouchs')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  0, null,  'ddate',  '��������',  20,  'datetime',  '�ɹ��������ӱ�',  'MES_CQ_PU_ArrivalVouchs',  '�ɹ��������ӱ�',  '861',  'ddate',  1,  'ҵ����')
 if not exists(select * from MES_FIELDCMP where cfield= 'cVenCode' and ctable= 'MES_CQ_PU_ArrivalVouchs')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  0, null,  'cVenCode',  '��Ӧ�̱���',  20,  'nvarchar',  '�ɹ��������ӱ�',  'MES_CQ_PU_ArrivalVouchs',  '�ɹ��������ӱ�',  '861',  'cVenCode',  1,  'ҵ����')
if not exists(select * from MES_FIELDCMP where cfield= 'cDepCode' and ctable= 'MES_CQ_PU_ArrivalVouchs')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  0, null,  'cDepCode',  '���ű���',  12,  'nvarchar',  '�ɹ��������ӱ�',  'MES_CQ_PU_ArrivalVouchs',  '�ɹ��������ӱ�',  '861',  'cDepCode',  1,  'ҵ����')
if not exists(select * from MES_FIELDCMP where cfield= 'cPersonCode' and ctable= 'MES_CQ_PU_ArrivalVouchs')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  0, null,  'cPersonCode',  'ҵ��Ա����',  20,  'nvarchar',  '�ɹ��������ӱ�',  'MES_CQ_PU_ArrivalVouchs',  '�ɹ��������ӱ�',  '861',  'cPersonCode',  1,  'ҵ����')
if not exists(select * from MES_FIELDCMP where cfield= 'cPTCode' and ctable= 'MES_CQ_PU_ArrivalVouchs')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  0, null,  'cPTCode',  '�ɹ����ͱ���',  2,  'nvarchar',  '�ɹ��������ӱ�',  'MES_CQ_PU_ArrivalVouchs',  '�ɹ��������ӱ�',  '861',  'cPTCode',  1,  'ҵ����')
if not exists(select * from MES_FIELDCMP where cfield= 'cPTName' and ctable= 'MES_CQ_PU_ArrivalVouchs')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  0, null,  'cPTName',  '�ɹ���������',  20,  'nvarchar',  '�ɹ��������ӱ�',  'MES_CQ_PU_ArrivalVouchs',  '�ɹ��������ӱ�',  '861',  'cPTName',  1,  'ҵ����')
if not exists(select * from MES_FIELDCMP where cfield= 'cInvCode' and ctable= 'MES_CQ_PU_ArrivalVouchs')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  0, null,  'cInvCode',  '�������',  20,  'nvarchar',  '�ɹ��������ӱ�',  'MES_CQ_PU_ArrivalVouchs',  '�ɹ��������ӱ�',  '861',  'cInvCode',  1,  'ҵ����')
if not exists(select * from MES_FIELDCMP where cfield= 'iquantity' and ctable= 'MES_CQ_PU_ArrivalVouchs')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  0, null,  'iquantity',  '����',  32,  'Decimal',  '�ɹ��������ӱ�',  'MES_CQ_PU_ArrivalVouchs',  '�ɹ��������ӱ�',  '861',  'iquantity',  1,  'ҵ����')
   
GO



    
----�¼��ֶζ��ձ�	 
/*======================= table data: [MES_FIELDCMP] ========================*/
print 'dbo.[MES_FIELDCMP] data...'  
-- ������������ 
if not exists(select * from MES_FIELDCMP where cfield= 'id' and ctable= 'MES_CQ_mom_order')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  0, null,  'id',  '����id',  32,  'nvarchar',  '��������',  'MES_CQ_mom_order',  '������������',  '861',  'main|##newguid',  5,  'ҵ����')
GO

-- ���������ӱ�  
--if not exists(select * from MES_FIELDCMP where cfield= 'did' and ctable= 'MES_CQ_Mom_orderdetail')
--  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
--  ('0',  0, null,  'did',  '����id',  32,  'nvarchar',  '���������ӱ�',  'MES_CQ_Mom_orderdetail',  '���������ӱ�',  '861',  '##newguid',  5,  'ҵ����')
if not exists(select * from MES_FIELDCMP where cfield= 'id' and ctable= 'MES_CQ_Mom_orderdetail')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  0, null,  'id',  '����id',  32,  'nvarchar',  '���������ӱ�',  'MES_CQ_Mom_orderdetail',  '���������ӱ�',  '861',  'main|##newguid',  5,  'ҵ����')

if not exists(select * from MES_FIELDCMP where cfield= 'cInvCode' and ctable= 'MES_CQ_Mom_orderdetail')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  0, null,  'cInvCode',  '��Ʒ����',  32,  'nvarchar',  '���������ӱ�',  'MES_CQ_Mom_orderdetail',  '���������ӱ�',  '861',  'DInvCode',  1,  'ҵ����')
if not exists(select * from MES_FIELDCMP where cfield= 'MoCode' and ctable= 'MES_CQ_Mom_orderdetail')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  0, null,  'MoCode',  '����������',  32,  'nvarchar',  '���������ӱ�',  'MES_CQ_Mom_orderdetail',  '���������ӱ�',  '861',  'MoCode',  1,  'ҵ����')
if not exists(select * from MES_FIELDCMP where cfield= 'iquantity' and ctable= 'MES_CQ_Mom_orderdetail')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  0, null,  'iquantity',  '����',  32,  'nvarchar',  '���������ӱ�',  'MES_CQ_Mom_orderdetail',  '���������ӱ�',  '861',  'DQty',  1,  'ҵ����')
if not exists(select * from MES_FIELDCMP where cfield= 'PStartDate' and ctable= 'MES_CQ_Mom_orderdetail')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  0, null,  'PStartDate',  '��������',  32,  'nvarchar',  '���������ӱ�',  'MES_CQ_Mom_orderdetail',  '���������ӱ�',  '861',  'DStartDate',  1,  'ҵ����')
if not exists(select * from MES_FIELDCMP where cfield= 'PStartDate' and ctable= 'MES_CQ_Mom_orderdetail')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  0, null,  'PDueDate',  '�깤����',  32,  'nvarchar',  '���������ӱ�',  'MES_CQ_Mom_orderdetail',  '���������ӱ�',  '861',  'DDueDate',  1,  'ҵ����')
if not exists(select * from MES_FIELDCMP where cfield= 'MoType' and ctable= 'MES_CQ_Mom_orderdetail')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  0, null,  'MoType',  '��������',  32,  'nvarchar',  '���������ӱ�',  'MES_CQ_Mom_orderdetail',  '���������ӱ�',  '861',  'DMoTypeCode',  1,  'ҵ����')
if not exists(select * from MES_FIELDCMP where cfield= 'MoType' and ctable= 'MES_CQ_Mom_orderdetail')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  0, null,  'cSoCode',  '���۶�����',  32,  'nvarchar',  '���������ӱ�',  'MES_CQ_Mom_orderdetail',  '���������ӱ�',  '861',  'SoCode',  1,  'ҵ����')
    
GO


-- ��������BOM
if not exists(select * from MES_FIELDCMP where cfield= 'did' and ctable= 'MES_CQ_Mom_OrderBom')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  0, null,  'did',  '����id',  32,  'nvarchar',  '��������Bom',  'MES_CQ_Mom_OrderBom',  '���������ӱ�',  '861',  '##newguid',  5,  'ҵ����')
if not exists(select * from MES_FIELDCMP where cfield= 'id' and ctable= 'MES_CQ_Mom_OrderBom')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  0, null,  'id',  '����id',  32,  'nvarchar',  '��������Bom',  'MES_CQ_Mom_OrderBom',  '���������ӱ�',  '861',  'main|##newguid',  5,  'ҵ����')
if not exists(select * from MES_FIELDCMP where cfield= 'BomID' and ctable= 'MES_CQ_Mom_OrderBom')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  0, null,  'BomID',  'BomID',  32,  'nvarchar',  '���������ӱ�',  'MES_CQ_Mom_OrderBom',  '���������ӱ�',  '861',  'BomID',  1,  'ҵ����')
if not exists(select * from MES_FIELDCMP where cfield= 'cInvCode' and ctable= 'MES_CQ_Mom_OrderBom')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  0, null,  'cInvCode',  '��Ʒ����',  32,  'nvarchar',  '���������ӱ�',  'MES_CQ_Mom_OrderBom',  '���������ӱ�',  '861',  'DInvCode',  1,  'ҵ����')
if not exists(select * from MES_FIELDCMP where cfield= 'MoCode' and ctable= 'MES_CQ_Mom_OrderBom')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  0, null,  'MoCode',  '����������',  32,  'nvarchar',  '���������ӱ�',  'MES_CQ_Mom_OrderBom',  '���������ӱ�',  '861',  'MoCode',  1,  'ҵ����')
if not exists(select * from MES_FIELDCMP where cfield= 'iquantity' and ctable= 'MES_CQ_Mom_OrderBom')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  0, null,  'iquantity',  '����',  32,  'nvarchar',  '���������ӱ�',  'MES_CQ_Mom_OrderBom',  '���������ӱ�',  '861',  'DQty',  1,  'ҵ����')
   
GO

/*======================= table data: [MES_FIELDCMP] ========================*/
print 'dbo.[MES_FIELDCMP] data...'  
-- ���ŵ���
if not exists(select * from MES_FIELDCMP where cfield= 'id' and ctable= 'MES_CQ_Department')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  0, null,  'id',  '����id',  32,  'nvarchar',  '���ŵ���',  'MES_CQ_Department',  '���Ż�����Ϣ',  '861',  'main|##newguid',  5,  '������')
if not exists(select * from MES_FIELDCMP where cfield= 'cDepCode' and ctable= 'MES_CQ_Department')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  1, null,  'cDepCode',  '���ű���',  12,  'nvarchar',  '���ŵ���',  'MES_CQ_Department',  '���Ż�����Ϣ',  '861',  'cDepCode',  1,  '������')
if not exists(select * from MES_FIELDCMP where cfield= 'cDepName' and ctable= 'MES_CQ_Department')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  1, null,  'cDepName',  '��������',  255,  'nvarchar',  '���ŵ���',  'MES_CQ_Department',  '���Ż�����Ϣ',  '861',  'cDepName',  1,  '������')
if not exists(select * from MES_FIELDCMP where cfield= 'cLDepCode' and ctable= 'MES_CQ_Department')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  1, null,  'cLDepCode',  '�ϼ�����',  255,  'nvarchar',  '���ŵ���',  'MES_CQ_Department',  '���Ż�����Ϣ',  '861',  '2',  3,  '������') 

GO

/*======================= table data: [MES_FIELDCMP] ========================*/
print 'dbo.[MES_FIELDCMP] data...'  
-- ��Ա����
if not exists(select * from MES_FIELDCMP where cfield= 'id' and ctable= 'MES_CQ_Person')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  0, null,  'id',  '����id',  32,  'nvarchar',  '��Ա����',  'MES_CQ_Person',  '��Ա������Ϣ��',  '861',  'main|##newguid',  5,  '��Ա��')

if not exists(select * from MES_FIELDCMP where cfield= 'cPersonCode' and ctable= 'MES_CQ_Person')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  1, null,  'cPersonCode',  '��Ա����',  20,  'nvarchar',  '��Ա����',  'MES_CQ_Person',  '��Ա������Ϣ��',  '861',  'cPsn_Num',  1,  '��Ա��')
if not exists(select * from MES_FIELDCMP where cfield= 'cPersonName' and ctable= 'MES_CQ_Person')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  1, null,  'cPersonName',  '����',  40,  'nvarchar',  '��Ա����',  'MES_CQ_Person',  '��Ա������Ϣ��',  '861',  'cPsn_Name',  1,  '��Ա��')
if not exists(select * from MES_FIELDCMP where cfield= 'PersonType' and ctable= 'MES_CQ_Person')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  1, null,  'PersonType',  '��Ա���',  30,  'Nvarchar',  '��Ա����',  'MES_CQ_Person',  '��Ա������Ϣ��',  '861',  'rPersonType',  1,  '��Ա��')
if not exists(select * from MES_FIELDCMP where cfield= 'cDepCode' and ctable= 'MES_CQ_Person')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  1, null,  'cDepCode',  '����',  12,  'nvarchar',  '��Ա����',  'MES_CQ_Person',  '��Ա������Ϣ��',  '861',  'cDept_num',  1,  '��Ա��') 
if not exists(select * from MES_FIELDCMP where cfield= 'Sex' and ctable= 'MES_CQ_Person')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  1, null,  'Sex',  '�Ա�',  2,  'nvarchar',  '��Ա����',  'MES_CQ_Person',  '��Ա������Ϣ��',  '861',  'rSex',  1,  '��Ա��')
if not exists(select * from MES_FIELDCMP where cfield= 'dBirthDate' and ctable= 'MES_CQ_Person')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  0, null,  'dBirthDate',  '��������',  10,  'datetime',  '��Ա����',  'MES_CQ_Person',  '��Ա������Ϣ��',  '861',  'dBirthDate',  1,  '��Ա��')
if not exists(select * from MES_FIELDCMP where cfield= 'cPsnEmail' and ctable= 'MES_CQ_Person')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  0, null,  'cPsnEmail',  '����',  100,  'nvarchar',  '��Ա����',  'MES_CQ_Person',  '��Ա������Ϣ��',  '861',  'cPsnEmail',  1,  '��Ա��')
   
GO


/*======================= table data: [MES_FIELDCMP] ========================*/
print 'dbo.[MES_FIELDCMP] data...'  
-- �������  
if not exists(select * from MES_FIELDCMP where cfield= 'id' and ctable= 'MES_CQ_Inventory')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  0, null,  'id',  '����id',  32,  'nvarchar',  '�������',  'MES_CQ_Inventory',  '�������',  '861',  'main|##newguid',  5,  '�����')

if not exists(select * from MES_FIELDCMP where cfield= 'cInvCode' and ctable= 'MES_CQ_Inventory')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  1, null,  'cInvCode',  '�������',  20,  'nvarchar',  '�������',  'MES_CQ_Inventory',  '�������',  '861',  'cInvCode',  1,  '�����') 
if not exists(select * from MES_FIELDCMP where cfield= 'cInvName' and ctable= 'MES_CQ_Inventory')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  1, null,  'cInvName',  '�������',  255,  'nvarchar',  '�������',  'MES_CQ_Inventory',  '�������',  '861',  'cInvName',  1,  '�����')
if not exists(select * from MES_FIELDCMP where cfield= 'cInvStd' and ctable= 'MES_CQ_Inventory')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  0, null,  'cInvStd',  '����ͺ�',  255,  'nvarchar',  '�������',  'MES_CQ_Inventory',  '�������',  '861',  'cInvStd',  1,  '�����')
if not exists(select * from MES_FIELDCMP where cfield= 'cWhCode' and ctable= 'MES_CQ_Inventory')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  1, null,  'cWhCode',  '�ֿ����',  10,  'nvarchar',  '�������',  'MES_CQ_Inventory',  '�������',  '861',  'cDefWareHouse',  1,  '�����')
if not exists(select * from MES_FIELDCMP where cfield= 'cInvAddCode' and ctable= 'MES_CQ_Inventory')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  1, null,  'cInvAddCode',  '�������',  255,  'nvarchar',  '�������',  'MES_CQ_Inventory',  '�������',  '861',  'cInvAddCode',  1,  '�����')
if not exists(select * from MES_FIELDCMP where cfield= 'bPropertyCheck' and ctable= 'MES_CQ_Inventory') 
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  0, null,  'bPropertyCheck',  '�Ƿ��ʼ�',  1,  'bit',  '�������',  'MES_CQ_Inventory',  '�������',  '861',  'bPropertyCheck',  1,  '�����')

if not exists(select * from MES_FIELDCMP where cfield= 'cComUnitCode' and ctable= 'MES_CQ_Inventory')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  1, null,  'cComUnitCode',  '��������λ����',  35,  'nvarchar',  '�������',  'MES_CQ_Inventory',  '�������',  '861',  'cComUnitCode',  6,  '�����')  --4
if not exists(select * from MES_FIELDCMP where cfield= 'cInvCCode' and ctable= 'MES_CQ_Inventory')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  1, null,  'cInvCCode',  '����������',  12,  'nvarchar',  '�������',  'MES_CQ_Inventory',  '�������',  '861',  'cInvCCode',  6,  '�����') --3 
if not exists(select * from MES_FIELDCMP where cfield= 'bPurchase' and ctable= 'MES_CQ_Inventory')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  0, null,  'bPurchase',  '�Ƿ��⹺',  1,  'bit',  '�������',  'MES_CQ_Inventory',  '�������',  '861',  'bPurchase',  6,  '�����') 
if not exists(select * from MES_FIELDCMP where cfield= 'bSelf' and ctable= 'MES_CQ_Inventory')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  0, null,  'bSelf',  '�Ƿ�����',  1,  'bit',  '�������',  'MES_CQ_Inventory',  '�������',  '861',  'bSelf',  6,  '�����')  
if not exists(select * from MES_FIELDCMP where cfield= 'bBomMain' and ctable= 'MES_CQ_Inventory')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  0, null,  'bBomMain',  '����BOMĸ��',  1,  'bit',  '�������',  'MES_CQ_Inventory',  '�������',  '861',  'bBomMain',  6,  '�����') 
if not exists(select * from MES_FIELDCMP where cfield= 'bBomSub' and ctable= 'MES_CQ_Inventory')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  0, null,  'bBomSub',  '����BOM�Ӽ�',  1,  'bit',  '�������',  'MES_CQ_Inventory',  '�������',  '861',  'bBomSub',  6,  '�����') 

if not exists(select * from MES_FIELDCMP where cfield= 'cInvCName' and ctable= 'MES_CQ_Inventory')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  0, null,  'cInvCName',  '�����������',  255,  'nvarchar',  '�������',  'MES_CQ_Inventory',  '�������',  '861',  '3',  3,  '�����')
if not exists(select * from MES_FIELDCMP where cfield= 'cComUnitName' and ctable= 'MES_CQ_Inventory')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  0, null,  'cComUnitName',  '��������λ����',  20,  'nvarchar',  '�������',  'MES_CQ_Inventory',  '�������',  '861',  '4', 3,  '�����')
if not exists(select * from MES_FIELDCMP where cfield= 'iInvType' and ctable= 'MES_CQ_Inventory')
  insert into MES_FIELDCMP ( bfixed,bvisible,cdefult,cfield,cfielddesc,cfieldlength,cfieldtype,cname,ctable,ctabledesc,cversion,igetvalue,igetvaluetype,itype ) values 
  ('0',  0, null,  'iInvType',  '�����������',  10,  'nvarchar',  '�������',  'MES_CQ_Inventory',  '�������',  '861',  '5',  3,  '�����')
  
   
    
GO
