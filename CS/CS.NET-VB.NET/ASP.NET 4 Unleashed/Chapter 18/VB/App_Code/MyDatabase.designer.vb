﻿'------------------------------------------------------------------------------
' <auto-generated>
'     This code was generated by a tool.
'     Runtime Version:2.0.50727.1426
'
'     Changes to this file may cause incorrect behavior and will be lost if
'     the code is regenerated.
' </auto-generated>
'------------------------------------------------------------------------------

Option Strict On
Option Explicit On

Imports System
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.Data
Imports System.Data.Linq
Imports System.Data.Linq.Mapping
Imports System.Linq
Imports System.Linq.Expressions
Imports System.Reflection


<System.Data.Linq.Mapping.DatabaseAttribute(Name:="C:\DOCUMENTS AND SETTINGS\STEVE\MY DOCUMENTS\ASP.NET 3.5 UNLEASHED\CHAPTER16\CODE"& _ 
	"\VB\APP_DATA\MYDATABASE.MDF")>  _
Partial Public Class MyDatabaseDataContext
	Inherits System.Data.Linq.DataContext
	
	Private Shared mappingSource As System.Data.Linq.Mapping.MappingSource = New AttributeMappingSource
	
  #Region "Extensibility Method Definitions"
  Partial Private Sub OnCreated()
  End Sub
  Partial Private Sub InsertMovie(instance As Movie)
    End Sub
  Partial Private Sub UpdateMovie(instance As Movie)
    End Sub
  Partial Private Sub DeleteMovie(instance As Movie)
    End Sub
  #End Region
	
	Public Sub New()
		MyBase.New(Global.System.Configuration.ConfigurationManager.ConnectionStrings("MyDatabaseConnectionString").ConnectionString, mappingSource)
		OnCreated
	End Sub
	
	Public Sub New(ByVal connection As String)
		MyBase.New(connection, mappingSource)
		OnCreated
	End Sub
	
	Public Sub New(ByVal connection As System.Data.IDbConnection)
		MyBase.New(connection, mappingSource)
		OnCreated
	End Sub
	
	Public Sub New(ByVal connection As String, ByVal mappingSource As System.Data.Linq.Mapping.MappingSource)
		MyBase.New(connection, mappingSource)
		OnCreated
	End Sub
	
	Public Sub New(ByVal connection As System.Data.IDbConnection, ByVal mappingSource As System.Data.Linq.Mapping.MappingSource)
		MyBase.New(connection, mappingSource)
		OnCreated
	End Sub
	
	Public ReadOnly Property Movies() As System.Data.Linq.Table(Of Movie)
		Get
			Return Me.GetTable(Of Movie)
		End Get
	End Property
End Class

