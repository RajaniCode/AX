// (c) 2010 CodePlex Foundation

/// <reference name="MicrosoftAjax.js" />
/// <reference name="MicrosoftAjaxTimer.debug.js" />
/// <reference name="MicrosoftAjaxWebForms.debug.js" />

(function() {
var scriptName = "ExtendedBase";

function execute() {

var version = Sys.version;
if (!version && !Sys._versionChecked) {
    Sys._versionChecked = true;
    throw new Error("AjaxControlToolkit requires ASP.NET Ajax 4.0 scripts. Ensure the correct version of the scripts are referenced. If you are using an ASP.NET ScriptManager, switch to the ToolkitScriptManager in AjaxControlToolkit.dll.");
}

Type.registerNamespace('Sys.Extended.UI');

Sys.Extended.UI.BehaviorBase = function(element) {
    /// <summary>
    /// Base behavior for all extender behaviors
    /// </summary>
    /// <param name="element" type="Sys.UI.DomElement" domElement="true">
    /// Element the behavior is associated with
    /// </param>
    Sys.Extended.UI.BehaviorBase.initializeBase(this,[element]);
    
    this._clientStateFieldID = null;
    this._pageRequestManager = null;
    this._partialUpdateBeginRequestHandler = null;
    this._partialUpdateEndRequestHandler = null;
}
Sys.Extended.UI.BehaviorBase.prototype = {
    initialize : function() {
        /// <summary>
        /// Initialize the behavior
        /// </summary>

        Sys.Extended.UI.BehaviorBase.callBaseMethod(this, 'initialize');
    },

    dispose : function() {
        /// <summary>
        /// Dispose the behavior
        /// </summary>
        Sys.Extended.UI.BehaviorBase.callBaseMethod(this, 'dispose');

        if (this._pageRequestManager) {
            if (this._partialUpdateBeginRequestHandler) {
                this._pageRequestManager.remove_beginRequest(this._partialUpdateBeginRequestHandler);
                this._partialUpdateBeginRequestHandler = null;
            }
            if (this._partialUpdateEndRequestHandler) {
                this._pageRequestManager.remove_endRequest(this._partialUpdateEndRequestHandler);
                this._partialUpdateEndRequestHandler = null;
            }
            this._pageRequestManager = null;
        }
    },

    get_ClientStateFieldID : function() {
        /// <value type="String">
        /// ID of the hidden field used to store client state
        /// </value>
        return this._clientStateFieldID;
    },
    set_ClientStateFieldID : function(value) {
        if (this._clientStateFieldID != value) {
            this._clientStateFieldID = value;
            this.raisePropertyChanged('ClientStateFieldID');
        }
    },

    get_ClientState : function() {
        /// <value type="String">
        /// Client state
        /// </value>
        if (this._clientStateFieldID) {
            var input = document.getElementById(this._clientStateFieldID);
            if (input) {
                return input.value;
            }
        }
        return null;
    },
    set_ClientState : function(value) {
        if (this._clientStateFieldID) {
            var input = document.getElementById(this._clientStateFieldID);
            if (input) {
                input.value = value;
            }
        }
    },

    registerPartialUpdateEvents : function() {
        /// <summary>
        /// Register for beginRequest and endRequest events on the PageRequestManager,
        /// (which cause _partialUpdateBeginRequest and _partialUpdateEndRequest to be
        /// called when an UpdatePanel refreshes)
        /// </summary>

        if (Sys && Sys.WebForms && Sys.WebForms.PageRequestManager){
            this._pageRequestManager = Sys.WebForms.PageRequestManager.getInstance();
            if (this._pageRequestManager) {
                this._partialUpdateBeginRequestHandler = Function.createDelegate(this, this._partialUpdateBeginRequest);
                this._pageRequestManager.add_beginRequest(this._partialUpdateBeginRequestHandler);
                this._partialUpdateEndRequestHandler = Function.createDelegate(this, this._partialUpdateEndRequest);
                this._pageRequestManager.add_endRequest(this._partialUpdateEndRequestHandler);
            }
        }
    },

    _partialUpdateBeginRequest : function(sender, beginRequestEventArgs) {
        /// <summary>
        /// Method that will be called when a partial update (via an UpdatePanel) begins,
        /// if registerPartialUpdateEvents() has been called.
        /// </summary>
        /// <param name="sender" type="Object">
        /// Sender
        /// </param>
        /// <param name="beginRequestEventArgs" type="Sys.WebForms.BeginRequestEventArgs">
        /// Event arguments
        /// </param>

    },
    
    _partialUpdateEndRequest : function(sender, endRequestEventArgs) {
        /// <summary>
        /// Method that will be called when a partial update (via an UpdatePanel) finishes,
        /// if registerPartialUpdateEvents() has been called.
        /// </summary>
        /// <param name="sender" type="Object">
        /// Sender
        /// </param>
        /// <param name="endRequestEventArgs" type="Sys.WebForms.EndRequestEventArgs">
        /// Event arguments
        /// </param>

    }
}
Sys.Extended.UI.BehaviorBase.registerClass('Sys.Extended.UI.BehaviorBase', Sys.UI.Behavior);


Sys.Extended.UI.DynamicPopulateBehaviorBase = function(element) {
    /// <summary>
    /// DynamicPopulateBehaviorBase is used to add DynamicPopulateBehavior funcitonality
    /// to other extenders.  It will dynamically populate the contents of the target element
    /// when its populate method is called.
    /// </summary>
    /// <param name="element" type="Sys.UI.DomElement" domElement="true">
    /// DOM Element the behavior is associated with
    /// </param>
    Sys.Extended.UI.DynamicPopulateBehaviorBase.initializeBase(this, [element]);
    
    this._DynamicControlID = null;
    this._DynamicContextKey = null;
    this._DynamicServicePath = null;
    this._DynamicServiceMethod = null;
    this._cacheDynamicResults = false;
    this._dynamicPopulateBehavior = null;
    this._populatingHandler = null;
    this._populatedHandler = null;
}
Sys.Extended.UI.DynamicPopulateBehaviorBase.prototype = {
    initialize : function() {
        /// <summary>
        /// Initialize the behavior
        /// </summary>

        Sys.Extended.UI.DynamicPopulateBehaviorBase.callBaseMethod(this, 'initialize');

        this._populatingHandler = Function.createDelegate(this, this._onPopulating);
        this._populatedHandler = Function.createDelegate(this, this._onPopulated);
    },

    dispose : function() {
        /// <summary>
        /// Dispose the behavior
        /// </summary>

        if (this._populatedHandler) {
            if (this._dynamicPopulateBehavior) {
                this._dynamicPopulateBehavior.remove_populated(this._populatedHandler);
            }
            this._populatedHandler = null;
        }
        if (this._populatingHandler) {
            if (this._dynamicPopulateBehavior) {
                this._dynamicPopulateBehavior.remove_populating(this._populatingHandler);
            }
            this._populatingHandler = null;
        }

        if (this._dynamicPopulateBehavior) {
            this._dynamicPopulateBehavior.dispose();
            this._dynamicPopulateBehavior = null;
        }
        Sys.Extended.UI.DynamicPopulateBehaviorBase.callBaseMethod(this, 'dispose');
    },

    populate : function(contextKeyOverride) {
        /// <summary>
        /// Demand-create the DynamicPopulateBehavior and use it to populate the target element
        /// </summary>
        /// <param name="contextKeyOverride" type="String" mayBeNull="true" optional="true">
        /// An arbitrary string value to be passed to the web method. For example, if the element to be populated is within a data-bound repeater, this could be the ID of the current row.
        /// </param>

        if (this._dynamicPopulateBehavior && (this._dynamicPopulateBehavior.get_element() != $get(this._DynamicControlID))) {
            this._dynamicPopulateBehavior.dispose();
            this._dynamicPopulateBehavior = null;
        }
        
        if (!this._dynamicPopulateBehavior && this._DynamicControlID && this._DynamicServiceMethod) {
            this._dynamicPopulateBehavior = $create(Sys.Extended.UI.DynamicPopulateBehavior,
                {
                    "id" : this.get_id() + "_DynamicPopulateBehavior",
                    "ContextKey" : this._DynamicContextKey,
                    "ServicePath" : this._DynamicServicePath,
                    "ServiceMethod" : this._DynamicServiceMethod,
                    "cacheDynamicResults" : this._cacheDynamicResults
                }, null, null, $get(this._DynamicControlID));

            this._dynamicPopulateBehavior.add_populating(this._populatingHandler);
            this._dynamicPopulateBehavior.add_populated(this._populatedHandler);
        }
        
        if (this._dynamicPopulateBehavior) {
            this._dynamicPopulateBehavior.populate(contextKeyOverride ? contextKeyOverride : this._DynamicContextKey);
        }
    },

    _onPopulating : function(sender, eventArgs) {
        /// <summary>
        /// Handler for DynamicPopulate behavior's Populating event
        /// </summary>
        /// <param name="sender" type="Object">
        /// DynamicPopulate behavior
        /// </param>
        /// <param name="eventArgs" type="Sys.CancelEventArgs" mayBeNull="false">
        /// Event args
        /// </param>
        this.raisePopulating(eventArgs);
    },

    _onPopulated : function(sender, eventArgs) {
        /// <summary>
        /// Handler for DynamicPopulate behavior's Populated event
        /// </summary>
        /// <param name="sender" type="Object">
        /// DynamicPopulate behavior
        /// </param>
        /// <param name="eventArgs" type="Sys.EventArgs" mayBeNull="false">
        /// Event args
        /// </param>
        this.raisePopulated(eventArgs);
    },

    get_dynamicControlID : function() {
        /// <value type="String">
        /// ID of the element to populate with dynamic content
        /// </value>
        return this._DynamicControlID;
    },
    get_DynamicControlID : this.get_dynamicControlID,
    set_dynamicControlID : function(value) {
        if (this._DynamicControlID != value) {
            this._DynamicControlID = value;
            this.raisePropertyChanged('dynamicControlID');
            this.raisePropertyChanged('DynamicControlID');
        }
    },
    set_DynamicControlID : this.set_dynamicControlID,

    get_dynamicContextKey : function() {
        /// <value type="String">
        /// An arbitrary string value to be passed to the web method.
        /// For example, if the element to be populated is within a
        /// data-bound repeater, this could be the ID of the current row.
        /// </value>
        return this._DynamicContextKey;
    },
    get_DynamicContextKey : this.get_dynamicContextKey,
    set_dynamicContextKey : function(value) {
        if (this._DynamicContextKey != value) {
            this._DynamicContextKey = value;
            this.raisePropertyChanged('dynamicContextKey');
            this.raisePropertyChanged('DynamicContextKey');
        }
    },
    set_DynamicContextKey : this.set_dynamicContextKey,

    get_dynamicServicePath : function() {
        /// <value type="String" mayBeNull="true" optional="true">
        /// The URL of the web service to call.  If the ServicePath is not defined, then we will invoke a PageMethod instead of a web service.
        /// </value>
        return this._DynamicServicePath;
    },
    get_DynamicServicePath : this.get_dynamicServicePath,
    set_dynamicServicePath : function(value) {
        if (this._DynamicServicePath != value) {
            this._DynamicServicePath = value;
            this.raisePropertyChanged('dynamicServicePath');
            this.raisePropertyChanged('DynamicServicePath');
        }
    },
    set_DynamicServicePath : this.set_dynamicServicePath,

    get_dynamicServiceMethod : function() {
        /// <value type="String">
        /// The name of the method to call on the page or web service
        /// </value>
        /// <remarks>
        /// The signature of the method must exactly match the following:
        ///     [WebMethod]
        ///     string DynamicPopulateMethod(string contextKey)
        ///     {
        ///         ...
        ///     }
        /// </remarks>
        return this._DynamicServiceMethod;
    },
    get_DynamicServiceMethod : this.get_dynamicServiceMethod,
    set_dynamicServiceMethod : function(value) {
        if (this._DynamicServiceMethod != value) {
            this._DynamicServiceMethod = value;
            this.raisePropertyChanged('dynamicServiceMethod');
            this.raisePropertyChanged('DynamicServiceMethod');
        }
    },
    set_DynamicServiceMethod : this.set_dynamicServiceMethod,
    
    get_cacheDynamicResults : function() {
        /// <value type="Boolean" mayBeNull="false">
        /// Whether the results of the dynamic population should be cached and
        /// not fetched again after the first load
        /// </value>
        return this._cacheDynamicResults;
    },
    set_cacheDynamicResults : function(value) {
        if (this._cacheDynamicResults != value) {
            this._cacheDynamicResults = value;
            this.raisePropertyChanged('cacheDynamicResults');
        }
    },
    
    add_populated : function(handler) {
        /// <summary>
        /// Add a handler on the populated event
        /// </summary>
        /// <param name="handler" type="Function">
        /// Handler
        /// </param>
        this.get_events().addHandler("populated", handler);
    },
    remove_populated : function(handler) {
        /// <summary>
        /// Remove a handler from the populated event
        /// </summary>
        /// <param name="handler" type="Function">
        /// Handler
        /// </param>
        this.get_events().removeHandler("populated", handler);
    },
    raisePopulated : function(arg) {
        /// <summary>
        /// Raise the populated event
        /// </summary>
        /// <param name="arg" type="Sys.EventArgs">
        /// Event arguments
        /// </param>
        var handler = this.get_events().getHandler("populated");  
        if (handler) handler(this, arg);
    },
    
    add_populating : function(handler) {
        /// <summary>
        /// Add an event handler for the populating event
        /// </summary>
        /// <param name="handler" type="Function" mayBeNull="false">
        /// Event handler
        /// </param>
        /// <returns />
        this.get_events().addHandler('populating', handler);
    },
    remove_populating : function(handler) {
        /// <summary>
        /// Remove an event handler from the populating event
        /// </summary>
        /// <param name="handler" type="Function" mayBeNull="false">
        /// Event handler
        /// </param>
        /// <returns />
        this.get_events().removeHandler('populating', handler);
    },
    raisePopulating : function(eventArgs) {
        /// <summary>
        /// Raise the populating event
        /// </summary>
        /// <param name="eventArgs" type="Sys.CancelEventArgs" mayBeNull="false">
        /// Event arguments for the populating event
        /// </param>
        /// <returns />
        
        var handler = this.get_events().getHandler('populating');
        if (handler) {
            handler(this, eventArgs);
        }
    }
}
Sys.Extended.UI.DynamicPopulateBehaviorBase.registerClass('Sys.Extended.UI.DynamicPopulateBehaviorBase', Sys.Extended.UI.BehaviorBase);


Sys.Extended.UI.ControlBase = function(element) {
    Sys.Extended.UI.ControlBase.initializeBase(this, [element]);
    this._clientStateField = null;
    this._callbackTarget = null;
    this._onsubmit$delegate = Function.createDelegate(this, this._onsubmit);
    this._oncomplete$delegate = Function.createDelegate(this, this._oncomplete);
    this._onerror$delegate = Function.createDelegate(this, this._onerror);
}

Sys.Extended.UI.ControlBase.__doPostBack = function(eventTarget, eventArgument) {
    if (!Sys.WebForms.PageRequestManager.getInstance().get_isInAsyncPostBack()) {
        for (var i = 0; i < Sys.Extended.UI.ControlBase.onsubmitCollection.length; i++) {
            Sys.Extended.UI.ControlBase.onsubmitCollection[i]();
        }
    }
    Function.createDelegate(window, Sys.Extended.UI.ControlBase.__doPostBackSaved)(eventTarget, eventArgument);
}

Sys.Extended.UI.ControlBase.prototype = {
    initialize: function() {
        Sys.Extended.UI.ControlBase.callBaseMethod(this, "initialize");
        if (this._clientStateField) {
            this.loadClientState(this._clientStateField.value);
        }
        if (typeof (Sys.WebForms) !== "undefined" && typeof (Sys.WebForms.PageRequestManager) !== "undefined") {
            Array.add(Sys.WebForms.PageRequestManager.getInstance()._onSubmitStatements, this._onsubmit$delegate);
            if (Sys.Extended.UI.ControlBase.__doPostBackSaved == null || typeof Sys.Extended.UI.ControlBase.__doPostBackSaved == "undefined") {
                Sys.Extended.UI.ControlBase.__doPostBackSaved = window.__doPostBack;
                window.__doPostBack = Sys.Extended.UI.ControlBase.__doPostBack;
                Sys.Extended.UI.ControlBase.onsubmitCollection = new Array();
            }
            Array.add(Sys.Extended.UI.ControlBase.onsubmitCollection, this._onsubmit$delegate);
        } else {
            $addHandler(document.forms[0], "submit", this._onsubmit$delegate);
        }
    },
    dispose: function() {
        if (typeof (Sys.WebForms) !== "undefined" && typeof (Sys.WebForms.PageRequestManager) !== "undefined") {
            Array.remove(Sys.Extended.UI.ControlBase.onsubmitCollection, this._onsubmit$delegate);
            Array.remove(Sys.WebForms.PageRequestManager.getInstance()._onSubmitStatements, this._onsubmit$delegate);
        } else {
            $removeHandler(document.forms[0], "submit", this._onsubmit$delegate);
        }
        Sys.Extended.UI.ControlBase.callBaseMethod(this, "dispose");
    },

    findElement: function(id) {
        return $get(this.get_id() + '_' + id.split(':').join('_'));
    },
    get_clientStateField: function() {
        return this._clientStateField;
    },
    set_clientStateField: function(value) {
        if (this.get_isInitialized()) throw Error.invalidOperation(Sys.Extended.UI.Resources.ExtenderBase_CannotSetClientStateField);
        if (this._clientStateField != value) {
            this._clientStateField = value;
            this.raisePropertyChanged('clientStateField');
        }
    },
    loadClientState: function(value) {
        /// <remarks>override this method to intercept client state loading after a callback</remarks>
    },
    saveClientState: function() {
        /// <remarks>override this method to intercept client state acquisition before a callback</remarks>
        return null;
    },
    _invoke: function(name, args, cb) {
        /// <summary>invokes a callback method on the server control</summary>        
        if (!this._callbackTarget) {
            throw Error.invalidOperation(Sys.Extended.UI.Resources.ExtenderBase_ControlNotRegisteredForCallbacks);
        }
        if (typeof (WebForm_DoCallback) === "undefined") {
            throw Error.invalidOperation(Sys.Extended.UI.Resources.ExtenderBase_PageNotRegisteredForCallbacks);
        }
        var ar = [];
        for (var i = 0; i < args.length; i++)
            ar[i] = args[i];
        var clientState = this.saveClientState();
        if (clientState != null && !String.isInstanceOfType(clientState)) {
            throw Error.invalidOperation(Sys.Extended.UI.Resources.ExtenderBase_InvalidClientStateType);
        }
        var payload = Sys.Serialization.JavaScriptSerializer.serialize({ name: name, args: ar, state: this.saveClientState() });
        WebForm_DoCallback(this._callbackTarget, payload, this._oncomplete$delegate, cb, this._onerror$delegate, true);
    },
    _oncomplete: function(result, context) {
        result = Sys.Serialization.JavaScriptSerializer.deserialize(result);
        if (result.error) {
            throw Error.create(result.error);
        }
        this.loadClientState(result.state);
        context(result.result);
    },
    _onerror: function(message, context) {
        throw Error.create(message);
    },
    _onsubmit: function() {
        if (this._clientStateField) {
            this._clientStateField.value = this.saveClientState();
        }
        return true;
    }

}
Sys.Extended.UI.ControlBase.registerClass("Sys.Extended.UI.ControlBase", Sys.UI.Control);

} // execute

if (window.Sys && Sys.loader) {
    Sys.loader.registerScript(scriptName, ["ComponentModel", "Serialization"], execute);
}
else {
    execute();
}

})();

