namespace U8.Interface.Bus.Event.SyncAdapter.Biz.Factory.CQ
{
    using ADODB;
    using MSXML2;
    using System;
    using System.Data;
    using System.Text;
    using U8.Interface.Bus.Config;
    using U8.Interface.Bus.Event.SyncAdapter.Biz;

    public class SO_SOMain : BizBase
    {
        private string _csocode;
        private SO_SODetails detailBiz;

        public SO_SOMain(ref Connection conn, IXMLDOMDocument2 doc, IXMLDOMDocument2 docbody, string ufConnStr, string _opertype) : base(conn, ufConnStr)
        {
            base.oracleTableName = "MES_CQ_SO_SOMain";
            base.oraclePriKey = "cSoCode";
            base.fieldcmpTablename = "MES_CQ_SO_SOMain";
            base.ufTableName = "SO_SOMain";
            base.ufPriKey = "cSoCode";
            this._csocode = ((IXMLDOMElement) doc.selectSingleNode("/xml/rs:data/z:row")).getAttribute("csocode").ToString();
            base.opertype = _opertype;
        }

        public override object Delete()
        {
            if (ConfigUtility.get_LogOper())
            {
                return this.Insert();
            }
            StringBuilder builder = new StringBuilder();
            this.SetData(this._csocode);
            builder.Append(this.CreateDeleteString());
            builder.Append(this.detailBiz.CreateDeleteString());
            if (builder.Length > 0)
            {
                return this.ExecSql(builder.ToString());
            }
            return null;
        }

        private object DeleteLog()
        {
            StringBuilder builder = new StringBuilder();
            if (base.lst.Count == 0)
            {
                this.SetData(this._csocode);
            }
            builder.Append(this.CreateDeleteString());
            builder.Append(this.detailBiz.CreateDeleteString());
            if (builder.Length > 0)
            {
                return this.ExecSql(builder.ToString());
            }
            return null;
        }

        public override DataTable GetSourceData(string sourceTableName, string sourceKeyName, string sourceKeyValue, string colNames)
        {
            string str = "(select cSoCode,cCusCode,cCusName, cBusType,t.cstcode as cStCode,cStName,t.cDepCode as cDepCode,cDepName,";
            str = (str + " cPersonCode,p.cPsn_Name as cPersonName   from so_somain t with(nolock) left join department d with(nolock) on t.cDepCode = d.cDepCode ") + " left join hr_hi_person p with(nolock) on t.cPersonCode = p.cPsn_Num " + " left join SaleType st with(nolock) on st.cSTCode = t.cSTCode ) tmpt ";
            string str2 = "SELECT " + colNames + " FROM " + str + "  WHERE csocode ='" + this._csocode + "' ";
            DataTable table = new DataTable();
            return base.UFSelect(str2);
        }

        public override object Insert()
        {
            this.SetData(this._csocode);
            StringBuilder builder = new StringBuilder();
            StringBuilder builder2 = new StringBuilder();
            builder2 = this.CreateInsertString();
            if (builder2.Length > 0)
            {
                builder.Append(" DECLARE @mainid AS INT ");
                builder.Append(builder2);
                builder.Append(" SELECT @mainid = @@IDENTITY ");
                builder.Append(this.detailBiz.CreateInsertString());
                builder.Replace("main|##newguid", Guid.NewGuid().ToString());
            }
            if (base.bNoCase)
            {
                this.DeleteLog();
            }
            if (builder.Length > 0)
            {
                return this.ExecSql(builder.ToString());
            }
            return null;
        }

        private void SetData(string csocode)
        {
            base.lst = base.MakeMultiLineData(null, base.fieldcmpTablename, base.ufTableName, base.ufPriKey, csocode);
            this.detailBiz = new SO_SODetails(ref this.conn, csocode, base.ufConnStr, base.opertype);
            this.detailBiz.lst = this.detailBiz.MakeMultiLineData(null, this.detailBiz.fieldcmpTablename, this.detailBiz.ufTableName, this.detailBiz.ufPriKey, csocode);
        }
    }
}

