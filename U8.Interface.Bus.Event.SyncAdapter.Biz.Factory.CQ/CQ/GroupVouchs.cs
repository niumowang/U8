namespace U8.Interface.Bus.Event.SyncAdapter.Biz.Factory.CQ
{
    using ADODB;
    using System;
    using System.Data;
    using System.Text;
    using U8.Interface.Bus.Event.SyncAdapter.Biz;

    public class GroupVouchs : BizBase
    {
        private string _ccode;

        public GroupVouchs(ref Connection conn, string ccode, string ufConnStr, string _opertype) : base(conn, ufConnStr)
        {
            base.oracleTableName = "MES_CQ_GroupVouchs";
            base.oraclePriKey = "dhcode";
            base.fieldcmpTablename = "MES_CQ_GroupVouchs";
            base.ufTableName = "GroupVouchs";
            base.ufPriKey = "ccode";
            base.opertype = _opertype;
            this._ccode = ccode;
        }

        public override StringBuilder CreateDeleteString()
        {
            if (base.Synch.Equals("UFOper"))
            {
                return new StringBuilder(" DELETE FROM " + base.oracleTableName + " WHERE  " + base.oracleTableName + ".dhcode ='" + this._ccode + "'  ");
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
            string str = " (select t.ccode as dhCode,b.Autoid as dhid,cPoCode,ddate,";
            str = (str + "cVenCode,cDepCode,cPersonCode,t.cPTCode,cPTName,cInvCode,iquantity ") + " from GroupVouchs b with(nolock) inner join PU_ArrivalVouch t on t.id = b.id " + " left join PurchaseType ty with(nolock) on t.cPTCode = ty.cPTCode ) tmpt   ";
            string str2 = "SELECT " + colNames + " FROM " + str + "  WHERE dhcode ='" + this._ccode + "' ";
            DataTable table = new DataTable();
            return base.UFSelect(str2);
        }

        private void SetData(string ccode)
        {
            base.lst = base.MakeMultiLineData(null, base.fieldcmpTablename, base.ufTableName, base.ufPriKey, ccode);
        }
    }
}

