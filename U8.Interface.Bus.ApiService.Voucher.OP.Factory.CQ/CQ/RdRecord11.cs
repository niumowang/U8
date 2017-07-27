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

    public class RdRecord11 : StockOP
    {
        private string bodytable = "mes_cq_rdrecords11";
        private string cardNo = "0412";
        private string headtable = "MES_CQ_rdrecord11";
        private string sourceBodyTable = "v_mom_orderdetail_wf";
        private string sourceCardNo = "MO21";
        private string sourceHeadTable = "v_mom_order_wf";
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
                str = "select isnull(id,'') from rdrecord11  with(nolock)  where ccode='" + strID + "'";
            }
            if (codeorid == "code")
            {
                str = "select isnull(ccode,'') from rdrecord11  with(nolock)  where id='" + strID + "'";
            }
            APIData data = bd as APIData;
            DbHelperSQLP rsqlp = new DbHelperSQLP(data.get_ConnectInfo().get_Constring());
            string str2 = Common.NullToString(rsqlp.GetSingle(str));
            Common.ErrorMsg(str2, "未能获材料出库单ID或单号");
            return str2;
        }

        public override Synergismlogdt GetFirst(Synergismlogdt dt)
        {
            Synergismlogdt synergismlogdt = new Synergismlogdt();
            synergismlogdt.set_Cvouchertype(this.sourceCardNo);
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
            if (dt.get_Cvouchertype() == this.cardNo)
            {
                Synergismlogdt synergismlogdt = new Synergismlogdt();
                synergismlogdt.set_Cvouchertype(this.sourceCardNo);
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
            string str = ((" SELECT distinct T.* FROM " + this.headtable + " T WITH(NOLOCK) ") + " INNER JOIN " + this.bodytable + " B WITH(NOLOCK) ON T.id = B.id  ") + " INNER JOIN MES_CQ_mom_order MT WITH(NOLOCK) ON MT.MoCode = B.MoCode  AND MT.operflag = 1  and T.opertype = MT.opertype and T.operflag = 0 ";
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
                type.set_SourceCardNo(this.sourceCardNo);
                type.set_CardNo(this.cardNo);
                type.set_VoucherName("材料出库单");
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

        public override string SetApiAddressAdd()
        {
            return "U8API/MaterialOut/Add";
        }

        public override string SetApiAddressAudit()
        {
            return "U8API/MaterialOut/Audit";
        }

        public override string SetApiAddressCancelAudit()
        {
            return "U8API/MaterialOut/CancelAudit";
        }

        public override string SetApiAddressDelete()
        {
            return "U8API/MaterialOut/Delete";
        }

        public override string SetApiAddressLoad()
        {
            return "U8API/MaterialOut/Load";
        }

        public override string SetApiAddressUpdate()
        {
            return "U8API/MaterialOut/Update";
        }

        public override DataSet SetFromTabet(Synergismlogdt dt, Synergismlogdt pdt, APIData apidata)
        {
            ConnectInfo connectInfo = ClassFactory.GetITaskLogDetailDAL(apidata.get_TaskType()).GetConnectInfo(pdt);
            string str2 = (("select t.*," + "lt.cWhCode as MES_cWhCode ,lt.cRdCode as cCode,lt.cvencode as mes_cvencode, lt.cDepCode as mes_cdepcode,lt.cRdStyleCode as MES_cRdStyleCode ") + ",'" + DateTime.Now.ToString(SysInfo.dateFormat) + "' as ddate,") + " lb.MoCode as MES_T_MOCODE " + ",'生产订单' as cSource ";
            string str = str2 + " from  " + this.sourceHeadTable + " t with(nolock) INNER JOIN " + this.bodytable + " lb with(nolock) on lb.mocode = t.mocode INNER JOIN " + this.headtable + " lt with(nolock) on lt.id = lb.id where lt.id ='" + pdt.get_Id() + "' ";
            DataSet set = new DbHelperSQLP(connectInfo.get_Constring()).Query(str);
            Common.ErrorMsg(set, "未能获取生产订单表头信息");
            return set;
        }

        public override DataSet SetFromTabets(Synergismlogdt dt, Synergismlogdt pdt, APIData apidata)
        {
            ConnectInfo connectInfo = ClassFactory.GetITaskLogDetailDAL(apidata.get_TaskType()).GetConnectInfo(pdt);
            string str2 = (("select b.*," + " sb.DSortSeq as DSortSeq , ") + " lt.cWhCode as MES_cWhCode,lt.cRdCode as cCode,sb.modid as modid," + " lb.iquantity as MES_iquantity, lb.cVenCode as mes_cvencode,lb.cpinvcode as mes_cpinvcode,lb.cInvCode as mes_cinvcode,lb.mocode as mes_mocode,  ") + " CASE lb.opertype WHEN 0 THEN 'A' WHEN 1 THEN 'M' WHEN '2' THEN 'D' ELSE 'A' END as editprop,  " + " lb.MOCODE as MES_B_MOCODE ";
            str2 = ((str2 + " from " + this.sourceBodyTable + " sb with(nolock) INNER JOIN  " + this.sourceHeadTable + " t with(nolock) on sb.moid = t.moid ") + " INNER JOIN mom_moallocate b with(nolock) on b.modid = sb.modid ") + " INNER JOIN " + this.bodytable + " lb with(nolock) on lb.mocode = t.mocode and lb.cinvcode = b.invcode and lb.cpinvcode = sb.dinvcode ";
            string str = str2 + " INNER JOIN " + this.headtable + " lt with(nolock) on lt.id = lb.id where lt.id ='" + pdt.get_Id() + "' ";
            DataSet set = new DbHelperSQLP(connectInfo.get_Constring()).Query(str);
            Common.ErrorMsg(set, "未能获取生产订单表体信息");
            return set;
        }

        public override string SetTableName()
        {
            return "rdrecord11";
        }

        public override string SetVouchType()
        {
            return "11";
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

