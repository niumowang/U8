namespace U8.Interface.Bus.ApiService.Voucher.OP.Factory.CQ
{
    using System;
    using System.Collections.Generic;
    using System.Data;
    using U8.Interface.Bus;
    using U8.Interface.Bus.ApiService.BLL;
    using U8.Interface.Bus.ApiService.DAL;
    using U8.Interface.Bus.ApiService.Model;
    using U8.Interface.Bus.DBUtility;

    public class PU_ArrivalVouch : PurchaseRetOp
    {
        private string bodytable = "MES_CQ_rdrecords01Ret";
        private string cardNo = "26";
        private string headtable = "MES_CQ_rdrecord01Ret";
        private string opertype = "opertype";
        private string sourceBodyTable = "PU_ArrivalVouchs";
        private string sourceCardNo = "26";
        private string sourceHeadTable = "PU_ArrivalVouch";
        private string targetVoucherNoColumnName = "cCode";
        private string taskStatusflagColName = "operflag";
        private int tasktype = 0;
        private string voucherNoColumnName = "cCode";
        private string voucherTypeName = "采购退货单";

        public override bool CheckAuditStatus(string strVoucherNo, string strConn)
        {
            return false;
        }

        public override string GetCodeorID(string strID, BaseData bd, string codeorid)
        {
            string str = string.Empty;
            if (codeorid == "id")
            {
                str = "select isnull(id,'') from PU_ArrivalVouch  with(nolock)  where " + this.targetVoucherNoColumnName + "='" + strID + "'";
            }
            if (codeorid == "code")
            {
                str = "select isnull(" + this.targetVoucherNoColumnName + ",'') from PU_ArrivalVouch  with(nolock)  where id ='" + strID + "'";
            }
            APIData data = bd as APIData;
            DbHelperSQLP rsqlp = new DbHelperSQLP(data.get_ConnectInfo().get_Constring());
            string str2 = Common.NullToString(rsqlp.GetSingle(str));
            Common.ErrorMsg(str2, "未能获采购退货单ID或单号");
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
                item.set_Cvoucherno("");
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
                synergismlogdt.set_Cvoucherno("");
                return synergismlogdt;
            }
            return null;
        }

        public override TaskList GetTask()
        {
            string str = "SELECT * FROM " + this.headtable + " WHERE " + this.taskStatusflagColName + " = 0 ";
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
            return "U8API/ArrivedGoods/VoucherSave";
        }

        public override string SetApiAddressAudit()
        {
            return "U8API/ArrivedGoods/ConfirmArr";
        }

        public override string SetApiAddressCancelAudit()
        {
            return "U8API/ArrivedGoods/CancelconfirmArr";
        }

        public override string SetApiAddressDelete()
        {
            return "U8API/ArrivedGoods/Delete";
        }

        public override string SetApiAddressLoad()
        {
            return "U8API/ArrivedGoods/GetVoucherData";
        }

        public override string SetApiAddressUpdate()
        {
            throw new NotImplementedException();
        }

        public override DataSet SetFromTabet(Synergismlogdt dt, Synergismlogdt pdt, APIData apidata)
        {
            ConnectInfo connectInfo = ClassFactory.GetITaskLogDetailDAL(apidata.get_TaskType()).GetConnectInfo(pdt);
            string str = "select top 1 st.*,";
            str = (((((((str + " lt.cRdCode as MES_cRdCode ,lt.ddate as MES_ddate, ") + " lt.cWhCode as MES_cWhCode ,lt.cRdStyleCode as MES_cRdStyleCode, " + " lt.cDepCode as MES_cDepCode ,lt.cVenCode as MES_cVenCode, ") + " lt.cPersonCode as MES_cPersonCode ,lt.cRemark as MES_cRemark, " + " '采购退货单' as cSource ") + " from  " + this.headtable + " lt with(nolock) ") + " INNER JOIN  " + this.bodytable + " lb with(nolock) on lb.id = lt.id ") + " INNER JOIN  " + this.sourceBodyTable + " sb with(nolock) on sb.autoid = lb.dhid ") + " INNER JOIN  " + this.sourceHeadTable + " st with(nolock) on sb.id = st.id ") + " where lt.id ='" + pdt.get_Id() + "' ";
            DataSet set = new DbHelperSQLP(connectInfo.get_Constring()).Query(str);
            Common.ErrorMsg(set, "未能获取采购退货单表头信息");
            return set;
        }

        public override DataSet SetFromTabets(Synergismlogdt dt, Synergismlogdt pdt, APIData apidata)
        {
            ConnectInfo connectInfo = ClassFactory.GetITaskLogDetailDAL(apidata.get_TaskType()).GetConnectInfo(pdt);
            string str2 = ((((((("select st.cCode as cCode,sb.*," + " lt.cWhCode as MES_cWhCode," + " lb.cInvCode as MES_cInvCode,lb.iquantity as MES_iquantity,   ") + " CASE lb." + this.opertype + " WHEN 0 THEN 'A' WHEN 1 THEN 'M' WHEN '2' THEN 'D' ELSE 'A' END as editprop, ") + " lb.iquantity * sb.iOriCost as pro_iOriMoney , " + " lb.iquantity * sb.iOriCost * sb.iTaxRate/100 as pro_iOriTaxPrice , ") + " (lb.iquantity * sb.iOriCost + lb.iquantity * sb.iOriCost * sb.iTaxRate/100 ) as pro_iOriSum , " + " lb.iquantity * sb.iCost as pro_iMoney , ") + " lb.iquantity * sb.iCost * sb.iTaxRate/100 as pro_iTaxPrice , " + " (lb.iquantity * sb.iCost + lb.iquantity * sb.iCost * sb.iTaxRate/100 ) as pro_iSum   ") + " FROM " + this.sourceBodyTable + " sb with(nolock) ") + " INNER JOIN " + this.sourceHeadTable + " st with(nolock) on sb.id = st.id ") + " INNER JOIN " + this.bodytable + " lb with(nolock) on lb.dhid = sb.autoid ";
            string str = str2 + " INNER JOIN " + this.headtable + " lt with(nolock) on lt.id = lb.id where lt.id ='" + pdt.get_Id() + "' ";
            DataSet set = new DbHelperSQLP(connectInfo.get_Constring()).Query(str);
            Common.ErrorMsg(set, "未能获取采购退货单表体信息");
            return set;
        }

        public override void SetNormalValue(APIData apidata, Synergismlogdt dt)
        {
            base.SetNormalValue(apidata, dt);
            string str = "ccode";
            U8NameValue value2 = Common.U8NameValueFind(apidata.get_HeadData(), str);
            if ((value2 != null) && string.IsNullOrEmpty(value2.get_U8FieldValue()))
            {
                DbHelperSQLP rsqlp = new DbHelperSQLP(apidata.get_ConnectInfo().get_Constring());
                string str2 = "select top 1 ccode from PU_ArrivalVouch  with(nolock) ";
                value2.set_U8FieldValue(Common.NullToString(rsqlp.GetSingle(str2)));
                if (string.IsNullOrEmpty(value2.get_U8FieldValue()))
                {
                    value2.set_U8FieldValue("0000000001");
                }
            }
        }

        public override string SetTableName()
        {
            return "PU_ArrivalVouch";
        }

        public override string SetVouchType()
        {
            return "2";
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

