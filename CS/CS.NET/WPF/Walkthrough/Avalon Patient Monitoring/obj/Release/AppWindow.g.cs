//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:2.0.50727.42
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using IdentityMine.Avalon.Controls;
using System;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;


namespace Avalon_Patient_Monitoring {
    
    
    /// <summary>
    /// AppWindow
    /// </summary>
    public partial class AppWindow : System.Windows.Window, System.Windows.Markup.IComponentConnector {
        
        internal Avalon_Patient_Monitoring.AppWindow MainApplicationWindow;
        
        internal System.Windows.Controls.ContentControl OSCheckerContentControl;
        
        internal System.Windows.Controls.Grid GlobalRoot;
        
        internal System.Windows.Controls.Grid Root;
        
        internal System.Windows.Controls.ColumnDefinition Master3DColumnDefinition;
        
        internal System.Windows.Controls.ColumnDefinition MasterColumnDefinition;
        
        internal System.Windows.Controls.ColumnDefinition DetailColumnDefinition;
        
        internal System.Windows.Controls.Grid Toolbar;
        
        internal IdentityMine.Avalon.Controls.VistaTypeTextBox SearchBox;
        
        internal System.Windows.Controls.Grid Master;
        
        internal System.Windows.Controls.Grid MasterView2DWrapperFor3DSnap;
        
        internal System.Windows.Media.TranslateTransform MasterView2DWrapperTranslate;
        
        internal System.Windows.Controls.Grid MasterView2D;
        
        internal System.Windows.Controls.ColumnDefinition WatchlistColumnDefinition;
        
        internal System.Windows.Controls.ColumnDefinition PatientRosterColumnDefinition;
        
        internal System.Windows.Controls.ContentControl MasterBackgroundContent;
        
        internal System.Windows.Controls.ContentControl WatchListHeaderContent;
        
        internal System.Windows.Controls.ListBox WatchList;
        
        internal System.Windows.Controls.ContentControl PatientRosterListHeaderContent;
        
        internal System.Windows.Controls.ContentControl PatientRosterStyleSelectorContent;
        
        internal System.Windows.Controls.ListBox PatientRosterList;
        
        internal IdentityMine.Avalon.Controls.Rotater3DTransition PatientMasterRotater3DTransition;
        
        internal System.Windows.Controls.ListBox PatientRosterList3DOverlay;
        
        internal System.Windows.Controls.Grid Detail;
        
        internal System.Windows.Controls.Grid DetailBack2DWrapper;
        
        internal System.Windows.Media.TranslateTransform DetailBack2DWrapperTranslate;
        
        internal System.Windows.Controls.Grid DetailBack2D;
        
        internal System.Windows.Controls.ContentControl DetailBackgroundContent;
        
        internal System.Windows.Controls.Grid PatientDetails;
        
        internal System.Windows.Shapes.Rectangle PatientDetailsBackgroundRectangle;
        
        internal System.Windows.Controls.ContentControl PatientDetailHeaderContent;
        
        internal System.Windows.Controls.ContentControl PatientDetailSelectorContent;
        
        internal System.Windows.Controls.ContentControl PatientDetailLiveMonitorsContent;
        
        internal System.Windows.Controls.ContentControl PatientDetailWorkspaceContent;
        
        internal System.Windows.Controls.ContentControl PatientDetailDataGridContent;
        
        internal System.Windows.Controls.Button BackToPatientOverview;
        
        internal System.Windows.Shapes.Rectangle MonitorWorkspaceSplitterVisualRectangle;
        
        internal System.Windows.Controls.GridSplitter MonitorWorkspaceSplitter;
        
        internal System.Windows.Controls.Grid DetailFront2DWrapper;
        
        internal System.Windows.Media.TranslateTransform DetailFront2DWrapperTranslate;
        
        internal System.Windows.Controls.Grid DetailFront2D;
        
        internal System.Windows.Controls.Grid PatientOverview2D;
        
        internal System.Windows.Controls.ContentControl PatientOverviewHeaderBackgroundContent;
        
        internal System.Windows.Controls.ContentControl PatientOverviewHeaderContent;
        
