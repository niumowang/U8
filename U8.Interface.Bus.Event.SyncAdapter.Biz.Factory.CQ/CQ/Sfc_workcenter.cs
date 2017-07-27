namespace U8.Interface.Bus.Event.SyncAdapter.Biz.Factory.CQ
{
    using ADODB;
    using MSXML2;
    using System;
    using U8.Interface.Bus.Event.SyncAdapter.Biz;

    public class Sfc_workcenter : BizBase
    {
        public Sfc_workcenter(ref Connection conn, IXMLDOMDocument2 doc, string ufConnStr, string _opertype) : base(conn, ufConnStr)
        {
            base.oracleTableName = "MES_CQ_Workcenter";
            base.oraclePriKey = "WcCode";
            base.fieldcmpTablename = "MES_CQ_Workcenter";
            base.ufTableName = "Sfc_workcenter";
            base.ufPriKey = "WcCode";
            base.opertype = _opertype;
            this.SetData(doc);
        }

        private void SetData(IXMLDOMDocument2 doc)
        {
            base.lst = base.MakeMultiLineData(doc, base.fieldcmpTablename, base.ufTableName, base.ufPriKey, base.GetNodeValue(doc, "/sfc_workcenter/wccode"));
        }
    }
}