Type.registerNamespace("Sys.Extended.UI");
Sys.Extended.UI.Resources = {
"AlwaysVisible_ElementRequired": "必须为 Sys.Extended.UI.AlwaysVisibleControlBehavior 指定一个元素",
"Animation_CannotNestSequence": "Sys.Extended.UI.Animation.ParallelAnimation 不能内含 Sys.Extended.UI.Animation.SequenceAnimation",
"Animation_ChildrenNotAllowed": "Sys.Extended.UI.Animation.createAnimation 无法加入一个不是派生自 Sys.Extended.UI.Animation.ParentAnimation 且类型为 {0} 的子动画",
"Animation_InvalidBaseType": "Sys.Extended.UI.Animation.registerAnimation 只能注册那些继承自 Sys.Extended.UI.Animation.Animation 的类型",
"Animation_InvalidColor": "标记名称 Color 必须是 7 个字符的 16 进位字符串（例如：#246ACF），不能是 {0}",
"Animation_MissingAnimationName": "Sys.Extended.UI.Animation.createAnimation 必须持有一个 AnimationName 属性的对象",
"Animation_NoDynamicPropertyFound": "Sys.Extended.UI.Animation.createAnimation 找不到相对应的  {0} 或 {1} 属性",
"Animation_NoPropertyFound": "Sys.Extended.UI.Animation.createAnimation 找不到相对应的 {0} 属性",
"Animation_TargetNotFound": "Sys.Extended.UI.Animation.Animation.set_animationTarget 需要一个 Sys.UI.DomElement 或 Sys.UI.Control 类的控件  ID。找不到相对应的  {0} 之元素或控件",
"Animation_UknownAnimationName": "Sys.Extended.UI.Animation.createAnimation 找不到名称为 {0} 的动画",
"Calendar_Today": "Today: {0}",
"CascadingDropDown_MethodError": "[方法错误 {0}]",
"CascadingDropDown_MethodTimeout": "[方法逾时]",
"CascadingDropDown_NoParentElement": "无法找到父元素 {0}",
"CollapsiblePanel_NoControlID": "无法找到元素 {0}",
"Common_DateTime_InvalidFormat": "格式无效",
"Common_DateTime_InvalidTimeSpan": "{0} 的 TimeSpan 格式无效",
"Common_InvalidBorderWidthUnit": "单位类型 {0} 对 parseBorderWidth 而言无效",
"Common_InvalidPaddingUnit": "单位类型 {0} 对 parsePadding 而言无效",
"Common_UnitHasNoDigits": "没有数字",
"DynamicPopulate_WebServiceError": "无法调用 Web 服务：{0}",
"DynamicPopulate_WebServiceTimeout": "调用 Web 服务超时",
"ExtenderBase_CannotSetClientStateField": "只能在初始化之前设定 clientStateField",
"ExtenderBase_ControlNotRegisteredForCallbacks": "这个控件尚未注册，无法提供回调",
"ExtenderBase_InvalidClientStateType": "saveClientState 必须返回 String 类型的值",
"ExtenderBase_PageNotRegisteredForCallbacks": "这个页面尚未注册，无法提供回调",
"HTMLEditor_toolbar_button_FixedBackColor_title": "Background color",
"HTMLEditor_toolbar_button_BackColorClear_title": "Clear background color",
"HTMLEditor_toolbar_button_Bold_title": "Bold",
"HTMLEditor_toolbar_button_BulletedList_title": "Bulleted List",
"HTMLEditor_toolbar_button_Copy_title": "Copy",
"HTMLEditor_toolbar_button_Cut_title": "Cut",
"HTMLEditor_toolbar_button_DecreaseIndent_title": "Decrease Indent",
"HTMLEditor_toolbar_button_FontName_defaultValue": "default",
"HTMLEditor_toolbar_button_FontSize_defaultValue": "default",
"HTMLEditor_toolbar_button_DesignMode_title": "Design mode",
"HTMLEditor_toolbar_button_FontName_label": "Font",
"HTMLEditor_toolbar_button_FixedForeColor_title": "Foreground color",
"HTMLEditor_toolbar_button_ForeColorClear_title": "Clear foreground color",
"HTMLEditor_toolbar_button_HtmlMode_title": "HTML text",
"HTMLEditor_toolbar_button_IncreaseIndent_title": "Increase Indent",
"HTMLEditor_toolbar_button_InsertHR_title": "Insert horizontal rule",
"HTMLEditor_toolbar_button_InsertLink_title": "Insert/Edit URL link",
"HTMLEditor_toolbar_button_InsertLink_message_EmptyURL": "URL can not be empty",
"HTMLEditor_toolbar_button_Italic_title": "Italic",
"HTMLEditor_toolbar_button_JustifyCenter_title": "Justify Center",
"HTMLEditor_toolbar_button_JustifyFull_title": "Justify",
"HTMLEditor_toolbar_button_JustifyLeft_title": "Justify Left",
"HTMLEditor_toolbar_button_JustifyRight_title": "Justify Right",
"HTMLEditor_toolbar_button_Ltr_title": "Left to right direction",
"HTMLEditor_toolbar_button_OnPasteFromMSWord": "Pasting from MS Word is switched on. Just now: {0}",
"HTMLEditor_toolbar_button_OnPastePlainText": "Plain text pasting is switched on. Just now: {0}",
"HTMLEditor_toolbar_button_OrderedList_title": "Ordered List",
"HTMLEditor_toolbar_button_Paragraph_title": "Make Paragraph",
"HTMLEditor_toolbar_button_Paste_title": "Paste",
"HTMLEditor_toolbar_button_PasteText_title": "Paste Plain Text",
"HTMLEditor_toolbar_button_PasteWord_title": "Paste from MS Word (with cleanup)",
"HTMLEditor_toolbar_popup_LinkProperties_button_Cancel": "Cancel",
"HTMLEditor_toolbar_popup_LinkProperties_button_OK": "OK",
"HTMLEditor_toolbar_popup_LinkProperties_field_URL": "URL",
"HTMLEditor_toolbar_popup_LinkProperties_field_Target": "Target",
"HTMLEditor_toolbar_popup_LinkProperties_field_Target_New": "New window",
"HTMLEditor_toolbar_popup_LinkProperties_field_Target_Current": "Current window",
"HTMLEditor_toolbar_popup_LinkProperties_field_Target_Parent": "Parent window",
"HTMLEditor_toolbar_popup_LinkProperties_field_Target_Top": "Top window",
"HTMLEditor_toolbar_button_PreviewMode_title": "Preview",
"HTMLEditor_toolbar_button_Redo_title": "Redo",
"HTMLEditor_toolbar_button_RemoveAlignment_title": "Remove Alignment",
"HTMLEditor_toolbar_button_RemoveLink_title": "Remove Link",
"HTMLEditor_toolbar_button_RemoveStyles_title": "Remove styles",
"HTMLEditor_toolbar_button_Rtl_title": "Right to left direction",
"HTMLEditor_toolbar_button_FontSize_label": "Size",
"HTMLEditor_toolbar_button_StrikeThrough_title": "Strike through",
"HTMLEditor_toolbar_button_SubScript_title": "Sub script",
"HTMLEditor_toolbar_button_SuperScript_title": "Super script",
"HTMLEditor_toolbar_button_Underline_title": "Underline",
"HTMLEditor_toolbar_button_Undo_title": "Undo",
"HTMLEditor_toolbar_button_Use_verb": "Use {0}",
"ListSearch_DefaultPrompt": "请键入以便搜寻",
"PasswordStrength_DefaultStrengthDescriptions": "没有;很弱;弱;差;差强人意;尚可;普通;好;很好;非常好;臻于完美！",
"PasswordStrength_GetHelpRequirements": "取得密码强度的要求说明",
"PasswordStrength_InvalidStrengthDescriptions": "所指定的密码强度文字内容个数无效",
"PasswordStrength_InvalidStrengthDescriptionStyles": "密码强度文字说明的样式表，必须符合文字内容之个数",
"PasswordStrength_InvalidWeightingRatios": "密码强度的权重比例必须有 4 种",
"PasswordStrength_RemainingCharacters": "还需要 {0} 个字符",
"PasswordStrength_RemainingLowerCase": "{0} more lower case characters",
"PasswordStrength_RemainingMixedCase": "大小写混合",
"PasswordStrength_RemainingNumbers": "还需要 {0} 个数字",
"PasswordStrength_RemainingSymbols": "还需要 {0} 个符号",
"PasswordStrength_RemainingUpperCase": "{0} more upper case characters",
"PasswordStrength_Satisfied": "密码强度已经足够",
"PasswordStrength_StrengthPrompt": "强度：",
"PopupControl_NoDefaultProperty": "类型 {1} 的 控件 {0} 不支持预设属性",
"PopupExtender_NoParentElement": "无法找到父元素 {0}",
"Rating_CallbackError": "发生未处理的异常状况：\\r\\n{0}",
"ReorderList_DropWatcherBehavior_CallbackError": "无法重新排列，请参考下面的说明：\\r\\n\\r\\n{0}",
"ReorderList_DropWatcherBehavior_NoChild": "无法找到 ID 为 {0} 的子清单",
"ResizableControlBehavior_CannotChangeProperty": "不支持对 {0} 的变更",
"ResizableControlBehavior_InvalidHandler": "{0} 处理例程不是函数、函数名称、或是函数文字",
"RTE_BackgroundColor": "Background Color",
"RTE_BarColor": "Bar Color",
"RTE_Bold": "Bold",
"RTE_Border": "Border",
"RTE_BorderColor": "Border Color",
"RTE_Cancel": "Cancel",
"RTE_CellColor": "Cell Color",
"RTE_CellPadding": "Cell Padding",
"RTE_CellSpacing": "Cell Spacing",
"RTE_ClearFormatting": "Clear Formatting",
"RTE_Columns": "Columns",
"RTE_Copy": "Copy",
"RTE_Create": "Create",
"RTE_Cut": "Cut",
"RTE_Font": "Font",
"RTE_FontColor": "Font Color",
"RTE_Heading": "Heading",
"RTE_Hyperlink": "Hyperlink",
"RTE_Indent": "Indent",
"RTE_InsertHorizontalRule": "Insert Horizontal Rule",
"RTE_InsertImage": "Insert Image",
"RTE_InsertTable": "Insert Table",
"RTE_Inserttexthere": "Insert text here",
"RTE_Italic": "Italic",
"RTE_JustifyCenter": "Justify Center",
"RTE_JustifyFull": "Justify Full",
"RTE_JustifyLeft": "Justify Left",
"RTE_JustifyRight": "Justify Right",
"RTE_LabelColor": "Label Color",
"RTE_Labels": "Labels",
"RTE_Legend": "Legend",
"RTE_Normal": "Normal",
"RTE_OK": "OK",
"RTE_OrderedList": "Ordered List",
"RTE_Outdent": "Outdent",
"RTE_Paragraph": "Paragraph",
"RTE_Paste": "Paste",
"RTE_PreviewHTML": "Preview HTML",
"RTE_Redo": "Redo",
"RTE_Rows": "Rows",
"RTE_Size": "Size",
"RTE_Underline": "Underline",
"RTE_Undo": "Undo",
"RTE_UnorderedList": "Unordered List",
"RTE_Values": "Values",
"RTE_ViewEditor": "View Editor",
"RTE_ViewSource": "View Source",
"RTE_ViewValues": "View Values",
"Shared_BrowserSecurityPreventsPaste": "您的浏览器安全性设定，不允许执行自动粘贴的操作。请改用键盘快捷键 Ctrl + V。",
"Slider_NoSizeProvided": "请在 Slider 的 CSS Class 中，设定高度与宽度属性的有效值",
"Tabs_ActiveTabArgumentOutOfRange": "参数不是索引标签 (Tab) 集合的成员",
"Tabs_OwnerExpected": "于初始化之前，必须设定拥有者",
"Tabs_PropertySetAfterInitialization": "于初始化之后，无法变更 {0}",
"Tabs_PropertySetBeforeInitialization": "于初始化之前，无法变更 {0}",
"ValidatorCallout_DefaultErrorMessage": "这个控件无效",
"MultiHandleSlider_CssHeightWidthRequired": "You must specify a CSS width and height for all handle styles as well as the rail.",
"AsyncFileUpload_InternalErrorMessage": "The AsyncFileUpload control has encountered an error with the uploader in this page. Please refresh the page and try again.",
"AsyncFileUpload_UnhandledException": "Unhandled Exception",
"AsyncFileUpload_ConfirmToSeeErrorPage": "Do you want to see the response page?",
"AsyncFileUpload_ServerResponseError": "Server Response Error",
"AsyncFileUpload_UnknownServerError": "Unknown Server error",
"AsyncFileUpload_UploadingProblem": "The requested file uploading problem.",
"Calendar_Today1": "今天:  {0}"
};
