﻿using System.Web.Mvc;

namespace MvcApplication1.Controllers
{
    public class ExcelResult : ActionResult
    {
        public string FileName { get; set; }
        public string Path { get;set; }

        public override void ExecuteResult(ControllerContext context)
        {
            context.HttpContext.Response.Buffer = true;
            context.HttpContext.Response.Clear();
            context.HttpContext.Response.AddHeader("content-disposition", "attachment; filename=" + FileName);
            context.HttpContext.Response.ContentType = "application/vnd.ms-excel";
            context.HttpContext.Response.WriteFile(context.HttpContext.Server.MapPath(Path));    
        }
    }
}
