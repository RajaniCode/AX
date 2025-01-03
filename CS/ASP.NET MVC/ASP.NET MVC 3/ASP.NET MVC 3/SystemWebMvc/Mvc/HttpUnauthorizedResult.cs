﻿/* ****************************************************************************
 *
 * Copyright (c) Microsoft Corporation. All rights reserved.
 *
 * This software is subject to the Microsoft Public License (Ms-PL). 
 * A copy of the license can be found in the license.htm file included 
 * in this distribution.
 *
 * You must not remove this notice, or any other, from this software.
 *
 * ***************************************************************************/

namespace System.Web.Mvc {

    public class HttpUnauthorizedResult : HttpStatusCodeResult {

        // HTTP 401 is the status code for unauthorized access. Other code might
        // intercept this and perform some special logic. For example, the
        // FormsAuthenticationModule looks for 401 responses and instead redirects
        // the user to the login page.
        private const int UnauthorizedCode = 401;

        public HttpUnauthorizedResult()
            : this(null) {
        }

        public HttpUnauthorizedResult(string statusDescription)
            : base(UnauthorizedCode, statusDescription) {
        }
    }
}
