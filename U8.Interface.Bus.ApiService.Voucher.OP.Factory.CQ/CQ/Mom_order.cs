namespace U8.Interface.Bus.ApiService.Voucher.OP.Factory.CQ
{
    using System;
    using System.Collections.Generic;
    using System.Data;
    using U8.Interface.Bus;
    using U8.Interface.Bus.ApiService.BLL;
    using U8.Interface.Bus.ApiService.DAL;
    using U8.Interface.Bus.ApiService.Model;
    using U8.Interface.Bus.Comm;
    using U8.Interface.Bus.DBUtility;

    public class Mom_order : SfcOp
    {
        private string bodysubtable = "MES_CQ_Mom_orderdetailsub";
        private string bodytable = "MES_CQ_mom_orderdetail";
        private string cardNo = "MO21";
        private string headtable = "MES_CQ_mom_order";
        private string opertype = "opertype";
        private string sourceBodyTable = "mps_netdemand";
        private string sourceCardNo = "MQ6303";
        private string sourceHeadTable = "mps_netdemand";
        private string taskStatusflagColName = "operflag";
        private int tasktype = 0;
        private string voucherNoColumnName = "mocode";
        private string voucherTypeName = "生产订单";

        public override bool CheckAuditStatus(string strVoucherNo, string strConn)
        {
            return false;
        }

        public override string GetCodeorID(string strID, BaseData bd, string codeorid)
        {
            string str = string.Empty;
            if (codeorid == "id")
            {
                str = "select isnull(moid,'') from mom_order  with(nolock)  where mocode='" + strID + "'";
            }
            if (codeorid == "code")
            {
                str = "select isnull(mocode,'') from mom_order  with(nolock)  where moid ='" + strID + "'";
            }
            APIData data = bd as APIData;
            DbHelperSQLP rsqlp = new DbHelperSQLP(data.get_ConnectInfo().get_Constring());
            string str2 = Common.NullToString(rsqlp.GetSingle(str));
            Common.ErrorMsg(str2, "未能获生产订单ID或单号");
            return str2;
        }

        public override Synergismlogdt GetFirst(Synergismlogdt dt)
        {
            throw new NotImplementedException();
        }

        public override Synergismlog GetLogModel(string id)
        {
            return Utility.GetLogModel(this.headtable, this.cardNo, this.voucherNoColumnName, this.opertype, id);
        }

        public override Synergismlogdt GetModel(string autoid)
        {
            return Utility.GetModel(this.tasktype, this.headtable, this.cardNo, this.voucherNoColumnName, this.opertype, autoid);
        }

        public override List<Synergismlogdt> GetNext(Synergismlogdt dt)
        {
            List<Synergismlogdt> list = new List<Synergismlogdt>();
            if (dt.get_Ilineno() == 1)
            {
                Synergismlogdt item = new Synergismlogdt();
                item.set_Id(dt.get_Id());
                item.set_Cvouchertype(this.cardNo);
                item.set_Ilineno(2);
                item.set_TaskType(this.tasktype);
                item.set_Cstatus("未处理");
                item.set_Isaudit(1);
                DataSet set = DbHelperSQL.Query("SELECT " + this.voucherNoColumnName + " FROM " + this.bodytable + " with(nolock) WHERE ID = '" + dt.get_Id() + "' ");
                for (int i = 0; i < set.Tables[0].Rows.Count; i++)
                {
                    item.set_Cvoucherno(set.Tables[0].Rows[i][this.voucherNoColumnName].ToString());
                }
                list.Add(item);
                return list;
            }
            return list;
        }

        public override Synergismlogdt GetPrevious(Synergismlogdt dt)
        {
            if (dt.get_Cvouchertype() == this.cardNo)
            {
                Synergismlogdt synergismlogdt = new Synergismlogdt();
                synergismlogdt.set_Cvouchertype(this.sourceCardNo);
                synergismlogdt.set_Id(dt.get_Id());
                DataSet set = DbHelperSQL.Query("SELECT " + this.voucherNoColumnName + " FROM " + this.bodytable + " with(nolock) WHERE ID = " + Convert.ConvertDbValueFromPro(dt.get_Id(), "string"));
                for (int i = 0; i < set.Tables[0].Rows.Count; i++)
                {
                    synergismlogdt.set_Cvoucherno(set.Tables[0].Rows[i][this.voucherNoColumnName].ToString());
                }
                return synergismlogdt;
            }
            return null;
        }

        public override TaskList GetTask()
        {
            string str = "SELECT * FROM " + this.headtable + " WHERE operflag = 0 ";
            string str2 = "";
            DataTable table = new DataTable();
            table = DbHelperSQL.Query(str).Tables[0];
            if ((table == null) || (table.Rows.Count == 0))
            {
                return null;
            }
            TaskList list = new TaskList();
            for (int i = 0; i < table.Rows.Count; i++)
            {
                Exception exception;
                Task item = new Task();
                VoucherType type = new VoucherType();
                type.set_SourceCardNo(this.sourceCardNo);
                type.set_CardNo(this.cardNo);
                type.set_VoucherName(this.voucherTypeName);
                item.VouchType = type;
                item.taskType = this.tasktype;
                item.OperType = (int) table.Rows[i]["OperType"];
                try
                {
                    item.id = table.Rows[i]["id"].ToString();
                }
                catch (Exception exception1)
                {
                    exception = exception1;
                    Common.ErrorMsg(SysInfo.productName, "id 值出错！");
                }
                try
                {
                    item.OperType = int.Parse(table.Rows[i]["opertype"].ToString());
                }
                catch (Exception exception2)
                {
                    exception = exception2;
                    Common.ErrorMsg(SysInfo.productName, "opertype 值出错！");
                }
                list.Add(item);
                str2 = str2 + "'" + item.id + "'";
            }
            if (!string.IsNullOrEmpty(str2))
            {
                DbHelperSQL.ExecuteSql(" update " + this.headtable + " set " + this.taskStatusflagColName + " = 2 where id in (" + str2 + ") ");
            }
            return list;
        }

        public override string SetApiAddressAdd()
        {
            return "U8API/MOrder/MOrderAdd";
        }

        public override string SetApiAddressAudit()
        {
            return "U8API/MOrder/MOrderAuditing";
        }

        public override string SetApiAddressCancelAudit()
        {
            return "U8API/MOrder/MOrderUnauditing";
        }

        public override string SetApiAddressDelete()
        {
            return "U8API/MOrder/MOrderDelete";
        }

        public override string SetApiAddressLoad()
        {
            return "U8API/MOrder/MOrderLoad";
        }

        public override string SetApiAddressUpdate()
        {
            return "U8API/MOrder/MOrderUpdate";
        }

        public override DataSet SetFromTabet(Synergismlogdt dt, Synergismlogdt pdt, APIData apidata)
        {
            ConnectInfo connectInfo = ClassFactory.GetITaskLogDetailDAL(apidata.get_TaskType()).GetConnectInfo(pdt);
            string str = "select st.*,";
            str = ((((((str + " lt.PlanCode as MES_cWhCode ,lt.MoCode as MES_MoCode,lt.cWcCode as MES_cWcCode,lt.cInvCode as MES_cInvCode, ") + " lt.cSoCode as MES_cSoCode ,lt.cForCode as MES_cForCode,lt.PStartDate as MES_PStartDate,lt.PDueDate as MES_PDueDate, " + " lt.DmandDate as MES_DmandDate ,lt.MoType as MES_MoType,  ") + " '" + DateTime.Now.ToString(SysInfo.dateFormat) + "' as ddate, ") + " '生产订单' as cSource ") + " from  " + this.headtable + " lt with(nolock) ") + " left join " + this.sourceHeadTable + " st with(nolock) on  ltrim(rtrim(lt.PlanCode)) = ltrim(rtrim(st.PlanCode))  ") + " where lt.id ='" + pdt.get_Id() + "' ";
            DataSet set = new DbHelperSQLP(connectInfo.get_Constring()).Query(str);
            Common.ErrorMsg(set, "未能获取生产计划表头信息");
            return set;
        }

        public override DataSet SetFromTabets(Synergismlogdt dt, Synergismlogdt pdt, APIData apidata)
        {
            ConnectInfo connectInfo = ClassFactory.GetITaskLogDetailDAL(apidata.get_TaskType()).GetConnectInfo(pdt);
            string str = "select st.*,";
            str = ((((((((str + " lt.PlanCode as MES_PlanCode ,lt.MoCode as MES_MoCode,lt.cWcCode as MES_cWcCode,lt.cInvCode as MES_cInvCode, " + " lt.cSoCode as MES_cSoCode ,lt.cForCode as MES_cForCode,lt.PStartDate as MES_PStartDate,lt.PDueDate as MES_PDueDate, ") + " lt.DmandDate as MES_DmandDate ,lt.MoType as MES_MoType,lt.iquantity as MES_iquantity,  " + " sob.iRowNo as sob_iRowNo,sob.cSOCode as sob_cSOCode,  ") + " '" + DateTime.Now.ToString(SysInfo.dateFormat) + "' as ddate, ") + " tt.MoTypeId as PRO_MoTypeId, ") + " tt.MoTypeCode as PRO_MoType, " + " '生产订单' as cSource ") + " from  " + this.headtable + " lt with(nolock) ") + " LEFT JOIN " + this.sourceHeadTable + " st with(nolock) on  ltrim(rtrim(lt.PlanCode)) = ltrim(rtrim(st.PlanCode))  ") + " LEFT JOIN mom_motype tt with(nolock) ON lt.MoType  = substring(tt.MotypeCode,LEN(tt.MotypeCode),1)  " + " left join SO_SODetails sob with(nolock) on Convert(nvarchar,sob.iSOsID) = st.sodid  ") + " where lt.id ='" + pdt.get_Id() + "' ";
            DataSet set = new DbHelperSQLP(connectInfo.get_Constring()).Query(str);
            Common.ErrorMsg(set, "未能获取生产计划表体信息");
            return set;
        }

        public override DataSet SetFromTabetsChild(Synergismlogdt dt, Synergismlogdt pdt, APIData apidata)
        {
            ConnectInfo connectInfo = ClassFactory.GetITaskLogDetailDAL(apidata.get_TaskType()).GetConnectInfo(pdt);
            string str = "select st.*,";
            str = ((((((((str + " lt.PlanCode as MES_cWhCode ,lt.MoCode as MES_MoCode,lt.cWcCode as MES_cWcCode, ") + " lt.cSoCode as MES_cSoCode ,lt.cForCode as MES_cForCode,lt.PStartDate as MES_PStartDate,lt.PDueDate as MES_PDueDate, " + " lt.DmandDate as MES_DmandDate ,lt.MoType as MES_MoType,  ") + " lb.BomID as MES_BomID ,lb.cInvCode as MES_cInvCode,lb.iquantity as MES_iquantity, " + " lb.iquantity * lt.iquantity as MES_C_iquantity,  ") + " '" + DateTime.Now.ToString(SysInfo.dateFormat) + "' as ddate , ") + " '生产订单' as cSource ") + " from  " + this.headtable + " lt with(nolock) ") + " inner join " + this.bodytable + " lb with(nolock) on lt.id = lb.id ") + " left join " + this.sourceHeadTable + " st with(nolock) on  ltrim(rtrim(lt.PlanCode)) = ltrim(rtrim(st.PlanCode))  ") + " where lt.id ='" + pdt.get_Id() + "' ";
            DataSet set = new DbHelperSQLP(connectInfo.get_Constring()).Query(str);
            Common.ErrorMsg(set, "未能获取生产计划表体子件信息");
            return set;
        }

        public override string SetTableName()
        {
            return "mom_order";
        }

        public override int Update(Synergismlog dt)
        {
            return Utility.UpdateMainLog(dt, this.headtable, this.voucherNoColumnName, this.taskStatusflagColName, "cerrordesc");
        }

        public override int Update(Synergismlogdt dt)
        {
            return Utility.UpdateDetailLog(dt, this.headtable, this.voucherNoColumnName, this.taskStatusflagColName, "cerrordesc");
        }

        public override string SubChildEntityName
        {
            get
            {
                return "Mom_MoAllocate";
            }
            set
            {
            }
        }

        public string SubChildSubEntityName
        {
            get
            {
                return "Mom_MoAllocatesub";
            }
            set
            {
            }
        }

        public override string SubEntityName
        {
            get
            {
                return "Mom_OrderDetail";
            }
            set
            {
            }
        }
    }
}

