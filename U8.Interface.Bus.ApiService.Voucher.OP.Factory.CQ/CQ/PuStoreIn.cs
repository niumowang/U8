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

    public class PuStoreIn : StockOP
    {
        private string bodytable = "mes_cq_rdrecords01";
        private string cardNo = "24";
        private string errordescColumnName = "cerrordesc";
        private string headtable = "MES_CQ_rdrecord01";
        private string sourceCardNo = "26";
        private string taskStatusflagColName = "operflag";
        private int tasktype = 0;
        private string voucherNoColumnName = "cRdCode";

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
            DataSet set = DbHelperSQL.Query("SELECT t.cRdCode,t.id,t.opertype FROM " + this.headtable + " t with(nolock)  WHERE t.id = '" + autoid + "' ");
            for (int i = 0; i < set.Tables[0].Rows.Count; i++)
            {
                synergismlog.set_Cvoucherno(set.Tables[0].Rows[i]["cRdCode"].ToString());
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
            DataSet set = DbHelperSQL.Query("SELECT t.cRdCode,t.id,t.opertype FROM " + this.headtable + " t with(nolock)  WHERE t.id = " + Convert.ConvertDbValueFromPro(autoid, "string"));
            for (int i = 0; i < set.Tables[0].Rows.Count; i++)
            {
                synergismlogdt.set_Cvoucherno(set.Tables[0].Rows[i]["cRdCode"].ToString());
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
                DataSet set = DbHelperSQL.Query("SELECT t.cRdCode,t.id,t.opertype FROM " + this.headtable + " t with(nolock)  WHERE t.id = " + Convert.ConvertDbValueFromPro(dt.get_Id(), "string"));
                for (int i = 0; i < set.Tables[0].Rows.Count; i++)
                {
                    item.set_Cvoucherno(set.Tables[0].Rows[i]["cRdCode"].ToString());
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
                type.set_VoucherName("采购到货单");
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
            ConnectInfo connectInfo = ClassFactory.GetITaskLogDetailDAL(apidata.get_TaskType()).GetConnectInfo(pdt);
            string str4 = (((((("select t.*," + " t.id as iarriveid ," + " t.id as ipurarriveid ,") + " '' as ipurorderid ," + " lt.cvencode as MES_cvencode,") + " '" + DateTime.Now.ToString(SysInfo.dateFormat) + "' as pro_ddate ") + ",'" + DateTime.Now.ToString(SysInfo.datetimeFormat) + "' as dnmaketime, ") + " lt.cRdCode as cCode ,") + " lt.cWhCode as MES_cWhCode,lt.cRdStyleCode as MES_cRdCode,lt.cDepCode as MES_cDepCode,lt.cPersonCode as MES_cPersonCode , " + " lb.dhCode as MES_dhCode, ") + " '" + apidata.get_ConnectInfo().get_UserId() + "'  as PRO_CMaker  ";
            string str3 = str4 + " from  pu_ArrHead t with(nolock) left join " + this.bodytable + " lb with(nolock) on lb.dhCode = t.ccode left join " + this.headtable + " lt with(nolock) on lt.id = lb.id where lt.id ='" + pdt.get_Id() + "' ";
            DataSet set = new DbHelperSQLP(connectInfo.get_Constring()).Query(str3);
            Common.ErrorMsg(set, "未能获取采购到货单表头信息");
            return set;
        }

        public override DataSet SetFromTabets(Synergismlogdt dt, Synergismlogdt pdt, APIData apidata)
        {
            string str = "pu_ArrHead";
            string str2 = "pu_ArrBody";
            ConnectInfo connectInfo = ClassFactory.GetITaskLogDetailDAL(apidata.get_TaskType()).GetConnectInfo(pdt);
            string str4 = ("select b.*," + " lt.cWhCode as MES_cWhCode,lt.cRdStyleCode as MES_cRdCode,lt.cDepCode as MES_cDepCode,lt.cPersonCode as MES_cPersonCode, " + " lt.cvencode as MES_cvencode,") + " CASE lb.opertype WHEN 0 THEN 'A' WHEN 1 THEN 'M' WHEN '2' THEN 'D' ELSE 'A' END as editprop, " + " lb.iquantity as MES_iquantity   ";
            string str3 = str4 + " from " + str2 + " b with(nolock) inner join  " + str + " t with(nolock) on b.id = t.id inner join " + this.bodytable + " lb with(nolock) on lb.dhid = b.autoid inner join " + this.headtable + " lt with(nolock) on lt.id = lb.id where lt.id ='" + pdt.get_Id() + "' ";
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
                builder.Append(" cRdCode = '" + dt.get_Cvoucherno() + "',  ");
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
            return Utility.UpdateDetailLog(dt, this.headtable, this.voucherNoColumnName, this.taskStatusflagColName, this.errordescColumnName);
        }
    }
}

