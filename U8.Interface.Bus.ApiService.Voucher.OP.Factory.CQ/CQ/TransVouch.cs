namespace U8.Interface.Bus.ApiService.Voucher.OP.Factory.CQ
{
    using System;
    using System.Collections.Generic;
    using System.Data;
    using System.Text;
    using U8.Interface.Bus;
    using U8.Interface.Bus.ApiService.BLL;
    using U8.Interface.Bus.ApiService.DAL;
    using U8.Interface.Bus.ApiService.Model;
    using U8.Interface.Bus.Comm;
    using U8.Interface.Bus.DBUtility;

    public class TransVouch : StockOP
    {
        private string bodytable = "MES_CQ_TransVouchs";
        private string cardNo = "0304";
        private string headtable = "MES_CQ_TransVouch";
        private string sourceBodyTable = "";
        private string sourceCardNo = "";
        private string sourceHeadTable = "";
        private string sourceVoucherNoColumnName = "ctvcode";
        private string taskStatusflagColName = "operflag";
        private int tasktype = 0;
        private string voucherNoColumnName = "ctvcode";
        private string voucherTypeName = "调拨单";

        public override bool CheckAuditStatus(string strVoucherNo, string strConn)
        {
            return false;
        }

        public override string GetCodeorID(string strID, BaseData bd, string codeorid)
        {
            string str = string.Empty;
            if (codeorid == "id")
            {
                str = "select isnull(id,'') from TransVouch  with(nolock)  where ctvcode ='" + strID + "'";
            }
            if (codeorid == "code")
            {
                str = "select isnull(ctvcode,'') from TransVouch  with(nolock)  where id ='" + strID + "'";
            }
            APIData data = bd as APIData;
            DbHelperSQLP rsqlp = new DbHelperSQLP(data.get_ConnectInfo().get_Constring());
            string str2 = Common.NullToString(rsqlp.GetSingle(str));
            Common.ErrorMsg(str2, "未能获取" + this.voucherTypeName + "ID或单号");
            return str2;
        }

        public override Synergismlogdt GetFirst(Synergismlogdt dt)
        {
            Synergismlogdt synergismlogdt = new Synergismlogdt();
            synergismlogdt.set_Cvouchertype(this.sourceCardNo);
            synergismlogdt.set_Id(dt.get_Id());
            synergismlogdt.set_Ilineno(1);
            synergismlogdt.set_Autoid(dt.get_Id());
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
            synergismlogdt.set_Isaudit(1);
            DataSet set = DbHelperSQL.Query("SELECT t." + this.voucherNoColumnName + ",t.id,t.opertype FROM " + this.headtable + " t with(nolock)  WHERE t.id = " + Convert.ConvertDbValueFromPro(autoid, "string"));
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
                synergismlogdt.set_Autoid(dt.get_Id());
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
                type.set_VoucherName("调拨单");
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
            return "U8API/TransVouch/Add";
        }

        public override string SetApiAddressAudit()
        {
            return "U8API/TransVouch/Audit";
        }

        public override string SetApiAddressCancelAudit()
        {
            return "U8API/TransVouch/CancelAudit";
        }

        public override string SetApiAddressDelete()
        {
            return "U8API/TransVouch/Delete";
        }

        public override string SetApiAddressLoad()
        {
            return "U8API/TransVouch/Load";
        }

        public override string SetApiAddressUpdate()
        {
            throw new NotImplementedException();
        }

        public override DataSet SetFromTabet(Synergismlogdt dt, Synergismlogdt pdt, APIData apidata)
        {
            ConnectInfo connectInfo = ClassFactory.GetITaskLogDetailDAL(apidata.get_TaskType()).GetConnectInfo(pdt);
            string str2 = ((((((("select " + " '" + connectInfo.get_UserId() + "' as cMaker,") + " '" + DateTime.Now.ToString(SysInfo.dateFormat) + "' as dTVDate ") + ",'" + DateTime.Now.ToString(SysInfo.datetimeFormat) + "' as dnmaketime, ") + " lt.cTvCode as mes_cTvCode ,") + " lt.cIDepCode as mes_T_cIDepCode ," + " lt.cODepCode as mes_T_cODepCode ,") + " lt.cIWhCode as mes_cIWhCode ," + " lt.cOWhCode as mes_cOWhCode ,") + " lt.cIRdCode as mes_cIRdCode ," + " lt.cORdCode as mes_cORdCode, ") + " lt.cPersonCode as mes_T_cPersonCode, " + " lt.cremark as mes_cTVMemo  ";
            string str = str2 + " from   " + this.bodytable + " lb with(nolock) INNER JOIN " + this.headtable + " lt with(nolock) on lt.id = lb.id where lt.id ='" + pdt.get_Id() + "' ";
            DataSet set = new DbHelperSQLP(connectInfo.get_Constring()).Query(str);
            Common.ErrorMsg(set, "未能获取 表头信息");
            return set;
        }

        public override DataSet SetFromTabets(Synergismlogdt dt, Synergismlogdt pdt, APIData apidata)
        {
            ConnectInfo connectInfo = ClassFactory.GetITaskLogDetailDAL(apidata.get_TaskType()).GetConnectInfo(pdt);
            string str2 = (((("select  " + " lt.cTvCode as mes_cTvCode ,") + " lt.cIWhCode as mes_cIWhCode ," + " lt.cOWhCode as mes_cOWhCode ,") + " lt.cIRdCode as mes_cIRdCode ," + " lt.cORdCode as mes_cORdCode, ") + " lt.cremark as mes_cTVMemo , " + " CASE lb.opertype WHEN 0 THEN 'A' WHEN 1 THEN 'M' WHEN '2' THEN 'D' ELSE 'A' END as editprop, ") + " lb.cinvcode as mes_cinvcode ,lb.cVenCode as MES_B_cVenCode,  " + " lb.iquantity as MES_iquantity   ";
            string str = str2 + " from   " + this.bodytable + " lb with(nolock) INNER JOIN " + this.headtable + " lt with(nolock) on lt.id = lb.id where lt.id ='" + pdt.get_Id() + "' ";
            DataSet set = new DbHelperSQLP(connectInfo.get_Constring()).Query(str);
            Common.ErrorMsg(set, "未能获取 表体信息");
            return set;
        }

        public override string SetTableName()
        {
            return "TransVouch";
        }

        public override string SetVouchType()
        {
            return "12";
        }

        public override int Update(Synergismlog dt)
        {
            DateTime? nullable = null;
            string str = dt.get_Cstatus();
            if ((str == "完成") || (str == "等待中"))
            {
                str = "1";
                nullable = new DateTime?(DateTime.Now);
            }
            else if (str == "错误")
            {
                str = "3";
            }
            else if (str == "未处理")
            {
                str = "0";
            }
            else if (str == "已作废")
            {
                str = "4";
            }
            else
            {
                str = "2";
            }
            StringBuilder builder = new StringBuilder();
            builder.Append("update " + this.headtable + " set ");
            if (!string.IsNullOrEmpty(dt.get_Cvoucherno()))
            {
                builder.Append(" ctvcode = '" + dt.get_Cvoucherno() + "',  ");
            }
            if (!nullable.HasValue)
            {
                builder.Append(" finishTime = null,  ");
            }
            else
            {
                builder.Append(" finishTime = '" + nullable + "',  ");
            }
            builder.Append(" operflag = " + str + "  ");
            builder.Append(" where id= " + Convert.ConvertDbValueFromPro(dt.get_Id(), "string") + " ");
            return DbHelperSQL.ExecuteSql(builder.ToString());
        }

        public override int Update(Synergismlogdt dt)
        {
            string str = dt.get_Cstatus();
            if (str == "完成")
            {
                str = "1";
            }
            else if (str == "错误")
            {
                str = "3";
            }
            else if (str == "未处理")
            {
                str = "0";
            }
            else if (str == "已删除")
            {
                str = "1";
            }
            else
            {
                str = "2";
            }
            StringBuilder builder = new StringBuilder();
            builder.Append("update " + this.headtable + " set ");
            if (!string.IsNullOrEmpty(dt.get_Cvoucherno()))
            {
                builder.Append(" ctvcode = '" + dt.get_Cvoucherno() + "',  ");
            }
            builder.Append(" operflag = " + str + ",  ");
            builder.Append(" cerrordesc = '" + dt.get_Cerrordesc() + "'  ");
            builder.Append(" where id=" + Convert.ConvertDbValueFromPro(dt.get_Id(), "string") + " ");
            return DbHelperSQL.ExecuteSql(builder.ToString());
        }
    }
}

