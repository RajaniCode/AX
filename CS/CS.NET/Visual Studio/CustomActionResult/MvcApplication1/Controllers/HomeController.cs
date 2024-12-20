﻿using System.Web.Mvc;

namespace MvcApplication1.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
        
        public ExcelResult GetExcelFile()
        {
            return new ExcelResult
                       {
                           FileName = "sample.xls", Path = "~/Content/sample.xls"
                       };
        }
    }
}
