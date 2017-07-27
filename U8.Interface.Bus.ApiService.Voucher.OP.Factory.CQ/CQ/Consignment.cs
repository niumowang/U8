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

    public class Consignment : SaleOp
    {
        private string bodytable = "MES_CQ_Dispatchlists";
        private string cardNo = "01";
        private string headtable = "MES_CQ_Dispatchlist";
        private string sourceCardNo = "17";
        private string sourceVoucherNoColumnName = "cSoCode";
        private string taskStatusflagColName = "operflag";
        private int tasktype = 0;
        private string voucherNoColumnName = "cdlcode";

        public override bool CheckAuditStatus(string strVoucherNo, string strConn)
        {
            return false;
        }

        public override string GetCodeorID(string strID, BaseData bd, string codeorid)
        {
            string str = string.Empty;
            if (codeorid == "id")
            {
                str = "select isnull(dlid,'') from DispatchList  with(nolock)  where cdlcode ='" + strID + "'";
            }
            if (codeorid == "code")
            {
                str = "select isnull(cdlcode,'') from DispatchList  with(nolock)  where dlid ='" + strID + "'";
            }
            APIData data = bd as APIData;
            DbHelperSQLP rsqlp = new DbHelperSQLP(data.get_ConnectInfo().get_Constring());
            string str2 = Common.NullToString(rsqlp.GetSingle(str));
            Common.ErrorMsg(str2, "未能获销售发货单ID或单号");
            return str2;
        }

        public override Synergismlogdt GetFirst(Synergismlogdt dt)
        {
            Synergismlogdt synergismlogdt = new Synergismlogdt();
            synergismlogdt.set_Cvouchertype(this.sourceCardNo);
            synergismlogdt.set_Id(dt.get_Id());
            synergismlogdt.set_Ilineno(1);
            DataSet set = DbHelperSQL.Query("SELECT cSoCode FROM " + this.headtable + " with(nolock) WHERE ID = '" + dt.get_Id() + "' ");
            for (int i = 0; i < set.Tables[0].Rows.Count; i++)
            {
                synergismlogdt.set_Cvoucherno(set.Tables[0].Rows[i]["cSoCode"].ToString());
                synergismlogdt.set_Autoid(dt.get_Id());
            }
            return synergismlogdt;
        }

        public override Synergismlog GetLogModel(string autoid)
        {
            Synergismlog synergismlog = new Synergismlog();
            synergismlog.set_Id(autoid);
            synergismlog.set_Cvouchertype(this.cardNo);
            synergismlog.set_Cstatus("未处理");
            DataSet set = DbHelperSQL.Query("SELECT t." + this.voucherNoColumnName + ",t.id,t.opertype FROM " + this.headtable + " t with(nolock)  WHERE t.id = '" + autoid + "' ");
            for (int i = 0; i < set.Tables[0].Rows.Count; i++)
            {
                synergismlog.set_Cvoucherno(set.Tables[0].Rows[i][this.voucherNoColumnName].ToString());
                synergismlog.set_Id(set.Tables[0].Rows[i]["id"].ToString());
            }
            return synergismlog;
        }

        public override Synergismlogdt GetModel(string autoid)
        {
            Synergismlogdt synergismlogdt = new Synergismlogdt();
            synergismlogdt.set_Autoid(autoid);
            synergismlogdt.set_Id(autoid);
            synergismlogdt.set_Cvouchertype(this.cardNo);
            synergismlogdt.set_Ilineno(2);
            synergismlogdt.set_Cstatus("未处理");
            DataSet set = DbHelperSQL.Query("SELECT t." + this.voucherNoColumnName + ",t.id,t.opertype FROM " + this.headtable + " t with(nolock)  WHERE t.id = '" + autoid + "' ");
            for (int i = 0; i < set.Tables[0].Rows.Count; i++)
            {
                synergismlogdt.set_Cvoucherno(set.Tables[0].Rows[i][this.voucherNoColumnName].ToString());
                synergismlogdt.set_Autoid(set.Tables[0].Rows[i]["id"].ToString());
                synergismlogdt.set_Id(set.Tables[0].Rows[i]["id"].ToString());
                synergismlogdt.set_Cdealmothed(int.Parse(set.Tables[0].Rows[i]["opertype"].ToString()) + 1);
            }
            return synergismlogdt;
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
                DataSet set = DbHelperSQL.Query("SELECT t." + this.voucherNoColumnName + ",t.id,t.opertype FROM " + this.headtable + " t with(nolock)  WHERE t.id = " + Convert.ConvertDbValueFromPro(dt.get_Id(), "string"));
                for (int i = 0; i < set.Tables[0].Rows.Count; i++)
                {
                    item.set_Cvoucherno(set.Tables[0].Rows[i][this.voucherNoColumnName].ToString());
                    item.set_Autoid(set.Tables[0].Rows[i]["id"].ToString());
                    item.set_Cdealmothed(int.Parse(set.Tables[0].Rows[i]["opertype"].ToString()) + 1);
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
                DataSet set = DbHelperSQL.Query("SELECT cSoCode FROM " + this.headtable + " with(nolock) WHERE ID = " + Convert.ConvertDbValueFromPro(dt.get_Id(), "string"));
                for (int i = 0; i < set.Tables[0].Rows.Count; i++)
                {
                    synergismlogdt.set_Cvoucherno(set.Tables[0].Rows[i]["cSoCode"].ToString());
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
                type.set_SourceVoucherNo(table.Rows[i][this.sourceVoucherNoColumnName].ToString());
                type.set_CardNo(this.cardNo);
                type.set_VoucherName("销售发货单");
                item.VouchType = type;
                item.taskType = 0;
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
            return "U8API/Consignment/Save";
        }

        public override string SetApiAddressAudit()
        {
            return "U8API/Consignment/Audit";
        }

        public override string SetApiAddressCancelAudit()
        {
            return "U8API/Consignment/Audit";
        }

        public override string SetApiAddressDelete()
        {
            return "U8API/Consignment/Delete";
        }

        public override string SetApiAddressLoad()
        {
            return "U8API/Consignment/Load";
        }

        public override string SetApiAddressUpdate()
        {
            return "U8API/Consignment/Save";
        }

        public override DataSet SetFromTabet(Synergismlogdt dt, Synergismlogdt pdt, APIData apidata)
        {
            string str = "SaleOrderQ";
            ConnectInfo connectInfo = ClassFactory.GetITaskLogDetailDAL(apidata.get_TaskType()).GetConnectInfo(pdt);
            string str3 = ("select t.*," + "lt." + this.voucherNoColumnName + " as cCode ") + ",'" + DateTime.Now.ToString(SysInfo.dateFormat) + "' as ddate ";
            string str2 = str3 + " from  " + str + " t with(nolock) left join " + this.headtable + " lt with(nolock) on lt.cSoCode = t.cSoCode where lt.id ='" + pdt.get_Id() + "' ";
            DataSet set = new DbHelperSQLP(connectInfo.get_Constring()).Query(str2);
            Common.ErrorMsg(set, "未能获取销售订单表头信息");
            return set;
        }

        public override DataSet SetFromTabets(Synergismlogdt dt, Synergismlogdt pdt, APIData apidata)
        {
            string str = "SaleOrderQ";
            string str2 = "SaleOrderSQ";
            ConnectInfo connectInfo = ClassFactory.GetITaskLogDetailDAL(apidata.get_TaskType()).GetConnectInfo(pdt);
            string str3 = "select b.*,";
            string str4 = str3 + " CASE lb.opertype WHEN 0 THEN 'A' WHEN 1 THEN 'M' WHEN '2' THEN 'D' ELSE 'A' END as editprop, " + " lb.cWhCode as mes_cWhCode,lb.iquantity as mes_iquantity,lb.cvencode as mes_cvencode   ";
            str3 = str4 + " from " + str2 + " b with(nolock) inner join  " + str + " t with(nolock) on b.id = t.id inner join " + this.bodytable + " lb with(nolock) on lb.isosid = b.isosid inner join " + this.headtable + " lt with(nolock) on lt.id = lb.id where lt.id ='" + pdt.get_Id() + "' ";
            DataSet set = new DbHelperSQLP(connectInfo.get_Constring()).Query(str3);
            Common.ErrorMsg(set, "未能获取销售订单表体信息");
            return set;
        }

        public override string SetTableName()
        {
            return "DispatchList";
        }

        public override string SetVouchType()
        {
            return "9";
        }

        public override int Update(Synergismlog dt)
        {
            return Utility.UpdateMainLog(dt, this.headtable, this.voucherNoColumnName, this.taskStatusflagColName, "cerrordesc");
        }

        public override int Update(Synergismlogdt dt)
        {
            return Utility.UpdateDetailLog(dt, this.headtable, this.voucherNoColumnName, this.taskStatusflagColName, "cerrordesc");
        }
    }
}

