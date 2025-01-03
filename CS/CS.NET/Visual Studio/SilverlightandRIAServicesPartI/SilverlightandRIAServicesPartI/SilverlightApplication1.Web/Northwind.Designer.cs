﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:2.0.50727.4918
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

[assembly: global::System.Data.Objects.DataClasses.EdmSchemaAttribute()]

// Original file name:
// Generation date: 8/9/2009 10:22:06 PM
namespace SilverlightApplication1.Web
{
    
    /// <summary>
    /// There are no comments for NorthwindEntities in the schema.
    /// </summary>
    public partial class NorthwindEntities : global::System.Data.Objects.ObjectContext
    {
        /// <summary>
        /// Initializes a new NorthwindEntities object using the connection string found in the 'NorthwindEntities' section of the application configuration file.
        /// </summary>
        public NorthwindEntities() : 
                base("name=NorthwindEntities", "NorthwindEntities")
        {
            this.OnContextCreated();
        }
        /// <summary>
        /// Initialize a new NorthwindEntities object.
        /// </summary>
        public NorthwindEntities(string connectionString) : 
                base(connectionString, "NorthwindEntities")
        {
            this.OnContextCreated();
        }
        /// <summary>
        /// Initialize a new NorthwindEntities object.
        /// </summary>
        public NorthwindEntities(global::System.Data.EntityClient.EntityConnection connection) : 
                base(connection, "NorthwindEntities")
        {
            this.OnContextCreated();
        }
        partial void OnContextCreated();
        /// <summary>
        /// There are no comments for Customers in the schema.
        /// </summary>
        public global::System.Data.Objects.ObjectQuery<Customer> Customers
        {
            get
            {
                if ((this._Customers == null))
                {
                    this._Customers = base.CreateQuery<Customer>("[Customers]");
                }
                return this._Customers;
            }
        }
        private global::System.Data.Objects.ObjectQuery<Customer> _Customers;
        /// <summary>
        /// There are no comments for Customers in the schema.
        /// </summary>
        public void AddToCustomers(Customer customer)
        {
            base.AddObject("Customers", customer);
        }
    }
    /// <summary>
    /// There are no comments for NorthwindModel.Customer in the schema.
    /// </summary>
    /// <KeyProperties>
    /// CustomerID
    /// </KeyProperties>
    [global::System.Data.Objects.DataClasses.EdmEntityTypeAttribute(NamespaceName="NorthwindModel", Name="Customer")]
    [global::System.Runtime.Serialization.DataContractAttribute(IsReference=true)]
    [global::System.Serializable()]
    public partial class Customer : global::System.Data.Objects.DataClasses.EntityObject
    {
        /// <summary>
        /// Create a new Customer object.
        /// </summary>
        /// <param name="customerID">Initial value of CustomerID.</param>
        /// <param name="companyName">Initial value of CompanyName.</param>
        public static Customer CreateCustomer(string customerID, string companyName)
        {
            Customer customer = new Customer();
            customer.CustomerID = customerID;
            customer.CompanyName = companyName;
            return customer;
        }
        /// <summary>
        /// There are no comments for Property CustomerID in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(EntityKeyProperty=true, IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public string CustomerID
        {
            get
            {
                return this._CustomerID;
            }
            set
            {
                this.OnCustomerIDChanging(value);
                this.ReportPropertyChanging("CustomerID");
                this._CustomerID = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, false);
                this.ReportPropertyChanged("CustomerID");
                this.OnCustomerIDChanged();
            }
        }
        private string _CustomerID;
        partial void OnCustomerIDChanging(string value);
        partial void OnCustomerIDChanged();
        /// <summary>
        /// There are no comments for Property CompanyName in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public string CompanyName
        {
            get
            {
                return this._CompanyName;
            }
            set
            {
                this.OnCompanyNameChanging(value);
                this.ReportPropertyChanging("CompanyName");
                this._CompanyName = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, false);
                this.ReportPropertyChanged("CompanyName");
                this.OnCompanyNameChanged();
            }
        }
        private string _CompanyName;
        partial void OnCompanyNameChanging(string value);
        partial void OnCompanyNameChanged();
        /// <summary>
        /// There are no comments for Property ContactName in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute()]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public string ContactName
        {
            get
            {
                return this._ContactName;
            }
            set
            {
                this.OnContactNameChanging(value);
                this.ReportPropertyChanging("ContactName");
                this._ContactName = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, true);
                this.ReportPropertyChanged("ContactName");
                this.OnContactNameChanged();
            }
        }
        private string _ContactName;
        partial void OnContactNameChanging(string value);
        partial void OnContactNameChanged();
        /// <summary>
        /// There are no comments for Property ContactTitle in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute()]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public string ContactTitle
        {
            get
            {
                return this._ContactTitle;
            }
            set
            {
                this.OnContactTitleChanging(value);
                this.ReportPropertyChanging("ContactTitle");
                this._ContactTitle = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, true);
                this.ReportPropertyChanged("ContactTitle");
                this.OnContactTitleChanged();
            }
        }
        private string _ContactTitle;
        partial void OnContactTitleChanging(string value);
        partial void OnContactTitleChanged();
        /// <summary>
        /// There are no comments for Property Address in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute()]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public string Address
        {
            get
            {
                return this._Address;
            }
            set
            {
                this.OnAddressChanging(value);
                this.ReportPropertyChanging("Address");
                this._Address = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, true);
                this.ReportPropertyChanged("Address");
                this.OnAddressChanged();
            }
        }
        private string _Address;
        partial void OnAddressChanging(string value);
        partial void OnAddressChanged();
        /// <summary>
        /// There are no comments for Property City in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute()]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public string City
        {
            get
            {
                return this._City;
            }
            set
            {
                this.OnCityChanging(value);
                this.ReportPropertyChanging("City");
                this._City = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, true);
                this.ReportPropertyChanged("City");
                this.OnCityChanged();
            }
        }
        private string _City;
        partial void OnCityChanging(string value);
        partial void OnCityChanged();
        /// <summary>
        /// There are no comments for Property Region in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute()]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public string Region
        {
            get
            {
                return this._Region;
            }
            set
            {
                this.OnRegionChanging(value);
                this.ReportPropertyChanging("Region");
                this._Region = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, true);
                this.ReportPropertyChanged("Region");
                this.OnRegionChanged();
            }
        }
        private string _Region;
        partial void OnRegionChanging(string value);
        partial void OnRegionChanged();
        /// <summary>
        /// There are no comments for Property PostalCode in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute()]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public string PostalCode
        {
            get
            {
                return this._PostalCode;
            }
            set
            {
                this.OnPostalCodeChanging(value);
                this.ReportPropertyChanging("PostalCode");
                this._PostalCode = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, true);
                this.ReportPropertyChanged("PostalCode");
                this.OnPostalCodeChanged();
            }
        }
        private string _PostalCode;
        partial void OnPostalCodeChanging(string value);
        partial void OnPostalCodeChanged();
        /// <summary>
        /// There are no comments for Property Country in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute()]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public string Country
        {
            get
            {
                return this._Country;
            }
            set
            {
                this.OnCountryChanging(value);
                this.ReportPropertyChanging("Country");
                this._Country = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, true);
                this.ReportPropertyChanged("Country");
                this.OnCountryChanged();
            }
        }
        private string _Country;
        partial void OnCountryChanging(string value);
        partial void OnCountryChanged();
        /// <summary>
        /// There are no comments for Property Phone in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute()]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public string Phone
        {
            get
            {
                return this._Phone;
            }
            set
            {
                this.OnPhoneChanging(value);
                this.ReportPropertyChanging("Phone");
                this._Phone = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, true);
                this.ReportPropertyChanged("Phone");
                this.OnPhoneChanged();
            }
        }
        private string _Phone;
        partial void OnPhoneChanging(string value);
        partial void OnPhoneChanged();
        /// <summary>
        /// There are no comments for Property Fax in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute()]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public string Fax
        {
            get
            {
                return this._Fax;
            }
            set
            {
                this.OnFaxChanging(value);
                this.ReportPropertyChanging("Fax");
                this._Fax = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, true);
                this.ReportPropertyChanged("Fax");
                this.OnFaxChanged();
            }
        }
        private string _Fax;
        partial void OnFaxChanging(string value);
        partial void OnFaxChanged();
    }
}
