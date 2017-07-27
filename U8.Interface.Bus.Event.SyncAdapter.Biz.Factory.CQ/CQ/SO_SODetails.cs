namespace U8.Interface.Bus.Event.SyncAdapter.Biz.Factory.CQ
{
    using ADODB;
    using System;
    using System.Data;
    using System.Text;
    using U8.Interface.Bus.Event.SyncAdapter.Biz;

    public class SO_SODetails : BizBase
    {
        private string _csocode;

        public SO_SODetails(ref Connection conn, string csocode, string ufConnStr, string _opertype) : base(conn, ufConnStr)
        {
            base.oracleTableName = "MES_CQ_SO_SODetails";
            base.oraclePriKey = "cSoCode";
            base.fieldcmpTablename = "MES_CQ_SO_SODetails";
            base.ufTableName = "SO_SODetails";
            base.ufPriKey = "cSoCode";
            base.opertype = _opertype;
            this._csocode = csocode;
        }

        public override StringBuilder CreateDeleteString()
        {
            if (base.Synch.Equals("UFOper"))
            {
                return new StringBuilder(" DELETE FROM " + base.oracleTableName + " WHERE  " + base.oracleTableName + ".isosid in( select isosid from SO_SODetails with(nolock) where  SO_SODetails.cSoCode ='" + this._csocode + "') ");
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
            string str = " (select t.cSOCode,t.isosid,t.cinvcode as cinvcode,d.cinvname as cinvname,iquantity ";
            str = str + " from so_sodetails t with(nolock) " + " inner join inventory  d with(nolock) on t.cinvcode = d.cinvcode ) tmpt   ";
            string str2 = "SELECT " + colNames + " FROM " + str + "  WHERE csocode ='" + this._csocode + "' ";
            DataTable table = new DataTable();
            return base.UFSelect(str2);
        }

        private void SetData(string csocode)
        {
            base.lst = base.MakeMultiLineData(null, base.fieldcmpTablename, base.ufTableName, base.ufPriKey, csocode);
        }
    }
}