<Table(Name:="dbo.Movies")>  _
Partial Public Class Movie
	Implements System.ComponentModel.INotifyPropertyChanging, System.ComponentModel.INotifyPropertyChanged
	
	Private Shared emptyChangingEventArgs As PropertyChangingEventArgs = New PropertyChangingEventArgs(String.Empty)
	
	Private _Id As Integer
	
	Private _CategoryId As Integer
	
	Private _Title As String
	
	Private _Director As String
	
	Private _DateReleased As Date
	
	Private _InTheaters As Boolean
	
	Private _BoxOfficeTotals As Decimal
	
	Private _Description As String
	
    #Region "Extensibility Method Definitions"
    Partial Private Sub OnLoaded()
    End Sub
    Partial Private Sub OnValidate(action As System.Data.Linq.ChangeAction)
    End Sub
    Partial Private Sub OnCreated()
    End Sub
    Partial Private Sub OnIdChanging(value As Integer)
    End Sub
    Partial Private Sub OnIdChanged()
    End Sub
    Partial Private Sub OnCategoryIdChanging(value As Integer)
    End Sub
    Partial Private Sub OnCategoryIdChanged()
    End Sub
    Partial Private Sub OnTitleChanging(value As String)
    End Sub
    Partial Private Sub OnTitleChanged()
    End Sub
    Partial Private Sub OnDirectorChanging(value As String)
    End Sub
    Partial Private Sub OnDirectorChanged()
    End Sub
    Partial Private Sub OnDateReleasedChanging(value As Date)
    End Sub
    Partial Private Sub OnDateReleasedChanged()
    End Sub
    Partial Private Sub OnInTheatersChanging(value As Boolean)
    End Sub
    Partial Private Sub OnInTheatersChanged()
    End Sub
    Partial Private Sub OnBoxOfficeTotalsChanging(value As Decimal)
    End Sub
    Partial Private Sub OnBoxOfficeTotalsChanged()
    End Sub
    Partial Private Sub OnDescriptionChanging(value As String)
    End Sub
    Partial Private Sub OnDescriptionChanged()
    End Sub
    #End Region
	
	Public Sub New()
		MyBase.New
		OnCreated
	End Sub
	
	<Column(Storage:="_Id", AutoSync:=AutoSync.OnInsert, DbType:="Int NOT NULL IDENTITY", IsPrimaryKey:=true, IsDbGenerated:=true)>  _
	Public Property Id() As Integer
		Get
			Return Me._Id
		End Get
		Set
			If ((Me._Id = value)  _
						= false) Then
				Me.OnIdChanging(value)
				Me.SendPropertyChanging
				Me._Id = value
				Me.SendPropertyChanged("Id")
				Me.OnIdChanged
			End If
		End Set
	End Property
	
	<Column(Storage:="_CategoryId", DbType:="Int NOT NULL")>  _
	Public Property CategoryId() As Integer
		Get
			Return Me._CategoryId
		End Get
		Set
			If ((Me._CategoryId = value)  _
						= false) Then
				Me.OnCategoryIdChanging(value)
				Me.SendPropertyChanging
				Me._CategoryId = value
				Me.SendPropertyChanged("CategoryId")
				Me.OnCategoryIdChanged
			End If
		End Set
	End Property
	
	<Column(Storage:="_Title", DbType:="NVarChar(100) NOT NULL", CanBeNull:=false)>  _
	Public Property Title() As String
		Get
			Return Me._Title
		End Get
		Set
			If (String.Equals(Me._Title, value) = false) Then
				Me.OnTitleChanging(value)
				Me.SendPropertyChanging
				Me._Title = value
				Me.SendPropertyChanged("Title")
				Me.OnTitleChanged
			End If
		End Set
	End Property
	
	<Column(Storage:="_Director", DbType:="NVarChar(100) NOT NULL", CanBeNull:=false)>  _
	Public Property Director() As String
		Get
			Return Me._Director
		End Get
		Set
			If (String.Equals(Me._Director, value) = false) Then
				Me.OnDirectorChanging(value)
				Me.SendPropertyChanging
				Me._Director = value
				Me.SendPropertyChanged("Director")
				Me.OnDirectorChanged
			End If
		End Set
	End Property
	
	<Column(Storage:="_DateReleased", DbType:="DateTime NOT NULL")>  _
	Public Property DateReleased() As Date
		Get
			Return Me._DateReleased
		End Get
		Set
			If ((Me._DateReleased = value)  _
						= false) Then
				Me.OnDateReleasedChanging(value)
				Me.SendPropertyChanging
				Me._DateReleased = value
				Me.SendPropertyChanged("DateReleased")
				Me.OnDateReleasedChanged
			End If
		End Set
	End Property
	
	<Column(Storage:="_InTheaters", DbType:="Bit NOT NULL")>  _
	Public Property InTheaters() As Boolean
		Get
			Return Me._InTheaters
		End Get
		Set
			If ((Me._InTheaters = value)  _
						= false) Then
				Me.OnInTheatersChanging(value)
				Me.SendPropertyChanging
				Me._InTheaters = value
				Me.SendPropertyChanged("InTheaters")
				Me.OnInTheatersChanged
			End If
		End Set
	End Property
	
	<Column(Storage:="_BoxOfficeTotals", DbType:="Money NOT NULL")>  _
	Public Property BoxOfficeTotals() As Decimal
		Get
			Return Me._BoxOfficeTotals
		End Get
		Set
			If ((Me._BoxOfficeTotals = value)  _
						= false) Then
				Me.OnBoxOfficeTotalsChanging(value)
				Me.SendPropertyChanging
				Me._BoxOfficeTotals = value
				Me.SendPropertyChanged("BoxOfficeTotals")
				Me.OnBoxOfficeTotalsChanged
			End If
		End Set
	End Property
	
	<Column(Storage:="_Description", DbType:="NVarChar(MAX)")>  _
	Public Property Description() As String
		Get
			Return Me._Description
		End Get
		Set
			If (String.Equals(Me._Description, value) = false) Then
				Me.OnDescriptionChanging(value)
				Me.SendPropertyChanging
				Me._Description = value
				Me.SendPropertyChanged("Description")
				Me.OnDescriptionChanged
			End If
		End Set
	End Property
	
	Public Event PropertyChanging As PropertyChangingEventHandler Implements System.ComponentModel.INotifyPropertyChanging.PropertyChanging
	
	Public Event PropertyChanged As PropertyChangedEventHandler Implements System.ComponentModel.INotifyPropertyChanged.PropertyChanged
	
	Protected Overridable Sub SendPropertyChanging()
		If ((Me.PropertyChangingEvent Is Nothing)  _
					= false) Then
			RaiseEvent PropertyChanging(Me, emptyChangingEventArgs)
		End If
	End Sub
	
	Protected Overridable Sub SendPropertyChanged(ByVal propertyName As [String])
		If ((Me.PropertyChangedEvent Is Nothing)  _
					= false) Then
			RaiseEvent PropertyChanged(Me, New PropertyChangedEventArgs(propertyName))
		End If
	End Sub
End Class
