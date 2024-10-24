﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:2.0.50727.1426
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Linq;
using System.Data.Linq.Mapping;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;



[System.Data.Linq.Mapping.DatabaseAttribute(Name="MyDatabase")]
public partial class MyDatabaseDataContext : System.Data.Linq.DataContext
{
	
	private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
	
  #region Extensibility Method Definitions
  partial void OnCreated();
  partial void InsertMovie(Movie instance);
  partial void UpdateMovie(Movie instance);
  partial void DeleteMovie(Movie instance);
  partial void InsertMovieCategory(MovieCategory instance);
  partial void UpdateMovieCategory(MovieCategory instance);
  partial void DeleteMovieCategory(MovieCategory instance);
  #endregion
	
	public MyDatabaseDataContext() : 
			base(global::System.Configuration.ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString, mappingSource)
	{
		OnCreated();
	}
	
	public MyDatabaseDataContext(string connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public MyDatabaseDataContext(System.Data.IDbConnection connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public MyDatabaseDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public MyDatabaseDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public System.Data.Linq.Table<Movie> Movies
	{
		get
		{
			return this.GetTable<Movie>();
		}
	}
	
	public System.Data.Linq.Table<MovieCategory> MovieCategories
	{
		get
		{
			return this.GetTable<MovieCategory>();
		}
	}
}

[Table(Name="dbo.Movie")]
public partial class Movie : INotifyPropertyChanging, INotifyPropertyChanged
{
	
	private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
	
	private int _Id;
	
	private int _CategoryId;
	
	private string _Title;
	
	private string _Director;
	
	private System.DateTime _DateReleased;
	
	private bool _InTheaters;
	
	private decimal _BoxOfficeTotals;
	
	private string _Description;
	
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnIdChanging(int value);
    partial void OnIdChanged();
    partial void OnCategoryIdChanging(int value);
    partial void OnCategoryIdChanged();
    partial void OnTitleChanging(string value);
    partial void OnTitleChanged();
    partial void OnDirectorChanging(string value);
    partial void OnDirectorChanged();
    partial void OnDateReleasedChanging(System.DateTime value);
    partial void OnDateReleasedChanged();
    partial void OnInTheatersChanging(bool value);
    partial void OnInTheatersChanged();
    partial void OnBoxOfficeTotalsChanging(decimal value);
    partial void OnBoxOfficeTotalsChanged();
    partial void OnDescriptionChanging(string value);
    partial void OnDescriptionChanged();
    #endregion
	
	public Movie()
	{
		OnCreated();
	}
	
	[Column(Storage="_Id", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
	public int Id
	{
		get
		{
			return this._Id;
		}
		set
		{
			if ((this._Id != value))
			{
				this.OnIdChanging(value);
				this.SendPropertyChanging();
				this._Id = value;
				this.SendPropertyChanged("Id");
				this.OnIdChanged();
			}
		}
	}
	
	[Column(Storage="_CategoryId", DbType="Int NOT NULL")]
	public int CategoryId
	{
		get
		{
			return this._CategoryId;
		}
		set
		{
			if ((this._CategoryId != value))
			{
				this.OnCategoryIdChanging(value);
				this.SendPropertyChanging();
				this._CategoryId = value;
				this.SendPropertyChanged("CategoryId");
				this.OnCategoryIdChanged();
			}
		}
	}
	
	[Column(Storage="_Title", DbType="NVarChar(100) NOT NULL", CanBeNull=false)]
	public string Title
	{
		get
		{
			return this._Title;
		}
		set
		{
			if ((this._Title != value))
			{
				this.OnTitleChanging(value);
				this.SendPropertyChanging();
				this._Title = value;
				this.SendPropertyChanged("Title");
				this.OnTitleChanged();
			}
		}
	}
	
	[Column(Storage="_Director", DbType="NVarChar(100) NOT NULL", CanBeNull=false)]
	public string Director
	{
		get
		{
			return this._Director;
		}
		set
		{
			if ((this._Director != value))
			{
				this.OnDirectorChanging(value);
				this.SendPropertyChanging();
				this._Director = value;
				this.SendPropertyChanged("Director");
				this.OnDirectorChanged();
			}
		}
	}
	
	[Column(Storage="_DateReleased", DbType="DateTime NOT NULL")]
	public System.DateTime DateReleased
	{
		get
		{
			return this._DateReleased;
		}
		set
		{
			if ((this._DateReleased != value))
			{
				this.OnDateReleasedChanging(value);
				this.SendPropertyChanging();
				this._DateReleased = value;
				this.SendPropertyChanged("DateReleased");
				this.OnDateReleasedChanged();
			}
		}
	}
	
	[Column(Storage="_InTheaters", DbType="Bit NOT NULL")]
	public bool InTheaters
	{
		get
		{
			return this._InTheaters;
		}
		set
		{
			if ((this._InTheaters != value))
			{
				this.OnInTheatersChanging(value);
				this.SendPropertyChanging();
				this._InTheaters = value;
				this.SendPropertyChanged("InTheaters");
				this.OnInTheatersChanged();
			}
		}
	}
	
	[Column(Storage="_BoxOfficeTotals", DbType="Money NOT NULL")]
	public decimal BoxOfficeTotals
	{
		get
		{
			return this._BoxOfficeTotals;
		}
		set
		{
			if ((this._BoxOfficeTotals != value))
			{
				this.OnBoxOfficeTotalsChanging(value);
				this.SendPropertyChanging();
				this._BoxOfficeTotals = value;
				this.SendPropertyChanged("BoxOfficeTotals");
				this.OnBoxOfficeTotalsChanged();
			}
		}
	}
	
	[Column(Storage="_Description", DbType="NVarChar(MAX)")]
	public string Description
	{
		get
		{
			return this._Description;
		}
		set
		{
			if ((this._Description != value))
			{
				this.OnDescriptionChanging(value);
				this.SendPropertyChanging();
				this._Description = value;
				this.SendPropertyChanged("Description");
				this.OnDescriptionChanged();
			}
		}
	}
	
	public event PropertyChangingEventHandler PropertyChanging;
	
	public event PropertyChangedEventHandler PropertyChanged;
	
	protected virtual void SendPropertyChanging()
	{
		if ((this.PropertyChanging != null))
		{
			this.PropertyChanging(this, emptyChangingEventArgs);
		}
	}
	
	protected virtual void SendPropertyChanged(String propertyName)
	{
		if ((this.PropertyChanged != null))
		{
			this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
		}
	}
}

[Table(Name="dbo.MovieCategory")]
public partial class MovieCategory : INotifyPropertyChanging, INotifyPropertyChanged
{
	
	private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
	
	private int _Id;
	
	private string _Name;
	
	private int _Position;
	
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnIdChanging(int value);
    partial void OnIdChanged();
    partial void OnNameChanging(string value);
    partial void OnNameChanged();
    partial void OnPositionChanging(int value);
    partial void OnPositionChanged();
    #endregion
	
	public MovieCategory()
	{
		OnCreated();
	}
	
	[Column(Storage="_Id", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
	public int Id
	{
		get
		{
			return this._Id;
		}
		set
		{
			if ((this._Id != value))
			{
				this.OnIdChanging(value);
				this.SendPropertyChanging();
				this._Id = value;
				this.SendPropertyChanged("Id");
				this.OnIdChanged();
			}
		}
	}
	
	[Column(Storage="_Name", DbType="NVarChar(100) NOT NULL", CanBeNull=false)]
	public string Name
	{
		get
		{
			return this._Name;
		}
		set
		{
			if ((this._Name != value))
			{
				this.OnNameChanging(value);
				this.SendPropertyChanging();
				this._Name = value;
				this.SendPropertyChanged("Name");
				this.OnNameChanged();
			}
		}
	}
	
	[Column(Storage="_Position", DbType="Int NOT NULL")]
	public int Position
	{
		get
		{
			return this._Position;
		}
		set
		{
			if ((this._Position != value))
			{
				this.OnPositionChanging(value);
				this.SendPropertyChanging();
				this._Position = value;
				this.SendPropertyChanged("Position");
				this.OnPositionChanged();
			}
		}
	}
	
	public event PropertyChangingEventHandler PropertyChanging;
	
	public event PropertyChangedEventHandler PropertyChanged;
	
	protected virtual void SendPropertyChanging()
	{
		if ((this.PropertyChanging != null))
		{
			this.PropertyChanging(this, emptyChangingEventArgs);
		}
	}
	
	protected virtual void SendPropertyChanged(String propertyName)
	{
		if ((this.PropertyChanged != null))
		{
			this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
		}
	}
}
#pragma warning restore 1591
