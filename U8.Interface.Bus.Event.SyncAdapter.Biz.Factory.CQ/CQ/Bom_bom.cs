namespace U8.Interface.Bus.Event.SyncAdapter.Biz.Factory.CQ
{
    using ADODB;
    using System;
    using System.Collections.Generic;
    using System.Data;
    using System.Text;
    using U8.Interface.Bus.Event.SyncAdapter.Biz;

    public class Bom_bom : BizBase
    {
        private int bomId;
        private Bom_opcomponent detailBiz;
        private Bom_opcomponentsub detailSubBiz;
        private DataSet ds;
        private string opertype;

        public Bom_bom(ref Connection conn, ref DataSet ds, string ufConnStr, string _opertype) : base(conn, ufConnStr)
        {
            base.oracleTableName = "MES_CQ_bom_bom";
            base.oraclePriKey = "bomid";
            base.fieldcmpTablename = "MES_CQ_bom_bom";
            base.ufTableName = "bom_bom";
            base.ufPriKey = "bomid";
            this.opertype = _opertype;
            this.ds = ds;
        }

        public Bom_bom(ref Connection conn, int bomId, string ufConnStr, string _opertype) : base(conn, ufConnStr)
        {
            base.oracleTableName = "MES_CQ_bom_bom";
            base.oraclePriKey = "bomid";
            base.fieldcmpTablename = "MES_CQ_bom_bom";
            base.ufTableName = "bom_bom";
            base.ufPriKey = "bomid";
            this.opertype = _opertype;
            this.bomId = bomId;
        }

        private bool CheckAutoAudit(ref DataSet ds)
        {
            string str = ds.Tables["StandardBom"].Rows[0]["BomId"].ToString();
            string str2 = " select BomDefaultStatus  from mom_parameter  with(nolock)  ";
            DataTable table = base.UFSelect(str2);
            return ((table.Rows.Count > 0) && table.Rows[0][0].ToString().Trim().Equals("3"));
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
            StringBuilder builder = new StringBuilder();
            if (base.bNoCase)
            {
                builder.Append(this.detailSubBiz.CreateDeleteString());
                builder.Append(this.detailBiz.CreateDeleteString());
                builder.Append(this.CreateDeleteString());
            }
            StringBuilder builder2 = new StringBuilder();
            if (base.bSaveOper)
            {
                base.lst = new List<List<BaseMode>>();
                base.l = new List<BaseMode>();
                this.detailBiz.l = new List<BaseMode>();
                this.detailBiz.lst = new List<List<BaseMode>>();
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
                builder2.Append(this.CreateInsertString());
                builder2.Append(this.detailBiz.CreateInsertString());
                builder2.Append(this.detailSubBiz.CreateInsertString());
                builder2.Replace("main|##newguid", Guid.NewGuid().ToString());
            }
            StringBuilder builder3 = new StringBuilder();
            builder3.Append(builder);
            builder3.Append(builder2);
            if (builder3.Length > 0)
            {
                return this.ExecSql(builder3.ToString());
            }
            return 1;
        }

        private void GetAllChildAndSubByInvCode(ref DataSet ds, DataTable dt)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DataTable childAndSubByInvcode = new DataTable();
                childAndSubByInvcode = this.GetChildAndSubByInvcode(dt.Rows[i]["subInvCode"].ToString());
                if (childAndSubByInvcode.Rows.Count > 0)
                {
                    childAndSubByInvcode.TableName = "Child_" + Guid.NewGuid().ToString();
                    ds.Tables.Add(childAndSubByInvcode.Copy());
                    this.GetAllChildAndSubByInvCode(ref ds, childAndSubByInvcode);
                }
            }
        }

        private DataTable GetBomHeadByBomId(int bomId)
        {
            DataTable table = new DataTable();
            StringBuilder builder = new StringBuilder();
            builder.Append("     SELECT  ");
            builder.Append("            h.bomid,h.InvCode,h.InvName,h.version,h.bomid, h.VersionEffDate   ");
            builder.Append("     FROM v_bom_head h  with(nolock) ");
            builder.Append("     WHERE  H.bomid ='" + bomId + "' ");
            return base.UFSelect(builder.ToString());
        }

        private DataTable GetChildAndSubByBomId(int bomId)
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

        private DataTable GetChildAndSubByInvcode(string cInvcode)
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

        private DataTable GetChildByBomId(int bomId)
        {
            DataTable table = new DataTable();
            StringBuilder builder = new StringBuilder();
            builder.Append(" SELECT V.* FROM   (     ");
            builder.Append(" SELECT              bom.bomid,bas.InvCode,inv.cinvname as InvName,bom.version,bom.VersionEffDate,   ");
            builder.Append(" D.BaseQtyN as DBaseQtyN,D.BaseQtyD as DBaseQtyD, bas1.InvCode as DInvCode,bas1.InvCode AS subInvCode,d.EffBegDate as DEffBegDate,d.EffEndDate as DEffEndDate,  ");
            builder.Append(" d.OpComponentId        ");
            builder.Append(" FROM bom_bom bom with(nolock) ");
            builder.Append(" inner join bom_parent bp with(nolock) on bp.bomid=bom.bomid ");
            builder.Append(" inner join bas_part bas  with(nolock) on bas.partid=bp.parentid ");
            builder.Append(" inner join inventory inv with(nolock) on inv.cinvcode=bas.InvCode     ");
            builder.Append(" inner JOIN bom_opcomponent d  with(nolock) ON bom.bomid = d.bomid  ");
            builder.Append("  inner join bas_part bas1 with(nolock) on bas1.partid=d.componentid    WHERE  bom.bomid ='" + bomId + "'  ) V ");
            builder.Append("  ORDER BY  V.DInvCode,V.subInvCode ");
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

        private DataTable GetSubChildByBomId(int bomId)
        {
            DataTable table = new DataTable();
            StringBuilder builder = new StringBuilder();
            builder.Append(" SELECT V.* FROM   (     ");
            builder.Append(" SELECT   bom.bomid,bom.version,bom.VersionEffDate,    ");
            builder.Append(" d.OpComponentId      , ");
            builder.Append(" subd.PartId,subd.Sequence,subd.ReplaceFlag, subd.Factor , ");
            builder.Append(" bas1.InvCode as cInvCode,inv.cinvname as cInvName  ");
            builder.Append(" FROM bom_bom bom with(nolock) ");
            builder.Append(" inner JOIN bom_opcomponent d  with(nolock) ON bom.bomid = d.bomid  ");
            builder.Append(" inner JOIN bom_opcomponentsub subd  with(nolock) ON d.OpComponentId = subd.OpComponentId  ");
            builder.Append(" inner join bas_part bas1 with(nolock) on bas1.partid=subd.PartId    ");
            builder.Append(" inner join inventory inv with(nolock) on inv.cinvcode=bas1.InvCode   WHERE  bom.bomid ='" + bomId + "'  ) V ");
            builder.Append("  ORDER BY  V.cInvCode ");
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
            StringBuilder builder = new StringBuilder();
            if (base.bNoCase)
            {
                builder.Append(this.detailSubBiz.CreateDeleteString());
                builder.Append(this.detailBiz.CreateDeleteString());
                builder.Append(this.CreateDeleteString());
            }
            StringBuilder builder2 = new StringBuilder();
            builder2.Append(this.CreateInsertString());
            builder2.Append(this.detailBiz.CreateInsertString());
            builder2.Append(this.detailSubBiz.CreateInsertString());
            builder2.Replace("main|##newguid", Guid.NewGuid().ToString());
            return this.ExecSql(builder.ToString() + builder2.ToString());
        }

        public void SetAddData(ref DataSet ds)
        {
            this.detailBiz = new Bom_opcomponent(ref this.conn, this.bomId, base.ufConnStr, this.opertype);
            List<BaseMode> item = new List<BaseMode>();
            string str5 = ds.Tables["StandardBom"].Rows[0]["BomId"].ToString();
            string invCodeByPartid = this.GetInvCodeByPartid(ds.Tables["BomParent"].Rows[0]["ParentId"].ToString());
            string str4 = ds.Tables["StandardBom"].Rows[0]["Version"].ToString();
            string str2 = ds.Tables["StandardBom"].Rows[0]["VersionEffDate"].ToString();
            string str3 = ds.Tables["StandardBom"].Rows[0]["VersionEndDate"].ToString();
            item.Add(new BaseMode(null, null, null, "id", "main|##newguid", null, null));
            item.Add(new BaseMode("bomid", str5, null, "bomid", str5, null, null));
            item.Add(new BaseMode(null, null, null, "Version", str4, null, null));
            item.Add(new BaseMode(null, null, null, "VersionEffDate", str2, null, null));
            item.Add(new BaseMode(null, null, null, "cInvCode", invCodeByPartid, null, null));
            item.Add(new BaseMode(null, null, null, "status", "0", null, null));
            if (this.opertype.Equals("a"))
            {
                item.Add(new BaseMode(null, null, null, "opertype", "0", null, null));
            }
            else
            {
                item.Add(new BaseMode(null, null, null, "opertype", "2", null, null));
            }
            base.lst.Add(item);
            for (int i = 0; i < ds.Tables["BomComponents"].Rows.Count; i++)
            {
                List<BaseMode> list2 = new List<BaseMode>();
                if (!ds.Tables["BomComponents"].Rows[i].RowState.ToString().ToLower().Equals("deleted"))
                {
                    string str6 = this.GetInvCodeByPartid(ds.Tables["BomComponents"].Rows[i]["ComponentId"].ToString());
                    list2.Add(new BaseMode(null, null, null, "id", "main|##newguid", null, null));
                    list2.Add(new BaseMode(null, null, null, "did", Guid.NewGuid().ToString(), null, null));
                    list2.Add(new BaseMode(null, null, null, "cInvCode", str6, null, null));
                    list2.Add(new BaseMode(null, null, null, "BaseQtyN", ds.Tables["BomComponents"].Rows[i]["BaseQtyN"].ToString(), null, null));
                    list2.Add(new BaseMode(null, null, null, "BaseQtyD", ds.Tables["BomComponents"].Rows[i]["BaseQtyD"].ToString(), null, null));
                    if (this.opertype.Equals("a"))
                    {
                        list2.Add(new BaseMode(null, null, null, "opertype", "0", null, null));
                    }
                    else
                    {
                        list2.Add(new BaseMode(null, null, null, "opertype", "2", null, null));
                    }
                    this.detailBiz.lst.Add(list2);
                }
            }
        }

        public void SetAddData(int bomId)
        {
            int num;
            int num2;
            this.detailBiz = new Bom_opcomponent(ref this.conn, bomId, base.ufConnStr, this.opertype);
            this.detailSubBiz = new Bom_opcomponentsub(ref this.conn, bomId, base.ufConnStr, this.opertype);
            DataSet set = new DataSet();
            DataTable bomHeadByBomId = this.GetBomHeadByBomId(bomId);
            set.Tables.Add(bomHeadByBomId.Copy());
            DataSet set2 = new DataSet();
            DataTable childByBomId = this.GetChildByBomId(bomId);
            set2.Tables.Add(childByBomId.Copy());
            DataSet set3 = new DataSet();
            DataTable subChildByBomId = this.GetSubChildByBomId(bomId);
            set3.Tables.Add(subChildByBomId.Copy());
            List<BaseMode> item = new List<BaseMode>();
            for (num = 0; num < set.Tables.Count; num++)
            {
                if (set.Tables[num].Rows.Count > 0)
                {
                    num2 = 0;
                    while (num2 < set.Tables[num].Rows.Count)
                    {
                        item.Add(new BaseMode(null, null, null, "id", "main|##newguid", null, null));
                        item.Add(new BaseMode("bomid", set.Tables[num].Rows[num2]["bomid"].ToString(), null, "bomid", set.Tables[num].Rows[num2]["bomid"].ToString(), null, null));
                        item.Add(new BaseMode(null, null, null, "Version", set.Tables[num].Rows[num2]["version"].ToString(), null, null));
                        item.Add(new BaseMode(null, null, null, "VersionEffDate", set.Tables[num].Rows[num2]["VersionEffDate"].ToString(), null, null));
                        item.Add(new BaseMode(null, null, null, "cInvCode", set.Tables[num].Rows[num2]["InvCode"].ToString(), null, null));
                        item.Add(new BaseMode(null, null, null, "status", "0", null, null));
                        if (this.opertype.Equals("a"))
                        {
                            item.Add(new BaseMode(null, null, null, "opertype", "0", null, null));
                        }
                        else
                        {
                            item.Add(new BaseMode(null, null, null, "opertype", "2", null, null));
                        }
                        base.lst.Add(item);
                        num2++;
                    }
                }
            }
            for (num = 0; num < set2.Tables.Count; num++)
            {
                if (set2.Tables[num].Rows.Count > 0)
                {
                    for (num2 = 0; num2 < set2.Tables[num].Rows.Count; num2++)
                    {
                        List<BaseMode> list2 = new List<BaseMode> {
                            new BaseMode(null, null, null, "id", "main|##newguid", null, null)
                        };
                        string str = Guid.NewGuid().ToString();
                        string str2 = set2.Tables[num].Rows[num2]["OpComponentId"].ToString();
                        list2.Add(new BaseMode(null, null, null, "did", str, null, null));
                        list2.Add(new BaseMode(null, null, null, "cInvCode", set2.Tables[num].Rows[num2]["DInvCode"].ToString(), null, null));
                        list2.Add(new BaseMode(null, null, null, "BaseQtyN", set2.Tables[num].Rows[num2]["DBaseQtyN"].ToString(), null, null));
                        list2.Add(new BaseMode(null, null, null, "BaseQtyD", set2.Tables[num].Rows[num2]["DBaseQtyD"].ToString(), null, null));
                        if (this.opertype.Equals("a"))
                        {
                            list2.Add(new BaseMode(null, null, null, "opertype", "0", null, null));
                        }
                        else
                        {
                            list2.Add(new BaseMode(null, null, null, "opertype", "2", null, null));
                        }
                        this.detailBiz.lst.Add(list2);
                        for (int i = 0; i < set3.Tables.Count; i++)
                        {
                            if (set3.Tables[i].Rows.Count > 0)
                            {
                                DataRow[] rowArray = set3.Tables[i].Select("OpComponentId =" + str2);
                                for (int j = 0; j < rowArray.Length; j++)
                                {
                                    List<BaseMode> list3 = new List<BaseMode> {
                                        new BaseMode(null, null, null, "did", str, null, null),
                                        new BaseMode(null, null, null, "ddid", Guid.NewGuid().ToString(), null, null),
                                        new BaseMode(null, null, null, "cInvCode", rowArray[j]["cInvCode"].ToString(), null, null),
                                        new BaseMode(null, null, null, "Sequence", rowArray[j]["Sequence"].ToString(), null, null),
                                        new BaseMode(null, null, null, "Factor", rowArray[j]["Factor"].ToString(), null, null),
                                        new BaseMode(null, null, null, "ReplaceFlag", rowArray[j]["ReplaceFlag"].ToString(), null, null)
                                    };
                                    if (this.opertype.Equals("a"))
                                    {
                                        list3.Add(new BaseMode(null, null, null, "opertype", "0", null, null));
                                    }
                                    else
                                    {
                                        list3.Add(new BaseMode(null, null, null, "opertype", "2", null, null));
                                    }
                                    this.detailSubBiz.lst.Add(list3);
                                }
                            }
                        }
                    }
                }
            }
        }

        public void SetDelData(ref DataSet ds)
        {
            List<BaseMode> item = new List<BaseMode>();
            string str5 = ds.Tables["StandardBom"].Rows[0]["BomId"].ToString();
            string invCodeByPartid = this.GetInvCodeByPartid(ds.Tables["BomParent"].Rows[0]["ParentId"].ToString());
            string str4 = ds.Tables["StandardBom"].Rows[0]["Version"].ToString();
            string str2 = ds.Tables["StandardBom"].Rows[0]["VersionEffDate"].ToString();
            string str3 = ds.Tables["StandardBom"].Rows[0]["VersionEndDate"].ToString();
            item.Add(new BaseMode(null, null, null, "bomid", str5, null, null));
            item.Add(new BaseMode(null, null, null, "Version", str4, null, null));
            item.Add(new BaseMode(null, null, null, "VersionEffDate", str2, null, null));
            item.Add(new BaseMode(null, null, null, "cInvCode", invCodeByPartid, null, null));
            item.Add(new BaseMode(null, null, null, "status", "0", null, null));
            item.Add(new BaseMode(null, null, null, "opertype", "2", null, null));
            base.lst.Add(item);
            for (int i = 0; i < ds.Tables["BomComponents"].Rows.Count; i++)
            {
                List<BaseMode> list2 = new List<BaseMode>();
                if (!ds.Tables["BomComponents"].Rows[i].RowState.ToString().ToLower().Equals("deleted"))
                {
                    string str6 = this.GetInvCodeByPartid(ds.Tables["BomComponents"].Rows[i]["ComponentId"].ToString());
                    list2.Add(new BaseMode(null, null, null, "cInvCode", str6, null, null));
                    list2.Add(new BaseMode(null, null, null, "BaseQtyN", ds.Tables["BomComponents"].Rows[i]["BaseQtyN"].ToString(), null, null));
                    list2.Add(new BaseMode(null, null, null, "BaseQtyD", ds.Tables["BomComponents"].Rows[i]["BaseQtyD"].ToString(), null, null));
                    list2.Add(new BaseMode(null, null, null, "opertype", "2", null, null));
                    this.detailBiz.lst.Add(list2);
                }
            }
        }

        public void SetDelData(int bomId)
        {
            int num2;
            this.detailBiz = new Bom_opcomponent(ref this.conn, bomId, base.ufConnStr, this.opertype);
            this.detailSubBiz = new Bom_opcomponentsub(ref this.conn, bomId, base.ufConnStr, this.opertype);
            DataSet set = new DataSet();
            DataTable bomHeadByBomId = this.GetBomHeadByBomId(bomId);
            set.Tables.Add(bomHeadByBomId.Copy());
            DataSet set2 = new DataSet();
            DataTable childByBomId = this.GetChildByBomId(bomId);
            set2.Tables.Add(childByBomId.Copy());
            DataSet set3 = new DataSet();
            DataTable subChildByBomId = this.GetSubChildByBomId(bomId);
            set3.Tables.Add(subChildByBomId.Copy());
            for (int i = 0; i < set.Tables.Count; i++)
            {
                if (set.Tables[i].Rows.Count > 0)
                {
                    num2 = 0;
                    while (num2 < set.Tables[i].Rows.Count)
                    {
                        List<BaseMode> item = new List<BaseMode> {
                            new BaseMode("bomid", Convert.ToString(bomId), null, "bomid", set.Tables[i].Rows[num2]["bomid"].ToString(), null, null),
                            new BaseMode(null, null, null, "Version", set.Tables[i].Rows[num2]["version"].ToString(), null, null),
                            new BaseMode(null, null, null, "VersionEffDate", set.Tables[i].Rows[num2]["VersionEffDate"].ToString(), null, null),
                            new BaseMode(null, null, null, "cInvCode", set.Tables[i].Rows[num2]["InvCode"].ToString(), null, null),
                            new BaseMode(null, null, null, "status", "0", null, null),
                            new BaseMode(null, null, null, "opertype", "2", null, null)
                        };
                        base.lst.Add(item);
                        num2++;
                    }
                }
            }
            for (int j = 0; j < set2.Tables.Count; j++)
            {
                if (set2.Tables[j].Rows.Count > 0)
                {
                    for (num2 = 0; num2 < set2.Tables[j].Rows.Count; num2++)
                    {
                        List<BaseMode> list2 = new List<BaseMode>();
                        string str = Guid.NewGuid().ToString();
                        string str2 = set2.Tables[j].Rows[num2]["OpComponentId"].ToString();
                        list2.Add(new BaseMode(null, null, null, "did", str, null, null));
                        list2.Add(new BaseMode(null, null, null, "cInvCode", set2.Tables[j].Rows[num2]["DInvCode"].ToString(), null, null));
                        list2.Add(new BaseMode(null, null, null, "BaseQtyN", set2.Tables[j].Rows[num2]["DBaseQtyN"].ToString(), null, null));
                        list2.Add(new BaseMode(null, null, null, "BaseQtyD", set2.Tables[j].Rows[num2]["DBaseQtyD"].ToString(), null, null));
                        list2.Add(new BaseMode(null, null, null, "opertype", "2", null, null));
                        this.detailBiz.lst.Add(list2);
                        for (int k = 0; k < set3.Tables.Count; k++)
                        {
                            if (set3.Tables[k].Rows.Count > 0)
                            {
                                DataRow[] rowArray = set3.Tables[k].Select("OpComponentId =" + str2);
                                for (int m = 0; m < rowArray.Length; m++)
                                {
                                    List<BaseMode> list3 = new List<BaseMode> {
                                        new BaseMode(null, null, null, "did", str, null, null),
                                        new BaseMode(null, null, null, "ddid", Guid.NewGuid().ToString(), null, null),
                                        new BaseMode(null, null, null, "cInvCode", rowArray[m]["cInvCode"].ToString(), null, null),
                                        new BaseMode(null, null, null, "Sequence", rowArray[m]["Sequence"].ToString(), null, null),
                                        new BaseMode(null, null, null, "Factor", rowArray[m]["Factor"].ToString(), null, null),
                                        new BaseMode(null, null, null, "ReplaceFlag", rowArray[m]["ReplaceFlag"].ToString(), null, null)
                                    };
                                    if (this.opertype.Equals("a"))
                                    {
                                        list3.Add(new BaseMode(null, null, null, "opertype", "0", null, null));
                                    }
                                    else
                                    {
                                        list3.Add(new BaseMode(null, null, null, "opertype", "2", null, null));
                                    }
                                    this.detailSubBiz.lst.Add(list3);
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

