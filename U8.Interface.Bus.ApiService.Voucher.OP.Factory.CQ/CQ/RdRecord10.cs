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

    public class RdRecord10 : StockOP
    {
        private string bodytable = "mes_cq_rdrecords10";
        private string cardNo = "0411";
        private string headtable = "MES_CQ_rdrecord10";
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
                str = "select isnull(id,'') from RdRecord10  with(nolock)  where ccode='" + strID + "'";
            }
            if (codeorid == "code")
            {
                str = "select isnull(ccode,'') from RdRecord10  with(nolock)  where id='" + strID + "'";
            }
            APIData data = bd as APIData;
            DbHelperSQLP rsqlp = new DbHelperSQLP(data.get_ConnectInfo().get_Constring());
            string str2 = Common.NullToString(rsqlp.GetSingle(str));
            Common.ErrorMsg(str2, "未能获产成品入库单ID或单号");
            return str2;
        }

        public override Synergismlogdt GetFirst(Synergismlogdt dt)
        {
            Synergismlogdt synergismlogdt = new Synergismlogdt();
            synergismlogdt.set_Cvouchertype("MO21");
            synergismlogdt.set_Id(dt.get_Id());
            synergismlogdt.set_Ilineno(1);
            DataSet set = DbHelperSQL.Query("SELECT MoCode FROM " + this.bodytable + " with(nolock) WHERE ID = " + Convert.ConvertDbValueFromPro(dt.get_Id(), "string"));
            for (int i = 0; i < set.Tables[0].Rows.Count; i++)
            {
                synergismlogdt.set_Cvoucherno(set.Tables[0].Rows[i]["MoCode"].ToString());
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
            DataSet set = DbHelperSQL.Query("SELECT t.cRdCode,t.id,t.opertype FROM " + this.headtable + " t with(nolock)  WHERE t.id = " + Convert.ConvertDbValueFromPro(autoid, "string"));
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
            if (dt.get_Cvouchertype() == this.cardNo)
            {
                Synergismlogdt synergismlogdt = new Synergismlogdt();
                synergismlogdt.set_Cvouchertype("MO21");
                synergismlogdt.set_Id(dt.get_Id());
                DataSet set = DbHelperSQL.Query("SELECT MoCode FROM " + this.bodytable + " with(nolock) WHERE ID = " + Convert.ConvertDbValueFromPro(dt.get_Id(), "string"));
                for (int i = 0; i < set.Tables[0].Rows.Count; i++)
                {
                    synergismlogdt.set_Cvoucherno(set.Tables[0].Rows[i]["MoCode"].ToString());
                }
                return synergismlogdt;
            }
            return null;
        }

        public override TaskList GetTask()
        {
            string str = ((" SELECT distinct T.* FROM " + this.headtable + " T WITH(NOLOCK) ") + " INNER JOIN " + this.bodytable + " B WITH(NOLOCK) ON T.id = B.id  ") + " INNER JOIN MES_CQ_RdRecords11 MB WITH(NOLOCK) ON MB.MoCode = B.MoCode " + " INNER JOIN MES_CQ_RdRecord11 MT WITH(NOLOCK) ON MT.id = MB.id  AND MT.operflag = 1  and T.opertype = MT.opertype and T.operflag = 0";
            string str2 = "";
            DataTable table = new DataTable();
            table = DbHelperSQL.Query(str).Tables[0];
            if ((table == null) || (table.Rows.Count == 0))
            {
                return null;
            }
            TaskList list = new TaskList();
            int num = 0;
            while (num < table.Rows.Count)
            {
                Exception exception;
                Task item = new Task();
                VoucherType type = new VoucherType();
                type.set_SourceCardNo("MO21");
                type.set_CardNo(this.cardNo);
                type.set_VoucherName("产成品入库单");
                item.VouchType = type;
                item.taskType = 0;
                item.OperType = (int) table.Rows[num]["OperType"];
                try
                {
                    item.id = table.Rows[num]["id"].ToString();
                }
                catch (Exception exception1)
                {
                    exception = exception1;
                    Common.ErrorMsg(SysInfo.productName, "id 值出错！");
                }
                try
                {
                    item.OperType = int.Parse(table.Rows[num]["opertype"].ToString());
                }
                catch (Exception exception2)
                {
                    exception = exception2;
                    Common.ErrorMsg(SysInfo.productName, "opertype 值出错！");
                }
                list.Add(item);
                str2 = str2 + "'" + item.id + "',";
                break;
            }
            if (!string.IsNullOrEmpty(str2))
            {
                string[] strArray = str2.Substring(0, str2.Length - 1).Split(new char[] { ',' });
                DbHelperSQL.ExecuteSql(" update " + this.headtable + " set " + this.taskStatusflagColName + " = 2 where id in (" + strArray[0] + ") ");
            }
            return list;
        }

        public override DealResult MakeAudit(BaseData bd, Synergismlogdt dt)
        {
            return base.MakeAudit(bd, dt);
        }

        public override string SetApiAddressAdd()
        {
            return "U8API/ProductIn/Add";
        }

        public override string SetApiAddressAudit()
        {
            return "U8API/ProductIn/Audit";
        }

        public override string SetApiAddressCancelAudit()
        {
            return "U8API/ProductIn/CancelAudit";
        }

        public override string SetApiAddressDelete()
        {
            return "U8API/ProductIn/Delete";
        }

        public override string SetApiAddressLoad()
        {
            return "U8API/ProductIn/Load";
        }

        public override string SetApiAddressUpdate()
        {
            return "U8API/ProductIn/Update";
        }

        public override DataSet SetFromTabet(Synergismlogdt dt, Synergismlogdt pdt, APIData apidata)
        {
            ConnectInfo connectInfo = ClassFactory.GetITaskLogDetailDAL(apidata.get_TaskType()).GetConnectInfo(pdt);
            string str2 = ((("select t.*,lt.cWhCode as cWhCode ,lt.cRdCode as cCode,lt.cRdStyleCode as MES_T_cRdStyleCode, " + " lt.cdepcode as MES_T_cDepCode ") + ",'" + DateTime.Now.ToString(SysInfo.dateFormat) + "' as ddate ") + ",'生产订单' as cSource ") + ",'" + apidata.get_ConnectInfo().get_UserId() + "'  as PRO_CMaker  ";
            string str = str2 + " from  v_mom_order_wf t with(nolock) left join " + this.bodytable + " lb with(nolock) on lb.mocode = t.mocode left join " + this.headtable + " lt with(nolock) on lt.id = lb.id where lt.id =" + Convert.ConvertDbValueFromPro(pdt.get_Id(), "string") + " ";
            DataSet set = new DbHelperSQLP(connectInfo.get_Constring()).Query(str);
            Common.ErrorMsg(set, "未能获取生产订单表头信息");
            return set;
        }

        public override DataSet SetFromTabets(Synergismlogdt dt, Synergismlogdt pdt, APIData apidata)
        {
            ConnectInfo connectInfo = ClassFactory.GetITaskLogDetailDAL(apidata.get_TaskType()).GetConnectInfo(pdt);
            string str = "select b.*,lt.cWhCode as cWhCode,lb.iquantity as iquantity,lt.cRdCode as cCode   ";
            string str2 = str;
            str = str2 + " from v_mom_orderdetail_wf b with(nolock) left join  v_mom_order_wf t with(nolock) on b.moid = t.moid left join " + this.bodytable + " lb with(nolock) on lb.mocode = t.mocode left join " + this.headtable + " lt with(nolock) on lt.id = lb.id where lt.id =" + Convert.ConvertDbValueFromPro(pdt.get_Id(), "string") + " ";
            DataSet set = new DbHelperSQLP(connectInfo.get_Constring()).Query(str);
            Common.ErrorMsg(set, "未能获取其他入库单表体信息");
            return set;
        }

        public override string SetTableName()
        {
            return "RdRecord10";
        }

        public override string SetVouchType()
        {
            return "10";
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
                builder.Append(" cRdCode = '" + dt.get_Cvoucherno() + "',  ");
            }
            builder.Append(" operflag = " + str + ",  ");
            builder.Append(" cerrordesc = '" + dt.get_Cerrordesc() + "'  ");
            builder.Append(" where id=" + Convert.ConvertDbValueFromPro(dt.get_Id(), "string") + " ");
            return DbHelperSQL.ExecuteSql(builder.ToString());
        }
    }
}

