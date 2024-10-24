﻿using System.Web.Mvc;
using System.Web.Routing;

namespace Helpers
{
    public static class ImageLinkHelper
    {
        public static string ImageLink(this HtmlHelper helper, string actionName, string imageUrl, string alternateText)
        {
            return ImageLink(helper, actionName, imageUrl, alternateText, null, null, null);
        }
        
        public static string ImageLink(this HtmlHelper helper, string actionName, string imageUrl, string alternateText, object routeValues)
        {
            return ImageLink(helper, actionName, imageUrl, alternateText, routeValues, null, null);
        }

        public static string ImageLink(this HtmlHelper helper, string actionName, string imageUrl, string alternateText, object routeValues, object linkHtmlAttributes, object imageHtmlAttributes)
        {
            var urlHelper = new UrlHelper(helper.ViewContext.RequestContext);
            var url = urlHelper.Action(actionName, routeValues);

            // Create link
            var linkTagBuilder = new TagBuilder("a");
            linkTagBuilder.MergeAttribute("href", url);
            linkTagBuilder.MergeAttributes(new RouteValueDictionary(linkHtmlAttributes));

            // Create image
            var imageTagBuilder = new TagBuilder("img");
            imageTagBuilder.MergeAttribute("src", urlHelper.Content(imageUrl));
            imageTagBuilder.MergeAttribute("alt", urlHelper.Encode(alternateText));
            imageTagBuilder.MergeAttributes(new RouteValueDictionary(imageHtmlAttributes));

            // Add image to link
            linkTagBuilder.InnerHtml = imageTagBuilder.ToString(TagRenderMode.SelfClosing);

            return linkTagBuilder.ToString();
        }
    }
}
