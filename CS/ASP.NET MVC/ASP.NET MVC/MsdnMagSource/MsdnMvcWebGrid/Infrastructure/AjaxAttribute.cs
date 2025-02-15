﻿using System;
using System.Reflection;
using System.Web.Mvc;

namespace MsdnMvcWebGrid.Infrastructure
{
    public class AjaxAttribute : ActionMethodSelectorAttribute
    {
        private readonly bool _ajax;

        public AjaxAttribute(bool ajax)
        {
            _ajax = ajax;
        }

        public override bool IsValidForRequest(ControllerContext controllerContext, MethodInfo methodInfo)
        {
            return _ajax == controllerContext.HttpContext.Request.IsAjaxRequest();
        }
    }
}