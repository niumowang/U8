namespace U8.Interface.Bus.Event.SyncAdapter.Biz.Factory.CQ
{
    using ADODB;
    using System;
    using System.Data;
    using System.Text;
    using U8.Interface.Bus.Event.SyncAdapter.Biz;

    public class Mom_OrderBom : BizBase
    {
        private int _modid;
        private int _moid;

        public Mom_OrderBom(ref Connection conn, int moid, int modid, string ufConnStr, string _opertype) : base(conn, ufConnStr)
        {
            base.oracleTableName = "MES_CQ_Mom_orderdetail";
            base.oraclePriKey = "MoCode";
            base.fieldcmpTablename = "MES_CQ_Mom_OrderBom";
            base.ufTableName = "v_mom_orderdetail_wf";
            base.ufPriKey = "MoId";
            base.opertype = _opertype;
            this._moid = moid;
            this._modid = modid;
        }

        public override StringBuilder CreateDeleteString()
        {
            if (base.Synch.Equals("UFOper"))
            {
                return new StringBuilder("DELETE FROM " + base.oracleTableName + " WHERE  " + base.oracleTableName + ".MoCode in( select h.mocode from mom_orderdetail d with(nolock) inner join mom_order h with(nolock) on h.moid = d.moid where  d.moid =" + Convert.ToString(this._moid) + " and d.modid =" + Convert.ToString(this._modid) + ") ");
            }
            if (base.Synch.Equals("LinkOper"))
            {
                base.sqlOper = new LinkOper(BizBase.oraLinkName, base.ufConnStr, base.ufTableName, base.ufPriKey, base.oracleTableName, base.oraclePriKey, base.l, base.lst);
                return base.sqlOper.CreateDeleteString();
            }
            base.sqlOper = new OracleOper(base.oraConnStr, base.oracleTableName, base.oraclePriKey, base.l, base.lst);
            return base.sqlOper.CreateDeleteString();
        }

        public override DataTable GetSourceData(string sourceTableName, string sourceKeyName, string sourceKeyValue, string colNames)
        {
            string str = " ( SELECT d.*,h.MoCode,dd.BomId FROM v_mom_orderdetail_wf d with(nolock) inner join v_mom_order_wf h with(nolock) on h.moid = d.moid inner join  mom_orderdetail dd with(nolock) on dd.modid = d.modid) tmp ";
            string str2 = string.Concat(new object[] { "SELECT ", colNames, " FROM ", str, " WHERE moid =", this._moid, " and modid =", Convert.ToString(this._modid), " " });
            DataTable table = new DataTable();
            return base.UFSelect(str2);
        }

        private void SetData(int moid)
        {
            base.lst = base.MakeMultiLineData(null, base.fieldcmpTablename, base.ufTableName, base.ufPriKey, Convert.ToString(moid));
        }
    }
}

