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
[assembly: global::System.Data.Objects.DataClasses.EdmRelationshipAttribute("MapDiscolModel", "FK_Salary_Employees", "Employees", global::System.Data.Metadata.Edm.RelationshipMultiplicity.One, typeof(MapToDisColumn.Employee), "Salary", global::System.Data.Metadata.Edm.RelationshipMultiplicity.Many, typeof(MapToDisColumn.Salary))]

// Original file name:
// Generation date: 10/21/2008 11:00:01 PM
namespace MapToDisColumn
{
    
    /// <summary>
    /// There are no comments for InhMpDisColEntities in the schema.
    /// </summary>
    public partial class InhMpDisColEntities : global::System.Data.Objects.ObjectContext
    {
        /// <summary>
        /// Initializes a new InhMpDisColEntities object using the connection string found in the 'InhMpDisColEntities' section of the application configuration file.
        /// </summary>
        public InhMpDisColEntities() : 
                base("name=InhMpDisColEntities", "InhMpDisColEntities")
        {
            this.OnContextCreated();
        }
        /// <summary>
        /// Initialize a new InhMpDisColEntities object.
        /// </summary>
        public InhMpDisColEntities(string connectionString) : 
                base(connectionString, "InhMpDisColEntities")
        {
            this.OnContextCreated();
        }
        /// <summary>
        /// Initialize a new InhMpDisColEntities object.
        /// </summary>
        public InhMpDisColEntities(global::System.Data.EntityClient.EntityConnection connection) : 
                base(connection, "InhMpDisColEntities")
        {
            this.OnContextCreated();
        }
        partial void OnContextCreated();
        /// <summary>
        /// There are no comments for Employees in the schema.
        /// </summary>
        public global::System.Data.Objects.ObjectQuery<Employee> Employees
        {
            get
            {
                if ((this._Employees == null))
                {
                    this._Employees = base.CreateQuery<Employee>("[Employees]");
                }
                return this._Employees;
            }
        }
        private global::System.Data.Objects.ObjectQuery<Employee> _Employees;
        /// <summary>
        /// There are no comments for Salary in the schema.
        /// </summary>
        public global::System.Data.Objects.ObjectQuery<Salary> Salary
        {
            get
            {
                if ((this._Salary == null))
                {
                    this._Salary = base.CreateQuery<Salary>("[Salary]");
                }
                return this._Salary;
            }
        }
        private global::System.Data.Objects.ObjectQuery<Salary> _Salary;
        /// <summary>
        /// There are no comments for Employees in the schema.
        /// </summary>
        public void AddToEmployees(Employee employee)
        {
            base.AddObject("Employees", employee);
        }
        /// <summary>
        /// There are no comments for Salary in the schema.
        /// </summary>
        public void AddToSalary(Salary salary)
        {
            base.AddObject("Salary", salary);
        }
    }
    /// <summary>
    /// There are no comments for MapDiscolModel.Employee in the schema.
    /// </summary>
    /// <KeyProperties>
    /// EmployeeId
    /// </KeyProperties>
    [global::System.Data.Objects.DataClasses.EdmEntityTypeAttribute(NamespaceName="MapDiscolModel", Name="Employee")]
    [global::System.Runtime.Serialization.DataContractAttribute(IsReference=true)]
    [global::System.Serializable()]
    public partial class Employee : global::System.Data.Objects.DataClasses.EntityObject
    {
        /// <summary>
        /// Create a new Employee object.
        /// </summary>
        /// <param name="employeeId">Initial value of EmployeeId.</param>
        /// <param name="name">Initial value of Name.</param>
        public static Employee CreateEmployee(int employeeId, string name)
        {
            Employee employee = new Employee();
            employee.EmployeeId = employeeId;
            employee.Name = name;
            return employee;
        }
        /// <summary>
        /// There are no comments for Property EmployeeId in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(EntityKeyProperty=true, IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public int EmployeeId
        {
            get
            {
                return this._EmployeeId;
            }
            set
            {
                this.OnEmployeeIdChanging(value);
                this.ReportPropertyChanging("EmployeeId");
                this._EmployeeId = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value);
                this.ReportPropertyChanged("EmployeeId");
                this.OnEmployeeIdChanged();
            }
        }
        private int _EmployeeId;
        partial void OnEmployeeIdChanging(int value);
        partial void OnEmployeeIdChanged();
        /// <summary>
        /// There are no comments for Property Name in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public string Name
        {
            get
            {
                return this._Name;
            }
            set
            {
                this.OnNameChanging(value);
                this.ReportPropertyChanging("Name");
                this._Name = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, false);
                this.ReportPropertyChanged("Name");
                this.OnNameChanged();
            }
        }
        private string _Name;
        partial void OnNameChanging(string value);
        partial void OnNameChanged();
        /// <summary>
        /// There are no comments for Salaries in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmRelationshipNavigationPropertyAttribute("MapDiscolModel", "FK_Salary_Employees", "Salary")]
        [global::System.Xml.Serialization.XmlIgnoreAttribute()]
        [global::System.Xml.Serialization.SoapIgnoreAttribute()]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public global::System.Data.Objects.DataClasses.EntityCollection<Salary> Salaries
        {
            get
            {
                return ((global::System.Data.Objects.DataClasses.IEntityWithRelationships)(this)).RelationshipManager.GetRelatedCollection<Salary>("MapDiscolModel.FK_Salary_Employees", "Salary");
            }
            set
            {
                if ((value != null))
                {
                    ((global::System.Data.Objects.DataClasses.IEntityWithRelationships)(this)).RelationshipManager.InitializeRelatedCollection<Salary>("MapDiscolModel.FK_Salary_Employees", "Salary", value);
                }
            }
        }
    }
    /// <summary>
    /// There are no comments for MapDiscolModel.Salary in the schema.
    /// </summary>
    /// <KeyProperties>
    /// SalaryId
    /// </KeyProperties>
    [global::System.Data.Objects.DataClasses.EdmEntityTypeAttribute(NamespaceName="MapDiscolModel", Name="Salary")]
    [global::System.Runtime.Serialization.DataContractAttribute(IsReference=true)]
    [global::System.Serializable()]
    [global::System.Runtime.Serialization.KnownTypeAttribute(typeof(global::MapToDisColumn.CurrentSalary))]
    [global::System.Runtime.Serialization.KnownTypeAttribute(typeof(global::MapToDisColumn.HistoricalSalary))]
    public abstract partial class Salary : global::System.Data.Objects.DataClasses.EntityObject
    {
        /// <summary>
        /// There are no comments for Property SalaryId in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(EntityKeyProperty=true, IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public int SalaryId
        {
            get
            {
                return this._SalaryId;
            }
            set
            {
                this.OnSalaryIdChanging(value);
                this.ReportPropertyChanging("SalaryId");
                this._SalaryId = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value);
                this.ReportPropertyChanged("SalaryId");
                this.OnSalaryIdChanged();
            }
        }
        private int _SalaryId;
        partial void OnSalaryIdChanging(int value);
        partial void OnSalaryIdChanged();
        /// <summary>
        /// There are no comments for Property StartDate in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public global::System.DateTime StartDate
        {
            get
            {
                return this._StartDate;
            }
            set
            {
                this.OnStartDateChanging(value);
                this.ReportPropertyChanging("StartDate");
                this._StartDate = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value);
                this.ReportPropertyChanged("StartDate");
                this.OnStartDateChanged();
            }
        }
        private global::System.DateTime _StartDate;
        partial void OnStartDateChanging(global::System.DateTime value);
        partial void OnStartDateChanged();
        /// <summary>
        /// There are no comments for Property Income in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public int Income
        {
            get
            {
                return this._Income;
            }
            set
            {
                this.OnIncomeChanging(value);
                this.ReportPropertyChanging("Income");
                this._Income = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value);
                this.ReportPropertyChanged("Income");
                this.OnIncomeChanged();
            }
        }
        private int _Income;
        partial void OnIncomeChanging(int value);
        partial void OnIncomeChanged();
        /// <summary>
        /// There are no comments for Employees in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmRelationshipNavigationPropertyAttribute("MapDiscolModel", "FK_Salary_Employees", "Employees")]
        [global::System.Xml.Serialization.XmlIgnoreAttribute()]
        [global::System.Xml.Serialization.SoapIgnoreAttribute()]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public Employee Employees
        {
            get
            {
                return ((global::System.Data.Objects.DataClasses.IEntityWithRelationships)(this)).RelationshipManager.GetRelatedReference<Employee>("MapDiscolModel.FK_Salary_Employees", "Employees").Value;
            }
            set
            {
                ((global::System.Data.Objects.DataClasses.IEntityWithRelationships)(this)).RelationshipManager.GetRelatedReference<Employee>("MapDiscolModel.FK_Salary_Employees", "Employees").Value = value;
            }
        }
        /// <summary>
        /// There are no comments for Employees in the schema.
        /// </summary>
        [global::System.ComponentModel.BrowsableAttribute(false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public global::System.Data.Objects.DataClasses.EntityReference<Employee> EmployeesReference
        {
            get
            {
                return ((global::System.Data.Objects.DataClasses.IEntityWithRelationships)(this)).RelationshipManager.GetRelatedReference<Employee>("MapDiscolModel.FK_Salary_Employees", "Employees");
            }
            set
            {
                if ((value != null))
                {
                    ((global::System.Data.Objects.DataClasses.IEntityWithRelationships)(this)).RelationshipManager.InitializeRelatedReference<Employee>("MapDiscolModel.FK_Salary_Employees", "Employees", value);
                }
            }
        }
    }
    /// <summary>
    /// There are no comments for MapDiscolModel.CurrentSalary in the schema.
    /// </summary>
    /// <KeyProperties>
    /// SalaryId
    /// </KeyProperties>
    [global::System.Data.Objects.DataClasses.EdmEntityTypeAttribute(NamespaceName="MapDiscolModel", Name="CurrentSalary")]
    [global::System.Runtime.Serialization.DataContractAttribute(IsReference=true)]
    [global::System.Serializable()]
    public partial class CurrentSalary : Salary
    {
        /// <summary>
        /// Create a new CurrentSalary object.
        /// </summary>
        /// <param name="salaryId">Initial value of SalaryId.</param>
        /// <param name="startDate">Initial value of StartDate.</param>
        /// <param name="income">Initial value of Income.</param>
        public static CurrentSalary CreateCurrentSalary(int salaryId, global::System.DateTime startDate, int income)
        {
            CurrentSalary currentSalary = new CurrentSalary();
            currentSalary.SalaryId = salaryId;
            currentSalary.StartDate = startDate;
            currentSalary.Income = income;
            return currentSalary;
        }
    }
    /// <summary>
    /// There are no comments for MapDiscolModel.HistoricalSalary in the schema.
    /// </summary>
    /// <KeyProperties>
    /// SalaryId
    /// </KeyProperties>
    [global::System.Data.Objects.DataClasses.EdmEntityTypeAttribute(NamespaceName="MapDiscolModel", Name="HistoricalSalary")]
    [global::System.Runtime.Serialization.DataContractAttribute(IsReference=true)]
    [global::System.Serializable()]
    public partial class HistoricalSalary : Salary
    {
        /// <summary>
        /// Create a new HistoricalSalary object.
        /// </summary>
        /// <param name="salaryId">Initial value of SalaryId.</param>
        /// <param name="startDate">Initial value of StartDate.</param>
        /// <param name="income">Initial value of Income.</param>
        /// <param name="endDate">Initial value of EndDate.</param>
        public static HistoricalSalary CreateHistoricalSalary(int salaryId, global::System.DateTime startDate, int income, global::System.DateTime endDate)
        {
            HistoricalSalary historicalSalary = new HistoricalSalary();
            historicalSalary.SalaryId = salaryId;
            historicalSalary.StartDate = startDate;
            historicalSalary.Income = income;
            historicalSalary.EndDate = endDate;
            return historicalSalary;
        }
        /// <summary>
        /// There are no comments for Property EndDate in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public global::System.DateTime EndDate
        {
            get
            {
                return this._EndDate;
            }
            set
            {
                this.OnEndDateChanging(value);
                this.ReportPropertyChanging("EndDate");
                this._EndDate = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value);
                this.ReportPropertyChanged("EndDate");
                this.OnEndDateChanged();
            }
        }
        private global::System.DateTime _EndDate;
        partial void OnEndDateChanging(global::System.DateTime value);
        partial void OnEndDateChanged();
    }
}
