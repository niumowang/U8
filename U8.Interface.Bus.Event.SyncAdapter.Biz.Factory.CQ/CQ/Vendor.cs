namespace U8.Interface.Bus.Event.SyncAdapter.Biz.Factory.CQ
{
    using ADODB;
    using MSXML2;
    using System;
    using System.Linq;
    using U8.Interface.Bus.Event.SyncAdapter.Biz;

    internal class Vendor : BizBase
    {
        public Vendor(ref Connection conn, IXMLDOMDocument2 doc, string ufConnStr) : base(conn, ufConnStr)
        {
            base.oracleTableName = "MES_CQ_Vendor";
            base.oraclePriKey = "cvencode";
            base.ufTableName = "Vendor";
            base.ufPriKey = "cvencode";
            base.l.Add(new BaseMode("id", null, null, "id", Guid.NewGuid().ToString(), null, null));
            base.l.Add(new BaseMode("cvencode", base.GetNodeValue(doc, "/vendor/cvencode"), "/vendor/cvencode", "cvencode", base.GetNodeValue(doc, "/vendor/cvencode"), null, null));
            base.l.Add(new BaseMode("cVenName", base.GetNodeValue(doc, "/vendor/cvenname"), "/vendor/cvenname", "cvenname", base.GetNodeValue(doc, "/vendor/cvenname"), null, null));
            base.l.Add(new BaseMode("cvccode", base.GetNodeValue(doc, "/vendor/cvccode"), "/vendor/cvccode", "cvccode", base.GetNodeValue(doc, "/vendor/cvccode"), null, null));
            base.l.Add(new BaseMode("cvenperson", base.GetNodeValue(doc, "/vendor/cvenperson"), "/vendor/cvenperson", "cVenContact", base.GetNodeValue(doc, "/vendor/cvenperson"), null, null));
            base.l.Add(new BaseMode("cvenhand", base.GetNodeValue(doc, "/vendor/cvenhand"), "/vendor/cvenhand", "cVenContactPhone", base.GetNodeValue(doc, "/vendor/cvenhand"), null, null));
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
            if (base.bNoCase)
            {
                base.Delete();
            }
            base.l.Add(new BaseMode("opertype", null, null, "opertype", "0", "string", "string"));
            return base.Insert();
        }

        public object LinkMerge(IXMLDOMDocument2 doc)
        {
            base.l.Remove(Enumerable.First<BaseMode>(base.l, (Func<BaseMode, bool>) (e => e.get_UfColumnName().Equals(base.ufPriKey))));
            base.l.Add(new BaseMode(base.ufPriKey, base.GetNodeValue(doc, "/vendor/cvencode1"), "/vendor/cvencode1", "cvencode", base.GetNodeValue(doc, "/vendor/cvencode1"), null, null));
            return base.Delete();
        }

        public override object Update()
        {
            if (base.bNoCase)
            {
                base.Delete();
            }
            base.l.Add(new BaseMode("opertype", null, null, "opertype", "1", "string", "string"));
            return base.Update();
        }
    }
}

