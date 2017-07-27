namespace U8.Interface.Bus.Event.SyncAdapter.Biz.Factory.CQ
{
    using ADODB;
    using MSXML2;
    using System;
    using System.Text;
    using U8.Interface.Bus.Event.SyncAdapter.Biz;

    public class Inventory : BizBase
    {
        public Inventory(ref Connection conn, IXMLDOMDocument2 doc, string ufConnStr, string _opertype) : base(conn, ufConnStr)
        {
            base.oracleTableName = "MES_CQ_Inventory";
            base.oraclePriKey = "cInvCode";
            base.fieldcmpTablename = "MES_CQ_Inventory";
            base.ufTableName = "Inventory";
            base.ufPriKey = "cInvCode";
            base.opertype = _opertype;
            this.SetData(doc);
        }

        public override object Delete()
        {
            if (base.Synch.Equals("UFOper"))
            {
                base.sqlOper = new UFOper(BizBase.oraLinkName, base.ufConnStr, base.ufTableName, base.ufPriKey, base.oracleTableName, base.oraclePriKey, base.l, base.lst);
                if (base.bNoCase)
                {
                    base.sqlOper.Delete();
                }
                if (base.bSaveOper)
                {
                    return this.Insert();
                }
                return 1;
            }
            if (base.Synch.Equals("LinkOper"))
            {
                base.sqlOper = new LinkOper(BizBase.oraLinkName, base.ufConnStr, base.ufTableName, base.ufPriKey, base.oracleTableName, base.oraclePriKey, base.l, base.lst);
                return base.sqlOper.Update();
            }
            base.sqlOper = new OracleOper(base.oraConnStr, base.oracleTableName, base.oraclePriKey, base.l, base.lst);
            return base.sqlOper.Update();
        }

        public override object Insert()
        {
            StringBuilder builder = new StringBuilder();
            StringBuilder builder2 = new StringBuilder();
            StringBuilder builder3 = new StringBuilder();
            builder2 = this.CreateInsertString();
            if (builder2.Length > 0)
            {
                builder.Append(" DECLARE @mainid AS INT ");
                builder.Append(builder2);
                builder.Append(" SELECT @mainid = @@IDENTITY ");
                builder.Replace("main|##newguid", Guid.NewGuid().ToString());
            }
            if (base.bNoCase)
            {
                builder3 = this.CreateDeleteString();
            }
            if (builder.Length > 0)
            {
                if (builder3.Length > 0)
                {
                    return this.ExecSql(builder3.ToString() + " " + builder.ToString());
                }
                return this.ExecSql(builder.ToString());
            }
            return null;
        }

        private void SetData(IXMLDOMDocument2 doc)
        {
            base.lst = base.MakeMultiLineData(doc, base.fieldcmpTablename, base.ufTableName, base.ufPriKey, base.GetNodeValue(doc, "/inventory/cinvcode"));
        }

        public override object Update()
        {
            if (base.Synch.Equals("UFOper"))
            {
                base.sqlOper = new UFOper(BizBase.oraLinkName, base.ufConnStr, base.ufTableName, base.ufPriKey, base.oracleTableName, base.oraclePriKey, base.l, base.lst);
                if (base.bNoCase)
                {
                    base.sqlOper.Delete();
                }
                return this.Insert();
            }
            if (base.Synch.Equals("LinkOper"))
            {
                base.sqlOper = new LinkOper(BizBase.oraLinkName, base.ufConnStr, base.ufTableName, base.ufPriKey, base.oracleTableName, base.oraclePriKey, base.l, base.lst);
                return base.sqlOper.Update();
            }
            base.sqlOper = new OracleOper(base.oraConnStr, base.oracleTableName, base.oraclePriKey, base.l, base.lst);
            return base.sqlOper.Update();
        }
    }
}

