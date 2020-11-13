'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "07fb6992d5780af4adcbb792e828b150",
"assets/assets/images/background.png": "2683b0bb1e0292f60e66a57ea9dc18d5",
"assets/assets/images/background_gameplay.png": "20cdd94056fa9f3dbfac3cacf240e3e2",
"assets/assets/images/background_historia.png": "697013c0f7ed98cc0a536e26ae2879eb",
"assets/assets/images/bard.png": "3f7a26f09b5388c3fd6d273080cb84b4",
"assets/assets/images/bard2.png": "cd71fc8761871a0d826d742fcd5c4bf4",
"assets/assets/images/bard3.png": "cac2be8553650c95a2b11194660e23a1",
"assets/assets/images/bard_teacher.png": "616b55aa4d841d755f7097b39b259858",
"assets/assets/images/casa_ionia.png": "1a7faa4c58b04b84a4633fcd3ffea716",
"assets/assets/images/clave_sol.png": "c192286ec1bd6a24a35206f2c366ef87",
"assets/assets/images/do_clave_sol.png": "4dac2c67b1b0e79f83d098fc3d4eb2a7",
"assets/assets/images/do_sustenido_clave_sol.png": "355631e63f1110b922b5ca100bd96381",
"assets/assets/images/fa_clave_sol.png": "7812c23e022949b0b7eb3dedcc3e3920",
"assets/assets/images/fa_sustenido_clave_sol.png": "400869a5b6c99aabf13d07347a4ffbf6",
"assets/assets/images/inimigo.png": "0e5adf85282573e49350c51c212e6e8e",
"assets/assets/images/jogador.png": "fdd846f59bf1c3884247dcdf4ce6a165",
"assets/assets/images/la_bemol_clave_sol.png": "68c8f5ecece84c2cca89a7c1a02e8227",
"assets/assets/images/la_clave_sol.png": "8c30a2e176f947a56c49e8938e5933c5",
"assets/assets/images/la_sustenido_clave_sol.png": "c1a093224a27ae83e472bf6f6bf2e6ad",
"assets/assets/images/mi_bemol_clave_sol.png": "79d0906d4febbcc337724bc5517a4cdd",
"assets/assets/images/mi_clave_sol.png": "caed6e8da7848059f747c63c870bd4e1",
"assets/assets/images/re_bemol_clave_sol.png": "941ba43f76284a8e58b5d200053e2e3f",
"assets/assets/images/re_clave_sol.png": "236d037b0f1a57d08e387116fe13c011",
"assets/assets/images/re_sustenido_clave_sol.png": "f4454f3ebc4cf30600b191053b2399d8",
"assets/assets/images/simbolo_nota_partitura.png": "2673c249a11c38c710c08e7199dfe779",
"assets/assets/images/si_bemol_clave_sol.png": "0315662afea99b5e2e965ce4e0eef4c7",
"assets/assets/images/si_clave_sol.png": "f1d7c0cad2ca6e988dcd4eddbda9e9f7",
"assets/assets/images/sol_bemol_clave_sol.png": "97e6a279f31036ce847fbd1e38ffba64",
"assets/assets/images/sol_clave_sol.png": "c2fd145e370af72ade6c79828a3f4fea",
"assets/assets/images/sol_sustenido_clave_sol.png": "dadabe6aabd468c37edd39ded55e01dd",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "1288c9e28052e028aba623321f7826ac",
"assets/NOTICES": "5a44cd0193037e7e6144d6c4c656c575",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "f0473620200840b834c7189f64476b01",
"/": "f0473620200840b834c7189f64476b01",
"main.dart.js": "8851907cb4dc5b4f1b42037311223495",
"manifest.json": "24c1b9fc2c87afe3649aef33a8eab29e"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value + '?revision=' + RESOURCES[value], {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list, skip the cache.
  if (!RESOURCES[key]) {
    return event.respondWith(fetch(event.request));
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    return self.skipWaiting();
  }
  if (event.message === 'downloadOffline') {
    downloadOffline();
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey in Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
