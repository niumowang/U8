namespace U8.Interface.Bus.ApiService.Voucher.OP.Factory.CQ
{
    using System;
    using System.Collections.Generic;
    using System.Data;
    using System.Data.SqlClient;
    using System.Text;
    using U8.Interface.Bus;
    using U8.Interface.Bus.ApiService.BLL;
    using U8.Interface.Bus.ApiService.DAL;
    using U8.Interface.Bus.ApiService.Model;
    using U8.Interface.Bus.Comm;
    using U8.Interface.Bus.DBUtility;

    public class Mom_order_bak : StockOP
    {
        private string bodytable = "MES_CQ_mom_orderdetail";
        private string cardNo = "0411";
        private string headtable = "MES_CQ_mom_order";
        private string taskStatusflagColName = "operflag";
        private int tasktype = 0;

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
            throw new NotImplementedException();
        }

        public override Synergismlogdt GetModel(string autoid)
        {
            throw new NotImplementedException();
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
                DataSet set = DbHelperSQL.Query("SELECT MoCode FROM " + this.bodytable + " with(nolock) WHERE ID = '" + dt.get_Id() + "' ");
                for (int i = 0; i < set.Tables[0].Rows.Count; i++)
                {
                    item.set_Cvoucherno(set.Tables[0].Rows[i]["MoCode"].ToString());
                }
                list.Add(item);
                return list;
            }
            return null;
        }

        public override Synergismlogdt GetPrevious(Synergismlogdt dt)
        {
            if (dt.get_Cvouchertype() == this.cardNo)
            {
                Synergismlogdt synergismlogdt = new Synergismlogdt();
                synergismlogdt.set_Cvouchertype("MQ63");
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
                type.set_SourceCardNo("MQ63");
                type.set_CardNo(this.cardNo);
                type.set_VoucherName("MRP计划维护");
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

        public override DealResult MakeAudit(BaseData bd, Synergismlogdt dt)
        {
            return base.MakeAudit(bd, dt);
        }

        public override DealResult MakeData(Synergismlogdt dt, BaseData bd)
        {
            DealResult result = new DealResult();
            return base.MakeData(dt, bd);
        }

        public override DealResult MakeVouch(BaseData bd)
        {
            DealResult result = new DealResult();
            return base.MakeVouch(bd);
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
            string str2 = ("select t.*,lt.cWhCode as cWhCode ,lt.cRdCode as cCode " + ",'" + DateTime.Now.ToString(SysInfo.dateFormat) + "' as ddate ") + ",'生产订单' as cSource ";
            string str = str2 + " from  v_mom_order_wf t with(nolock) left join " + this.bodytable + " lb with(nolock) on lb.mocode = t.mocode left join " + this.headtable + " lt with(nolock) on lt.id = lb.id where lt.id ='" + pdt.get_Id() + "' ";
            DataSet set = new DbHelperSQLP(connectInfo.get_Constring()).Query(str);
            Common.ErrorMsg(set, "未能获取生产订单表头信息");
            return set;
        }

        public override DataSet SetFromTabets(Synergismlogdt dt, Synergismlogdt pdt, APIData apidata)
        {
            ConnectInfo connectInfo = ClassFactory.GetITaskLogDetailDAL(apidata.get_TaskType()).GetConnectInfo(pdt);
            string str = "select b.*,lt.cWhCode as cWhCode,lb.iquantity as iquantity,lt.cRdCode as cCode   ";
            string str2 = str;
            str = str2 + " from v_mom_orderdetail_wf b with(nolock) left join  v_mom_order_wf t with(nolock) on b.moid = t.moid left join " + this.bodytable + " lb with(nolock) on lb.mocode = t.mocode left join " + this.headtable + " lt with(nolock) on lt.id = lb.id where lt.id ='" + pdt.get_Id() + "' ";
            DataSet set = new DbHelperSQLP(connectInfo.get_Constring()).Query(str);
            Common.ErrorMsg(set, "未能获取其他入库单表体信息");
            return set;
        }

        public override string SetTableName()
        {
            return "mom_order";
        }

        public override string SetVouchType()
        {
            return "10";
        }

        public override int Update(Synergismlog dt)
        {
            StringBuilder builder = new StringBuilder();
            builder.Append("update " + this.headtable + " set ");
            builder.Append(" cRdCode = @cRdCode,  ");
            builder.Append(" finishTime = @finishTime,  ");
            builder.Append(" operflag = @operflag  ");
            builder.Append(" where id=@id ");
            SqlParameter[] parameterArray = new SqlParameter[] { new SqlParameter("@operflag", SqlDbType.Int, 4), new SqlParameter("@cRdCode", SqlDbType.NVarChar, 30), new SqlParameter("@finishTime", SqlDbType.DateTime), new SqlParameter("@id", SqlDbType.Int, 4) };
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
            parameterArray[0].Value = str;
            parameterArray[1].Value = dt.get_Cvoucherno();
            parameterArray[2].Value = nullable;
            parameterArray[3].Value = dt.get_Id();
            return DbHelperSQL.ExecuteSql(builder.ToString(), parameterArray);
        }

        public override int Update(Synergismlogdt dt)
        {
            StringBuilder builder = new StringBuilder();
            builder.Append("update " + this.headtable + " set ");
            builder.Append(" operflag = @operflag,  ");
            builder.Append(" cerrordesc = @cerrordesc  ");
            builder.Append(" where id=@id ");
            SqlParameter[] parameterArray = new SqlParameter[] { new SqlParameter("@operflag", SqlDbType.Int, 4), new SqlParameter("@cerrordesc", SqlDbType.NVarChar, 0xfa0), new SqlParameter("@id", SqlDbType.Int, 4) };
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
            else
            {
                str = "2";
            }
            parameterArray[0].Value = str;
            parameterArray[1].Value = dt.get_Cerrordesc();
            parameterArray[2].Value = dt.get_Id();
            return DbHelperSQL.ExecuteSql(builder.ToString(), parameterArray);
        }
    }
}

