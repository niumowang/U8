namespace U8.Interface.Bus.Event.SyncAdapter.Biz.Factory.CQ
{
    using ADODB;
    using MSXML2;
    using System;
    using System.Linq;
    using U8.Interface.Bus.Event.SyncAdapter.Biz;

    internal class Customer : BizBase
    {
        public Customer(ref Connection conn, IXMLDOMDocument2 doc, string ufConnStr) : base(conn, ufConnStr)
        {
            base.oracleTableName = "MES_CQ_Customer";
            base.oraclePriKey = "ccuscode";
            base.ufTableName = "Customer";
            base.ufPriKey = "ccuscode";
            base.l.Add(new BaseMode("id", null, null, "id", Guid.NewGuid().ToString(), null, null));
            base.l.Add(new BaseMode("ccuscode", base.GetNodeValue(doc, "/customer/ccuscode"), "/customer/ccuscode", "ccuscode", base.GetNodeValue(doc, "/customer/ccuscode"), null, null));
            base.l.Add(new BaseMode("ccusname", base.GetNodeValue(doc, "/customer/ccusname"), "/customer/ccusname", "ccusname", base.GetNodeValue(doc, "/customer/ccusname"), null, null));
            base.l.Add(new BaseMode("ccccode", base.GetNodeValue(doc, "/customer/ccccode"), "/customer/ccccode", "ccccode", base.GetNodeValue(doc, "/customer/ccccode"), null, null));
            base.l.Add(new BaseMode("ccusname", base.GetNodeValue(doc, "/customer/ccusaddress"), "/customer/ccusaddress", "ccusaddress", base.GetNodeValue(doc, "/customer/ccusaddress"), null, null));
            base.l.Add(new BaseMode("ccusotype", base.GetNodeValue(doc, "/customer/ccusotype"), "/customer/ccusotype", "ccusotype", base.GetNodeValue(doc, "/customer/ccusotype"), null, null));
            base.l.Add(new BaseMode("ccusdefine1", base.GetNodeValue(doc, "/customer/ccusdefine1"), "/customer/ccusdefine1", "ccusdefine1", base.GetNodeValue(doc, "/customer/ccusdefine1"), null, null));
        }

        public override object Delete()
        {
            if (base.bSaveOper)
            {
                base.l.Add(new BaseMode("opertype", null, null, "opertype", "2", "string", "string"));
                return base.Insert();
            }
            return base.Delete();
        }

        public override object Insert()
        {
            base.l.Add(new BaseMode("opertype", null, null, "opertype", "0", "string", "string"));
            return base.Insert();
        }

        public object LinkMerge(IXMLDOMDocument2 doc)
        {
            base.l.Remove(Enumerable.First<BaseMode>(base.l, (Func<BaseMode, bool>) (e => e.get_UfColumnName().Equals(base.ufPriKey))));
            base.l.Add(new BaseMode(base.ufPriKey, base.GetNodeValue(doc, "/customer/ccuscode1"), "/customer/ccuscode1", "CustomerCode", base.GetNodeValue(doc, "/customer/ccuscode1"), null, null));
            return base.Delete();
        }

        public override object Update()
        {
            base.l.Add(new BaseMode("opertype", null, null, "opertype", "1", "string", "string"));
            return base.Update();
        }
    }
}

