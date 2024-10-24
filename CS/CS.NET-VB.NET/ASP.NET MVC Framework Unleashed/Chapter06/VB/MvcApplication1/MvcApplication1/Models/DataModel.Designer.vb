﻿'------------------------------------------------------------------------------
' <auto-generated>
'     This code was generated by a tool.
'     Runtime Version:2.0.50727.3053
'
'     Changes to this file may cause incorrect behavior and will be lost if
'     the code is regenerated.
' </auto-generated>
'------------------------------------------------------------------------------

Option Strict Off
Option Explicit On

<Assembly: Global.System.Data.Objects.DataClasses.EdmSchemaAttribute("1f7010cd-e856-4937-a614-1bc61efbe2a4")> 

'Original file name:
'Generation date: 2/27/2009 3:28:18 PM
'''<summary>
'''There are no comments for CustomersDBEntities in the schema.
'''</summary>
Partial Public Class CustomersDBEntities
    Inherits Global.System.Data.Objects.ObjectContext
    '''<summary>
    '''Initializes a new CustomersDBEntities object using the connection string found in the 'CustomersDBEntities' section of the application configuration file.
    '''</summary>
    Public Sub New()
        MyBase.New("name=CustomersDBEntities", "CustomersDBEntities")
        Me.OnContextCreated
    End Sub
    '''<summary>
    '''Initialize a new CustomersDBEntities object.
    '''</summary>
    Public Sub New(ByVal connectionString As String)
        MyBase.New(connectionString, "CustomersDBEntities")
        Me.OnContextCreated
    End Sub
    '''<summary>
    '''Initialize a new CustomersDBEntities object.
    '''</summary>
    Public Sub New(ByVal connection As Global.System.Data.EntityClient.EntityConnection)
        MyBase.New(connection, "CustomersDBEntities")
        Me.OnContextCreated
    End Sub
    Partial Private Sub OnContextCreated()
        End Sub
    '''<summary>
    '''There are no comments for CustomerSet in the schema.
    '''</summary>
    Public ReadOnly Property CustomerSet() As Global.System.Data.Objects.ObjectQuery(Of Customer)
        Get
            If (Me._CustomerSet Is Nothing) Then
                Me._CustomerSet = MyBase.CreateQuery(Of Customer)("[CustomerSet]")
            End If
            Return Me._CustomerSet
        End Get
    End Property
    Private _CustomerSet As Global.System.Data.Objects.ObjectQuery(Of Customer)
    '''<summary>
    '''There are no comments for CustomerSet in the schema.
    '''</summary>
    Public Sub AddToCustomerSet(ByVal customer As Customer)
        MyBase.AddObject("CustomerSet", customer)
    End Sub
End Class
'''<summary>
'''There are no comments for Models.Customer in the schema.
'''</summary>
'''<KeyProperties>
'''Id
'''</KeyProperties>
<Global.System.Data.Objects.DataClasses.EdmEntityTypeAttribute(NamespaceName:="Models", Name:="Customer"),  _
 Global.System.Runtime.Serialization.DataContractAttribute(IsReference:=true),  _
 Global.System.Serializable()>  _
