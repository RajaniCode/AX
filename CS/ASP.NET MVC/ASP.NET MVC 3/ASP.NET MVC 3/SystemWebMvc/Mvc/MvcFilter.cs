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
    public abstract class MvcFilter : IMvcFilter {
        protected MvcFilter() {
        }

        protected MvcFilter(bool allowMultiple, int order) {
            AllowMultiple = allowMultiple;
            Order = order;
        }

        public bool AllowMultiple {
            get;
            private set;
        }

        public int Order {
            get;
            private set;
        }
    }
}