        internal System.Windows.Controls.ContentControl PatientOverviewChartContent;
        
        internal System.Windows.Controls.ContentControl PatientOverviewStatusContent;
        
        internal System.Windows.Controls.ContentControl PatientOverviewPreviewContent;
        
        internal System.Windows.Controls.ContentControl PatientOverviewTaskListContent;
        
        internal System.Windows.Controls.Button PatientDetailButton;
        
        internal IdentityMine.Avalon.Controls.Flipper3DTransition PatientOverview3D;
        
        internal IdentityMine.Avalon.Controls.Rotater3DTransition PatientDetailRotater3DTransition;
        
        internal System.Windows.Controls.GridSplitter GridSplitter;
        
        internal System.Windows.Controls.Grid PatientSearchResults;
        
        internal System.Windows.Controls.Grid Grid;
        
        internal System.Windows.Controls.Expander MSNExpander;
        
        internal System.Windows.Controls.ListBox PatientMSNSearchList;
        
        internal System.Windows.Controls.Expander LocalExpander;
        
        internal System.Windows.Controls.ListBox PatientLocalSearchList;
        
        internal System.Windows.Controls.Button PatientSearchCloseButton;
        
        internal System.Windows.Controls.TextBlock TextBlock;
        
        internal System.Windows.Controls.Grid SettingsDialog;
        
        internal System.Windows.Controls.Grid SettingsDialogRootGrid;
        
        internal System.Windows.Controls.TextBox ChartFramerateTextBox;
        
        internal System.Windows.Controls.Button SettingsDialogCloseButton;
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/Avalon Patient Monitoring;component/appwindow.xaml", System.UriKind.Relative);
            System.Windows.Application.LoadComponent(this, resourceLocater);
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.MainApplicationWindow = ((Avalon_Patient_Monitoring.AppWindow)(target));
            
            #line 15 "..\..\AppWindow.xaml"
            this.MainApplicationWindow.Loaded += new System.Windows.RoutedEventHandler(this.OnWindowLoaded);
            
            #line default
            #line hidden
            
            #line 15 "..\..\AppWindow.xaml"
            this.MainApplicationWindow.Initialized += new System.EventHandler(this.OnWindowInitialized);
            
            #line default
            #line hidden
            return;
            case 2:
            this.OSCheckerContentControl = ((System.Windows.Controls.ContentControl)(target));
            return;
            case 3:
            this.GlobalRoot = ((System.Windows.Controls.Grid)(target));
            return;
            case 4:
            this.Root = ((System.Windows.Controls.Grid)(target));
            return;
            case 5:
            this.Master3DColumnDefinition = ((System.Windows.Controls.ColumnDefinition)(target));
            return;
            case 6:
            this.MasterColumnDefinition = ((System.Windows.Controls.ColumnDefinition)(target));
            return;
            case 7:
            this.DetailColumnDefinition = ((System.Windows.Controls.ColumnDefinition)(target));
            return;
            case 8:
            this.Toolbar = ((System.Windows.Controls.Grid)(target));
            return;
            case 9:
            this.SearchBox = ((IdentityMine.Avalon.Controls.VistaTypeTextBox)(target));
            
            #line 68 "..\..\AppWindow.xaml"
            this.SearchBox.AddHandler(System.Windows.Controls.Primitives.ButtonBase.ClickEvent, new System.Windows.RoutedEventHandler(this.SearchTextBoxButtonClick));
            
            #line default
            #line hidden
            
            #line 68 "..\..\AppWindow.xaml"
            this.SearchBox.ReturnKeyUp += new IdentityMine.Avalon.Controls.VistaTypeTextBox.ReturnKeyUpEventHandler(this.ReturnKeyUpHandler);
            
            #line default
            #line hidden
            return;
            case 10:
            
            #line 74 "..\..\AppWindow.xaml"
            ((System.Windows.Controls.Button)(target)).Click += new System.Windows.RoutedEventHandler(this.ShowAboutIdentityMineDialog);
            
