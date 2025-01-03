﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:2.0.50727.3053
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

[assembly: global::System.Data.Objects.DataClasses.EdmSchemaAttribute()]

// Original file name:
// Generation date: 10/27/2008 5:18:34 PM
namespace NorthWind.Business.EF.Inheritance
{
    
    /// <summary>
    /// There are no comments for TPHQVEntities in the schema.
    /// </summary>
    public partial class TPHQVEntities : global::System.Data.Objects.ObjectContext
    {
        /// <summary>
        /// Initializes a new TPHQVEntities object using the connection string found in the 'TPHQVEntities' section of the application configuration file.
        /// </summary>
        public TPHQVEntities() : 
                base("name=TPHQVEntities", "TPHQVEntities")
        {
            this.OnContextCreated();
        }
        /// <summary>
        /// Initialize a new TPHQVEntities object.
        /// </summary>
        public TPHQVEntities(string connectionString) : 
                base(connectionString, "TPHQVEntities")
        {
            this.OnContextCreated();
        }
        /// <summary>
        /// Initialize a new TPHQVEntities object.
        /// </summary>
        public TPHQVEntities(global::System.Data.EntityClient.EntityConnection connection) : 
                base(connection, "TPHQVEntities")
        {
            this.OnContextCreated();
        }
        partial void OnContextCreated();
        /// <summary>
        /// There are no comments for ContactInfos in the schema.
        /// </summary>
        public global::System.Data.Objects.ObjectQuery<ContactInfo> ContactInfos
        {
            get
            {
                if ((this._ContactInfos == null))
                {
                    this._ContactInfos = base.CreateQuery<ContactInfo>("[ContactInfos]");
                }
                return this._ContactInfos;
            }
        }
        private global::System.Data.Objects.ObjectQuery<ContactInfo> _ContactInfos;
        /// <summary>
        /// There are no comments for ContactInfos in the schema.
        /// </summary>
        public void AddToContactInfos(ContactInfo contactInfo)
        {
            base.AddObject("ContactInfos", contactInfo);
        }
    }
    /// <summary>
    /// There are no comments for TPHQVContactModel.ContactInfo in the schema.
    /// </summary>
    /// <KeyProperties>
    /// ContactInfoId
    /// </KeyProperties>
    [global::System.Data.Objects.DataClasses.EdmEntityTypeAttribute(NamespaceName="TPHQVContactModel", Name="ContactInfo")]
    [global::System.Runtime.Serialization.DataContractAttribute(IsReference=true)]
    [global::System.Serializable()]
    [global::System.Runtime.Serialization.KnownTypeAttribute(typeof(global::NorthWind.Business.EF.Inheritance.Phone))]
    [global::System.Runtime.Serialization.KnownTypeAttribute(typeof(global::NorthWind.Business.EF.Inheritance.EmailAddress))]
    public abstract partial class ContactInfo : global::System.Data.Objects.DataClasses.EntityObject
    {
        /// <summary>
        /// There are no comments for Property ContactInfoId in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(EntityKeyProperty=true, IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public int ContactInfoId
        {
            get
            {
                return this._ContactInfoId;
            }
            set
            {
                this.OnContactInfoIdChanging(value);
                this.ReportPropertyChanging("ContactInfoId");
                this._ContactInfoId = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value);
                this.ReportPropertyChanged("ContactInfoId");
                this.OnContactInfoIdChanged();
            }
        }
        private int _ContactInfoId;
        partial void OnContactInfoIdChanging(int value);
        partial void OnContactInfoIdChanged();
    }
    /// <summary>
    /// There are no comments for TPHQVContactModel.Phone in the schema.
    /// </summary>
    /// <KeyProperties>
    /// ContactInfoId
    /// </KeyProperties>
    [global::System.Data.Objects.DataClasses.EdmEntityTypeAttribute(NamespaceName="TPHQVContactModel", Name="Phone")]
    [global::System.Runtime.Serialization.DataContractAttribute(IsReference=true)]
    [global::System.Serializable()]
    [global::System.Runtime.Serialization.KnownTypeAttribute(typeof(global::NorthWind.Business.EF.Inheritance.HomePhone))]
    [global::System.Runtime.Serialization.KnownTypeAttribute(typeof(global::NorthWind.Business.EF.Inheritance.CellPhone))]
    public abstract partial class Phone : ContactInfo
    {
        /// <summary>
        /// There are no comments for Property PhoneNumber in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute()]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public string PhoneNumber
        {
            get
            {
                return this._PhoneNumber;
            }
            set
            {
                this.OnPhoneNumberChanging(value);
                this.ReportPropertyChanging("PhoneNumber");
                this._PhoneNumber = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, true);
                this.ReportPropertyChanged("PhoneNumber");
                this.OnPhoneNumberChanged();
            }
        }
        private string _PhoneNumber;
        partial void OnPhoneNumberChanging(string value);
        partial void OnPhoneNumberChanged();
    }
    /// <summary>
    /// There are no comments for TPHQVContactModel.EmailAddress in the schema.
    /// </summary>
    /// <KeyProperties>
    /// ContactInfoId
    /// </KeyProperties>
    [global::System.Data.Objects.DataClasses.EdmEntityTypeAttribute(NamespaceName="TPHQVContactModel", Name="EmailAddress")]
    [global::System.Runtime.Serialization.DataContractAttribute(IsReference=true)]
    [global::System.Serializable()]
    public partial class EmailAddress : ContactInfo
    {
        /// <summary>
        /// Create a new EmailAddress object.
        /// </summary>
        /// <param name="contactInfoId">Initial value of ContactInfoId.</param>
        public static EmailAddress CreateEmailAddress(int contactInfoId)
        {
            EmailAddress emailAddress = new EmailAddress();
            emailAddress.ContactInfoId = contactInfoId;
            return emailAddress;
        }
        /// <summary>
        /// There are no comments for Property Email in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute()]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public string Email
        {
            get
            {
                return this._Email;
            }
            set
            {
                this.OnEmailChanging(value);
                this.ReportPropertyChanging("Email");
                this._Email = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, true);
                this.ReportPropertyChanged("Email");
                this.OnEmailChanged();
            }
        }
        private string _Email;
        partial void OnEmailChanging(string value);
        partial void OnEmailChanged();
    }
    /// <summary>
    /// There are no comments for TPHQVContactModel.HomePhone in the schema.
    /// </summary>
    /// <KeyProperties>
    /// ContactInfoId
    /// </KeyProperties>
    [global::System.Data.Objects.DataClasses.EdmEntityTypeAttribute(NamespaceName="TPHQVContactModel", Name="HomePhone")]
    [global::System.Runtime.Serialization.DataContractAttribute(IsReference=true)]
    [global::System.Serializable()]
    public partial class HomePhone : Phone
    {
        /// <summary>
        /// Create a new HomePhone object.
        /// </summary>
        /// <param name="contactInfoId">Initial value of ContactInfoId.</param>
        public static HomePhone CreateHomePhone(int contactInfoId)
        {
            HomePhone homePhone = new HomePhone();
            homePhone.ContactInfoId = contactInfoId;
            return homePhone;
        }
    }
    /// <summary>
    /// There are no comments for TPHQVContactModel.CellPhone in the schema.
    /// </summary>
    /// <KeyProperties>
    /// ContactInfoId
    /// </KeyProperties>
    [global::System.Data.Objects.DataClasses.EdmEntityTypeAttribute(NamespaceName="TPHQVContactModel", Name="CellPhone")]
    [global::System.Runtime.Serialization.DataContractAttribute(IsReference=true)]
    [global::System.Serializable()]
    public partial class CellPhone : Phone
    {
        /// <summary>
        /// Create a new CellPhone object.
        /// </summary>
        /// <param name="contactInfoId">Initial value of ContactInfoId.</param>
        public static CellPhone CreateCellPhone(int contactInfoId)
        {
            CellPhone cellPhone = new CellPhone();
            cellPhone.ContactInfoId = contactInfoId;
            return cellPhone;
        }
    }
}
