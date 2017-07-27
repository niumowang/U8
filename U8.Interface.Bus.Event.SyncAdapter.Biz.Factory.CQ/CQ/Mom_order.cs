namespace U8.Interface.Bus.Event.SyncAdapter.Biz.Factory.CQ
{
    using ADODB;
    using System;
    using System.Data;
    using System.Text;
    using U8.Interface.Bus.Config;
    using U8.Interface.Bus.Event.SyncAdapter.Biz;

    public class Mom_order : BizBase
    {
        private Mom_orderdetail detailBiz;
        private Mom_OrderBom detailBomBiz;
        private Mom_moallocate locateBiz;
        private int modid;
        private int moid;

        public Mom_order(ref Connection conn, int moid, int modid, string ufConnStr, string _opertype) : base(conn, ufConnStr)
        {
            base.oracleTableName = "MES_CQ_mom_order";
            base.oraclePriKey = "MoCode";
            base.fieldcmpTablename = "MES_CQ_mom_order";
            base.ufTableName = "mom_order";
            base.ufPriKey = "MoId";
            base.opertype = _opertype;
            this.modid = modid;
            this.moid = moid;
        }

        public override object Delete()
        {
            if (ConfigUtility.get_LogOper())
            {
                return this.Insert();
            }
            return this.DeleteLog();
        }

        public object DeleteLog()
        {
            StringBuilder builder = new StringBuilder();
            if (base.lst.Count == 0)
            {
                this.SetData(this.moid, this.modid);
            }
            builder.Append(this.detailBiz.CreateDeleteString());
            builder.Append(this.detailBomBiz.CreateDeleteString());
            if (builder.Length > 0)
            {
                return this.ExecSql(builder.ToString());
            }
            return null;
        }

        public override DataTable GetSourceData(string sourceTableName, string sourceKeyName, string sourceKeyValue, string colNames)
        {
            string ufTableName = base.ufTableName;
            string str2 = string.Concat(new object[] { "SELECT ", colNames, " FROM ", ufTableName, "  WHERE moid ='", this.moid, "' " });
            DataTable table = new DataTable();
            return base.UFSelect(str2);
        }

        public override object Insert()
        {
            StringBuilder builder = new StringBuilder();
            this.SetData(this.moid, this.modid);
            builder.Append(this.detailBiz.CreateInsertString());
            builder.Append(this.detailBomBiz.CreateInsertString());
            builder.Replace("main|##newguid", Guid.NewGuid().ToString());
            if (base.bNoCase)
            {
                this.DeleteLog();
            }
            if (builder.Length > 0)
            {
                return this.ExecSql(builder.ToString());
            }
            return null;
        }

        private void SetData(int moid, int modid)
        {
            this.detailBiz = new Mom_orderdetail(ref this.conn, moid, modid, base.ufConnStr, base.opertype);
            this.detailBiz.lst = this.detailBiz.MakeMultiLineData(null, this.detailBiz.fieldcmpTablename, this.detailBiz.ufTableName, this.detailBiz.ufPriKey, Convert.ToString(moid));
            this.detailBomBiz = new Mom_OrderBom(ref this.conn, moid, modid, base.ufConnStr, base.opertype);
            this.detailBomBiz.lst = this.detailBomBiz.MakeMultiLineData(null, this.detailBomBiz.fieldcmpTablename, this.detailBomBiz.ufTableName, this.detailBomBiz.ufPriKey, Convert.ToString(moid));
        }
    }
}