            #line default
            #line hidden
            return;
            case 11:
            this.Master = ((System.Windows.Controls.Grid)(target));
            return;
            case 12:
            this.MasterView2DWrapperFor3DSnap = ((System.Windows.Controls.Grid)(target));
            return;
            case 13:
            this.MasterView2DWrapperTranslate = ((System.Windows.Media.TranslateTransform)(target));
            return;
            case 14:
            this.MasterView2D = ((System.Windows.Controls.Grid)(target));
            return;
            case 15:
            this.WatchlistColumnDefinition = ((System.Windows.Controls.ColumnDefinition)(target));
            return;
            case 16:
            this.PatientRosterColumnDefinition = ((System.Windows.Controls.ColumnDefinition)(target));
            return;
            case 17:
            this.MasterBackgroundContent = ((System.Windows.Controls.ContentControl)(target));
            return;
            case 18:
            this.WatchListHeaderContent = ((System.Windows.Controls.ContentControl)(target));
            return;
            case 19:
            this.WatchList = ((System.Windows.Controls.ListBox)(target));
            return;
            case 20:
            this.PatientRosterListHeaderContent = ((System.Windows.Controls.ContentControl)(target));
            return;
            case 21:
            this.PatientRosterStyleSelectorContent = ((System.Windows.Controls.ContentControl)(target));
            return;
            case 22:
            this.PatientRosterList = ((System.Windows.Controls.ListBox)(target));
            
            #line 113 "..\..\AppWindow.xaml"
            this.PatientRosterList.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.OnPatientRosterSelectionChanged);
            
            #line default
            #line hidden
            return;
            case 23:
            this.PatientMasterRotater3DTransition = ((IdentityMine.Avalon.Controls.Rotater3DTransition)(target));
            return;
            case 24:
            this.PatientRosterList3DOverlay = ((System.Windows.Controls.ListBox)(target));
            
