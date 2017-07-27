namespace U8.Interface.Bus.Event.SyncAdapter.Biz.Factory.CQ
{
    using ADODB;
    using System;
    using System.Data;
    using System.Text;
    using U8.Interface.Bus.Event.SyncAdapter.Biz;

    public class Mom_moallocate : BizBase
    {
        private int _modid;
        private int _moid;

        public Mom_moallocate(ref Connection conn, int moid, int modid, string ufConnStr, string _opertype) : base(conn, ufConnStr)
        {
            base.oracleTableName = "MES_mom_moallocate";
            base.oraclePriKey = "MoId";
            base.fieldcmpTablename = "mom_moallocate";
            base.ufTableName = "mom_moallocate";
            base.ufPriKey = "MoId";
            base.opertype = _opertype;
            this._moid = moid;
            this._modid = modid;
        }

        public override StringBuilder CreateDeleteString()
        {
            if (base.Synch.Equals("UFOper"))
            {
                return new StringBuilder("DELETE FROM " + base.oracleTableName + " WHERE  " + base.oracleTableName + ".MoDId in( select modid from mom_orderdetail with(nolock) where  mom_orderdetail.moid =" + Convert.ToString(this._moid) + " and mom_orderdetail.modid =" + Convert.ToString(this._modid) + ") ");
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
            string str = "SELECT " + colNames + " FROM " + sourceTableName + " with(nolock) WHERE  mom_moallocate.MoDId in( select modid from mom_orderdetail with(nolock) where  mom_orderdetail.moid =" + sourceKeyValue + " and mom_orderdetail.modid =" + Convert.ToString(this._modid) + ") ";
            DataTable table = new DataTable();
            return base.UFSelect(str);
        }

        private void SetData(int moid)
        {
            base.lst = base.MakeMultiLineData(null, base.fieldcmpTablename, base.ufTableName, base.ufPriKey, Convert.ToString(moid));
        }
    }
}

