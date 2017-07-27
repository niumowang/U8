namespace U8.Interface.Bus.Event.SyncAdapter.Biz.Factory.CQ
{
    using ADODB;
    using MSXML2;
    using System;
    using System.Data;
    using System.Text;
    using U8.Interface.Bus.Config;
    using U8.Interface.Bus.Event.SyncAdapter.Biz;

    public class AssemVouchRet : BizBase
    {
        private string _cAVCode;
        private AssemVouchRets detailBiz;

        public AssemVouchRet(ref Connection conn, IXMLDOMDocument2 doc, IXMLDOMDocument2 docbody, string ufConnStr, string _opertype) : base(conn, ufConnStr)
        {
            base.oracleTableName = "MES_CQ_AssemVouchRet";
            base.oraclePriKey = "cAVCode";
            base.fieldcmpTablename = "MES_CQ_AssemVouchRet";
            base.ufTableName = "AssemVouch";
            base.ufPriKey = "cAVCode";
            this._cAVCode = ((IXMLDOMElement) doc.selectSingleNode("/xml/rs:data/z:row")).getAttribute("cavcode").ToString();
            base.opertype = _opertype;
        }

        public override object Delete()
        {
            if (ConfigUtility.get_LogOper())
            {
                return this.Insert();
            }
            StringBuilder builder = new StringBuilder();
            this.SetData(this._cAVCode);
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
                this.SetData(this._cAVCode);
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
            string str = "(select cAVCode,dAVDate,cIRdCode,cDepCode,cORdCode,";
            str = str + "cDepCode as cODepCode from  AssemVouch with(nolock) ) tmpt ";
            string str2 = "SELECT " + colNames + " FROM " + base.ufTableName + "  WHERE cVouchType = '14' AND cAVCode ='" + this._cAVCode + "' ";
            DataTable table = new DataTable();
            return base.UFSelect(str2);
        }

        public override object Insert()
        {
            this.SetData(this._cAVCode);
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

        private void SetData(string cAVCode)
        {
            base.lst = base.MakeMultiLineData(null, base.fieldcmpTablename, base.ufTableName, base.ufPriKey, cAVCode);
            this.detailBiz = new AssemVouchRets(ref this.conn, cAVCode, base.ufConnStr, base.opertype);
            this.detailBiz.lst = this.detailBiz.MakeMultiLineData(null, this.detailBiz.fieldcmpTablename, this.detailBiz.ufTableName, this.detailBiz.ufPriKey, cAVCode);
        }
    }
}

