namespace U8.Interface.Bus.Event.SyncAdapter.Biz.Factory.CQ
{
    using ADODB;
    using MSXML2;
    using System;
    using U8.Interface.Bus.Event.SyncAdapter.Biz;

    public class InventoryClass : BizBase
    {
        public InventoryClass(ref Connection conn, IXMLDOMDocument2 doc, string ufConnStr, string _opertype) : base(conn, ufConnStr)
        {
            base.oracleTableName = "MES_InventoryClass";
            base.oraclePriKey = "cInvCCode";
            base.fieldcmpTablename = "InventoryClass";
            base.ufTableName = "InventoryClass";
            base.ufPriKey = "cInvCCode";
            base.opertype = _opertype;
            this.SetData(doc);
        }

        private void SetData(IXMLDOMDocument2 doc)
        {
            base.lst = base.MakeMultiLineData(doc, base.fieldcmpTablename, base.ufTableName, base.ufPriKey, base.GetNodeValue(doc, "/inventoryclass/cinvccode"));
        }
    }
}

