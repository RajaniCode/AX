﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.20915.0
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Microsoft.ServiceModel.Samples.Properties {
    using System;
    
    
    /// <summary>
    ///   A strongly-typed resource class, for looking up localized strings, etc.
    /// </summary>
    // This class was auto-generated by the StronglyTypedResourceBuilder
    // class via a tool like ResGen or Visual Studio.
    // To add or remove a member, edit your .ResX file then rerun ResGen
    // with the /str option, or rebuild your VS project.
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute("System.Resources.Tools.StronglyTypedResourceBuilder", "4.0.0.0")]
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
    [global::System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    internal class Resources {
        
        private static global::System.Resources.ResourceManager resourceMan;
        
        private static global::System.Globalization.CultureInfo resourceCulture;
        
        [global::System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")]
        internal Resources() {
        }
        
        /// <summary>
        ///   Returns the cached ResourceManager instance used by this class.
        /// </summary>
        [global::System.ComponentModel.EditorBrowsableAttribute(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        internal static global::System.Resources.ResourceManager ResourceManager {
            get {
                if (object.ReferenceEquals(resourceMan, null)) {
                    global::System.Resources.ResourceManager temp = new global::System.Resources.ResourceManager("Microsoft.ServiceModel.Samples.Properties.Resources", typeof(Resources).Assembly);
                    resourceMan = temp;
                }
                return resourceMan;
            }
        }
        
        /// <summary>
        ///   Overrides the current thread's CurrentUICulture property for all
        ///   resource lookups using this strongly typed resource class.
        /// </summary>
        [global::System.ComponentModel.EditorBrowsableAttribute(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        internal static global::System.Globalization.CultureInfo Culture {
            get {
                return resourceCulture;
            }
            set {
                resourceCulture = value;
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Minimum pool size must be lesser than the maximum pool size..
        /// </summary>
        internal static string ExHighMinPool {
            get {
                return ResourceManager.GetString("ExHighMinPool", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to InstanceContextMode must not be set to Single..
        /// </summary>
        internal static string ExInvalidContext {
            get {
                return ResourceManager.GetString("ExInvalidContext", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Maximum pool size must be greater than the minimum pool size..
        /// </summary>
        internal static string ExLowMaxPool {
            get {
                return ResourceManager.GetString("ExLowMaxPool", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Pool size values must be positive integers..
        /// </summary>
        internal static string ExNegetivePoolSize {
            get {
                return ResourceManager.GetString("ExNegetivePoolSize", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Target object creation timed out..
        /// </summary>
        internal static string ExObjectCreationTimeout {
            get {
                return ResourceManager.GetString("ExObjectCreationTimeout", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to New object created in the pool..
        /// </summary>
        internal static string MsgNewObject {
            get {
                return ResourceManager.GetString("MsgNewObject", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Object returned and added to the pool..
        /// </summary>
        internal static string MsgObjectPooled {
            get {
                return ResourceManager.GetString("MsgObjectPooled", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to An object is being removed from the pool..
        /// </summary>
        internal static string MsgObjectRemoving {
            get {
                return ResourceManager.GetString("MsgObjectRemoving", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Object returned to the pool. However, the pool rejected pooling it again..
        /// </summary>
        internal static string MsgObjectWasNotPooled {
            get {
                return ResourceManager.GetString("MsgObjectWasNotPooled", resourceCulture);
            }
        }
    }
}
