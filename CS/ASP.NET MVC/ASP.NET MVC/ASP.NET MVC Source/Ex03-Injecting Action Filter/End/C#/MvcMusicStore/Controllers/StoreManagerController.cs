﻿// ----------------------------------------------------------------------------------
// Microsoft Developer & Platform Evangelism
// 
// Copyright (c) Microsoft Corporation. All rights reserved.
// 
// THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, 
// EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES 
// OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE.
// ----------------------------------------------------------------------------------
// The example companies, organizations, products, domain names,
// e-mail addresses, logos, people, places, and events depicted
// herein are fictitious.  No association with any real company,
// organization, product, domain name, email address, logo, person,
// places, or events is intended or should be inferred.
// ----------------------------------------------------------------------------------

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using MvcMusicStore.Models;
using MvcMusicStore.ViewModels;

namespace MvcMusicStore.Controllers
{
    public class StoreManagerController : Controller
    {
        MusicStoreEntities storeDB = new MusicStoreEntities();

        //
        // GET: /StoreManager/

        public ActionResult Index()
        {
            var albums = storeDB.Albums
                .Include("Genre").Include("Artist")
                .ToList();

            return View(albums);
        }

        public ActionResult Index2()
        {
            var albums = storeDB.Albums
                .Include("Genre").Include("Artist")
                .ToList();

            return View(albums);
        }

        //
        // GET: /StoreManager/Create

        public ActionResult Create()
        {
            var viewModel = new StoreManagerViewModel()
            {
                Album = new Album(),
                Genres = new SelectList(storeDB.Genres.ToList(), "GenreId", "Name"),
                Artists = new SelectList(storeDB.Artists.ToList(), "ArtistId", "Name")
            };
            
            return View(viewModel);
        } 

        //
        // POST: /StoreManager/Create

        [HttpPost]
        public ActionResult Create(Album album)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    // Save Album
                    storeDB.AddToAlbums(album);
                    storeDB.SaveChanges();

                    return Redirect("Index");
                }
            }
            catch (Exception ex)
            {
                ModelState.AddModelError(String.Empty, ex);
            }

            // Invalid - redisplay with errors

            var viewModel = new StoreManagerViewModel()
            {
                Album = album,
                Genres = new SelectList(storeDB.Genres.ToList(), "GenreId", "Name", album.GenreId),
                Artists = new SelectList(storeDB.Artists.ToList(), "ArtistId", "Name", album.ArtistId)
            };

            return View(viewModel);
        }
        
        //
        // GET: /StoreManager/Edit/5
 
        public ActionResult Edit(int id)
        {
            Album album = storeDB.Albums.Single(a => a.AlbumId == id);

            var viewModel = new StoreManagerViewModel()
            {
                Album = album,
                Genres = new SelectList(storeDB.Genres.ToList(), "GenreId", "Name", album.GenreId),
                Artists = new SelectList(storeDB.Artists.ToList(), "ArtistId", "Name", album.ArtistId)
            };

            return View(viewModel);
        }

        //
        // POST: /StoreManager/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            var album = storeDB.Albums.Single(a => a.AlbumId == id);

            try
            {
                // Save Album

                UpdateModel(album, "Album");
                storeDB.SaveChanges();
 
                return RedirectToAction("Index");
            }
            catch
            {
                // Error ocurred - so redisplay the form

                var viewModel = new StoreManagerViewModel()
                {
                    Album = album,
                    Genres = new SelectList(storeDB.Genres.ToList(), "GenreId", "Name", album.GenreId),
                    Artists = new SelectList(storeDB.Artists.ToList(), "ArtistId", "Name", album.ArtistId)
                };

                return View(viewModel);
            }
        }

        //
        // GET: /StoreManager/Delete/5
 
        public ActionResult Delete(int id)
        {
            var album = storeDB.Albums.Single(a => a.AlbumId == id);

            return View(album);
        }

        //
        // POST: /StoreManager/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            var album = storeDB.Albums
                .Include("OrderDetails").Include("Carts")
                .Single(a => a.AlbumId == id);

            storeDB.DeleteObject(album);
            storeDB.SaveChanges();

            return RedirectToAction("Index");

        }
    }
}
