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

    public class Rdrecord01Ret : StockOP
    {
        private string bodytable = "mes_cq_rdrecords01Ret";
        private string cardNo = "24_Ret";
        private string headtable = "MES_CQ_rdrecord01Ret";
        private string opertype = "opertype_rd";
        private string sourceBodyTable = "PU_ArrivalVouchs";
        private string sourceCardNo = "26";
        private string sourceHeadTable = "PU_ArrivalVouch";
        private string taskStatusflagColName = "operflag_rd";
        private int tasktype = 0;
        private string voucherNoColumnName = "cPuRdCode";
        private string voucherTypeName = "采购入库单(红字)";

        public override bool CheckAuditStatus(string strVoucherNo, string strConn)
        {
            return false;
        }

        public override string GetCodeorID(string strID, BaseData bd, string codeorid)
        {
            string str = string.Empty;
            if (codeorid == "id")
            {
                str = "select isnull(id,'') from rdrecord01  with(nolock)  where ccode='" + strID + "'";
            }
            if (codeorid == "code")
            {
                str = "select isnull(ccode,'') from rdrecord01  with(nolock)  where id='" + strID + "'";
            }
            APIData data = bd as APIData;
            DbHelperSQLP rsqlp = new DbHelperSQLP(data.get_ConnectInfo().get_Constring());
            string str2 = Common.NullToString(rsqlp.GetSingle(str));
            Common.ErrorMsg(str2, "未能获采购入库单ID或单号");
            return str2;
        }

        public override Synergismlogdt GetFirst(Synergismlogdt dt)
        {
            string str = "dhCode";
            Synergismlogdt synergismlogdt = new Synergismlogdt();
            synergismlogdt.set_Cvouchertype(this.sourceCardNo);
            synergismlogdt.set_Id(dt.get_Id());
            synergismlogdt.set_Ilineno(1);
            DataSet set = DbHelperSQL.Query("SELECT " + str + " FROM " + this.bodytable + " with(nolock) WHERE ID = " + Convert.ConvertDbValueFromPro(dt.get_Id(), "string"));
            for (int i = 0; i < set.Tables[0].Rows.Count; i++)
            {
                synergismlogdt.set_Cvoucherno(set.Tables[0].Rows[i][str].ToString());
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
            DataSet set = DbHelperSQL.Query("SELECT t." + this.voucherNoColumnName + ",t.id,t." + this.opertype + " FROM " + this.headtable + " t with(nolock)  WHERE t.id = '" + autoid + "' ");
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
            DataSet set = DbHelperSQL.Query("SELECT t." + this.voucherNoColumnName + ",t.id,t." + this.opertype + " FROM " + this.headtable + " t with(nolock)  WHERE t.id = " + Convert.ConvertDbValueFromPro(autoid, "string"));
            for (int i = 0; i < set.Tables[0].Rows.Count; i++)
            {
                synergismlogdt.set_Cvoucherno(set.Tables[0].Rows[i][this.voucherNoColumnName].ToString());
                synergismlogdt.set_Autoid(set.Tables[0].Rows[i]["id"].ToString());
                synergismlogdt.set_Id(set.Tables[0].Rows[i]["id"].ToString());
                synergismlogdt.set_Cdealmothed(int.Parse(set.Tables[0].Rows[i][this.opertype].ToString()) + 1);
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
                DataSet set = DbHelperSQL.Query("SELECT t." + this.voucherNoColumnName + ",t.id,t." + this.opertype + " FROM " + this.headtable + " t with(nolock)  WHERE t.id = " + Convert.ConvertDbValueFromPro(dt.get_Id(), "string"));
                for (int i = 0; i < set.Tables[0].Rows.Count; i++)
                {
                    item.set_Cvoucherno(set.Tables[0].Rows[i][this.voucherNoColumnName].ToString());
                    item.set_Autoid(set.Tables[0].Rows[i]["id"].ToString());
                    item.set_Cdealmothed(int.Parse(set.Tables[0].Rows[i][this.opertype].ToString()) + 1);
                }
                list.Add(item);
                return list;
            }
            return list;
        }

        public override Synergismlogdt GetPrevious(Synergismlogdt dt)
        {
            string str = "dhCode";
            if (dt.get_Cvouchertype() == this.cardNo)
            {
                Synergismlogdt synergismlogdt = new Synergismlogdt();
                synergismlogdt.set_Cvouchertype(this.sourceCardNo);
                synergismlogdt.set_Id(dt.get_Id());
                DataSet set = DbHelperSQL.Query("SELECT " + str + " FROM " + this.bodytable + " with(nolock) WHERE ID = " + Convert.ConvertDbValueFromPro(dt.get_Id(), "string"));
                for (int i = 0; i < set.Tables[0].Rows.Count; i++)
                {
                    synergismlogdt.set_Cvoucherno(set.Tables[0].Rows[i][str].ToString());
                }
                return synergismlogdt;
            }
            return null;
        }

        public override TaskList GetTask()
        {
            string str = "SELECT * FROM " + this.headtable + " WHERE " + this.taskStatusflagColName + " =0 and operflag = 1 ";
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
                item.OperType = (int) table.Rows[i][this.opertype];
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
                    item.OperType = int.Parse(table.Rows[i][this.opertype].ToString());
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
            return "U8API/PuStoreIn/Add";
        }

        public override string SetApiAddressAudit()
        {
            return "U8API/PuStoreIn/Audit";
        }

        public override string SetApiAddressCancelAudit()
        {
            return "U8API/PuStoreIn/CancelAudit";
        }

        public override string SetApiAddressDelete()
        {
            return "U8API/PuStoreIn/Delete";
        }

        public override string SetApiAddressLoad()
        {
            return "U8API/PuStoreIn/Load";
        }

        public override string SetApiAddressUpdate()
        {
            return "U8API/PuStoreIn/Update";
        }

        public override DataSet SetFromTabet(Synergismlogdt dt, Synergismlogdt pdt, APIData apidata)
        {
            string str = "pu_ArrHead";
            string str2 = "pu_ArrBody";
            ConnectInfo connectInfo = ClassFactory.GetITaskLogDetailDAL(apidata.get_TaskType()).GetConnectInfo(pdt);
            string str4 = ((((((((("select distinct st.*," + " st.ccode as MES_cARVCode, ") + " st.id as iarriveid ," + " st.id as ipurarriveid ,") + " '' as ipurorderid ," + " lt.cvencode as MES_cvencode,") + " '" + DateTime.Now.ToString(SysInfo.dateFormat) + "' as ddate ") + ",'" + DateTime.Now.ToString(SysInfo.datetimeFormat) + "' as dnmaketime, ") + " lt." + this.voucherNoColumnName + " as cCode ,") + " lt.cWhCode as MES_cWhCode,lt.cRdStyleCode as MES_cRdCode,lt.cDepCode as MES_cDepCode,lt.cPersonCode as MES_cPersonCode ") + " FROM " + str2 + " sb with(nolock) ") + " INNER JOIN " + str + " st with(nolock) on sb.id = st.id ") + " INNER JOIN " + this.bodytable + " lb with(nolock) on lb.dhid = sb.autoid ";
            string str3 = str4 + " INNER JOIN " + this.headtable + " lt with(nolock) on lt.id = lb.id where lt.id ='" + dt.get_Id() + "' ";
            DataSet set = new DbHelperSQLP(connectInfo.get_Constring()).Query(str3);
            Common.ErrorMsg(set, "未能获取采购到货单表头信息");
            return set;
        }

        public override DataSet SetFromTabets(Synergismlogdt dt, Synergismlogdt pdt, APIData apidata)
        {
            string str = "pu_ArrHead";
            string str2 = "pu_ArrBody";
            ConnectInfo connectInfo = ClassFactory.GetITaskLogDetailDAL(apidata.get_TaskType()).GetConnectInfo(pdt);
            string str3 = "select sb.*,";
            str3 = ((((((((str3 + " lt.cWhCode as MES_cWhCode,lt.cRdStyleCode as MES_cRdCode,lt.cDepCode as MES_cDepCode,lt.cPersonCode as MES_cPersonCode, " + " lt.cvencode as MES_cvencode,") + " CASE lb." + this.opertype + " WHEN 0 THEN 'A' WHEN 1 THEN 'M' WHEN '2' THEN 'D' ELSE 'A' END as editprop, ") + " lb.iquantity as MES_iquantity,   " + " inv.cComUnitCode as inv_cComUnitCode,inv.cAssComUnitCode as inv_cAssComUnitCode,inv.cSTComUnitCode as inv_cSTComUnitCode ") + " FROM " + str2 + " sb with(nolock) ") + " INNER JOIN " + str + " st with(nolock) on sb.id = st.id ") + " INNER JOIN " + this.bodytable + " lb with(nolock) on lb.dhid = sb.autoid ") + " INNER JOIN " + this.headtable + " lt with(nolock) on lt.id = lb.id ") + " INNER JOIN inventory inv with(nolock) on inv.cinvcode = lb.cinvcode  ") + " where lt.id ='" + dt.get_Id() + "' ";
            DataSet set = new DbHelperSQLP(connectInfo.get_Constring()).Query(str3);
            Common.ErrorMsg(set, "未能获取采购到货单表体信息");
            return set;
        }

        public override string SetTableName()
        {
            return "rdrecord01";
        }

        public override string SetVouchType()
        {
            return "01";
        }

        public override int Update(Synergismlog dt)
        {
            return Utility.UpdateMainLog(dt, this.headtable, this.voucherNoColumnName, this.taskStatusflagColName, "cerrordesc_rd");
        }

        public override int Update(Synergismlogdt dt)
        {
            return Utility.UpdateDetailLog(dt, this.headtable, this.voucherNoColumnName, this.taskStatusflagColName, "cerrordesc_rd");
        }
    }
}

