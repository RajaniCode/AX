﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.IO;

namespace System.Web.Mvc.Html
{
    public static class DataGridHelper
    {
        public static string DataGrid<T>(this HtmlHelper helper)
        {
            return DataGrid<T>(helper, null, null);
        }

        public static string DataGrid<T>(this HtmlHelper helper, object data)
        {
            return DataGrid<T>(helper, data, null);
        }

        public static string DataGrid<T>(this HtmlHelper helper, object data, string[] columns)
        {
            //Get items
            var items = (IEnumerable<T>)data;
            if (items == null)
                items = (IEnumerable<T>)helper.ViewData.Model;

            //Get column names 
            if (columns == null)
                columns = typeof(T).GetProperties().Select(p => p.Name).ToArray();

            //Create HtmlTextWriter 
            var writer = new HtmlTextWriter(new StringWriter());

            //Open table tag 
            writer.RenderBeginTag(HtmlTextWriterTag.Table);

            //Render Table Header 
            writer.RenderBeginTag(HtmlTextWriterTag.Thead);
            RenderHeader(helper, writer, columns);
            writer.RenderEndTag();

            // Render table body 
            writer.RenderBeginTag(HtmlTextWriterTag.Tbody);
            foreach (var item in items)
                RenderRow<T>(helper, writer, columns, item);
            writer.RenderEndTag();

            //Close  table tag 
            writer.RenderEndTag();

            //return the string 
            return writer.InnerWriter.ToString();
        }

        private static void RenderHeader(HtmlHelper helper, HtmlTextWriter writer, string[] columns)
        {
            writer.RenderBeginTag(HtmlTextWriterTag.Tr);
            foreach (var columnName in columns)
            {
                writer.RenderBeginTag(HtmlTextWriterTag.Th);
                var currentAction = (string)helper.ViewContext.RouteData.Values["action"];
                var link = helper.ActionLink(columnName, currentAction, new { sort = columnName });
                writer.Write(link);
                writer.RenderEndTag();
            }
            writer.RenderEndTag();
        }

        public static void RenderRow<T>(HtmlHelper helper, HtmlTextWriter write, string[] columns, T item)
        {
            write.RenderBeginTag(HtmlTextWriterTag.Tr);
            foreach (var columnName in columns)
            {
                write.RenderBeginTag(HtmlTextWriterTag.Td);
                var value = typeof(T).GetProperty(columnName).GetValue(item, null) ?? String.Empty;
                write.Write(helper.Encode(value.ToString()));
                write.RenderEndTag();
            }
            write.RenderEndTag();
        }

    }
}
