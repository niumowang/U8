namespace U8.Interface.Bus.Event.SyncAdapter.Biz.Factory.CQ
{
    using ADODB;
    using System;
    using System.Collections.Generic;
    using System.Data;
    using System.Text;
    using U8.Interface.Bus.Event.SyncAdapter.Biz;

    public class Bom_opcomponent : BizBase
    {
        private int bomId;
        private DataSet ds;
        private string opertype;

        public Bom_opcomponent(ref Connection conn, ref DataSet ds, string ufConnStr, string opertype) : base(conn, ufConnStr)
        {
            base.oracleTableName = "MES_CQ_Bom_opcomponent";
            base.oraclePriKey = "bomid";
            base.fieldcmpTablename = "MES_CQ_bom_bom";
            base.ufTableName = "Bom_opcomponent";
            base.ufPriKey = "bomid";
            this.opertype = opertype;
            this.ds = ds;
        }

        public Bom_opcomponent(ref Connection conn, int bomId, string ufConnStr, string opertype) : base(conn, ufConnStr)
        {
            base.oracleTableName = "MES_CQ_Bom_opcomponent";
            base.oraclePriKey = "bomid";
            base.fieldcmpTablename = "MES_CQ_bom_bom";
            base.ufTableName = "Bom_opcomponent";
            base.ufPriKey = "bomid";
            this.opertype = opertype;
            this.bomId = bomId;
        }

        private bool CheckAutoAudit(ref DataSet ds)
        {
            string str = ds.Tables["StandardBom"].Rows[0]["BomId"].ToString();
            string str2 = " select count(1) as  cc from bom_bom with(nolock) where bomid ='" + str + "'  ";
            DataTable table = base.UFSelect(str2);
            if ((table.Rows.Count > 0) && (((int) table.Rows[0][0]) > 0))
            {
                return false;
            }
            str2 = " select BomDefaultStatus  from mom_parameter  with(nolock)  ";
            table = base.UFSelect(str2);
            return ((table.Rows.Count > 0) && table.Rows[0][0].ToString().Trim().Equals("3"));
        }

        public override StringBuilder CreateDeleteString()
        {
            if (base.Synch.Equals("UFOper"))
            {
                return new StringBuilder(string.Concat(new object[] { " DELETE FROM ", base.oracleTableName, " WHERE  ", base.oracleTableName, ".id in( select id from MES_CQ_bom_bom with(nolock) where  bomid ='", this.bomId, "') " }));
            }
            if (base.Synch.Equals("LinkOper"))
            {
                base.sqlOper = new LinkOper(BizBase.oraLinkName, base.ufConnStr, base.ufTableName, base.ufPriKey, base.oracleTableName, base.oraclePriKey, base.l, base.lst);
                return base.sqlOper.CreateDeleteString();
            }
            base.sqlOper = new OracleOper(base.oraConnStr, base.oracleTableName, base.oraclePriKey, base.l, base.lst);
            return base.sqlOper.CreateDeleteString();
        }

        public override object Delete()
        {
            if (this.bomId > 0)
            {
                this.SetDelData(this.bomId);
            }
            else if (this.CheckAutoAudit(ref this.ds))
            {
                this.SetDelData(ref this.ds);
            }
            return base.Delete();
        }

        private void GetAllChildByInvCode(ref DataSet ds, DataTable dt)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DataTable childByInvcode = new DataTable();
                childByInvcode = this.GetChildByInvcode(dt.Rows[i]["subInvCode"].ToString());
                if (childByInvcode.Rows.Count > 0)
                {
                    childByInvcode.TableName = "Child_" + Guid.NewGuid().ToString();
                    ds.Tables.Add(childByInvcode.Copy());
                    this.GetAllChildByInvCode(ref ds, childByInvcode);
                }
            }
        }

        private DataTable GetChildByBomId(int bomId)
        {
            DataTable table = new DataTable();
            StringBuilder builder = new StringBuilder();
            builder.Append(" SELECT V.* FROM  ");
            builder.Append(" ( ");
            builder.Append("     SELECT  ");
            builder.Append("           h.InvCode,h.InvName,h.version,  ");
            builder.Append("           D.DInvCode,D.DInvCode AS subInvCode,d.DEffBegDate,d.DEffEndDate,d.DInvUnit,d.DBaseQtyD,d.OpComponentId    ");
            builder.Append("     FROM v_bom_head h  with(nolock) ");
            builder.Append("           LEFT JOIN v_bom_detail d  with(nolock) ON h.bomid = d.bomid  ");
            builder.Append("     WHERE  H.bomid ='" + bomId + "' ");
            builder.Append("     UNION ALL ");
            builder.Append("     SELECT ");
            builder.Append("           h.InvCode,h.InvName,h.version, ");
            builder.Append("           D.DInvCode,rm.invcode AS subInvCode,d.DEffBegDate,d.DEffEndDate,i.cComUnitCode as DInvUnit,d.DBaseQtyD,d.OpComponentId   ");
            builder.Append("     FROM v_bom_head h  with(nolock) ");
            builder.Append("           INNER JOIN v_bom_detail d  with(nolock) ON h.bomid = d.bomid  ");
            builder.Append("           INNER JOIN bom_opcomponentsub r  with(nolock) ON d.opcomponentid = r.opcomponentid ");
            builder.Append("           INNER JOIN bas_part rm  with(nolock) ON r.PartId = rm.PartId ");
            builder.Append("           INNER JOIN inventory i  with(nolock) ON i.cInvCode = rm.InvCode ");
            builder.Append("           WHERE  H.bomid ='" + bomId + "' AND ISNULL(rm.InvCode,'') <> '' ");
            builder.Append(" ) V");
            builder.Append(" ORDER BY  V.DInvCode,V.subInvCode ");
            return base.UFSelect(builder.ToString());
        }

        private DataTable GetChildByInvcode(string cInvcode)
        {
            DataTable table = new DataTable();
            StringBuilder builder = new StringBuilder();
            builder.Append(" SELECT V.* FROM  ");
            builder.Append(" ( ");
            builder.Append("     SELECT  ");
            builder.Append("           h.InvCode,h.InvName,h.version,  ");
            builder.Append("           D.DInvCode,D.DInvCode AS subInvCode,d.DEffBegDate,d.DEffEndDate,d.DInvUnit ,d.DBaseQtyD,d.OpComponentId   ");
            builder.Append("     FROM v_bom_head h  with(nolock) ");
            builder.Append("           LEFT JOIN v_bom_detail d  with(nolock) ON h.bomid = d.bomid  ");
            builder.Append("     WHERE  H.InvCode ='" + cInvcode + "' ");
            builder.Append("     UNION ALL ");
            builder.Append("     SELECT ");
            builder.Append("           h.InvCode,h.InvName,h.version, ");
            builder.Append("           D.DInvCode,rm.invcode AS subInvCode,d.DEffBegDate,d.DEffEndDate,d.DInvUnit ,d.DBaseQtyD,d.OpComponentId  ");
            builder.Append("     FROM v_bom_head h with(nolock) ");
            builder.Append("           INNER JOIN v_bom_detail d with(nolock) ON h.bomid = d.bomid  ");
            builder.Append("           INNER JOIN bom_opcomponentsub r with(nolock) ON d.opcomponentid = r.opcomponentid ");
            builder.Append("           INNER JOIN bas_part rm with(nolock) ON r.PartId = rm.PartId ");
            builder.Append("           WHERE  H.InvCode ='" + cInvcode + "' AND ISNULL(rm.InvCode,'') <> '' ");
            builder.Append(" ) V");
            builder.Append(" ORDER BY  V.DInvCode,V.subInvCode ");
            return base.UFSelect(builder.ToString());
        }

        private string GetInvCodeByPartid(string partid)
        {
            string str = " select top 1 InvCode from bas_part with(nolock) where PartId = '" + partid + "' ";
            DataTable table = base.UFSelect(str);
            if (table.Rows.Count > 0)
            {
                return table.Rows[0][0].ToString();
            }
            return "";
        }

        private DataTable GetLocation(int bomId)
        {
            DataTable table = new DataTable();
            StringBuilder builder = new StringBuilder();
            builder.Append(" SELECT   a.OpComponentId,     loc=(select ' '+loc from bom_opcomponentloc b where b.OpComponentId=a.OpComponentId for xml path('')) ");
            builder.Append(" FROM bom_opcomponent with(nolock) ");
            builder.Append(" INNER JOIN bom_opcomponentloc a with(nolock) on a.OpComponentId = bom_opcomponent.OpComponentId ");
            builder.Append(" where bom_opcomponent.BomId = " + bomId);
            return base.UFSelect(builder.ToString());
        }

        private string GetLocation(DataTable dt, string OpComponentId)
        {
            string str = "";
            DataRow[] rowArray = dt.Select("OpComponentId='" + OpComponentId + "'");
            for (int i = 0; i < rowArray.Length; i++)
            {
                string str2 = rowArray[i]["loc"].ToString();
                if (!string.IsNullOrEmpty(str2))
                {
                    str = str + " " + str2;
                }
            }
            return str;
        }

        private DataTable GetLocation_bak(int bomId)
        {
            DataTable table = new DataTable();
            StringBuilder builder = new StringBuilder();
            builder.Append(" SELECT  loc,bom_opcomponentloc.OpComponentId FROM bom_opcomponent with(nolock) ");
            builder.Append(" INNER JOIN bom_opcomponentloc  with(nolock) on bom_opcomponentloc.OpComponentId = bom_opcomponent.OpComponentId ");
            builder.Append(" where bom_opcomponent.BomId = " + bomId);
            return base.UFSelect(builder.ToString());
        }

        private string GetUnitCodeByInvCode(string cinvcode)
        {
            string str = " select cComUnitCode from inventory with(nolock) where cinvcode = '" + cinvcode + "' ";
            DataTable table = base.UFSelect(str);
            if (table.Rows.Count > 0)
            {
                return table.Rows[0][0].ToString();
            }
            return "";
        }

        private string GetUnitCodeByPartid(string partid)
        {
            string str = " select  i.cComUnitCode from bas_part rm with(nolock) INNER join inventory i with(nolock) on rm.InvCode = i.cInvCode  where rm.PartId = '" + partid + "' ";
            DataTable table = base.UFSelect(str);
            if (table.Rows.Count > 0)
            {
                return table.Rows[0][0].ToString();
            }
            return "";
        }

        public override object Insert()
        {
            if (this.bomId > 0)
            {
                this.SetAddData(this.bomId);
            }
            else if (this.CheckAutoAudit(ref this.ds))
            {
                this.SetAddData(ref this.ds);
            }
            if ((base.l.Count == 0) && (base.lst.Count == 0))
            {
                return null;
            }
            return base.BatchInsert();
        }

        public void SetAddData(ref DataSet ds)
        {
            string str5;
            string unitCodeByInvCode;
            int num;
            List<BaseMode> list;
            string invCodeByPartid = this.GetInvCodeByPartid(ds.Tables["BomParent"].Rows[0]["ParentId"].ToString());
            string str2 = ds.Tables["StandardBom"].Rows[0]["Version"].ToString();
            string str3 = ds.Tables["StandardBom"].Rows[0]["VersionEffDate"].ToString();
            string str4 = ds.Tables["StandardBom"].Rows[0]["VersionEndDate"].ToString();
            for (num = 0; num < ds.Tables["BomComponents"].Rows.Count; num++)
            {
                if (!ds.Tables["BomComponents"].Rows[num].RowState.ToString().ToLower().Equals("deleted"))
                {
                    list = new List<BaseMode> {
                        new BaseMode("InvCode", invCodeByPartid, null, "ITEMCODE", invCodeByPartid, null, null)
                    };
                    str5 = this.GetInvCodeByPartid(ds.Tables["BomComponents"].Rows[num]["ComponentId"].ToString());
                    list.Add(new BaseMode("DInvCode", str5, null, "SBITEMCODE", str5, null, null));
                    list.Add(new BaseMode("subInvCode", str5, null, "SBSITEMCODE", str5, null, null));
                    list.Add(new BaseMode("DBaseQtyD", ds.Tables["BomComponents"].Rows[num]["BaseQtyD"].ToString(), null, "SBITEMQTY", ds.Tables["BomComponents"].Rows[num]["BaseQtyD"].ToString(), null, null));
                    list.Add(new BaseMode("DEffBegDate", str3, null, "SBITEMEFFDATE", str3, null, null));
                    list.Add(new BaseMode("DEffEndDate", str4, null, "SBITEMINVDATE", str4, null, null));
                    unitCodeByInvCode = this.GetUnitCodeByInvCode(str5);
                    list.Add(new BaseMode("DInvUnit", unitCodeByInvCode, null, "SBITEMUOM", unitCodeByInvCode, null, null));
                    list.Add(new BaseMode("version", str2, null, "SBOMVER", str2, null, null));
                    list.Add(new BaseMode(null, "", null, "LOCATION", "", null, null));
                    list.Add(new BaseMode(null, null, null, "FLAG", "W", null, null));
                    list.Add(new BaseMode(null, null, null, "EDITPROP", "A", null, null));
                    list.Add(new BaseMode(null, null, null, "FINISHFLAG", "0", null, null));
                    list.Add(new BaseMode(null, null, null, "dModifyDate", DateTime.Now.ToString(), null, null));
                    base.lst.Add(list);
                }
            }
            for (num = 0; num < ds.Tables["ComponentSubstitutes"].Rows.Count; num++)
            {
                if (!ds.Tables["ComponentSubstitutes"].Rows[num].RowState.ToString().ToLower().Equals("deleted"))
                {
                    list = new List<BaseMode> {
                        new BaseMode("InvCode", invCodeByPartid, null, "ITEMCODE", invCodeByPartid, null, null)
                    };
                    str5 = this.GetInvCodeByPartid(ds.Tables["BomComponents"].Select("OpComponentId='" + ds.Tables["ComponentSubstitutes"].Rows[num]["OpComponentId"].ToString() + "'")[0]["ComponentId"].ToString());
                    unitCodeByInvCode = this.GetUnitCodeByInvCode(str5);
                    list.Add(new BaseMode("DInvCode", str5, null, "SBITEMCODE", str5, null, null));
                    str5 = this.GetInvCodeByPartid(ds.Tables["ComponentSubstitutes"].Rows[num]["PartId"].ToString());
                    list.Add(new BaseMode("subInvCode", str5, null, "SBSITEMCODE", str5, null, null));
                    list.Add(new BaseMode("DBaseQtyD", ds.Tables["BomComponents"].Select("OpComponentId='" + ds.Tables["ComponentSubstitutes"].Rows[num]["OpComponentId"].ToString() + "'")[0]["BaseQtyD"].ToString(), null, "SBITEMQTY", ds.Tables["BomComponents"].Select("OpComponentId='" + ds.Tables["ComponentSubstitutes"].Rows[num]["OpComponentId"].ToString() + "'")[0]["BaseQtyD"].ToString(), null, null));
                    list.Add(new BaseMode("DEffBegDate", str3, null, "SBITEMEFFDATE", str3, null, null));
                    list.Add(new BaseMode("DEffEndDate", str4, null, "SBITEMINVDATE", str4, null, null));
                    list.Add(new BaseMode("DInvUnit", unitCodeByInvCode, null, "SBITEMUOM", unitCodeByInvCode, null, null));
                    list.Add(new BaseMode("version", str2, null, "SBOMVER", str2, null, null));
                    list.Add(new BaseMode(null, "", null, "LOCATION", "", null, null));
                    list.Add(new BaseMode(null, null, null, "FLAG", "W", null, null));
                    list.Add(new BaseMode(null, null, null, "EDITPROP", "A", null, null));
                    list.Add(new BaseMode(null, null, null, "FINISHFLAG", "0", null, null));
                    list.Add(new BaseMode(null, null, null, "dModifyDate", DateTime.Now.ToString(), null, null));
                    base.lst.Add(list);
                }
            }
        }

        public void SetAddData(int bomId)
        {
            DataSet set = new DataSet();
            DataTable childByBomId = this.GetChildByBomId(bomId);
            set.Tables.Add(childByBomId.Copy());
            DataTable location = this.GetLocation(bomId);
            for (int i = 0; i < set.Tables.Count; i++)
            {
                if (set.Tables[i].Rows.Count > 0)
                {
                    for (int j = 0; j < set.Tables[i].Rows.Count; j++)
                    {
                        List<BaseMode> item = new List<BaseMode> {
                            new BaseMode("InvCode", set.Tables[i].Rows[j]["InvCode"].ToString(), null, "ITEMCODE", set.Tables[i].Rows[j]["InvCode"].ToString(), null, null),
                            new BaseMode("DInvCode", set.Tables[i].Rows[j]["DInvCode"].ToString(), null, "SBITEMCODE", set.Tables[i].Rows[j]["DInvCode"].ToString(), null, null),
                            new BaseMode("subInvCode", set.Tables[i].Rows[j]["subInvCode"].ToString(), null, "SBSITEMCODE", set.Tables[i].Rows[j]["subInvCode"].ToString(), null, null),
                            new BaseMode("DBaseQtyD", set.Tables[i].Rows[j]["DBaseQtyD"].ToString(), null, "SBITEMQTY", set.Tables[i].Rows[j]["DBaseQtyD"].ToString(), null, null),
                            new BaseMode("DEffBegDate", set.Tables[i].Rows[j]["DEffBegDate"].ToString(), null, "SBITEMEFFDATE", set.Tables[i].Rows[j]["DEffBegDate"].ToString(), null, null),
                            new BaseMode("DEffEndDate", set.Tables[i].Rows[j]["DEffEndDate"].ToString(), null, "SBITEMINVDATE", set.Tables[i].Rows[j]["DEffEndDate"].ToString(), null, null),
                            new BaseMode("DInvUnit", set.Tables[i].Rows[j]["DInvUnit"].ToString(), null, "SBITEMUOM", set.Tables[i].Rows[j]["DInvUnit"].ToString(), null, null),
                            new BaseMode("version", set.Tables[i].Rows[j]["version"].ToString(), null, "SBOMVER", set.Tables[i].Rows[j]["version"].ToString(), null, null),
                            new BaseMode(null, "", null, "LOCATION", this.GetLocation(location, set.Tables[i].Rows[j]["OpComponentId"].ToString()), null, null),
                            new BaseMode(null, null, null, "FLAG", "W", null, null),
                            new BaseMode(null, null, null, "EDITPROP", "A", null, null),
                            new BaseMode(null, null, null, "FINISHFLAG", "0", null, null),
                            new BaseMode(null, null, null, "dModifyDate", DateTime.Now.ToString(), null, null)
                        };
                        base.lst.Add(item);
                    }
                }
            }
        }

        public void SetDelData(ref DataSet ds)
        {
            string str5;
            string unitCodeByInvCode;
            int num;
            List<BaseMode> list;
            string invCodeByPartid = this.GetInvCodeByPartid(ds.Tables["BomParent"].Rows[0]["ParentId"].ToString());
            string str2 = ds.Tables["StandardBom"].Rows[0]["Version"].ToString();
            string str3 = ds.Tables["StandardBom"].Rows[0]["VersionEffDate"].ToString();
            string str4 = ds.Tables["StandardBom"].Rows[0]["VersionEndDate"].ToString();
            for (num = 0; num < ds.Tables["BomComponents"].Rows.Count; num++)
            {
                if (!ds.Tables["BomComponents"].Rows[num].RowState.ToString().ToLower().Equals("deleted"))
                {
                    list = new List<BaseMode> {
                        new BaseMode("InvCode", invCodeByPartid, null, "ITEMCODE", invCodeByPartid, null, null)
                    };
                    str5 = this.GetInvCodeByPartid(ds.Tables["BomComponents"].Rows[num]["ComponentId"].ToString());
                    list.Add(new BaseMode("DInvCode", str5, null, "SBITEMCODE", str5, null, null));
                    list.Add(new BaseMode("subInvCode", str5, null, "SBSITEMCODE", str5, null, null));
                    list.Add(new BaseMode("DBaseQtyD", ds.Tables["BomComponents"].Rows[num]["BaseQtyD"].ToString(), null, "SBITEMQTY", ds.Tables["BomComponents"].Rows[num]["BaseQtyD"].ToString(), null, null));
                    list.Add(new BaseMode("DEffBegDate", str3, null, "SBITEMEFFDATE", str3, null, null));
                    list.Add(new BaseMode("DEffEndDate", str4, null, "SBITEMINVDATE", str4, null, null));
                    unitCodeByInvCode = this.GetUnitCodeByInvCode(str5);
                    list.Add(new BaseMode("DInvUnit", unitCodeByInvCode, null, "SBITEMUOM", unitCodeByInvCode, null, null));
                    list.Add(new BaseMode("version", str2, null, "SBOMVER", str2, null, null));
                    list.Add(new BaseMode(null, "", null, "LOCATION", "", null, null));
                    list.Add(new BaseMode(null, null, null, "EDITPROP", "D", null, null));
                    list.Add(new BaseMode(null, null, null, "FINISHFLAG", "0", null, null));
                    list.Add(new BaseMode(null, null, null, "dModifyDate", DateTime.Now.ToString(), null, null));
                    base.lst.Add(list);
                }
            }
            for (num = 0; num < ds.Tables["ComponentSubstitutes"].Rows.Count; num++)
            {
                if (!ds.Tables["ComponentSubstitutes"].Rows[num].RowState.ToString().ToLower().Equals("deleted"))
                {
                    list = new List<BaseMode> {
                        new BaseMode("InvCode", invCodeByPartid, null, "ITEMCODE", invCodeByPartid, null, null)
                    };
                    str5 = this.GetInvCodeByPartid(ds.Tables["BomComponents"].Select("OpComponentId='" + ds.Tables["ComponentSubstitutes"].Rows[num]["OpComponentId"].ToString() + "'")[0]["ComponentId"].ToString());
                    unitCodeByInvCode = this.GetUnitCodeByInvCode(str5);
                    list.Add(new BaseMode("DInvCode", str5, null, "SBITEMCODE", str5, null, null));
                    str5 = this.GetInvCodeByPartid(ds.Tables["ComponentSubstitutes"].Rows[num]["PartId"].ToString());
                    list.Add(new BaseMode("subInvCode", str5, null, "SBSITEMCODE", str5, null, null));
                    list.Add(new BaseMode("DBaseQtyD", ds.Tables["BomComponents"].Select("OpComponentId='" + ds.Tables["ComponentSubstitutes"].Rows[num]["OpComponentId"].ToString() + "'")[0]["BaseQtyD"].ToString(), null, "SBITEMQTY", ds.Tables["BomComponents"].Select("OpComponentId='" + ds.Tables["ComponentSubstitutes"].Rows[num]["OpComponentId"].ToString() + "'")[0]["BaseQtyD"].ToString(), null, null));
                    list.Add(new BaseMode("DEffBegDate", str3, null, "SBITEMEFFDATE", str3, null, null));
                    list.Add(new BaseMode("DEffEndDate", str4, null, "SBITEMINVDATE", str4, null, null));
                    list.Add(new BaseMode("DInvUnit", unitCodeByInvCode, null, "SBITEMUOM", unitCodeByInvCode, null, null));
                    list.Add(new BaseMode("version", str2, null, "SBOMVER", str2, null, null));
                    list.Add(new BaseMode(null, "", null, "LOCATION", "", null, null));
                    list.Add(new BaseMode(null, null, null, "EDITPROP", "D", null, null));
                    list.Add(new BaseMode(null, null, null, "FINISHFLAG", "0", null, null));
                    list.Add(new BaseMode(null, null, null, "dModifyDate", DateTime.Now.ToString(), null, null));
                    base.lst.Add(list);
                }
            }
        }

        public void SetDelData(int bomId)
        {
            DataSet set = new DataSet();
            DataTable childByBomId = this.GetChildByBomId(bomId);
            set.Tables.Add(childByBomId.Copy());
            for (int i = 0; i < set.Tables.Count; i++)
            {
                if (set.Tables[i].Rows.Count > 0)
                {
                    for (int j = 0; j < set.Tables[i].Rows.Count; j++)
                    {
                        List<BaseMode> item = new List<BaseMode> {
                            new BaseMode("InvCode", set.Tables[i].Rows[j]["InvCode"].ToString(), null, "ITEMCODE", set.Tables[i].Rows[j]["InvCode"].ToString(), null, null),
                            new BaseMode("DInvCode", set.Tables[i].Rows[j]["DInvCode"].ToString(), null, "SBITEMCODE", set.Tables[i].Rows[j]["DInvCode"].ToString(), null, null),
                            new BaseMode("subInvCode", set.Tables[i].Rows[j]["subInvCode"].ToString(), null, "SBSITEMCODE", set.Tables[i].Rows[j]["subInvCode"].ToString(), null, null),
                            new BaseMode("DBaseQtyD", set.Tables[i].Rows[j]["DBaseQtyD"].ToString(), null, "SBITEMQTY", set.Tables[i].Rows[j]["DBaseQtyD"].ToString(), null, null),
                            new BaseMode("DEffBegDate", set.Tables[i].Rows[j]["DEffBegDate"].ToString(), null, "SBITEMEFFDATE", set.Tables[i].Rows[j]["DEffBegDate"].ToString(), null, null),
                            new BaseMode("DEffEndDate", set.Tables[i].Rows[j]["DEffEndDate"].ToString(), null, "SBITEMINVDATE", set.Tables[i].Rows[j]["DEffEndDate"].ToString(), null, null),
                            new BaseMode("DInvUnit", set.Tables[i].Rows[j]["DInvUnit"].ToString(), null, "SBITEMUOM", set.Tables[i].Rows[j]["DInvUnit"].ToString(), null, null),
                            new BaseMode("version", set.Tables[i].Rows[j]["version"].ToString(), null, "SBOMVER", set.Tables[i].Rows[j]["version"].ToString(), null, null),
                            new BaseMode(null, "", null, "LOCATION", "", null, null),
                            new BaseMode(null, null, null, "EDITPROP", "D", null, null),
                            new BaseMode(null, null, null, "FINISHFLAG", "0", null, null),
                            new BaseMode(null, null, null, "dModifyDate", DateTime.Now.ToString(), null, null)
                        };
                        base.lst.Add(item);
                    }
                }
            }
        }
    }
}

