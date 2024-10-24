﻿using ContosoUniversity.Migrations;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ContosoUniversity.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Message = "Welcome to Contoso University";

            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        public ActionResult Contact()
        {
            var configuration = new Configuration();
            var migrator = new DbMigrator(configuration);
            migrator.Update();

            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}
