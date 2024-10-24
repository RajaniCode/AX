/*******************************************************************************
 * Copyright 2008-2013 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * Licensed under the Apache License, Version 2.0 (the "License"). You may not use
 * this file except in compliance with the License. A copy of the License is located at
 *
 * http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed on
 * an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
 * or implied. See the License for the specific language governing permissions and
 * limitations under the License.
 * *****************************************************************************
 *    __  _    _  ___
 *   (  )( \/\/ )/ __)
 *   /__\ \    / \__ \
 *  (_)(_) \/\/  (___/
 *
 *  AWS SDK for .NET
 */

using System;
using System.Collections.Generic;
using System.Xml.Serialization;
using System.Text;

namespace Amazon.EC2.Model
{
    /// <summary>
    /// Describes current bundling tasks.
    /// </summary>
    /// <remarks>
    /// Describes in-progress and recent bundle tasks.
    /// Complete and failed tasks are removed from the list a
    /// short time after completion.
    /// If no bundle ids are given, all bundle tasks are returned.
    /// </remarks>
    [XmlRootAttribute(IsNullable = false)]
    public class DescribeBundleTasksRequest
    {    
        private List<string> bundleIdField;
        private List<Filter> filterField;

        /// <summary>
        /// One or more IDs of the bundle tasks to describe.
        /// </summary>
        [XmlElementAttribute(ElementName = "BundleId")]
        public List<string> BundleId
        {
            get
            {
                if (this.bundleIdField == null)
                {
                    this.bundleIdField = new List<string>();
                }
                return this.bundleIdField;
            }
            set { this.bundleIdField = value; }
        }

        /// <summary>
        /// Sets the IDs of the bundle tasks to describe.
        /// </summary>
        /// <param name="list">The ID of the bundle task to describe.</param>
        /// <returns>this instance</returns>
        public DescribeBundleTasksRequest WithBundleId(params string[] list)
        {
            foreach (string item in list)
            {
                BundleId.Add(item);
            }
            return this;
        }

        /// <summary>
        /// Checks if BundleId property is set
        /// </summary>
        /// <returns>true if BundleId property is set</returns>
        public bool IsSetBundleId()
        {
            return (BundleId.Count > 0);
        }

        /// <summary>
        /// A list of filters used to match system-defined properties and user-defined tags associated 
        /// with the specified BundleTasks.
        /// For a complete reference to the available filter keys for this operation, see the
        /// Amazon EC2 API reference.
        /// </summary>
        [XmlElementAttribute(ElementName = "Filter")]
        public List<Filter> Filter
        {
            get
            {
                if (this.filterField == null)
                {
                    this.filterField = new List<Filter>();
                }
                return this.filterField;
            }
            set { this.filterField = value; }
        }

        /// <summary>
        /// Sets the filters used to match system-defined properties and user-defined tags associated 
        /// with the specified BundleTasks.
        /// </summary>
        /// <param name="list">A list of filters used to match system-defined properties and user-defined tags associated 
        /// with the specified BundleTasks.
        /// For a complete reference to the available filter keys for this operation, see the
        /// Amazon EC2 API reference.</param>
        /// <returns>this instance</returns>
        public DescribeBundleTasksRequest WithFilter(params Filter[] list)
        {
            foreach (Filter item in list)
            {
                Filter.Add(item);
            }
            return this;
        }

        /// <summary>
        /// Checks if Filter property is set
        /// </summary>
        /// <returns>true if Filter property is set</returns>
        public bool IsSetFilter()
        {
            return (Filter.Count > 0);
        }

    }
}
