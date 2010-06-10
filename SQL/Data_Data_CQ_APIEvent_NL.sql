----���۶������
declare @AppSysID int,@AppTypeID int,@AppTagID int,@EndpointID nvarchar(50),@MsgTypeID int,@MsgTypeCategoryID int,@MsgFilterID int,@ParentAppTypeID int 
select @AppSysID=IB_AppSys.ID from IB_AppSys,IB_Entities where IB_Entities.ID=IB_AppSys.EntityID and IB_Entities.EntityTag='U8API' 
if @AppSysID is null 
begin 
insert into IB_Entities(EntityTag,FriendName)values('U8API','U8API') 
insert into IB_AppSys(AppSystem,FriendName,EntityID)values('U8API','U8API',@@identity) 
set @AppSysID=@@identity 
end 
set @ParentAppTypeID=0 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='SA' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('SA','���۹���',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='SaleOrder' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('SaleOrder','���۶���',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
select @AppTagID=ID from IB_AppTag where AppTag='HY_ME_SVREvent.BeforeSaleOrderAudit' and AppTypeID=@AppTypeID 
if @AppTagID is null 
begin 
insert into IB_AppTag(AppTag,FriendName,AppTypeID,ExtendProperties,Description,Customize,IsPlugin) 
 values('HY_ME_SVREvent.BeforeSaleOrderAudit','Mes�������۶������ǰ�¼�',@AppTypeID,'','',0,1) 
set @AppTagID=@@identity 
end 
else 
begin 
update IB_AppTag set ExtendProperties='',Description='',Customize=0 where ID=@AppTagID 
end 
select top 1 @EndpointID=ID from IB_EndPoint where AppTagID=@AppTagID 
if @EndpointID is null 
begin 
insert into IB_EndPoint(Address,ProtocolID,ProtocolParams,AppTagID) 
 values('','DotNetAssemblyForRPC','<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeVoucherEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>',@AppTagID) 
end 
else 
begin 
update IB_EndPoint set Address='',ProtocolID='DotNetAssemblyForRPC',ProtocolParams='<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeVoucherEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>' where ID=@EndpointID 
end 
select @MsgTypeCategoryID=ID from MOM_MsgTypeCategories where MsgTypeCategory='����¼�' 
select @MsgFilterID=ID from IB_MsgFilter where FilterName='XPathFilter' 
select @MsgTypeID=ID from IB_MsgType where MsgType='Audit_Before' and AppTypeID=@AppTypeID 
if @MsgTypeID is null 
begin 
insert into IB_MsgType(MsgType,FriendName,MsgSchema,AppTypeID,MsgTypeCategoryID,MsgFilterID,ExtendProperties) values('Audit_Before','���ǰ�¼�','<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="domhead" type="MSXML2.IXMLDOMDocument2" direction="inout" desc="��ͷ" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="dombody" type="MSXML2.IXMLDOMDocument2" direction="inout" desc="����" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="2" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',@AppTypeID,@MsgTypeCategoryID,@MsgFilterID,'') 
 set @MsgTypeID=@@identity 
end 
else 
begin 
update IB_MsgType set MsgSchema='<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="domhead" type="MSXML2.IXMLDOMDocument2" direction="inout" desc="��ͷ" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="dombody" type="MSXML2.IXMLDOMDocument2" direction="inout" desc="����" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="2" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',ExtendProperties='' where ID=@MsgTypeID 
end 
if (select count(*) from IB_Event_Plugin where AppTagID=@AppTagID and MsgTypeID=@MsgTypeID) = 0 
begin 
insert into IB_Event_Plugin(AppTagID,MsgTypeID,AccID,OrderNO,IsSyncOrAsync,Description,Disabled,UnVisible,UnDeleted) values(@AppTagID,@MsgTypeID,'',1,0,'',0,0,0)  
end 
go

----���۶�������ǰ
declare @AppSysID int,@AppTypeID int,@AppTagID int,@EndpointID nvarchar(50),@MsgTypeID int,@MsgTypeCategoryID int,@MsgFilterID int,@ParentAppTypeID int 
select @AppSysID=IB_AppSys.ID from IB_AppSys,IB_Entities where IB_Entities.ID=IB_AppSys.EntityID and IB_Entities.EntityTag='U8API' 
if @AppSysID is null 
begin 
insert into IB_Entities(EntityTag,FriendName)values('U8API','U8API') 
insert into IB_AppSys(AppSystem,FriendName,EntityID)values('U8API','U8API',@@identity) 
set @AppSysID=@@identity 
end 
set @ParentAppTypeID=0 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='SA' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('SA','���۹���',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='SaleOrder' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('SaleOrder','���۶���',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
select @AppTagID=ID from IB_AppTag where AppTag='HY_ME_SVREvent.BeforeSaleOrderCancelAudit' and AppTypeID=@AppTypeID 
if @AppTagID is null 
begin 
insert into IB_AppTag(AppTag,FriendName,AppTypeID,ExtendProperties,Description,Customize,IsPlugin) 
 values('HY_ME_SVREvent.BeforeSaleOrderCancelAudit','Mes�������۶�������ǰ�¼�',@AppTypeID,'','',0,1) 
set @AppTagID=@@identity 
end 
else 
begin 
update IB_AppTag set ExtendProperties='',Description='',Customize=0 where ID=@AppTagID 
end 
select top 1 @EndpointID=ID from IB_EndPoint where AppTagID=@AppTagID 
if @EndpointID is null 
begin 
insert into IB_EndPoint(Address,ProtocolID,ProtocolParams,AppTagID) 
 values('','DotNetAssemblyForRPC','<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeVoucherEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>',@AppTagID) 
end 
else 
begin 
update IB_EndPoint set Address='',ProtocolID='DotNetAssemblyForRPC',ProtocolParams='<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeVoucherEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>' where ID=@EndpointID 
end 
select @MsgTypeCategoryID=ID from MOM_MsgTypeCategories where MsgTypeCategory='����¼�' 
select @MsgFilterID=ID from IB_MsgFilter where FilterName='XPathFilter' 
select @MsgTypeID=ID from IB_MsgType where MsgType='CancelAudit_Before' and AppTypeID=@AppTypeID 
if @MsgTypeID is null 
begin 
insert into IB_MsgType(MsgType,FriendName,MsgSchema,AppTypeID,MsgTypeCategoryID,MsgFilterID,ExtendProperties) values('CancelAudit_Before','����ǰ�¼�','<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="domhead" type="MSXML2.IXMLDOMDocument2" direction="inout" desc="��ͷ" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="dombody" type="MSXML2.IXMLDOMDocument2" direction="inout" desc="����" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="2" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',@AppTypeID,@MsgTypeCategoryID,@MsgFilterID,'') 
 set @MsgTypeID=@@identity 
end 
else 
begin 
update IB_MsgType set MsgSchema='<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="domhead" type="MSXML2.IXMLDOMDocument2" direction="inout" desc="��ͷ" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="dombody" type="MSXML2.IXMLDOMDocument2" direction="inout" desc="����" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="2" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',ExtendProperties='' where ID=@MsgTypeID 
end 
if (select count(*) from IB_Event_Plugin where AppTagID=@AppTagID and MsgTypeID=@MsgTypeID) = 0 
begin 
insert into IB_Event_Plugin(AppTagID,MsgTypeID,AccID,OrderNO,IsSyncOrAsync,Description,Disabled,UnVisible,UnDeleted) values(@AppTagID,@MsgTypeID,'',2,0,'',0,0,0)  
end 
go

----�ɹ����������ǰ 
declare @AppSysID int,@AppTypeID int,@AppTagID int,@EndpointID nvarchar(50),@MsgTypeID int,@MsgTypeCategoryID int,@MsgFilterID int,@ParentAppTypeID int 
select @AppSysID=IB_AppSys.ID from IB_AppSys,IB_Entities where IB_Entities.ID=IB_AppSys.EntityID and IB_Entities.EntityTag='U8API' 
if @AppSysID is null 
begin 
insert into IB_Entities(EntityTag,FriendName)values('U8API','U8API') 
insert into IB_AppSys(AppSystem,FriendName,EntityID)values('U8API','U8API',@@identity) 
set @AppSysID=@@identity 
end 
set @ParentAppTypeID=0 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='PU' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('PU','�ɹ�����',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='ArrivedGoods' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('ArrivedGoods','�ɹ�������(�˻���)',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
select @AppTagID=ID from IB_AppTag where AppTag='HY_ME_SVREvent.BeforePU_ArrivalVouchAudit' and AppTypeID=@AppTypeID 
if @AppTagID is null 
begin 
insert into IB_AppTag(AppTag,FriendName,AppTypeID,ExtendProperties,Description,Customize,IsPlugin) 
 values('HY_ME_SVREvent.BeforePU_ArrivalVouchAudit','Mes����ɹ����������ǰ�¼�',@AppTypeID,'','',0,1) 
set @AppTagID=@@identity 
end 
else 
begin 
update IB_AppTag set ExtendProperties='',Description='',Customize=0 where ID=@AppTagID 
end 
select top 1 @EndpointID=ID from IB_EndPoint where AppTagID=@AppTagID 
if @EndpointID is null 
begin 
insert into IB_EndPoint(Address,ProtocolID,ProtocolParams,AppTagID) 
 values('','DotNetAssemblyForRPC','<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeVoucherEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>',@AppTagID) 
end 
else 
begin 
update IB_EndPoint set Address='',ProtocolID='DotNetAssemblyForRPC',ProtocolParams='<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeVoucherEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>' where ID=@EndpointID 
end 
select @MsgTypeCategoryID=ID from MOM_MsgTypeCategories where MsgTypeCategory='����¼�' 
select @MsgFilterID=ID from IB_MsgFilter where FilterName='XPathFilter' 
select @MsgTypeID=ID from IB_MsgType where MsgType='Audit_Before' and AppTypeID=@AppTypeID 
if @MsgTypeID is null 
begin 
insert into IB_MsgType(MsgType,FriendName,MsgSchema,AppTypeID,MsgTypeCategoryID,MsgFilterID,ExtendProperties) values('Audit_Before','���ǰ�¼�','<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="domhead" type="MSXML2.IXMLDOMDocument2" direction="inout" desc="��ͷ" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="dombody" type="MSXML2.IXMLDOMDocument2" direction="inout" desc="����" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="2" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',@AppTypeID,@MsgTypeCategoryID,@MsgFilterID,'') 
 set @MsgTypeID=@@identity 
end 
else 
begin 
update IB_MsgType set MsgSchema='<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="domhead" type="MSXML2.IXMLDOMDocument2" direction="inout" desc="��ͷ" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="dombody" type="MSXML2.IXMLDOMDocument2" direction="inout" desc="����" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="2" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',ExtendProperties='' where ID=@MsgTypeID 
end 
if (select count(*) from IB_Event_Plugin where AppTagID=@AppTagID and MsgTypeID=@MsgTypeID) = 0 
begin 
insert into IB_Event_Plugin(AppTagID,MsgTypeID,AccID,OrderNO,IsSyncOrAsync,Description,Disabled,UnVisible,UnDeleted) values(@AppTagID,@MsgTypeID,'',1,0,'',0,0,0)  
end 
go

----�ɹ�����������ǰ 
declare @AppSysID int,@AppTypeID int,@AppTagID int,@EndpointID nvarchar(50),@MsgTypeID int,@MsgTypeCategoryID int,@MsgFilterID int,@ParentAppTypeID int 
select @AppSysID=IB_AppSys.ID from IB_AppSys,IB_Entities where IB_Entities.ID=IB_AppSys.EntityID and IB_Entities.EntityTag='U8API' 
if @AppSysID is null 
begin 
insert into IB_Entities(EntityTag,FriendName)values('U8API','U8API') 
insert into IB_AppSys(AppSystem,FriendName,EntityID)values('U8API','U8API',@@identity) 
set @AppSysID=@@identity 
end 
set @ParentAppTypeID=0 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='PU' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('PU','�ɹ�����',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='ArrivedGoods' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('ArrivedGoods','�ɹ�������(�˻���)',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
select @AppTagID=ID from IB_AppTag where AppTag='HY_ME_SVREvent.BeforePU_ArrivalVouchCancelAudit' and AppTypeID=@AppTypeID 
if @AppTagID is null 
begin 
insert into IB_AppTag(AppTag,FriendName,AppTypeID,ExtendProperties,Description,Customize,IsPlugin) 
 values('HY_ME_SVREvent.BeforePU_ArrivalVouchCancelAudit','Mes����ɹ���������ǰ�¼�',@AppTypeID,'','',0,1) 
set @AppTagID=@@identity 
end 
else 
begin 
update IB_AppTag set ExtendProperties='',Description='',Customize=0 where ID=@AppTagID 
end 
select top 1 @EndpointID=ID from IB_EndPoint where AppTagID=@AppTagID 
if @EndpointID is null 
begin 
insert into IB_EndPoint(Address,ProtocolID,ProtocolParams,AppTagID) 
 values('','DotNetAssemblyForRPC','<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeVoucherEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>',@AppTagID) 
end 
else 
begin 
update IB_EndPoint set Address='',ProtocolID='DotNetAssemblyForRPC',ProtocolParams='<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeVoucherEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>' where ID=@EndpointID 
end 
select @MsgTypeCategoryID=ID from MOM_MsgTypeCategories where MsgTypeCategory='����¼�' 
select @MsgFilterID=ID from IB_MsgFilter where FilterName='XPathFilter' 
select @MsgTypeID=ID from IB_MsgType where MsgType='CancelAudit_Before' and AppTypeID=@AppTypeID 
if @MsgTypeID is null 
begin 
insert into IB_MsgType(MsgType,FriendName,MsgSchema,AppTypeID,MsgTypeCategoryID,MsgFilterID,ExtendProperties) values('CancelAudit_Before','����ǰ�¼�','<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="domhead" type="MSXML2.IXMLDOMDocument2" direction="inout" desc="��ͷ" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="dombody" type="MSXML2.IXMLDOMDocument2" direction="inout" desc="����" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="2" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',@AppTypeID,@MsgTypeCategoryID,@MsgFilterID,'') 
 set @MsgTypeID=@@identity 
end 
else 
begin 
update IB_MsgType set MsgSchema='<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="domhead" type="MSXML2.IXMLDOMDocument2" direction="inout" desc="��ͷ" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="dombody" type="MSXML2.IXMLDOMDocument2" direction="inout" desc="����" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="2" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',ExtendProperties='' where ID=@MsgTypeID 
end 
if (select count(*) from IB_Event_Plugin where AppTagID=@AppTagID and MsgTypeID=@MsgTypeID) = 0 
begin 
insert into IB_Event_Plugin(AppTagID,MsgTypeID,AccID,OrderNO,IsSyncOrAsync,Description,Disabled,UnVisible,UnDeleted) values(@AppTagID,@MsgTypeID,'',2,0,'',0,0,0)  
end 
go
 
----�����嵥�����
declare @AppSysID int,@AppTypeID int,@AppTagID int,@EndpointID nvarchar(50),@MsgTypeID int,@MsgTypeCategoryID int,@MsgFilterID int,@ParentAppTypeID int 
select @AppSysID=IB_AppSys.ID from IB_AppSys,IB_Entities where IB_Entities.ID=IB_AppSys.EntityID and IB_Entities.EntityTag='U8API' 
if @AppSysID is null 
begin 
insert into IB_Entities(EntityTag,FriendName)values('U8API','U8API') 
insert into IB_AppSys(AppSystem,FriendName,EntityID)values('U8API','U8API',@@identity) 
set @AppSysID=@@identity 
end 
set @ParentAppTypeID=0 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='U8M' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('U8M','��������',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='BOM' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('BOM','�����嵥',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
select @AppTagID=ID from IB_AppTag where AppTag='HY_ME_SVREvent.AfterBomSave' and AppTypeID=@AppTypeID 
if @AppTagID is null 
begin 
insert into IB_AppTag(AppTag,FriendName,AppTypeID,ExtendProperties,Description,Customize,IsPlugin) 
 values('HY_ME_SVREvent.AfterBomSave','Mes���������嵥������¼�',@AppTypeID,'','',0,1) 
set @AppTagID=@@identity 
end 
else 
begin 
update IB_AppTag set ExtendProperties='',Description='',Customize=0 where ID=@AppTagID 
end 
select top 1 @EndpointID=ID from IB_EndPoint where AppTagID=@AppTagID 
if @EndpointID is null 
begin 
insert into IB_EndPoint(Address,ProtocolID,ProtocolParams,AppTagID) 
 values('','DotNetAssemblyForRPC','<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.PMEvent" description="" display="true" /><param name="MethodName" value="DoAPI_DataSet" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>',@AppTagID) 
end 
else 
begin 
update IB_EndPoint set Address='',ProtocolID='DotNetAssemblyForRPC',ProtocolParams='<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.PMEvent" description="" display="true" /><param name="MethodName" value="DoAPI_DataSet" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>' where ID=@EndpointID 
end 
select @MsgTypeCategoryID=ID from MOM_MsgTypeCategories where MsgTypeCategory='����¼�' 
select @MsgFilterID=ID from IB_MsgFilter where FilterName='XPathFilter' 
select @MsgTypeID=ID from IB_MsgType where MsgType='Save_After' and AppTypeID=@AppTypeID 
if @MsgTypeID is null 
begin 
insert into IB_MsgType(MsgType,FriendName,MsgSchema,AppTypeID,MsgTypeCategoryID,MsgFilterID,ExtendProperties) values('Save_After','������¼�','<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="bomds" type="DataSet" direction="in" desc="�����嵥���ݼ��� ( ��: UFSoft.U8.U8M.DOSchema.BO.StandardBomDs, ����: UFSoft.U8.U8M.DOSchema.dll )" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',@AppTypeID,@MsgTypeCategoryID,@MsgFilterID,'') 
 set @MsgTypeID=@@identity 
end 
else 
begin 
update IB_MsgType set MsgSchema='<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="bomds" type="DataSet" direction="in" desc="�����嵥���ݼ��� ( ��: UFSoft.U8.U8M.DOSchema.BO.StandardBomDs, ����: UFSoft.U8.U8M.DOSchema.dll )" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',ExtendProperties='' where ID=@MsgTypeID 
end 
if (select count(*) from IB_Event_Plugin where AppTagID=@AppTagID and MsgTypeID=@MsgTypeID) = 0 
begin 
insert into IB_Event_Plugin(AppTagID,MsgTypeID,AccID,OrderNO,IsSyncOrAsync,Description,Disabled,UnVisible,UnDeleted) values(@AppTagID,@MsgTypeID,'',1,0,'',0,0,0)  
end 
go

----�����嵥���ǰ
declare @AppSysID int,@AppTypeID int,@AppTagID int,@EndpointID nvarchar(50),@MsgTypeID int,@MsgTypeCategoryID int,@MsgFilterID int,@ParentAppTypeID int 
select @AppSysID=IB_AppSys.ID from IB_AppSys,IB_Entities where IB_Entities.ID=IB_AppSys.EntityID and IB_Entities.EntityTag='U8API' 
if @AppSysID is null 
begin 
insert into IB_Entities(EntityTag,FriendName)values('U8API','U8API') 
insert into IB_AppSys(AppSystem,FriendName,EntityID)values('U8API','U8API',@@identity) 
set @AppSysID=@@identity 
end 
set @ParentAppTypeID=0 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='U8M' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('U8M','��������',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='BOM' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('BOM','�����嵥',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
select @AppTagID=ID from IB_AppTag where AppTag='HY_ME_SVREvent.BeforeBomAudit' and AppTypeID=@AppTypeID 
if @AppTagID is null 
begin 
insert into IB_AppTag(AppTag,FriendName,AppTypeID,ExtendProperties,Description,Customize,IsPlugin) 
 values('HY_ME_SVREvent.BeforeBomAudit','Mes���������嵥���ǰ�¼�',@AppTypeID,'','',0,1) 
set @AppTagID=@@identity 
end 
else 
begin 
update IB_AppTag set ExtendProperties='',Description='',Customize=0 where ID=@AppTagID 
end 
select top 1 @EndpointID=ID from IB_EndPoint where AppTagID=@AppTagID 
if @EndpointID is null 
begin 
insert into IB_EndPoint(Address,ProtocolID,ProtocolParams,AppTagID) 
 values('','DotNetAssemblyForRPC','<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.PMEvent" description="" display="true" /><param name="MethodName" value="DoAPI_BomId" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>',@AppTagID) 
end 
else 
begin 
update IB_EndPoint set Address='',ProtocolID='DotNetAssemblyForRPC',ProtocolParams='<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.PMEvent" description="" display="true" /><param name="MethodName" value="DoAPI_BomId" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>' where ID=@EndpointID 
end 
select @MsgTypeCategoryID=ID from MOM_MsgTypeCategories where MsgTypeCategory='����¼�' 
select @MsgFilterID=ID from IB_MsgFilter where FilterName='XPathFilter' 
select @MsgTypeID=ID from IB_MsgType where MsgType='Audit_Before' and AppTypeID=@AppTypeID 
if @MsgTypeID is null 
begin 
insert into IB_MsgType(MsgType,FriendName,MsgSchema,AppTypeID,MsgTypeCategoryID,MsgFilterID,ExtendProperties) values('Audit_Before','���ǰ�¼�','<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="bomid" type="int" direction="in" desc="�����嵥ID ( ��: Bom_Bom.BomId )" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',@AppTypeID,@MsgTypeCategoryID,@MsgFilterID,'') 
 set @MsgTypeID=@@identity 
end 
else 
begin 
update IB_MsgType set MsgSchema='<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="bomid" type="int" direction="in" desc="�����嵥ID ( ��: Bom_Bom.BomId )" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',ExtendProperties='' where ID=@MsgTypeID 
end 
if (select count(*) from IB_Event_Plugin where AppTagID=@AppTagID and MsgTypeID=@MsgTypeID) = 0 
begin 
insert into IB_Event_Plugin(AppTagID,MsgTypeID,AccID,OrderNO,IsSyncOrAsync,Description,Disabled,UnVisible,UnDeleted) values(@AppTagID,@MsgTypeID,'',1,0,'',0,0,0)  
end 
go

----��װ������ǰ
declare @AppSysID int,@AppTypeID int,@AppTagID int,@EndpointID nvarchar(50),@MsgTypeID int,@MsgTypeCategoryID int,@MsgFilterID int,@ParentAppTypeID int 
select @AppSysID=IB_AppSys.ID from IB_AppSys,IB_Entities where IB_Entities.ID=IB_AppSys.EntityID and IB_Entities.EntityTag='U8API' 
if @AppSysID is null 
begin 
insert into IB_Entities(EntityTag,FriendName)values('U8API','U8API') 
insert into IB_AppSys(AppSystem,FriendName,EntityID)values('U8API','U8API',@@identity) 
set @AppSysID=@@identity 
end 
set @ParentAppTypeID=0 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='U8M' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('U8M','��������',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='BOM' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('BOM','�����嵥',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
select @AppTagID=ID from IB_AppTag where AppTag='HY_ME_SVREvent.BeforeBomCancelAudit' and AppTypeID=@AppTypeID 
if @AppTagID is null 
begin 
insert into IB_AppTag(AppTag,FriendName,AppTypeID,ExtendProperties,Description,Customize,IsPlugin) 
 values('HY_ME_SVREvent.BeforeBomCancelAudit','Mes���������嵥����ǰ�¼�',@AppTypeID,'','',0,1) 
set @AppTagID=@@identity 
end 
else 
begin 
update IB_AppTag set ExtendProperties='',Description='',Customize=0 where ID=@AppTagID 
end 
select top 1 @EndpointID=ID from IB_EndPoint where AppTagID=@AppTagID 
if @EndpointID is null 
begin 
insert into IB_EndPoint(Address,ProtocolID,ProtocolParams,AppTagID) 
 values('','DotNetAssemblyForRPC','<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.PMEvent" description="" display="true" /><param name="MethodName" value="DoAPI_BomId" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>',@AppTagID) 
end 
else 
begin 
update IB_EndPoint set Address='',ProtocolID='DotNetAssemblyForRPC',ProtocolParams='<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.PMEvent" description="" display="true" /><param name="MethodName" value="DoAPI_BomId" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>' where ID=@EndpointID 
end 
select @MsgTypeCategoryID=ID from MOM_MsgTypeCategories where MsgTypeCategory='����¼�' 
select @MsgFilterID=ID from IB_MsgFilter where FilterName='XPathFilter' 
select @MsgTypeID=ID from IB_MsgType where MsgType='CancelAudit_Before' and AppTypeID=@AppTypeID 
if @MsgTypeID is null 
begin 
insert into IB_MsgType(MsgType,FriendName,MsgSchema,AppTypeID,MsgTypeCategoryID,MsgFilterID,ExtendProperties) values('CancelAudit_Before','����ǰ�¼�','<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="bomid" type="int" direction="in" desc="�����嵥ID ( ��: Bom_Bom.BomId )" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',@AppTypeID,@MsgTypeCategoryID,@MsgFilterID,'') 
 set @MsgTypeID=@@identity 
end 
else 
begin 
update IB_MsgType set MsgSchema='<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="bomid" type="int" direction="in" desc="�����嵥ID ( ��: Bom_Bom.BomId )" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',ExtendProperties='' where ID=@MsgTypeID 
end 
if (select count(*) from IB_Event_Plugin where AppTagID=@AppTagID and MsgTypeID=@MsgTypeID) = 0 
begin 
insert into IB_Event_Plugin(AppTagID,MsgTypeID,AccID,OrderNO,IsSyncOrAsync,Description,Disabled,UnVisible,UnDeleted) values(@AppTagID,@MsgTypeID,'',1,0,'',0,0,0)  
end 
go

----��װ�����ǰ
declare @AppSysID int,@AppTypeID int,@AppTagID int,@EndpointID nvarchar(50),@MsgTypeID int,@MsgTypeCategoryID int,@MsgFilterID int,@ParentAppTypeID int 
select @AppSysID=IB_AppSys.ID from IB_AppSys,IB_Entities where IB_Entities.ID=IB_AppSys.EntityID and IB_Entities.EntityTag='U8API' 
if @AppSysID is null 
begin 
insert into IB_Entities(EntityTag,FriendName)values('U8API','U8API') 
insert into IB_AppSys(AppSystem,FriendName,EntityID)values('U8API','U8API',@@identity) 
set @AppSysID=@@identity 
end 
set @ParentAppTypeID=0 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='ST' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('ST','������',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='GroupVouch' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('GroupVouch','��װ��',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
select @AppTagID=ID from IB_AppTag where AppTag='HY_ME_SVREvent.BeforeGroupAudit' and AppTypeID=@AppTypeID 
if @AppTagID is null 
begin 
insert into IB_AppTag(AppTag,FriendName,AppTypeID,ExtendProperties,Description,Customize,IsPlugin) 
 values('HY_ME_SVREvent.BeforeGroupAudit','Mes������װ�����ǰ�¼�',@AppTypeID,'','',0,1) 
set @AppTagID=@@identity 
end 
else 
begin 
update IB_AppTag set ExtendProperties='',Description='',Customize=0 where ID=@AppTagID 
end 
select top 1 @EndpointID=ID from IB_EndPoint where AppTagID=@AppTagID 
if @EndpointID is null 
begin 
insert into IB_EndPoint(Address,ProtocolID,ProtocolParams,AppTagID) 
 values('','DotNetAssemblyForRPC','<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeVoucherEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>',@AppTagID) 
end 
else 
begin 
update IB_EndPoint set Address='',ProtocolID='DotNetAssemblyForRPC',ProtocolParams='<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeVoucherEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>' where ID=@EndpointID 
end 
select @MsgTypeCategoryID=ID from MOM_MsgTypeCategories where MsgTypeCategory='����¼�' 
select @MsgFilterID=ID from IB_MsgFilter where FilterName='XPathFilter' 
select @MsgTypeID=ID from IB_MsgType where MsgType='Audit_Before' and AppTypeID=@AppTypeID 
if @MsgTypeID is null 
begin 
insert into IB_MsgType(MsgType,FriendName,MsgSchema,AppTypeID,MsgTypeCategoryID,MsgFilterID,ExtendProperties) values('Audit_Before','���ǰ�¼�','<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="domhead" type="MSXML2.IXMLDOMDocument2" direction="inout" desc="��ͷ" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="dombody" type="MSXML2.IXMLDOMDocument2" direction="inout" desc="����" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="2" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',@AppTypeID,@MsgTypeCategoryID,@MsgFilterID,'') 
 set @MsgTypeID=@@identity 
end 
else 
begin 
update IB_MsgType set MsgSchema='<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="domhead" type="MSXML2.IXMLDOMDocument2" direction="inout" desc="��ͷ" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="dombody" type="MSXML2.IXMLDOMDocument2" direction="inout" desc="����" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="2" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',ExtendProperties='' where ID=@MsgTypeID 
end 
if (select count(*) from IB_Event_Plugin where AppTagID=@AppTagID and MsgTypeID=@MsgTypeID) = 0 
begin 
insert into IB_Event_Plugin(AppTagID,MsgTypeID,AccID,OrderNO,IsSyncOrAsync,Description,Disabled,UnVisible,UnDeleted) values(@AppTagID,@MsgTypeID,'',1,0,'',0,0,0)  
end 
go

----��װ������ǰ
declare @AppSysID int,@AppTypeID int,@AppTagID int,@EndpointID nvarchar(50),@MsgTypeID int,@MsgTypeCategoryID int,@MsgFilterID int,@ParentAppTypeID int 
select @AppSysID=IB_AppSys.ID from IB_AppSys,IB_Entities where IB_Entities.ID=IB_AppSys.EntityID and IB_Entities.EntityTag='U8API' 
if @AppSysID is null 
begin 
insert into IB_Entities(EntityTag,FriendName)values('U8API','U8API') 
insert into IB_AppSys(AppSystem,FriendName,EntityID)values('U8API','U8API',@@identity) 
set @AppSysID=@@identity 
end 
set @ParentAppTypeID=0 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='ST' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('ST','������',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='GroupVouch' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('GroupVouch','��װ��',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
select @AppTagID=ID from IB_AppTag where AppTag='HY_ME_SVREvent.BeforeGroupCancelAudit' and AppTypeID=@AppTypeID 
if @AppTagID is null 
begin 
insert into IB_AppTag(AppTag,FriendName,AppTypeID,ExtendProperties,Description,Customize,IsPlugin) 
 values('HY_ME_SVREvent.BeforeGroupCancelAudit','Mes������װ������ǰ�¼�',@AppTypeID,'','',0,1) 
set @AppTagID=@@identity 
end 
else 
begin 
update IB_AppTag set ExtendProperties='',Description='',Customize=0 where ID=@AppTagID 
end 
select top 1 @EndpointID=ID from IB_EndPoint where AppTagID=@AppTagID 
if @EndpointID is null 
begin 
insert into IB_EndPoint(Address,ProtocolID,ProtocolParams,AppTagID) 
 values('','DotNetAssemblyForRPC','<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeVoucherEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>',@AppTagID) 
end 
else 
begin 
update IB_EndPoint set Address='',ProtocolID='DotNetAssemblyForRPC',ProtocolParams='<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeVoucherEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>' where ID=@EndpointID 
end 
select @MsgTypeCategoryID=ID from MOM_MsgTypeCategories where MsgTypeCategory='����¼�' 
select @MsgFilterID=ID from IB_MsgFilter where FilterName='XPathFilter' 
select @MsgTypeID=ID from IB_MsgType where MsgType='CancelAudit_Before' and AppTypeID=@AppTypeID 
if @MsgTypeID is null 
begin 
insert into IB_MsgType(MsgType,FriendName,MsgSchema,AppTypeID,MsgTypeCategoryID,MsgFilterID,ExtendProperties) values('CancelAudit_Before','����ǰ�¼�','<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="domhead" type="MSXML2.IXMLDOMDocument2" direction="inout" desc="��ͷ" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="dombody" type="MSXML2.IXMLDOMDocument2" direction="inout" desc="����" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="2" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',@AppTypeID,@MsgTypeCategoryID,@MsgFilterID,'') 
 set @MsgTypeID=@@identity 
end 
else 
begin 
update IB_MsgType set MsgSchema='<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="domhead" type="MSXML2.IXMLDOMDocument2" direction="inout" desc="��ͷ" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="dombody" type="MSXML2.IXMLDOMDocument2" direction="inout" desc="����" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="2" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',ExtendProperties='' where ID=@MsgTypeID 
end 
if (select count(*) from IB_Event_Plugin where AppTagID=@AppTagID and MsgTypeID=@MsgTypeID) = 0 
begin 
insert into IB_Event_Plugin(AppTagID,MsgTypeID,AccID,OrderNO,IsSyncOrAsync,Description,Disabled,UnVisible,UnDeleted) values(@AppTagID,@MsgTypeID,'',1,0,'',0,0,0)  
end 
go

-----   �������� ��ʼ   ----
-- �������� ��˺�
declare @AppSysID int,@AppTypeID int,@AppTagID int,@EndpointID nvarchar(50),@MsgTypeID int,@MsgTypeCategoryID int,@MsgFilterID int,@ParentAppTypeID int 
select @AppSysID=IB_AppSys.ID from IB_AppSys,IB_Entities where IB_Entities.ID=IB_AppSys.EntityID and IB_Entities.EntityTag='U8API' 
if @AppSysID is null 
begin 
insert into IB_Entities(EntityTag,FriendName)values('U8API','U8API') 
insert into IB_AppSys(AppSystem,FriendName,EntityID)values('U8API','U8API',@@identity) 
set @AppSysID=@@identity 
end 
set @ParentAppTypeID=0 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='U8M' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('U8M','��������',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='MOrder' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('MOrder','��������',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
select @AppTagID=ID from IB_AppTag where AppTag='HY_ME_SVREvent.AfterMoorderAudit' and AppTypeID=@AppTypeID 
if @AppTagID is null 
begin 
insert into IB_AppTag(AppTag,FriendName,AppTypeID,ExtendProperties,Description,Customize,IsPlugin) 
 values('HY_ME_SVREvent.AfterMoorderAudit','Mes��������������˺��¼�',@AppTypeID,'','',0,1) 
set @AppTagID=@@identity 
end 
else 
begin 
update IB_AppTag set ExtendProperties='',Description='',Customize=0 where ID=@AppTagID 
end 
select top 1 @EndpointID=ID from IB_EndPoint where AppTagID=@AppTagID 
if @EndpointID is null 
begin 
insert into IB_EndPoint(Address,ProtocolID,ProtocolParams,AppTagID) 
 values('','DotNetAssemblyForRPC','<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.MoEvent" description="" display="true" /><param name="MethodName" value="DoAPIEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>',@AppTagID) 
end 
else 
begin 
update IB_EndPoint set Address='',ProtocolID='DotNetAssemblyForRPC',ProtocolParams='<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.MoEvent" description="" display="true" /><param name="MethodName" value="DoAPIEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>' where ID=@EndpointID 
end 
select @MsgTypeCategoryID=ID from MOM_MsgTypeCategories where MsgTypeCategory='����¼�' 
select @MsgFilterID=ID from IB_MsgFilter where FilterName='XPathFilter' 
select @MsgTypeID=ID from IB_MsgType where MsgType='Audit_After' and AppTypeID=@AppTypeID 
if @MsgTypeID is null 
begin 
insert into IB_MsgType(MsgType,FriendName,MsgSchema,AppTypeID,MsgTypeCategoryID,MsgFilterID,ExtendProperties) values('Audit_After','��˺��¼�','<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="moid" type="int" direction="in" desc="��������ID ( ��: mom_order.MoId )" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="modid" type="int" direction="in" desc="����������ϸID ( ��: mom_orderdetail.MoDId )" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="2" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',@AppTypeID,@MsgTypeCategoryID,@MsgFilterID,'') 
 set @MsgTypeID=@@identity 
end 
else 
begin 
update IB_MsgType set MsgSchema='<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="moid" type="int" direction="in" desc="��������ID ( ��: mom_order.MoId )" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="modid" type="int" direction="in" desc="����������ϸID ( ��: mom_orderdetail.MoDId )" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="2" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',ExtendProperties='' where ID=@MsgTypeID 
end 
if (select count(*) from IB_Event_Plugin where AppTagID=@AppTagID and MsgTypeID=@MsgTypeID) = 0 
begin 
insert into IB_Event_Plugin(AppTagID,MsgTypeID,AccID,OrderNO,IsSyncOrAsync,Description,Disabled,UnVisible,UnDeleted) values(@AppTagID,@MsgTypeID,'',1,0,'',0,0,0)  
end 
go

-- �������� ����� 
declare @AppSysID int,@AppTypeID int,@AppTagID int,@EndpointID nvarchar(50),@MsgTypeID int,@MsgTypeCategoryID int,@MsgFilterID int,@ParentAppTypeID int 
select @AppSysID=IB_AppSys.ID from IB_AppSys,IB_Entities where IB_Entities.ID=IB_AppSys.EntityID and IB_Entities.EntityTag='U8API' 
if @AppSysID is null 
begin 
insert into IB_Entities(EntityTag,FriendName)values('U8API','U8API') 
insert into IB_AppSys(AppSystem,FriendName,EntityID)values('U8API','U8API',@@identity) 
set @AppSysID=@@identity 
end 
set @ParentAppTypeID=0 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='U8M' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('U8M','��������',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='MOrder' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('MOrder','��������',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
select @AppTagID=ID from IB_AppTag where AppTag='HY_ME_SVREvent.AfterMoorderUnAudit' and AppTypeID=@AppTypeID 
if @AppTagID is null 
begin 
insert into IB_AppTag(AppTag,FriendName,AppTypeID,ExtendProperties,Description,Customize,IsPlugin) 
 values('HY_ME_SVREvent.AfterMoorderUnAudit','Mes������������������¼�',@AppTypeID,'','',0,1) 
set @AppTagID=@@identity 
end 
else 
begin 
update IB_AppTag set ExtendProperties='',Description='',Customize=0 where ID=@AppTagID 
end 
select top 1 @EndpointID=ID from IB_EndPoint where AppTagID=@AppTagID 
if @EndpointID is null 
begin 
insert into IB_EndPoint(Address,ProtocolID,ProtocolParams,AppTagID) 
 values('','DotNetAssemblyForRPC','<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.MoEvent" description="" display="true" /><param name="MethodName" value="DoAPIEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>',@AppTagID) 
end 
else 
begin 
update IB_EndPoint set Address='',ProtocolID='DotNetAssemblyForRPC',ProtocolParams='<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.MoEvent" description="" display="true" /><param name="MethodName" value="DoAPIEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>' where ID=@EndpointID 
end 
select @MsgTypeCategoryID=ID from MOM_MsgTypeCategories where MsgTypeCategory='����¼�' 
select @MsgFilterID=ID from IB_MsgFilter where FilterName='XPathFilter' 
select @MsgTypeID=ID from IB_MsgType where MsgType='CancelAudit_After' and AppTypeID=@AppTypeID 
if @MsgTypeID is null 
begin 
insert into IB_MsgType(MsgType,FriendName,MsgSchema,AppTypeID,MsgTypeCategoryID,MsgFilterID,ExtendProperties) values('CancelAudit_After','������¼�','<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="moid" type="int" direction="in" desc="��������ID ( ��: mom_order.MoId )" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="modid" type="int" direction="in" desc="����������ϸID ( ��: mom_orderdetail.MoDId )" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="2" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',@AppTypeID,@MsgTypeCategoryID,@MsgFilterID,'') 
 set @MsgTypeID=@@identity 
end 
else 
begin 
update IB_MsgType set MsgSchema='<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="moid" type="int" direction="in" desc="��������ID ( ��: mom_order.MoId )" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="modid" type="int" direction="in" desc="����������ϸID ( ��: mom_orderdetail.MoDId )" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="2" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',ExtendProperties='' where ID=@MsgTypeID 
end 
if (select count(*) from IB_Event_Plugin where AppTagID=@AppTagID and MsgTypeID=@MsgTypeID) = 0 
begin 
insert into IB_Event_Plugin(AppTagID,MsgTypeID,AccID,OrderNO,IsSyncOrAsync,Description,Disabled,UnVisible,UnDeleted) values(@AppTagID,@MsgTypeID,'',1,0,'',0,0,0)  
end 
go

-----   �������� ����   ----


-----   ���ŵ����¼� ��ʼ   ----

-- ��������ǰ
declare @AppSysID int,@AppTypeID int,@AppTagID int,@EndpointID nvarchar(50),@MsgTypeID int,@MsgTypeCategoryID int,@MsgFilterID int,@ParentAppTypeID int 
select @AppSysID=IB_AppSys.ID from IB_AppSys,IB_Entities where IB_Entities.ID=IB_AppSys.EntityID and IB_Entities.EntityTag='U8API' 
if @AppSysID is null 
begin 
insert into IB_Entities(EntityTag,FriendName)values('U8API','U8API') 
insert into IB_AppSys(AppSystem,FriendName,EntityID)values('U8API','U8API',@@identity) 
set @AppSysID=@@identity 
end 
set @ParentAppTypeID=0 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='U8Archive' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('U8Archive','��������',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='department' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('department','���ŵ���',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
select @AppTagID=ID from IB_AppTag where AppTag='HY_ME_SVREvent.BeforeDeptIns' and AppTypeID=@AppTypeID 
if @AppTagID is null 
begin 
insert into IB_AppTag(AppTag,FriendName,AppTypeID,ExtendProperties,Description,Customize,IsPlugin) 
 values('HY_ME_SVREvent.BeforeDeptIns','Mes����������ǰ�¼�',@AppTypeID,'','',0,1) 
set @AppTagID=@@identity 
end 
else 
begin 
update IB_AppTag set ExtendProperties='',Description='',Customize=0 where ID=@AppTagID 
end 
select top 1 @EndpointID=ID from IB_EndPoint where AppTagID=@AppTagID 
if @EndpointID is null 
begin 
insert into IB_EndPoint(Address,ProtocolID,ProtocolParams,AppTagID) 
 values('','DotNetAssemblyForRPC','<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeArchiveEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>',@AppTagID) 
end 
else 
begin 
update IB_EndPoint set Address='',ProtocolID='DotNetAssemblyForRPC',ProtocolParams='<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeArchiveEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>' where ID=@EndpointID 
end 
select @MsgTypeCategoryID=ID from MOM_MsgTypeCategories where MsgTypeCategory='����¼�' 
select @MsgFilterID=ID from IB_MsgFilter where FilterName='XPathFilter' 
select @MsgTypeID=ID from IB_MsgType where MsgType='Add_Before' and AppTypeID=@AppTypeID 
if @MsgTypeID is null 
begin 
insert into IB_MsgType(MsgType,FriendName,MsgSchema,AppTypeID,MsgTypeCategoryID,MsgFilterID,ExtendProperties) values('Add_Before','����ǰ�¼�','<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="archivedata" type="MSXML2.IXMLDOMDocument2" direction="in" desc="��������XmlDom" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',@AppTypeID,@MsgTypeCategoryID,@MsgFilterID,'') 
 set @MsgTypeID=@@identity 
end 
else 
begin 
update IB_MsgType set MsgSchema='<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="archivedata" type="MSXML2.IXMLDOMDocument2" direction="in" desc="��������XmlDom" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',ExtendProperties='' where ID=@MsgTypeID 
end 
if (select count(*) from IB_Event_Plugin where AppTagID=@AppTagID and MsgTypeID=@MsgTypeID) = 0 
begin 
insert into IB_Event_Plugin(AppTagID,MsgTypeID,AccID,OrderNO,IsSyncOrAsync,Description,Disabled,UnVisible,UnDeleted) values(@AppTagID,@MsgTypeID,'',1,0,'',0,0,0)  
end 
go

-- ����ɾ��ǰ
declare @AppSysID int,@AppTypeID int,@AppTagID int,@EndpointID nvarchar(50),@MsgTypeID int,@MsgTypeCategoryID int,@MsgFilterID int,@ParentAppTypeID int 
select @AppSysID=IB_AppSys.ID from IB_AppSys,IB_Entities where IB_Entities.ID=IB_AppSys.EntityID and IB_Entities.EntityTag='U8API' 
if @AppSysID is null 
begin 
insert into IB_Entities(EntityTag,FriendName)values('U8API','U8API') 
insert into IB_AppSys(AppSystem,FriendName,EntityID)values('U8API','U8API',@@identity) 
set @AppSysID=@@identity 
end 
set @ParentAppTypeID=0 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='U8Archive' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('U8Archive','��������',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='department' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('department','���ŵ���',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
select @AppTagID=ID from IB_AppTag where AppTag='HY_ME_SVREvent.BeforeDeptDel' and AppTypeID=@AppTypeID 
if @AppTagID is null 
begin 
insert into IB_AppTag(AppTag,FriendName,AppTypeID,ExtendProperties,Description,Customize,IsPlugin) 
 values('HY_ME_SVREvent.BeforeDeptDel','Mes������ɾ��ǰ�¼�',@AppTypeID,'','',0,1) 
set @AppTagID=@@identity 
end 
else 
begin 
update IB_AppTag set ExtendProperties='',Description='',Customize=0 where ID=@AppTagID 
end 
select top 1 @EndpointID=ID from IB_EndPoint where AppTagID=@AppTagID 
if @EndpointID is null 
begin 
insert into IB_EndPoint(Address,ProtocolID,ProtocolParams,AppTagID) 
 values('','DotNetAssemblyForRPC','<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeArchiveEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>',@AppTagID) 
end 
else 
begin 
update IB_EndPoint set Address='',ProtocolID='DotNetAssemblyForRPC',ProtocolParams='<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeArchiveEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>' where ID=@EndpointID 
end 
select @MsgTypeCategoryID=ID from MOM_MsgTypeCategories where MsgTypeCategory='����¼�' 
select @MsgFilterID=ID from IB_MsgFilter where FilterName='XPathFilter' 
select @MsgTypeID=ID from IB_MsgType where MsgType='Delete_Before' and AppTypeID=@AppTypeID 
if @MsgTypeID is null 
begin 
insert into IB_MsgType(MsgType,FriendName,MsgSchema,AppTypeID,MsgTypeCategoryID,MsgFilterID,ExtendProperties) values('Delete_Before','ɾ��ǰ�¼�','<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="archivedata" type="MSXML2.IXMLDOMDocument2" direction="in" desc="��������XmlDom" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',@AppTypeID,@MsgTypeCategoryID,@MsgFilterID,'') 
 set @MsgTypeID=@@identity 
end 
else 
begin 
update IB_MsgType set MsgSchema='<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="archivedata" type="MSXML2.IXMLDOMDocument2" direction="in" desc="��������XmlDom" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',ExtendProperties='' where ID=@MsgTypeID 
end 
if (select count(*) from IB_Event_Plugin where AppTagID=@AppTagID and MsgTypeID=@MsgTypeID) = 0 
begin 
insert into IB_Event_Plugin(AppTagID,MsgTypeID,AccID,OrderNO,IsSyncOrAsync,Description,Disabled,UnVisible,UnDeleted) values(@AppTagID,@MsgTypeID,'',1,0,'',0,0,0)  
end 
go

-- �����޸�ǰ
declare @AppSysID int,@AppTypeID int,@AppTagID int,@EndpointID nvarchar(50),@MsgTypeID int,@MsgTypeCategoryID int,@MsgFilterID int,@ParentAppTypeID int 
select @AppSysID=IB_AppSys.ID from IB_AppSys,IB_Entities where IB_Entities.ID=IB_AppSys.EntityID and IB_Entities.EntityTag='U8API' 
if @AppSysID is null 
begin 
insert into IB_Entities(EntityTag,FriendName)values('U8API','U8API') 
insert into IB_AppSys(AppSystem,FriendName,EntityID)values('U8API','U8API',@@identity) 
set @AppSysID=@@identity 
end 
set @ParentAppTypeID=0 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='U8Archive' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('U8Archive','��������',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='department' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('department','���ŵ���',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
select @AppTagID=ID from IB_AppTag where AppTag='HY_ME_SVREvent.BeforeDeptMod' and AppTypeID=@AppTypeID 
if @AppTagID is null 
begin 
insert into IB_AppTag(AppTag,FriendName,AppTypeID,ExtendProperties,Description,Customize,IsPlugin) 
 values('HY_ME_SVREvent.BeforeDeptMod','Mes�������޸�ǰ�¼�',@AppTypeID,'','',0,1) 
set @AppTagID=@@identity 
end 
else 
begin 
update IB_AppTag set ExtendProperties='',Description='',Customize=0 where ID=@AppTagID 
end 
select top 1 @EndpointID=ID from IB_EndPoint where AppTagID=@AppTagID 
if @EndpointID is null 
begin 
insert into IB_EndPoint(Address,ProtocolID,ProtocolParams,AppTagID) 
 values('','DotNetAssemblyForRPC','<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeArchiveEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>',@AppTagID) 
end 
else 
begin 
update IB_EndPoint set Address='',ProtocolID='DotNetAssemblyForRPC',ProtocolParams='<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeArchiveEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>' where ID=@EndpointID 
end 
select @MsgTypeCategoryID=ID from MOM_MsgTypeCategories where MsgTypeCategory='����¼�' 
select @MsgFilterID=ID from IB_MsgFilter where FilterName='XPathFilter' 
select @MsgTypeID=ID from IB_MsgType where MsgType='Modify_Before' and AppTypeID=@AppTypeID 
if @MsgTypeID is null 
begin 
insert into IB_MsgType(MsgType,FriendName,MsgSchema,AppTypeID,MsgTypeCategoryID,MsgFilterID,ExtendProperties) values('Modify_Before','�޸�ǰ�¼�','<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="archivedata" type="MSXML2.IXMLDOMDocument2" direction="in" desc="��������XmlDom" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',@AppTypeID,@MsgTypeCategoryID,@MsgFilterID,'') 
 set @MsgTypeID=@@identity 
end 
else 
begin 
update IB_MsgType set MsgSchema='<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="archivedata" type="MSXML2.IXMLDOMDocument2" direction="in" desc="��������XmlDom" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',ExtendProperties='' where ID=@MsgTypeID 
end 
if (select count(*) from IB_Event_Plugin where AppTagID=@AppTagID and MsgTypeID=@MsgTypeID) = 0 
begin 
insert into IB_Event_Plugin(AppTagID,MsgTypeID,AccID,OrderNO,IsSyncOrAsync,Description,Disabled,UnVisible,UnDeleted) values(@AppTagID,@MsgTypeID,'',1,0,'',0,0,0)  
end 
go

-----   ���ŵ����¼� ����   ----


-----   ��Ա�����¼� ��ʼ   ----
-- ��Ա����ǰ
declare @AppSysID int,@AppTypeID int,@AppTagID int,@EndpointID nvarchar(50),@MsgTypeID int,@MsgTypeCategoryID int,@MsgFilterID int,@ParentAppTypeID int 
select @AppSysID=IB_AppSys.ID from IB_AppSys,IB_Entities where IB_Entities.ID=IB_AppSys.EntityID and IB_Entities.EntityTag='U8API' 
if @AppSysID is null 
begin 
insert into IB_Entities(EntityTag,FriendName)values('U8API','U8API') 
insert into IB_AppSys(AppSystem,FriendName,EntityID)values('U8API','U8API',@@identity) 
set @AppSysID=@@identity 
end 
set @ParentAppTypeID=0 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='U8Archive' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('U8Archive','��������',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='hr_hi_person' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('hr_hi_person','��Ա����',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
select @AppTagID=ID from IB_AppTag where AppTag='HY_ME_SVREvent.BeforePsnInv' and AppTypeID=@AppTypeID 
if @AppTagID is null 
begin 
insert into IB_AppTag(AppTag,FriendName,AppTypeID,ExtendProperties,Description,Customize,IsPlugin) 
 values('HY_ME_SVREvent.BeforePsnInv','Mes������Ա����ǰ�¼�',@AppTypeID,'','',0,1) 
set @AppTagID=@@identity 
end 
else 
begin 
update IB_AppTag set ExtendProperties='',Description='',Customize=0 where ID=@AppTagID 
end 
select top 1 @EndpointID=ID from IB_EndPoint where AppTagID=@AppTagID 
if @EndpointID is null 
begin 
insert into IB_EndPoint(Address,ProtocolID,ProtocolParams,AppTagID) 
 values('','DotNetAssemblyForRPC','<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeArchiveEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>',@AppTagID) 
end 
else 
begin 
update IB_EndPoint set Address='',ProtocolID='DotNetAssemblyForRPC',ProtocolParams='<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeArchiveEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>' where ID=@EndpointID 
end 
select @MsgTypeCategoryID=ID from MOM_MsgTypeCategories where MsgTypeCategory='����¼�' 
select @MsgFilterID=ID from IB_MsgFilter where FilterName='XPathFilter' 
select @MsgTypeID=ID from IB_MsgType where MsgType='Add_Before' and AppTypeID=@AppTypeID 
if @MsgTypeID is null 
begin 
insert into IB_MsgType(MsgType,FriendName,MsgSchema,AppTypeID,MsgTypeCategoryID,MsgFilterID,ExtendProperties) values('Add_Before','����ǰ�¼�','<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="archivedata" type="MSXML2.IXMLDOMDocument2" direction="in" desc="��������XmlDom" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',@AppTypeID,@MsgTypeCategoryID,@MsgFilterID,'') 
 set @MsgTypeID=@@identity 
end 
else 
begin 
update IB_MsgType set MsgSchema='<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="archivedata" type="MSXML2.IXMLDOMDocument2" direction="in" desc="��������XmlDom" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',ExtendProperties='' where ID=@MsgTypeID 
end 
if (select count(*) from IB_Event_Plugin where AppTagID=@AppTagID and MsgTypeID=@MsgTypeID) = 0 
begin 
insert into IB_Event_Plugin(AppTagID,MsgTypeID,AccID,OrderNO,IsSyncOrAsync,Description,Disabled,UnVisible,UnDeleted) values(@AppTagID,@MsgTypeID,'',1,0,'',0,0,0)  
end 
go

-- ��Աɾ��ǰ
declare @AppSysID int,@AppTypeID int,@AppTagID int,@EndpointID nvarchar(50),@MsgTypeID int,@MsgTypeCategoryID int,@MsgFilterID int,@ParentAppTypeID int 
select @AppSysID=IB_AppSys.ID from IB_AppSys,IB_Entities where IB_Entities.ID=IB_AppSys.EntityID and IB_Entities.EntityTag='U8API' 
if @AppSysID is null 
begin 
insert into IB_Entities(EntityTag,FriendName)values('U8API','U8API') 
insert into IB_AppSys(AppSystem,FriendName,EntityID)values('U8API','U8API',@@identity) 
set @AppSysID=@@identity 
end 
set @ParentAppTypeID=0 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='U8Archive' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('U8Archive','��������',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='hr_hi_person' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('hr_hi_person','��Ա����',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
select @AppTagID=ID from IB_AppTag where AppTag='HY_ME_SVREvent.BeforePsnDel' and AppTypeID=@AppTypeID 
if @AppTagID is null 
begin 
insert into IB_AppTag(AppTag,FriendName,AppTypeID,ExtendProperties,Description,Customize,IsPlugin) 
 values('HY_ME_SVREvent.BeforePsnDel','Mes������Աɾ��ǰ�¼�',@AppTypeID,'','',0,1) 
set @AppTagID=@@identity 
end 
else 
begin 
update IB_AppTag set ExtendProperties='',Description='',Customize=0 where ID=@AppTagID 
end 
select top 1 @EndpointID=ID from IB_EndPoint where AppTagID=@AppTagID 
if @EndpointID is null 
begin 
insert into IB_EndPoint(Address,ProtocolID,ProtocolParams,AppTagID) 
 values('','DotNetAssemblyForRPC','<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeArchiveEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>',@AppTagID) 
end 
else 
begin 
update IB_EndPoint set Address='',ProtocolID='DotNetAssemblyForRPC',ProtocolParams='<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeArchiveEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>' where ID=@EndpointID 
end 
select @MsgTypeCategoryID=ID from MOM_MsgTypeCategories where MsgTypeCategory='����¼�' 
select @MsgFilterID=ID from IB_MsgFilter where FilterName='XPathFilter' 
select @MsgTypeID=ID from IB_MsgType where MsgType='Delete_Before' and AppTypeID=@AppTypeID 
if @MsgTypeID is null 
begin 
insert into IB_MsgType(MsgType,FriendName,MsgSchema,AppTypeID,MsgTypeCategoryID,MsgFilterID,ExtendProperties) values('Delete_Before','ɾ��ǰ�¼�','<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="archivedata" type="MSXML2.IXMLDOMDocument2" direction="in" desc="��������XmlDom" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',@AppTypeID,@MsgTypeCategoryID,@MsgFilterID,'') 
 set @MsgTypeID=@@identity 
end 
else 
begin 
update IB_MsgType set MsgSchema='<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="archivedata" type="MSXML2.IXMLDOMDocument2" direction="in" desc="��������XmlDom" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',ExtendProperties='' where ID=@MsgTypeID 
end 
if (select count(*) from IB_Event_Plugin where AppTagID=@AppTagID and MsgTypeID=@MsgTypeID) = 0 
begin 
insert into IB_Event_Plugin(AppTagID,MsgTypeID,AccID,OrderNO,IsSyncOrAsync,Description,Disabled,UnVisible,UnDeleted) values(@AppTagID,@MsgTypeID,'',1,0,'',0,0,0)  
end 
go

-- ��Ա�޸�ǰ
declare @AppSysID int,@AppTypeID int,@AppTagID int,@EndpointID nvarchar(50),@MsgTypeID int,@MsgTypeCategoryID int,@MsgFilterID int,@ParentAppTypeID int 
select @AppSysID=IB_AppSys.ID from IB_AppSys,IB_Entities where IB_Entities.ID=IB_AppSys.EntityID and IB_Entities.EntityTag='U8API' 
if @AppSysID is null 
begin 
insert into IB_Entities(EntityTag,FriendName)values('U8API','U8API') 
insert into IB_AppSys(AppSystem,FriendName,EntityID)values('U8API','U8API',@@identity) 
set @AppSysID=@@identity 
end 
set @ParentAppTypeID=0 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='U8Archive' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('U8Archive','��������',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='hr_hi_person' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('hr_hi_person','��Ա����',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
select @AppTagID=ID from IB_AppTag where AppTag='HY_ME_SVREvent.BeforePsnMod' and AppTypeID=@AppTypeID 
if @AppTagID is null 
begin 
insert into IB_AppTag(AppTag,FriendName,AppTypeID,ExtendProperties,Description,Customize,IsPlugin) 
 values('HY_ME_SVREvent.BeforePsnMod','
Mes������Ա�޸�ǰ�¼�',@AppTypeID,'','',0,1) 
set @AppTagID=@@identity 
end 
else 
begin 
update IB_AppTag set ExtendProperties='',Description='',Customize=0 where ID=@AppTagID 
end 
select top 1 @EndpointID=ID from IB_EndPoint where AppTagID=@AppTagID 
if @EndpointID is null 
begin 
insert into IB_EndPoint(Address,ProtocolID,ProtocolParams,AppTagID) 
 values('','DotNetAssemblyForRPC','<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeArchiveEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>',@AppTagID) 
end 
else 
begin 
update IB_EndPoint set Address='',ProtocolID='DotNetAssemblyForRPC',ProtocolParams='<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeArchiveEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>' where ID=@EndpointID 
end 
select @MsgTypeCategoryID=ID from MOM_MsgTypeCategories where MsgTypeCategory='����¼�' 
select @MsgFilterID=ID from IB_MsgFilter where FilterName='XPathFilter' 
select @MsgTypeID=ID from IB_MsgType where MsgType='Modify_Before' and AppTypeID=@AppTypeID 
if @MsgTypeID is null 
begin 
insert into IB_MsgType(MsgType,FriendName,MsgSchema,AppTypeID,MsgTypeCategoryID,MsgFilterID,ExtendProperties) values('Modify_Before','�޸�ǰ�¼�','<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="archivedata" type="MSXML2.IXMLDOMDocument2" direction="in" desc="��������XmlDom" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',@AppTypeID,@MsgTypeCategoryID,@MsgFilterID,'') 
 set @MsgTypeID=@@identity 
end 
else 
begin 
update IB_MsgType set MsgSchema='<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="archivedata" type="MSXML2.IXMLDOMDocument2" direction="in" desc="��������XmlDom" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',ExtendProperties='' where ID=@MsgTypeID 
end 
if (select count(*) from IB_Event_Plugin where AppTagID=@AppTagID and MsgTypeID=@MsgTypeID) = 0 
begin 
insert into IB_Event_Plugin(AppTagID,MsgTypeID,AccID,OrderNO,IsSyncOrAsync,Description,Disabled,UnVisible,UnDeleted) values(@AppTagID,@MsgTypeID,'',1,0,'',0,0,0)  
end 
go
-----   ��Ա�����¼� ����   ----





-----   ��������¼� ��ʼ   ----
--�������ǰ
declare @AppSysID int,@AppTypeID int,@AppTagID int,@EndpointID nvarchar(50),@MsgTypeID int,@MsgTypeCategoryID int,@MsgFilterID int,@ParentAppTypeID int 
select @AppSysID=IB_AppSys.ID from IB_AppSys,IB_Entities where IB_Entities.ID=IB_AppSys.EntityID and IB_Entities.EntityTag='U8API' 
if @AppSysID is null 
begin 
insert into IB_Entities(EntityTag,FriendName)values('U8API','U8API') 
insert into IB_AppSys(AppSystem,FriendName,EntityID)values('U8API','U8API',@@identity) 
set @AppSysID=@@identity 
end 
set @ParentAppTypeID=0 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='U8Archive' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('U8Archive','��������',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='inventory' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('inventory','�������',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
select @AppTagID=ID from IB_AppTag where AppTag='HY_ME_SVREvent.BeforeInvIns' and AppTypeID=@AppTypeID 
if @AppTagID is null 
begin 
insert into IB_AppTag(AppTag,FriendName,AppTypeID,ExtendProperties,Description,Customize,IsPlugin) 
 values('HY_ME_SVREvent.BeforeInvIns','Mes����������ǰ�¼�',@AppTypeID,'','',0,1) 
set @AppTagID=@@identity 
end 
else 
begin 
update IB_AppTag set ExtendProperties='',Description='',Customize=0 where ID=@AppTagID 
end 
select top 1 @EndpointID=ID from IB_EndPoint where AppTagID=@AppTagID 
if @EndpointID is null 
begin 
insert into IB_EndPoint(Address,ProtocolID,ProtocolParams,AppTagID) 
 values('','DotNetAssemblyForRPC','<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeArchiveEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>',@AppTagID) 
end 
else 
begin 
update IB_EndPoint set Address='',ProtocolID='DotNetAssemblyForRPC',ProtocolParams='<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeArchiveEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>' where ID=@EndpointID 
end 
select @MsgTypeCategoryID=ID from MOM_MsgTypeCategories where MsgTypeCategory='����¼�' 
select @MsgFilterID=ID from IB_MsgFilter where FilterName='XPathFilter' 
select @MsgTypeID=ID from IB_MsgType where MsgType='Add_Before' and AppTypeID=@AppTypeID 
if @MsgTypeID is null 
begin 
insert into IB_MsgType(MsgType,FriendName,MsgSchema,AppTypeID,MsgTypeCategoryID,MsgFilterID,ExtendProperties) values('Add_Before','����ǰ�¼�','<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="archivedata" type="MSXML2.IXMLDOMDocument2" direction="in" desc="��������XmlDom" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',@AppTypeID,@MsgTypeCategoryID,@MsgFilterID,'') 
 set @MsgTypeID=@@identity 
end 
else 
begin 
update IB_MsgType set MsgSchema='<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="archivedata" type="MSXML2.IXMLDOMDocument2" direction="in" desc="��������XmlDom" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',ExtendProperties='' where ID=@MsgTypeID 
end 
if (select count(*) from IB_Event_Plugin where AppTagID=@AppTagID and MsgTypeID=@MsgTypeID) = 0 
begin 
insert into IB_Event_Plugin(AppTagID,MsgTypeID,AccID,OrderNO,IsSyncOrAsync,Description,Disabled,UnVisible,UnDeleted) values(@AppTagID,@MsgTypeID,'',2,0,'',0,0,0)  
end 
go

-- ���ɾ��ǰ
declare @AppSysID int,@AppTypeID int,@AppTagID int,@EndpointID nvarchar(50),@MsgTypeID int,@MsgTypeCategoryID int,@MsgFilterID int,@ParentAppTypeID int 
select @AppSysID=IB_AppSys.ID from IB_AppSys,IB_Entities where IB_Entities.ID=IB_AppSys.EntityID and IB_Entities.EntityTag='U8API' 
if @AppSysID is null 
begin 
insert into IB_Entities(EntityTag,FriendName)values('U8API','U8API') 
insert into IB_AppSys(AppSystem,FriendName,EntityID)values('U8API','U8API',@@identity) 
set @AppSysID=@@identity 
end 
set @ParentAppTypeID=0 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='U8Archive' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('U8Archive','��������',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='inventory' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('inventory','�������',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
select @AppTagID=ID from IB_AppTag where AppTag='HY_ME_SVREvent.BeforeInvDel' and AppTypeID=@AppTypeID 
if @AppTagID is null 
begin 
insert into IB_AppTag(AppTag,FriendName,AppTypeID,ExtendProperties,Description,Customize,IsPlugin) 
 values('HY_ME_SVREvent.BeforeInvDel','Mes������ɾ��ǰ�¼�',@AppTypeID,'','',0,1) 
set @AppTagID=@@identity 
end 
else 
begin 
update IB_AppTag set ExtendProperties='',Description='',Customize=0 where ID=@AppTagID 
end 
select top 1 @EndpointID=ID from IB_EndPoint where AppTagID=@AppTagID 
if @EndpointID is null 
begin 
insert into IB_EndPoint(Address,ProtocolID,ProtocolParams,AppTagID) 
 values('','DotNetAssemblyForRPC','<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeArchiveEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>',@AppTagID) 
end 
else 
begin 
update IB_EndPoint set Address='',ProtocolID='DotNetAssemblyForRPC',ProtocolParams='<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeArchiveEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>' where ID=@EndpointID 
end 
select @MsgTypeCategoryID=ID from MOM_MsgTypeCategories where MsgTypeCategory='����¼�' 
select @MsgFilterID=ID from IB_MsgFilter where FilterName='XPathFilter' 
select @MsgTypeID=ID from IB_MsgType where MsgType='Delete_Before' and AppTypeID=@AppTypeID 
if @MsgTypeID is null 
begin 
insert into IB_MsgType(MsgType,FriendName,MsgSchema,AppTypeID,MsgTypeCategoryID,MsgFilterID,ExtendProperties) values('Delete_Before','ɾ��ǰ�¼�','<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="archivedata" type="MSXML2.IXMLDOMDocument2" direction="in" desc="��������XmlDom" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',@AppTypeID,@MsgTypeCategoryID,@MsgFilterID,'') 
 set @MsgTypeID=@@identity 
end 
else 
begin 
update IB_MsgType set MsgSchema='<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="archivedata" type="MSXML2.IXMLDOMDocument2" direction="in" desc="��������XmlDom" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',ExtendProperties='' where ID=@MsgTypeID 
end 
if (select count(*) from IB_Event_Plugin where AppTagID=@AppTagID and MsgTypeID=@MsgTypeID) = 0 
begin 
insert into IB_Event_Plugin(AppTagID,MsgTypeID,AccID,OrderNO,IsSyncOrAsync,Description,Disabled,UnVisible,UnDeleted) values(@AppTagID,@MsgTypeID,'',2,0,'',0,0,0)  
end 
go

-- ����޸�ǰ
declare @AppSysID int,@AppTypeID int,@AppTagID int,@EndpointID nvarchar(50),@MsgTypeID int,@MsgTypeCategoryID int,@MsgFilterID int,@ParentAppTypeID int 
select @AppSysID=IB_AppSys.ID from IB_AppSys,IB_Entities where IB_Entities.ID=IB_AppSys.EntityID and IB_Entities.EntityTag='U8API' 
if @AppSysID is null 
begin 
insert into IB_Entities(EntityTag,FriendName)values('U8API','U8API') 
insert into IB_AppSys(AppSystem,FriendName,EntityID)values('U8API','U8API',@@identity) 
set @AppSysID=@@identity 
end 
set @ParentAppTypeID=0 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='U8Archive' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('U8Archive','��������',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='inventory' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('inventory','�������',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
select @AppTagID=ID from IB_AppTag where AppTag='HY_ME_SVREvent.BeforeInvMod' and AppTypeID=@AppTypeID 
if @AppTagID is null 
begin 
insert into IB_AppTag(AppTag,FriendName,AppTypeID,ExtendProperties,Description,Customize,IsPlugin) 
 values('HY_ME_SVREvent.BeforeInvMod','Mes�������޸�ǰ�¼�',@AppTypeID,'','',0,1) 
set @AppTagID=@@identity 
end 
else 
begin 
update IB_AppTag set ExtendProperties='',Description='',Customize=0 where ID=@AppTagID 
end 
select top 1 @EndpointID=ID from IB_EndPoint where AppTagID=@AppTagID 
if @EndpointID is null 
begin 
insert into IB_EndPoint(Address,ProtocolID,ProtocolParams,AppTagID) 
 values('','DotNetAssemblyForRPC','<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeArchiveEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>',@AppTagID) 
end 
else 
begin 
update IB_EndPoint set Address='',ProtocolID='DotNetAssemblyForRPC',ProtocolParams='<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeArchiveEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>' where ID=@EndpointID 
end 
select @MsgTypeCategoryID=ID from MOM_MsgTypeCategories where MsgTypeCategory='����¼�' 
select @MsgFilterID=ID from IB_MsgFilter where FilterName='XPathFilter' 
select @MsgTypeID=ID from IB_MsgType where MsgType='Modify_Before' and AppTypeID=@AppTypeID 
if @MsgTypeID is null 
begin 
insert into IB_MsgType(MsgType,FriendName,MsgSchema,AppTypeID,MsgTypeCategoryID,MsgFilterID,ExtendProperties) values('Modify_Before','�޸�ǰ�¼�','<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="archivedata" type="MSXML2.IXMLDOMDocument2" direction="in" desc="��������XmlDom" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',@AppTypeID,@MsgTypeCategoryID,@MsgFilterID,'') 
 set @MsgTypeID=@@identity 
end 
else 
begin 
update IB_MsgType set MsgSchema='<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="archivedata" type="MSXML2.IXMLDOMDocument2" direction="in" desc="��������XmlDom" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',ExtendProperties='' where ID=@MsgTypeID 
end 
if (select count(*) from IB_Event_Plugin where AppTagID=@AppTagID and MsgTypeID=@MsgTypeID) = 0 
begin 
insert into IB_Event_Plugin(AppTagID,MsgTypeID,AccID,OrderNO,IsSyncOrAsync,Description,Disabled,UnVisible,UnDeleted) values(@AppTagID,@MsgTypeID,'',2,0,'',0,0,0)  
end 
go

-- �������ǰ
declare @AppSysID int,@AppTypeID int,@AppTagID int,@EndpointID nvarchar(50),@MsgTypeID int,@MsgTypeCategoryID int,@MsgFilterID int,@ParentAppTypeID int 
select @AppSysID=IB_AppSys.ID from IB_AppSys,IB_Entities where IB_Entities.ID=IB_AppSys.EntityID and IB_Entities.EntityTag='U8API' 
if @AppSysID is null 
begin 
insert into IB_Entities(EntityTag,FriendName)values('U8API','U8API') 
insert into IB_AppSys(AppSystem,FriendName,EntityID)values('U8API','U8API',@@identity) 
set @AppSysID=@@identity 
end 
set @ParentAppTypeID=0 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='U8Archive' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('U8Archive','��������',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='inventory' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('inventory','�������',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
select @AppTagID=ID from IB_AppTag where AppTag='HY_ME_SVREvent.BeforeInvBat' and AppTypeID=@AppTypeID 
if @AppTagID is null 
begin 
insert into IB_AppTag(AppTag,FriendName,AppTypeID,ExtendProperties,Description,Customize,IsPlugin) 
 values('HY_ME_SVREvent.BeforeInvBat','Mes����������ǰ�¼�',@AppTypeID,'','',0,1) 
set @AppTagID=@@identity 
end 
else 
begin 
update IB_AppTag set ExtendProperties='',Description='',Customize=0 where ID=@AppTagID 
end 
select top 1 @EndpointID=ID from IB_EndPoint where AppTagID=@AppTagID 
if @EndpointID is null 
begin 
insert into IB_EndPoint(Address,ProtocolID,ProtocolParams,AppTagID) 
 values('','DotNetAssemblyForRPC','<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeArchiveEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>',@AppTagID) 
end 
else 
begin 
update IB_EndPoint set Address='',ProtocolID='DotNetAssemblyForRPC',ProtocolParams='<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeArchiveEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>' where ID=@EndpointID 
end 
select @MsgTypeCategoryID=ID from MOM_MsgTypeCategories where MsgTypeCategory='����¼�' 
select @MsgFilterID=ID from IB_MsgFilter where FilterName='XPathFilter' 
select @MsgTypeID=ID from IB_MsgType where MsgType='MulModify_Before' and AppTypeID=@AppTypeID 
if @MsgTypeID is null 
begin 
insert into IB_MsgType(MsgType,FriendName,MsgSchema,AppTypeID,MsgTypeCategoryID,MsgFilterID,ExtendProperties) values('MulModify_Before','����ǰ�¼�','<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="archivedata" type="MSXML2.IXMLDOMDocument2" direction="in" desc="��������XmlDom" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',@AppTypeID,@MsgTypeCategoryID,@MsgFilterID,'') 
 set @MsgTypeID=@@identity 
end 
else 
begin 
update IB_MsgType set MsgSchema='<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="archivedata" type="MSXML2.IXMLDOMDocument2" direction="in" desc="��������XmlDom" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',ExtendProperties='' where ID=@MsgTypeID 
end 
if (select count(*) from IB_Event_Plugin where AppTagID=@AppTagID and MsgTypeID=@MsgTypeID) = 0 
begin 
insert into IB_Event_Plugin(AppTagID,MsgTypeID,AccID,OrderNO,IsSyncOrAsync,Description,Disabled,UnVisible,UnDeleted) values(@AppTagID,@MsgTypeID,'',1,0,'',0,0,0)  
end 
go
-----   ��������¼� ����   ----



-----   �ͻ������¼� ��ʼ   ----

--�ͻ�����ǰ
declare @AppSysID int,@AppTypeID int,@AppTagID int,@EndpointID nvarchar(50),@MsgTypeID int,@MsgTypeCategoryID int,@MsgFilterID int,@ParentAppTypeID int 
select @AppSysID=IB_AppSys.ID from IB_AppSys,IB_Entities where IB_Entities.ID=IB_AppSys.EntityID and IB_Entities.EntityTag='U8API' 
if @AppSysID is null 
begin 
insert into IB_Entities(EntityTag,FriendName)values('U8API','U8API') 
insert into IB_AppSys(AppSystem,FriendName,EntityID)values('U8API','U8API',@@identity) 
set @AppSysID=@@identity 
end 
set @ParentAppTypeID=0 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='U8Archive' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('U8Archive','��������',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='customer' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('customer','�ͻ�����',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
select @AppTagID=ID from IB_AppTag where AppTag='HY_ME_SVREvent.BeforeCusIns' and AppTypeID=@AppTypeID 
if @AppTagID is null 
begin 
insert into IB_AppTag(AppTag,FriendName,AppTypeID,ExtendProperties,Description,Customize,IsPlugin) 
 values('HY_ME_SVREvent.BeforeCusIns','Mes����ͻ���������ǰ�¼�',@AppTypeID,'','',0,1) 
set @AppTagID=@@identity 
end 
else 
begin 
update IB_AppTag set ExtendProperties='',Description='',Customize=0 where ID=@AppTagID 
end 
select top 1 @EndpointID=ID from IB_EndPoint where AppTagID=@AppTagID 
if @EndpointID is null 
begin 
insert into IB_EndPoint(Address,ProtocolID,ProtocolParams,AppTagID) 
 values('','DotNetAssemblyForRPC','<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeArchiveEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>',@AppTagID) 
end 
else 
begin 
update IB_EndPoint set Address='',ProtocolID='DotNetAssemblyForRPC',ProtocolParams='<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeArchiveEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>' where ID=@EndpointID 
end 
select @MsgTypeCategoryID=ID from MOM_MsgTypeCategories where MsgTypeCategory='����¼�' 
select @MsgFilterID=ID from IB_MsgFilter where FilterName='XPathFilter' 
select @MsgTypeID=ID from IB_MsgType where MsgType='Add_Before' and AppTypeID=@AppTypeID 
if @MsgTypeID is null 
begin 
insert into IB_MsgType(MsgType,FriendName,MsgSchema,AppTypeID,MsgTypeCategoryID,MsgFilterID,ExtendProperties) values('Add_Before','����ǰ�¼�','<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="archivedata" type="MSXML2.IXMLDOMDocument2" direction="in" desc="��������XmlDom" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',@AppTypeID,@MsgTypeCategoryID,@MsgFilterID,'') 
 set @MsgTypeID=@@identity 
end 
else 
begin 
update IB_MsgType set MsgSchema='<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="archivedata" type="MSXML2.IXMLDOMDocument2" direction="in" desc="��������XmlDom" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',ExtendProperties='' where ID=@MsgTypeID 
end 
if (select count(*) from IB_Event_Plugin where AppTagID=@AppTagID and MsgTypeID=@MsgTypeID) = 0 
begin 
insert into IB_Event_Plugin(AppTagID,MsgTypeID,AccID,OrderNO,IsSyncOrAsync,Description,Disabled,UnVisible,UnDeleted) values(@AppTagID,@MsgTypeID,'',1,0,'',0,0,0)  
end 
go

--�ͻ��޸�ǰ
declare @AppSysID int,@AppTypeID int,@AppTagID int,@EndpointID nvarchar(50),@MsgTypeID int,@MsgTypeCategoryID int,@MsgFilterID int,@ParentAppTypeID int 
select @AppSysID=IB_AppSys.ID from IB_AppSys,IB_Entities where IB_Entities.ID=IB_AppSys.EntityID and IB_Entities.EntityTag='U8API' 
if @AppSysID is null 
begin 
insert into IB_Entities(EntityTag,FriendName)values('U8API','U8API') 
insert into IB_AppSys(AppSystem,FriendName,EntityID)values('U8API','U8API',@@identity) 
set @AppSysID=@@identity 
end 
set @ParentAppTypeID=0 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='U8Archive' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('U8Archive','��������',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='customer' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('customer','�ͻ�����',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
select @AppTagID=ID from IB_AppTag where AppTag='HY_ME_SVREvent.BeforeCusMod' and AppTypeID=@AppTypeID 
if @AppTagID is null 
begin 
insert into IB_AppTag(AppTag,FriendName,AppTypeID,ExtendProperties,Description,Customize,IsPlugin) 
 values('HY_ME_SVREvent.BeforeCusMod','Mes����ͻ������޸�ǰ�¼�',@AppTypeID,'','',0,1) 
set @AppTagID=@@identity 
end 
else 
begin 
update IB_AppTag set ExtendProperties='',Description='',Customize=0 where ID=@AppTagID 
end 
select top 1 @EndpointID=ID from IB_EndPoint where AppTagID=@AppTagID 
if @EndpointID is null 
begin 
insert into IB_EndPoint(Address,ProtocolID,ProtocolParams,AppTagID) 
 values('','DotNetAssemblyForRPC','<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeArchiveEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>',@AppTagID) 
end 
else 
begin 
update IB_EndPoint set Address='',ProtocolID='DotNetAssemblyForRPC',ProtocolParams='<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeArchiveEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>' where ID=@EndpointID 
end 
select @MsgTypeCategoryID=ID from MOM_MsgTypeCategories where MsgTypeCategory='����¼�' 
select @MsgFilterID=ID from IB_MsgFilter where FilterName='XPathFilter' 
select @MsgTypeID=ID from IB_MsgType where MsgType='Modify_Before' and AppTypeID=@AppTypeID 
if @MsgTypeID is null 
begin 
insert into IB_MsgType(MsgType,FriendName,MsgSchema,AppTypeID,MsgTypeCategoryID,MsgFilterID,ExtendProperties) values('Modify_Before','�޸�ǰ�¼�','<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="archivedata" type="MSXML2.IXMLDOMDocument2" direction="in" desc="��������XmlDom" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',@AppTypeID,@MsgTypeCategoryID,@MsgFilterID,'') 
 set @MsgTypeID=@@identity 
end 
else 
begin 
update IB_MsgType set MsgSchema='<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="archivedata" type="MSXML2.IXMLDOMDocument2" direction="in" desc="��������XmlDom" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',ExtendProperties='' where ID=@MsgTypeID 
end 
if (select count(*) from IB_Event_Plugin where AppTagID=@AppTagID and MsgTypeID=@MsgTypeID) = 0 
begin 
insert into IB_Event_Plugin(AppTagID,MsgTypeID,AccID,OrderNO,IsSyncOrAsync,Description,Disabled,UnVisible,UnDeleted) values(@AppTagID,@MsgTypeID,'',1,0,'',0,0,0)  
end 
go


--�ͻ�����ǰ

declare @AppSysID int,@AppTypeID int,@AppTagID int,@EndpointID nvarchar(50),@MsgTypeID int,@MsgTypeCategoryID int,@MsgFilterID int,@ParentAppTypeID int 
select @AppSysID=IB_AppSys.ID from IB_AppSys,IB_Entities where IB_Entities.ID=IB_AppSys.EntityID and IB_Entities.EntityTag='U8API' 
if @AppSysID is null 
begin 
insert into IB_Entities(EntityTag,FriendName)values('U8API','U8API') 
insert into IB_AppSys(AppSystem,FriendName,EntityID)values('U8API','U8API',@@identity) 
set @AppSysID=@@identity 
end 
set @ParentAppTypeID=0 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='U8Archive' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('U8Archive','��������',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='customer' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('customer','�ͻ�����',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
select @AppTagID=ID from IB_AppTag where AppTag='HY_ME_SVREvent.BeforeCusBatch' and AppTypeID=@AppTypeID 
if @AppTagID is null 
begin 
insert into IB_AppTag(AppTag,FriendName,AppTypeID,ExtendProperties,Description,Customize,IsPlugin) 
 values('HY_ME_SVREvent.BeforeCusBatch','Mes����ͻ���������ǰ�¼�',@AppTypeID,'','',0,1) 
set @AppTagID=@@identity 
end 
else 
begin 
update IB_AppTag set ExtendProperties='',Description='',Customize=0 where ID=@AppTagID 
end 
select top 1 @EndpointID=ID from IB_EndPoint where AppTagID=@AppTagID 
if @EndpointID is null 
begin 
insert into IB_EndPoint(Address,ProtocolID,ProtocolParams,AppTagID) 
 values('','DotNetAssemblyForRPC','<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeArchiveEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>',@AppTagID) 
end 
else 
begin 
update IB_EndPoint set Address='',ProtocolID='DotNetAssemblyForRPC',ProtocolParams='<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeArchiveEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>' where ID=@EndpointID 
end 
select @MsgTypeCategoryID=ID from MOM_MsgTypeCategories where MsgTypeCategory='����¼�' 
select @MsgFilterID=ID from IB_MsgFilter where FilterName='XPathFilter' 
select @MsgTypeID=ID from IB_MsgType where MsgType='MulModify_Before' and AppTypeID=@AppTypeID 
if @MsgTypeID is null 
begin 
insert into IB_MsgType(MsgType,FriendName,MsgSchema,AppTypeID,MsgTypeCategoryID,MsgFilterID,ExtendProperties) values('MulModify_Before','����ǰ�¼�','<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="archivedata" type="MSXML2.IXMLDOMDocument2" direction="in" desc="��������XmlDom" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',@AppTypeID,@MsgTypeCategoryID,@MsgFilterID,'') 
 set @MsgTypeID=@@identity 
end 
else 
begin 
update IB_MsgType set MsgSchema='<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="archivedata" type="MSXML2.IXMLDOMDocument2" direction="in" desc="��������XmlDom" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',ExtendProperties='' where ID=@MsgTypeID 
end 
if (select count(*) from IB_Event_Plugin where AppTagID=@AppTagID and MsgTypeID=@MsgTypeID) = 0 
begin 
insert into IB_Event_Plugin(AppTagID,MsgTypeID,AccID,OrderNO,IsSyncOrAsync,Description,Disabled,UnVisible,UnDeleted) values(@AppTagID,@MsgTypeID,'',1,0,'',0,0,0)  
end 
go

--�ͻ�ɾ��ǰ
declare @AppSysID int,@AppTypeID int,@AppTagID int,@EndpointID nvarchar(50),@MsgTypeID int,@MsgTypeCategoryID int,@MsgFilterID int,@ParentAppTypeID int 
select @AppSysID=IB_AppSys.ID from IB_AppSys,IB_Entities where IB_Entities.ID=IB_AppSys.EntityID and IB_Entities.EntityTag='U8API' 
if @AppSysID is null 
begin 
insert into IB_Entities(EntityTag,FriendName)values('U8API','U8API') 
insert into IB_AppSys(AppSystem,FriendName,EntityID)values('U8API','U8API',@@identity) 
set @AppSysID=@@identity 
end 
set @ParentAppTypeID=0 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='U8Archive' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('U8Archive','��������',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='customer' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('customer','�ͻ�����',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
select @AppTagID=ID from IB_AppTag where AppTag='HY_ME_SVREvent.BeforeCusDel' and AppTypeID=@AppTypeID 
if @AppTagID is null 
begin 
insert into IB_AppTag(AppTag,FriendName,AppTypeID,ExtendProperties,Description,Customize,IsPlugin) 
 values('HY_ME_SVREvent.BeforeCusDel','Mes����ͻ�����ɾ��ǰ�¼�',@AppTypeID,'','',0,1) 
set @AppTagID=@@identity 
end 
else 
begin 
update IB_AppTag set ExtendProperties='',Description='',Customize=0 where ID=@AppTagID 
end 
select top 1 @EndpointID=ID from IB_EndPoint where AppTagID=@AppTagID 
if @EndpointID is null 
begin 
insert into IB_EndPoint(Address,ProtocolID,ProtocolParams,AppTagID) 
 values('','DotNetAssemblyForRPC','<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeArchiveEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>',@AppTagID) 
end 
else 
begin 
update IB_EndPoint set Address='',ProtocolID='DotNetAssemblyForRPC',ProtocolParams='<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeArchiveEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>' where ID=@EndpointID 
end 
select @MsgTypeCategoryID=ID from MOM_MsgTypeCategories where MsgTypeCategory='����¼�' 
select @MsgFilterID=ID from IB_MsgFilter where FilterName='XPathFilter' 
select @MsgTypeID=ID from IB_MsgType where MsgType='Delete_Before' and AppTypeID=@AppTypeID 
if @MsgTypeID is null 
begin 
insert into IB_MsgType(MsgType,FriendName,MsgSchema,AppTypeID,MsgTypeCategoryID,MsgFilterID,ExtendProperties) values('Delete_Before','ɾ��ǰ�¼�','<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="archivedata" type="MSXML2.IXMLDOMDocument2" direction="in" desc="��������XmlDom" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',@AppTypeID,@MsgTypeCategoryID,@MsgFilterID,'') 
 set @MsgTypeID=@@identity 
end 
else 
begin 
update IB_MsgType set MsgSchema='<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="archivedata" type="MSXML2.IXMLDOMDocument2" direction="in" desc="��������XmlDom" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',ExtendProperties='' where ID=@MsgTypeID 
end 
if (select count(*) from IB_Event_Plugin where AppTagID=@AppTagID and MsgTypeID=@MsgTypeID) = 0 
begin 
insert into IB_Event_Plugin(AppTagID,MsgTypeID,AccID,OrderNO,IsSyncOrAsync,Description,Disabled,UnVisible,UnDeleted) values(@AppTagID,@MsgTypeID,'',5,0,'',0,0,0)  
end 
go

--�ͻ�����ǰ

declare @AppSysID int,@AppTypeID int,@AppTagID int,@EndpointID nvarchar(50),@MsgTypeID int,@MsgTypeCategoryID int,@MsgFilterID int,@ParentAppTypeID int 
select @AppSysID=IB_AppSys.ID from IB_AppSys,IB_Entities where IB_Entities.ID=IB_AppSys.EntityID and IB_Entities.EntityTag='U8API' 
if @AppSysID is null 
begin 
insert into IB_Entities(EntityTag,FriendName)values('U8API','U8API') 
insert into IB_AppSys(AppSystem,FriendName,EntityID)values('U8API','U8API',@@identity) 
set @AppSysID=@@identity 
end 
set @ParentAppTypeID=0 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='U8Archive' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('U8Archive','��������',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='customer' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('customer','�ͻ�����',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
select @AppTagID=ID from IB_AppTag where AppTag='HY_ME_SVREvent.BeforeCusMerge' and AppTypeID=@AppTypeID 
if @AppTagID is null 
begin 
insert into IB_AppTag(AppTag,FriendName,AppTypeID,ExtendProperties,Description,Customize,IsPlugin) 
 values('HY_ME_SVREvent.BeforeCusMerge','Mes����ͻ���������ǰ�¼�',@AppTypeID,'','',0,1) 
set @AppTagID=@@identity 
end 
else 
begin 
update IB_AppTag set ExtendProperties='',Description='',Customize=0 where ID=@AppTagID 
end 
select top 1 @EndpointID=ID from IB_EndPoint where AppTagID=@AppTagID 
if @EndpointID is null 
begin 
insert into IB_EndPoint(Address,ProtocolID,ProtocolParams,AppTagID) 
 values('','DotNetAssemblyForRPC','<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeArchiveEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>',@AppTagID) 
end 
else 
begin 
update IB_EndPoint set Address='',ProtocolID='DotNetAssemblyForRPC',ProtocolParams='<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeArchiveEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>' where ID=@EndpointID 
end 
select @MsgTypeCategoryID=ID from MOM_MsgTypeCategories where MsgTypeCategory='����¼�' 
select @MsgFilterID=ID from IB_MsgFilter where FilterName='XPathFilter' 
select @MsgTypeID=ID from IB_MsgType where MsgType='Merge_Before' and AppTypeID=@AppTypeID 
if @MsgTypeID is null 
begin 
insert into IB_MsgType(MsgType,FriendName,MsgSchema,AppTypeID,MsgTypeCategoryID,MsgFilterID,ExtendProperties) values('Merge_Before','����ǰ�¼�','<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="archivedata" type="MSXML2.IXMLDOMDocument2" direction="in" desc="��������XmlDom" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',@AppTypeID,@MsgTypeCategoryID,@MsgFilterID,'') 
 set @MsgTypeID=@@identity 
end 
else 
begin 
update IB_MsgType set MsgSchema='<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="archivedata" type="MSXML2.IXMLDOMDocument2" direction="in" desc="��������XmlDom" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',ExtendProperties='' where ID=@MsgTypeID 
end 
if (select count(*) from IB_Event_Plugin where AppTagID=@AppTagID and MsgTypeID=@MsgTypeID) = 0 
begin 
insert into IB_Event_Plugin(AppTagID,MsgTypeID,AccID,OrderNO,IsSyncOrAsync,Description,Disabled,UnVisible,UnDeleted) values(@AppTagID,@MsgTypeID,'',1,0,'',0,0,0)  
end 
go


-----   �ͻ������¼� ����   ----


 
-----   ��Ӧ�̵����¼� ��ʼ   ----

--��Ӧ������ǰ
declare @AppSysID int,@AppTypeID int,@AppTagID int,@EndpointID nvarchar(50),@MsgTypeID int,@MsgTypeCategoryID int,@MsgFilterID int,@ParentAppTypeID int 
select @AppSysID=IB_AppSys.ID from IB_AppSys,IB_Entities where IB_Entities.ID=IB_AppSys.EntityID and IB_Entities.EntityTag='U8API' 
if @AppSysID is null 
begin 
insert into IB_Entities(EntityTag,FriendName)values('U8API','U8API') 
insert into IB_AppSys(AppSystem,FriendName,EntityID)values('U8API','U8API',@@identity) 
set @AppSysID=@@identity 
end 
set @ParentAppTypeID=0 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='U8Archive' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('U8Archive','��������',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='vendor' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('vendor','��Ӧ�̵���',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
select @AppTagID=ID from IB_AppTag where AppTag='HY_ME_SVREvent.BeforeVenIns' and AppTypeID=@AppTypeID 
if @AppTagID is null 
begin 
insert into IB_AppTag(AppTag,FriendName,AppTypeID,ExtendProperties,Description,Customize,IsPlugin) 
 values('HY_ME_SVREvent.BeforeVenIns','Mes����Ӧ�̵�������ǰ�¼�',@AppTypeID,'','',0,1) 
set @AppTagID=@@identity 
end 
else 
begin 
update IB_AppTag set ExtendProperties='',Description='',Customize=0 where ID=@AppTagID 
end 
select top 1 @EndpointID=ID from IB_EndPoint where AppTagID=@AppTagID 
if @EndpointID is null 
begin 
insert into IB_EndPoint(Address,ProtocolID,ProtocolParams,AppTagID) 
 values('','DotNetAssemblyForRPC','<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeArchiveEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>',@AppTagID) 
end 
else 
begin 
update IB_EndPoint set Address='',ProtocolID='DotNetAssemblyForRPC',ProtocolParams='<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeArchiveEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>' where ID=@EndpointID 
end 
select @MsgTypeCategoryID=ID from MOM_MsgTypeCategories where MsgTypeCategory='����¼�' 
select @MsgFilterID=ID from IB_MsgFilter where FilterName='XPathFilter' 
select @MsgTypeID=ID from IB_MsgType where MsgType='Add_Before' and AppTypeID=@AppTypeID 
if @MsgTypeID is null 
begin 
insert into IB_MsgType(MsgType,FriendName,MsgSchema,AppTypeID,MsgTypeCategoryID,MsgFilterID,ExtendProperties) values('Add_Before','����ǰ�¼�','<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="archivedata" type="MSXML2.IXMLDOMDocument2" direction="in" desc="��������XmlDom" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',@AppTypeID,@MsgTypeCategoryID,@MsgFilterID,'') 
 set @MsgTypeID=@@identity 
end 
else 
begin 
update IB_MsgType set MsgSchema='<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="archivedata" type="MSXML2.IXMLDOMDocument2" direction="in" desc="��������XmlDom" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',ExtendProperties='' where ID=@MsgTypeID 
end 
if (select count(*) from IB_Event_Plugin where AppTagID=@AppTagID and MsgTypeID=@MsgTypeID) = 0 
begin 
insert into IB_Event_Plugin(AppTagID,MsgTypeID,AccID,OrderNO,IsSyncOrAsync,Description,Disabled,UnVisible,UnDeleted) values(@AppTagID,@MsgTypeID,'',1,0,'',0,0,0)  
end 
go

--��Ӧ���޸�ǰ
declare @AppSysID int,@AppTypeID int,@AppTagID int,@EndpointID nvarchar(50),@MsgTypeID int,@MsgTypeCategoryID int,@MsgFilterID int,@ParentAppTypeID int 
select @AppSysID=IB_AppSys.ID from IB_AppSys,IB_Entities where IB_Entities.ID=IB_AppSys.EntityID and IB_Entities.EntityTag='U8API' 
if @AppSysID is null 
begin 
insert into IB_Entities(EntityTag,FriendName)values('U8API','U8API') 
insert into IB_AppSys(AppSystem,FriendName,EntityID)values('U8API','U8API',@@identity) 
set @AppSysID=@@identity 
end 
set @ParentAppTypeID=0 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='U8Archive' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('U8Archive','��������',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='vendor' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('vendor','��Ӧ�̵���',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
select @AppTagID=ID from IB_AppTag where AppTag='HY_ME_SVREvent.BeforeVenMod' and AppTypeID=@AppTypeID 
if @AppTagID is null 
begin 
insert into IB_AppTag(AppTag,FriendName,AppTypeID,ExtendProperties,Description,Customize,IsPlugin) 
 values('HY_ME_SVREvent.BeforeVenMod','Mes����Ӧ�̵����޸�ǰ�¼�',@AppTypeID,'','',0,1) 
set @AppTagID=@@identity 
end 
else 
begin 
update IB_AppTag set ExtendProperties='',Description='',Customize=0 where ID=@AppTagID 
end 
select top 1 @EndpointID=ID from IB_EndPoint where AppTagID=@AppTagID 
if @EndpointID is null 
begin 
insert into IB_EndPoint(Address,ProtocolID,ProtocolParams,AppTagID) 
 values('','DotNetAssemblyForRPC','<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeArchiveEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>',@AppTagID) 
end 
else 
begin 
update IB_EndPoint set Address='',ProtocolID='DotNetAssemblyForRPC',ProtocolParams='<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeArchiveEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>' where ID=@EndpointID 
end 
select @MsgTypeCategoryID=ID from MOM_MsgTypeCategories where MsgTypeCategory='����¼�' 
select @MsgFilterID=ID from IB_MsgFilter where FilterName='XPathFilter' 
select @MsgTypeID=ID from IB_MsgType where MsgType='Modify_Before' and AppTypeID=@AppTypeID 
if @MsgTypeID is null 
begin 
insert into IB_MsgType(MsgType,FriendName,MsgSchema,AppTypeID,MsgTypeCategoryID,MsgFilterID,ExtendProperties) values('Modify_Before','�޸�ǰ�¼�','<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="archivedata" type="MSXML2.IXMLDOMDocument2" direction="in" desc="��������XmlDom" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',@AppTypeID,@MsgTypeCategoryID,@MsgFilterID,'') 
 set @MsgTypeID=@@identity 
end 
else 
begin 
update IB_MsgType set MsgSchema='<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="archivedata" type="MSXML2.IXMLDOMDocument2" direction="in" desc="��������XmlDom" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',ExtendProperties='' where ID=@MsgTypeID 
end 
if (select count(*) from IB_Event_Plugin where AppTagID=@AppTagID and MsgTypeID=@MsgTypeID) = 0 
begin 
insert into IB_Event_Plugin(AppTagID,MsgTypeID,AccID,OrderNO,IsSyncOrAsync,Description,Disabled,UnVisible,UnDeleted) values(@AppTagID,@MsgTypeID,'',1,0,'',0,0,0)  
end 
go
--��Ӧ��ɾ��ǰ
declare @AppSysID int,@AppTypeID int,@AppTagID int,@EndpointID nvarchar(50),@MsgTypeID int,@MsgTypeCategoryID int,@MsgFilterID int,@ParentAppTypeID int 
select @AppSysID=IB_AppSys.ID from IB_AppSys,IB_Entities where IB_Entities.ID=IB_AppSys.EntityID and IB_Entities.EntityTag='U8API' 
if @AppSysID is null 
begin 
insert into IB_Entities(EntityTag,FriendName)values('U8API','U8API') 
insert into IB_AppSys(AppSystem,FriendName,EntityID)values('U8API','U8API',@@identity) 
set @AppSysID=@@identity 
end 
set @ParentAppTypeID=0 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='U8Archive' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('U8Archive','��������',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='vendor' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('vendor','��Ӧ�̵���',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
select @AppTagID=ID from IB_AppTag where AppTag='HY_ME_SVREvent.BeforeVenDel' and AppTypeID=@AppTypeID 
if @AppTagID is null 
begin 
insert into IB_AppTag(AppTag,FriendName,AppTypeID,ExtendProperties,Description,Customize,IsPlugin) 
 values('HY_ME_SVREvent.BeforeVenDel','Mes����Ӧ�̵���ɾ��ǰ�¼�',@AppTypeID,'','',0,1) 
set @AppTagID=@@identity 
end 
else 
begin 
update IB_AppTag set ExtendProperties='',Description='',Customize=0 where ID=@AppTagID 
end 
select top 1 @EndpointID=ID from IB_EndPoint where AppTagID=@AppTagID 
if @EndpointID is null 
begin 
insert into IB_EndPoint(Address,ProtocolID,ProtocolParams,AppTagID) 
 values('','DotNetAssemblyForRPC','<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeArchiveEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>',@AppTagID) 
end 
else 
begin 
update IB_EndPoint set Address='',ProtocolID='DotNetAssemblyForRPC',ProtocolParams='<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeArchiveEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>' where ID=@EndpointID 
end 
select @MsgTypeCategoryID=ID from MOM_MsgTypeCategories where MsgTypeCategory='����¼�' 
select @MsgFilterID=ID from IB_MsgFilter where FilterName='XPathFilter' 
select @MsgTypeID=ID from IB_MsgType where MsgType='Delete_Before' and AppTypeID=@AppTypeID 
if @MsgTypeID is null 
begin 
insert into IB_MsgType(MsgType,FriendName,MsgSchema,AppTypeID,MsgTypeCategoryID,MsgFilterID,ExtendProperties) values('Delete_Before','ɾ��ǰ�¼�','<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="archivedata" type="MSXML2.IXMLDOMDocument2" direction="in" desc="��������XmlDom" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',@AppTypeID,@MsgTypeCategoryID,@MsgFilterID,'') 
 set @MsgTypeID=@@identity 
end 
else 
begin 
update IB_MsgType set MsgSchema='<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="archivedata" type="MSXML2.IXMLDOMDocument2" direction="in" desc="��������XmlDom" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',ExtendProperties='' where ID=@MsgTypeID 
end 
if (select count(*) from IB_Event_Plugin where AppTagID=@AppTagID and MsgTypeID=@MsgTypeID) = 0 
begin 
insert into IB_Event_Plugin(AppTagID,MsgTypeID,AccID,OrderNO,IsSyncOrAsync,Description,Disabled,UnVisible,UnDeleted) values(@AppTagID,@MsgTypeID,'',1,0,'',0,0,0)  
end 
go
--��Ӧ������ǰ
declare @AppSysID int,@AppTypeID int,@AppTagID int,@EndpointID nvarchar(50),@MsgTypeID int,@MsgTypeCategoryID int,@MsgFilterID int,@ParentAppTypeID int 
select @AppSysID=IB_AppSys.ID from IB_AppSys,IB_Entities where IB_Entities.ID=IB_AppSys.EntityID and IB_Entities.EntityTag='U8API' 
if @AppSysID is null 
begin 
insert into IB_Entities(EntityTag,FriendName)values('U8API','U8API') 
insert into IB_AppSys(AppSystem,FriendName,EntityID)values('U8API','U8API',@@identity) 
set @AppSysID=@@identity 
end 
set @ParentAppTypeID=0 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='U8Archive' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('U8Archive','��������',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='vendor' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('vendor','��Ӧ�̵���',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
select @AppTagID=ID from IB_AppTag where AppTag='HY_ME_SVREvent.BeforeVenBatch' and AppTypeID=@AppTypeID 
if @AppTagID is null 
begin 
insert into IB_AppTag(AppTag,FriendName,AppTypeID,ExtendProperties,Description,Customize,IsPlugin) 
 values('HY_ME_SVREvent.BeforeVenBatch','Mes����Ӧ�̵�������ǰ�¼�',@AppTypeID,'','',0,1) 
set @AppTagID=@@identity 
end 
else 
begin 
update IB_AppTag set ExtendProperties='',Description='',Customize=0 where ID=@AppTagID 
end 
select top 1 @EndpointID=ID from IB_EndPoint where AppTagID=@AppTagID 
if @EndpointID is null 
begin 
insert into IB_EndPoint(Address,ProtocolID,ProtocolParams,AppTagID) 
 values('','DotNetAssemblyForRPC','<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeArchiveEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>',@AppTagID) 
end 
else 
begin 
update IB_EndPoint set Address='',ProtocolID='DotNetAssemblyForRPC',ProtocolParams='<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeArchiveEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>' where ID=@EndpointID 
end 
select @MsgTypeCategoryID=ID from MOM_MsgTypeCategories where MsgTypeCategory='����¼�' 
select @MsgFilterID=ID from IB_MsgFilter where FilterName='XPathFilter' 
select @MsgTypeID=ID from IB_MsgType where MsgType='MulModify_Before' and AppTypeID=@AppTypeID 
if @MsgTypeID is null 
begin 
insert into IB_MsgType(MsgType,FriendName,MsgSchema,AppTypeID,MsgTypeCategoryID,MsgFilterID,ExtendProperties) values('MulModify_Before','����ǰ�¼�','<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="archivedata" type="MSXML2.IXMLDOMDocument2" direction="in" desc="��������XmlDom" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',@AppTypeID,@MsgTypeCategoryID,@MsgFilterID,'') 
 set @MsgTypeID=@@identity 
end 
else 
begin 
update IB_MsgType set MsgSchema='<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="archivedata" type="MSXML2.IXMLDOMDocument2" direction="in" desc="��������XmlDom" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',ExtendProperties='' where ID=@MsgTypeID 
end 
if (select count(*) from IB_Event_Plugin where AppTagID=@AppTagID and MsgTypeID=@MsgTypeID) = 0 
begin 
insert into IB_Event_Plugin(AppTagID,MsgTypeID,AccID,OrderNO,IsSyncOrAsync,Description,Disabled,UnVisible,UnDeleted) values(@AppTagID,@MsgTypeID,'',1,0,'',0,0,0)  
end 
go
--��Ӧ�̲���ǰ
declare @AppSysID int,@AppTypeID int,@AppTagID int,@EndpointID nvarchar(50),@MsgTypeID int,@MsgTypeCategoryID int,@MsgFilterID int,@ParentAppTypeID int 
select @AppSysID=IB_AppSys.ID from IB_AppSys,IB_Entities where IB_Entities.ID=IB_AppSys.EntityID and IB_Entities.EntityTag='U8API' 
if @AppSysID is null 
begin 
insert into IB_Entities(EntityTag,FriendName)values('U8API','U8API') 
insert into IB_AppSys(AppSystem,FriendName,EntityID)values('U8API','U8API',@@identity) 
set @AppSysID=@@identity 
end 
set @ParentAppTypeID=0 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='U8Archive' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('U8Archive','��������',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
set @AppTypeID=0 
select @AppTypeID=ID from IB_AppType where AppType='vendor' and AppSysID=@AppSysID 
if @AppTypeID is null or @AppTypeID=0 
begin 
insert into IB_AppType(AppType,FriendName,AppSysID)values('vendor','��Ӧ�̵���',@AppSysID) 
select @AppTypeID=@@identity 
if @ParentAppTypeID>0 
begin 
update IB_AppType set ParentID=@ParentAppTypeID where ID=@AppTypeID 
end 
end 
set @ParentAppTypeID=@AppTypeID 
select @AppTagID=ID from IB_AppTag where AppTag='HY_ME_SVREvent.BeforeVenMerge' and AppTypeID=@AppTypeID 
if @AppTagID is null 
begin 
insert into IB_AppTag(AppTag,FriendName,AppTypeID,ExtendProperties,Description,Customize,IsPlugin) 
 values('HY_ME_SVREvent.BeforeVenMerge','Mes����Ӧ�̵�������ǰ�¼�',@AppTypeID,'','',0,1) 
set @AppTagID=@@identity 
end 
else 
begin 
update IB_AppTag set ExtendProperties='',Description='',Customize=0 where ID=@AppTagID 
end 
select top 1 @EndpointID=ID from IB_EndPoint where AppTagID=@AppTagID 
if @EndpointID is null 
begin 
insert into IB_EndPoint(Address,ProtocolID,ProtocolParams,AppTagID) 
 values('','DotNetAssemblyForRPC','<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeArchiveEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>',@AppTagID) 
end 
else 
begin 
update IB_EndPoint set Address='',ProtocolID='DotNetAssemblyForRPC',ProtocolParams='<?xml version="1.0" encoding="utf-8"?><momEndPointProtocol name="DotNetAssemblyForRPC"><runtimeParameters><param name="AssemblyPath" value="%U8SOFT%\HY\client\HY_ME_SVR\Event\U8.Interface.Bus.Event.SyncAdapter.dll" description="" display="true" /><param name="ClassFullName" value="U8.Interface.Bus.Event.SyncAdapter.EventBase" description="" display="true" /><param name="MethodName" value="InvokeArchiveEvent" description="" display="true" /><param name="TransactionType" value="" description="" display="true" /></runtimeParameters></momEndPointProtocol>' where ID=@EndpointID 
end 
select @MsgTypeCategoryID=ID from MOM_MsgTypeCategories where MsgTypeCategory='����¼�' 
select @MsgFilterID=ID from IB_MsgFilter where FilterName='XPathFilter' 
select @MsgTypeID=ID from IB_MsgType where MsgType='Merge_Before' and AppTypeID=@AppTypeID 
if @MsgTypeID is null 
begin 
insert into IB_MsgType(MsgType,FriendName,MsgSchema,AppTypeID,MsgTypeCategoryID,MsgFilterID,ExtendProperties) values('Merge_Before','����ǰ�¼�','<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="archivedata" type="MSXML2.IXMLDOMDocument2" direction="in" desc="��������XmlDom" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',@AppTypeID,@MsgTypeCategoryID,@MsgFilterID,'') 
 set @MsgTypeID=@@identity 
end 
else 
begin 
update IB_MsgType set MsgSchema='<?xml version="1.0" encoding="utf-8" ?><serviceInterface transactionType=""><operation name="" ><parameters><parameter index="0" name="archivedata" type="MSXML2.IXMLDOMDocument2" direction="in" desc="��������XmlDom" optional="false" byRef="true" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter index="1" name="errmsg" type="string" direction="inout" desc="���ش�����Ϣ" optional="false" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /><parameter type="bool" direction="retval" desc="����ֵ: true:�ɹ�, false: ʧ��" byRef="false" uapMetaType="" uapMetaID="" uapMetaName="" isBoHead="false" isBoBody="false" /></parameters></operation></serviceInterface>',ExtendProperties='' where ID=@MsgTypeID 
end 
if (select count(*) from IB_Event_Plugin where AppTagID=@AppTagID and MsgTypeID=@MsgTypeID) = 0 
begin 
insert into IB_Event_Plugin(AppTagID,MsgTypeID,AccID,OrderNO,IsSyncOrAsync,Description,Disabled,UnVisible,UnDeleted) values(@AppTagID,@MsgTypeID,'',1,0,'',0,0,0)  
end 
go
-----   ��Ӧ�̵����¼� ����   ----