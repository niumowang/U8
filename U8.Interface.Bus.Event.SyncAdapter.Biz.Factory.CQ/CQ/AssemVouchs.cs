namespace U8.Interface.Bus.Event.SyncAdapter.Biz.Factory.CQ
{
    using ADODB;
    using System;
    using System.Data;
    using System.Text;
    using U8.Interface.Bus.Event.SyncAdapter.Biz;

    public class AssemVouchs : BizBase
    {
        private string _cAVCode;

        public AssemVouchs(ref Connection conn, string cAVCode, string ufConnStr, string _opertype) : base(conn, ufConnStr)
        {
            base.oracleTableName = "MES_CQ_AssemVouchs";
            base.oraclePriKey = "cAVCode";
            base.fieldcmpTablename = "MES_CQ_AssemVouchs";
            base.ufTableName = "AssemVouchs";
            base.ufPriKey = "cAVCode";
            base.opertype = _opertype;
            this._cAVCode = cAVCode;
        }

        public override StringBuilder CreateDeleteString()
        {
            if (base.Synch.Equals("UFOper"))
            {
                return new StringBuilder(" DELETE FROM " + base.oracleTableName + " WHERE  " + base.oracleTableName + ".cAVDID in( select  autoid from " + base.ufTableName + " sb with(nolock) INNER JOIN AssemVouch sh WITH(NOLOCK) ON sh.id = sb.id where sh.cVouchType = '13' AND sh.cAVCode ='" + this._cAVCode + "') ");
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
            string str = " ( select sb.*,h.cAVCode from " + base.ufTableName + " sb WITH(NOLOCK)  INNER JOIN AssemVouch sh WITH(NOLOCK) sb.id = sh.id  ) tmpt   ";
            string str2 = "SELECT " + colNames + " FROM " + base.ufTableName + " WHERE ID IN ( SELECT ID FROM AssemVouch WITH(NOLOCK) WHERE cVouchType = '13'  AND cAVCode ='" + this._cAVCode + "'  ) ";
            DataTable table = new DataTable();
            return base.UFSelect(str2);
        }

        private void SetData(string cAVCode)
        {
            base.lst = base.MakeMultiLineData(null, base.fieldcmpTablename, base.ufTableName, base.ufPriKey, cAVCode);
        }
    }
}