Partial Public Class Customer
    Inherits Global.System.Data.Objects.DataClasses.EntityObject
    '''<summary>
    '''Create a new Customer object.
    '''</summary>
    '''<param name="id">Initial value of Id.</param>
    '''<param name="firstName">Initial value of FirstName.</param>
    '''<param name="lastName">Initial value of LastName.</param>
    '''<param name="receiveNewsletter">Initial value of ReceiveNewsletter.</param>
    Public Shared Function CreateCustomer(ByVal id As Integer, ByVal firstName As String, ByVal lastName As String, ByVal receiveNewsletter As Boolean) As Customer
        Dim customer As Customer = New Customer
        customer.Id = id
        customer.FirstName = firstName
        customer.LastName = lastName
        customer.ReceiveNewsletter = receiveNewsletter
        Return customer
    End Function
    '''<summary>
    '''There are no comments for Property Id in the schema.
    '''</summary>
    <Global.System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(EntityKeyProperty:=true, IsNullable:=false),  _
     Global.System.Runtime.Serialization.DataMemberAttribute()>  _
    Public Property Id() As Integer
        Get
            Return Me._Id
        End Get
        Set
            Me.OnIdChanging(value)
            Me.ReportPropertyChanging("Id")
            Me._Id = Global.System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value)
            Me.ReportPropertyChanged("Id")
            Me.OnIdChanged
        End Set
    End Property
    Private _Id As Integer
    Partial Private Sub OnIdChanging(ByVal value As Integer)
        End Sub
    Partial Private Sub OnIdChanged()
        End Sub
    '''<summary>
    '''There are no comments for Property FirstName in the schema.
    '''</summary>
    <Global.System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(IsNullable:=false),  _
     Global.System.Runtime.Serialization.DataMemberAttribute()>  _
    Public Property FirstName() As String
        Get
            Return Me._FirstName
        End Get
        Set
            Me.OnFirstNameChanging(value)
            Me.ReportPropertyChanging("FirstName")
            Me._FirstName = Global.System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, false)
            Me.ReportPropertyChanged("FirstName")
            Me.OnFirstNameChanged
        End Set
    End Property
    Private _FirstName As String
    Partial Private Sub OnFirstNameChanging(ByVal value As String)
        End Sub
    Partial Private Sub OnFirstNameChanged()
        End Sub
    '''<summary>
    '''There are no comments for Property LastName in the schema.
    '''</summary>
    <Global.System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(IsNullable:=false),  _
     Global.System.Runtime.Serialization.DataMemberAttribute()>  _
    Public Property LastName() As String
        Get
            Return Me._LastName
        End Get
        Set
            Me.OnLastNameChanging(value)
            Me.ReportPropertyChanging("LastName")
            Me._LastName = Global.System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, false)
            Me.ReportPropertyChanged("LastName")
            Me.OnLastNameChanged
        End Set
    End Property
    Private _LastName As String
    Partial Private Sub OnLastNameChanging(ByVal value As String)
        End Sub
    Partial Private Sub OnLastNameChanged()
        End Sub
    '''<summary>
    '''There are no comments for Property Profile in the schema.
    '''</summary>
    <Global.System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(),  _
     Global.System.Runtime.Serialization.DataMemberAttribute()>  _
    Public Property Profile() As String
        Get
            Return Me._Profile
        End Get
        Set
            Me.OnProfileChanging(value)
            Me.ReportPropertyChanging("Profile")
            Me._Profile = Global.System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, true)
            Me.ReportPropertyChanged("Profile")
            Me.OnProfileChanged
        End Set
    End Property
    Private _Profile As String
    Partial Private Sub OnProfileChanging(ByVal value As String)
        End Sub
    Partial Private Sub OnProfileChanged()
        End Sub
    '''<summary>
    '''There are no comments for Property ReceiveNewsletter in the schema.
    '''</summary>
    <Global.System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(IsNullable:=false),  _
     Global.System.Runtime.Serialization.DataMemberAttribute()>  _
    Public Property ReceiveNewsletter() As Boolean
        Get
            Return Me._ReceiveNewsletter
        End Get
        Set
            Me.OnReceiveNewsletterChanging(value)
            Me.ReportPropertyChanging("ReceiveNewsletter")
            Me._ReceiveNewsletter = Global.System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value)
            Me.ReportPropertyChanged("ReceiveNewsletter")
            Me.OnReceiveNewsletterChanged
        End Set
    End Property
    Private _ReceiveNewsletter As Boolean
    Partial Private Sub OnReceiveNewsletterChanging(ByVal value As Boolean)
        End Sub
    Partial Private Sub OnReceiveNewsletterChanged()
        End Sub
End Class
