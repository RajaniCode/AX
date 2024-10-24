﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ASPCS2010JSONSerializationDeserialization.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <h2>JSON Object Creation in JavaScript</h2>
    <p>
        Name: <span id="jname"></span>
        <br />
        Age: <span id="jage"></span>
        <br />
        Address: <span id="jstreet"></span>
        <br />
        Phone: <span id="jphone"></span>
        <br />
    </p>
    <script type="text/javascript">
        var JSONObject = {
            "name": "John Johnson",
            "street": "Oslo West 555",
            "age": 33,
            "phone": "555 1234567"
        };
        document.getElementById("jname").innerHTML = JSONObject.name;
        document.getElementById("jage").innerHTML = JSONObject.age;
        document.getElementById("jstreet").innerHTML = JSONObject.street;
        document.getElementById("jphone").innerHTML = JSONObject.phone;
    </script>
</body>
</html>
