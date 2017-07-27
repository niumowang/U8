namespace U8.Interface.Bus.ApiService.Voucher.OP.Factory.CQ
{
    using System;
    using System.Data;
    using System.Text;
    using U8.Interface.Bus.ApiService.Model;
    using U8.Interface.Bus.Comm;
    using U8.Interface.Bus.DBUtility;

    public static class Utility
    {
        public static Synergismlog GetLogModel(string headtable, string cvouchertype, string voucherNoColumnName, string opertypecolname, string autoid)
        {
            Synergismlog synergismlog = new Synergismlog();
            synergismlog.set_Id(autoid);
            synergismlog.set_Cvouchertype(cvouchertype);
            synergismlog.set_Cstatus("未处理");
            DataSet set = DbHelperSQL.Query("SELECT t." + voucherNoColumnName + ",t.id,t." + opertypecolname + " FROM " + headtable + " t with(nolock)  WHERE t.id = '" + autoid + "' ");
            for (int i = 0; i < set.Tables[0].Rows.Count; i++)
            {
                synergismlog.set_Cvoucherno(set.Tables[0].Rows[i][voucherNoColumnName].ToString());
                synergismlog.set_Id(set.Tables[0].Rows[i]["id"].ToString());
            }
            return synergismlog;
        }

        public static Synergismlogdt GetModel(int tasktype, string headtable, string cvouchertype, string vouchernocolname, string opertypecolname, string autoid)
        {
            Synergismlogdt synergismlogdt = new Synergismlogdt();
            synergismlogdt.set_Autoid(autoid);
            synergismlogdt.set_Id(autoid);
            synergismlogdt.set_Cvouchertype(cvouchertype);
            synergismlogdt.set_Ilineno(2);
            synergismlogdt.set_TaskType(tasktype);
            synergismlogdt.set_Cstatus("未处理");
            DataSet set = DbHelperSQL.Query("SELECT t." + vouchernocolname + ",t.id,t." + opertypecolname + " FROM " + headtable + " t with(nolock)  WHERE t.id = " + Convert.ConvertDbValueFromPro(autoid, "string"));
            for (int i = 0; i < set.Tables[0].Rows.Count; i++)
            {
                synergismlogdt.set_Cvoucherno(set.Tables[0].Rows[i][vouchernocolname].ToString());
                synergismlogdt.set_Autoid(set.Tables[0].Rows[i]["id"].ToString());
                synergismlogdt.set_Id(set.Tables[0].Rows[i]["id"].ToString());
                synergismlogdt.set_Cdealmothed(int.Parse(set.Tables[0].Rows[i][opertypecolname].ToString()) + 1);
            }
            return synergismlogdt;
        }

        public static int UpdateDetailLog(Synergismlogdt dt, string headtable, string voucherNoColumnName, string flagColname, string errordesccolname)
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
            builder.Append("update " + headtable + " set ");
            if (!string.IsNullOrEmpty(dt.get_Cvoucherno()))
            {
                builder.Append(" " + voucherNoColumnName + " = '" + dt.get_Cvoucherno() + "',  ");
            }
            builder.Append(" " + flagColname + " = " + str + ", ");
            if (str == "0")
            {
                builder.Append(" " + errordesccolname + " = null    ");
            }
            else if (string.IsNullOrEmpty(dt.get_Cerrordesc()))
            {
                builder.Append("  " + errordesccolname + " = null ");
            }
            else
            {
                builder.Append("  " + errordesccolname + " = '" + Convert.EncodeDbValue(dt.get_Cerrordesc()) + "'  ");
            }
            builder.Append(" where id=" + Convert.ConvertDbValueFromPro(dt.get_Id(), "string") + " ");
            return DbHelperSQL.ExecuteSql(builder.ToString());
        }

        public static int UpdateMainLog(Synergismlog dt, string headtable, string voucherNoColumnName, string flagColname, string errordesccolname)
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
            builder.Append("update " + headtable + " set ");
            if (!string.IsNullOrEmpty(dt.get_Cvoucherno()))
            {
                builder.Append(" " + voucherNoColumnName + " = '" + dt.get_Cvoucherno() + "',  ");
            }
            if (!nullable.HasValue)
            {
                builder.Append(" finishTime = null,  ");
            }
            else
            {
                builder.Append(" finishTime = '" + nullable + "',  ");
            }
            if (str == "0")
            {
                builder.Append(" " + errordesccolname + " = null ,  ");
            }
            builder.Append(" " + flagColname + " = " + str + "  ");
            builder.Append(" where id= " + Convert.ConvertDbValueFromPro(dt.get_Id(), "string") + " ");
            return DbHelperSQL.ExecuteSql(builder.ToString());
        }
    }
}

