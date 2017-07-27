namespace U8.Interface.Bus.Event.SyncAdapter.Biz.Factory.CQ
{
    using ADODB;
    using MSXML2;
    using System;
    using System.Data;
    using System.Text;
    using U8.Interface.Bus.Event.SyncAdapter.Biz;

    public class PU_ArrivalVouch : BizBase
    {
        private string _ccode;
        private PU_ArrivalVouchs detailBiz;

        public PU_ArrivalVouch(ref Connection conn, IXMLDOMDocument2 doc, IXMLDOMDocument2 docbody, string ufConnStr, string _opertype) : base(conn, ufConnStr)
        {
            base.oracleTableName = "MES_CQ_PU_ArrivalVouch";
            base.oraclePriKey = "ccode";
            base.fieldcmpTablename = "MES_CQ_PU_ArrivalVouch";
            base.ufTableName = "PU_ArrivalVouch";
            base.ufPriKey = "ccode";
            this._ccode = ((IXMLDOMElement) doc.selectSingleNode("/xml/rs:data/z:row")).getAttribute("ccode").ToString();
            base.opertype = _opertype;
        }

        public override object Delete()
        {
            StringBuilder builder = new StringBuilder();
            this.SetData(this._ccode);
            if (base.bNoCase)
            {
                StringBuilder builder2 = new StringBuilder();
                builder2.Append(this.detailBiz.CreateDeleteString());
                if (builder2.Length > 0)
                {
                    builder.Append(builder2);
                }
            }
            if (base.bSaveOper)
            {
                StringBuilder builder3 = new StringBuilder();
                builder3.Append(this.detailBiz.CreateInsertString());
                if (builder3.Length > 0)
                {
                    builder.Append(builder3);
                }
            }
            if (builder.Length > 0)
            {
                return this.ExecSql(builder.ToString());
            }
            return 1;
        }

        private object DeleteLog()
        {
            StringBuilder builder = new StringBuilder();
            if (this.detailBiz.lst.Count == 0)
            {
                this.SetData(this._ccode);
            }
            builder.Append(this.detailBiz.CreateDeleteString());
            if (builder.Length > 0)
            {
                return this.ExecSql(builder.ToString());
            }
            return null;
        }

        public override DataTable GetSourceData(string sourceTableName, string sourceKeyName, string sourceKeyValue, string colNames)
        {
            string str = "(select ccode,cCusCode,cCusName, cBusType,t.cstcode as cStCode,cStName,t.cDepCode as cDepCode,cDepName,";
            str = (str + " cPersonCode,p.cPsn_Name as cPersonName   from PU_ArrivalVouch t with(nolock) left join department d with(nolock) on t.cDepCode = d.cDepCode ") + " left join hr_hi_person p with(nolock) on t.cPersonCode = p.cPsn_Num " + " left join SaleType st with(nolock) on st.cSTCode = t.cSTCode ) tmpt ";
            string str2 = "SELECT " + colNames + " FROM " + str + "  WHERE ccode ='" + this._ccode + "' ";
            DataTable table = new DataTable();
            return base.UFSelect(str2);
        }

        public override object Insert()
        {
            this.SetData(this._ccode);
            StringBuilder builder = new StringBuilder();
            builder.Append(this.detailBiz.CreateInsertString());
            if (base.bNoCase)
            {
                this.DeleteLog();
            }
            if (base.bSaveOper && (builder.Length > 0))
            {
                return this.ExecSql(builder.ToString());
            }
            return null;
        }

        private void SetData(string ccode)
        {
            this.detailBiz = new PU_ArrivalVouchs(ref this.conn, ccode, base.ufConnStr, base.opertype);
            this.detailBiz.lst = this.detailBiz.MakeMultiLineData(null, this.detailBiz.fieldcmpTablename, this.detailBiz.ufTableName, this.detailBiz.ufPriKey, ccode);
        }
    }
}

