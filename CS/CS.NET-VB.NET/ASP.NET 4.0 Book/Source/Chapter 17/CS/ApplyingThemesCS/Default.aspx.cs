﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    
    protected void Page_PreInit(object sender, EventArgs e)
    {
        Page.Theme = Server.HtmlEncode(Request.QueryString["Theme"]);
    }

}