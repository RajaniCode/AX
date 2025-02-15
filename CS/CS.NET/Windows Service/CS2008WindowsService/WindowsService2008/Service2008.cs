﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.ServiceProcess;
using System.Text;

namespace WindowsService2008
{
    public partial class Service2008 : ServiceBase
    {
        public Service2008()
        {
            InitializeComponent();

            if (!System.Diagnostics.EventLog.SourceExists("MySource"))
            {
                System.Diagnostics.EventLog.CreateEventSource(
                    "MySource", "MyNewLog");
            }
            eventLog1.Source = "MySource";
            eventLog1.Log = "MyNewLog";

        }

        protected override void OnStart(string[] args)
        {
            eventLog1.WriteEntry("In OnStart");

        }

        protected override void OnStop()
        {
            eventLog1.WriteEntry("In onStop.");

        }

        protected override void OnContinue()
        {
            eventLog1.WriteEntry("In OnContinue.");
        }  

    }
}