            #line 122 "..\..\AppWindow.xaml"
            this.PatientRosterList3DOverlay.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.OnPatientRoster3DOverlaySelectionChanged);
            
            #line default
            #line hidden
            return;
            case 25:
            this.Detail = ((System.Windows.Controls.Grid)(target));
            return;
            case 26:
            this.DetailBack2DWrapper = ((System.Windows.Controls.Grid)(target));
            return;
            case 27:
            this.DetailBack2DWrapperTranslate = ((System.Windows.Media.TranslateTransform)(target));
            return;
            case 28:
            this.DetailBack2D = ((System.Windows.Controls.Grid)(target));
            return;
            case 29:
            this.DetailBackgroundContent = ((System.Windows.Controls.ContentControl)(target));
            return;
            case 30:
            this.PatientDetails = ((System.Windows.Controls.Grid)(target));
            return;
            case 31:
            this.PatientDetailsBackgroundRectangle = ((System.Windows.Shapes.Rectangle)(target));
            return;
            case 32:
            this.PatientDetailHeaderContent = ((System.Windows.Controls.ContentControl)(target));
            return;
            case 33:
            this.PatientDetailSelectorContent = ((System.Windows.Controls.ContentControl)(target));
            return;
            case 34:
            this.PatientDetailLiveMonitorsContent = ((System.Windows.Controls.ContentControl)(target));
            return;
            case 35:
            this.PatientDetailWorkspaceContent = ((System.Windows.Controls.ContentControl)(target));
            return;
            case 36:
            this.PatientDetailDataGridContent = ((System.Windows.Controls.ContentControl)(target));
            return;
            case 37:
            this.BackToPatientOverview = ((System.Windows.Controls.Button)(target));
            
            #line 167 "..\..\AppWindow.xaml"
            this.BackToPatientOverview.Click += new System.Windows.RoutedEventHandler(this.OnBackToPatientOverview);
            
            #line default
            #line hidden
            return;
            case 38:
            this.MonitorWorkspaceSplitterVisualRectangle = ((System.Windows.Shapes.Rectangle)(target));
            return;
            case 39:
            this.MonitorWorkspaceSplitter = ((System.Windows.Controls.GridSplitter)(target));
            return;
            case 40:
            this.DetailFront2DWrapper = ((System.Windows.Controls.Grid)(target));
            return;
            case 41:
            this.DetailFront2DWrapperTranslate = ((System.Windows.Media.TranslateTransform)(target));
            return;
            case 42:
            this.DetailFront2D = ((System.Windows.Controls.Grid)(target));
            return;
            case 43:
            this.PatientOverview2D = ((System.Windows.Controls.Grid)(target));
            return;
            case 44:
            this.PatientOverviewHeaderBackgroundContent = ((System.Windows.Controls.ContentControl)(target));
            return;
            case 45:
            this.PatientOverviewHeaderContent = ((System.Windows.Controls.ContentControl)(target));
            return;
            case 46:
            this.PatientOverviewChartContent = ((System.Windows.Controls.ContentControl)(target));
            return;
            case 47:
            this.PatientOverviewStatusContent = ((System.Windows.Controls.ContentControl)(target));
            return;
            case 48:
            this.PatientOverviewPreviewContent = ((System.Windows.Controls.ContentControl)(target));
            return;
            case 49:
            this.PatientOverviewTaskListContent = ((System.Windows.Controls.ContentControl)(target));
            return;
            case 50:
            this.PatientDetailButton = ((System.Windows.Controls.Button)(target));
            
            #line 206 "..\..\AppWindow.xaml"
            this.PatientDetailButton.Click += new System.Windows.RoutedEventHandler(this.OnPatientDetailButton);
            
            #line default
            #line hidden
            return;
            case 51:
            this.PatientOverview3D = ((IdentityMine.Avalon.Controls.Flipper3DTransition)(target));
            
            #line 210 "..\..\AppWindow.xaml"
            this.PatientOverview3D.FlipCompleted += new IdentityMine.Avalon.Controls.Flipper3DTransition.SelectedEventHandler(this.PatientOverview3D_FlipCompleted);
            
            #line default
            #line hidden
            return;
            case 52:
            this.PatientDetailRotater3DTransition = ((IdentityMine.Avalon.Controls.Rotater3DTransition)(target));
            return;
            case 53:
            this.GridSplitter = ((System.Windows.Controls.GridSplitter)(target));
            return;
            case 54:
            this.PatientSearchResults = ((System.Windows.Controls.Grid)(target));
            return;
            case 55:
            this.Grid = ((System.Windows.Controls.Grid)(target));
            return;
            case 56:
            this.MSNExpander = ((System.Windows.Controls.Expander)(target));
            return;
            case 57:
            this.PatientMSNSearchList = ((System.Windows.Controls.ListBox)(target));
            
            #line 226 "..\..\AppWindow.xaml"
            this.PatientMSNSearchList.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.PatientMSNSearchList_SelectionChanged);
            
            #line default
            #line hidden
            return;
            case 58:
            this.LocalExpander = ((System.Windows.Controls.Expander)(target));
            return;
            case 59:
            this.PatientLocalSearchList = ((System.Windows.Controls.ListBox)(target));
            
            #line 229 "..\..\AppWindow.xaml"
            this.PatientLocalSearchList.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.PatientLocalSearchList_SelectionChanged);
            
            #line default
            #line hidden
            return;
            case 60:
            this.PatientSearchCloseButton = ((System.Windows.Controls.Button)(target));
            
            #line 232 "..\..\AppWindow.xaml"
            this.PatientSearchCloseButton.Click += new System.Windows.RoutedEventHandler(this.PatientSearchCloseButton_Click);
            
            #line default
            #line hidden
            return;
            case 61:
            this.TextBlock = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 62:
            this.SettingsDialog = ((System.Windows.Controls.Grid)(target));
            return;
            case 63:
            this.SettingsDialogRootGrid = ((System.Windows.Controls.Grid)(target));
            return;
            case 64:
            this.ChartFramerateTextBox = ((System.Windows.Controls.TextBox)(target));
            return;
            case 65:
            this.SettingsDialogCloseButton = ((System.Windows.Controls.Button)(target));
            
            #line 249 "..\..\AppWindow.xaml"
            this.SettingsDialogCloseButton.Click += new System.Windows.RoutedEventHandler(this.SettingsDialog_Click);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}
