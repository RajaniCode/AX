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
        ///   Looks up a localized string similar to WCF found cached InstanceContext. Returning this InstanceContext.
        /// </summary>
        internal static string CachedInstanceContextFound {
            get {
                return ResourceManager.GetString("CachedInstanceContextFound", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Callback could not be changed when the timer is running..
        /// </summary>
        internal static string ExCannotChangeCallback {
            get {
                return ResourceManager.GetString("ExCannotChangeCallback", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Idle timeout could not be changed when the timer is running..
        /// </summary>
        internal static string ExCannotChangeTimeout {
            get {
                return ResourceManager.GetString("ExCannotChangeTimeout", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to WCF created new InstanceContext with unique Id &apos;{0}&apos;. Adding this to cache..
        /// </summary>
        internal static string InstanceContextAddedToCache {
            get {
                return ResourceManager.GetString("InstanceContextAddedToCache", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to WCF is checking to see whether an InstanceContext with Id &apos;{0}&apos; has been cached..
        /// </summary>
        internal static string InstanceContextLookup {
            get {
                return ResourceManager.GetString("InstanceContextLookup", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to WCF closed InstanceContext with Id &apos;{0}&apos;. Removing this from cache..
        /// </summary>
        internal static string InstanceContextRemovedFromCache {
            get {
                return ResourceManager.GetString("InstanceContextRemovedFromCache", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to WCF is checking whether the instance is Idle. Reply with &apos;True&apos;.
        /// </summary>
        internal static string MsgIdle {
            get {
                return ResourceManager.GetString("MsgIdle", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Custom lease timeout expired. Notifying WCF..
        /// </summary>
        internal static string MsgLeaseExpired {
            get {
                return ResourceManager.GetString("MsgLeaseExpired", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to WCF is checking whether the instance is Idle. Reply with &apos;False&apos;.
        /// </summary>
        internal static string MsgNotIdle {
            get {
                return ResourceManager.GetString("MsgNotIdle", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to No header was found in the incoming message. WCF creating a new Id to associate with this InstanceContext..
        /// </summary>
        internal static string NoHeaderFound {
            get {
                return ResourceManager.GetString("NoHeaderFound", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to WCF is allocating InstanceContext with Id &apos;{0}&apos; to process new Message. Stopping the InstanceContext idle timer..
        /// </summary>
        internal static string StopInstanceContextIdleTimer {
            get {
                return ResourceManager.GetString("StopInstanceContextIdleTimer", resourceCulture);
            }
        }
    }
}
