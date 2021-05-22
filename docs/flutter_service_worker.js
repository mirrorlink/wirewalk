'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "cfb3127b219f5075b67a846697e93c42",
"assets/assets/dani.png": "a19b024b1af00c73e08dff6f757e520d",
"assets/assets/debugchicken.png": "18b28b20deeff9f29625bb06bd75e756",
"assets/assets/logo.svg": "021d4f0b0beabb24547c2c559f578334",
"assets/assets/main_char.png": "ec5893dc717617e3d4662d2db16a0141",
"assets/assets/minigame/images/websitesprites_01.png": "bdd8e5c63881ea73465aede91444ff8d",
"assets/assets/minigame/images/websitesprites_02.png": "2a03a7d814cd47d60bcfa394c70fb419",
"assets/assets/minigame/images/websitesprites_03.png": "b33bac375b63db5799d272189627b1d2",
"assets/assets/minigame/images/websitesprites_04.png": "64fb7d810ab78b2f22603d87e0ded478",
"assets/assets/minigame/images/websitesprites_05.png": "cf8e8f5e8b20d36a5d7dcde5db2217e3",
"assets/assets/minigame/images/websitesprites_06.png": "93b6d219ee620c4b631ff74d339c29d1",
"assets/assets/minigame/images/websitesprites_07.png": "16fc4ba1249d1fd46c34fd5958531217",
"assets/assets/minigame/images/websitesprites_08.png": "bc3fba724f537b7ed6f349d9995495ba",
"assets/assets/minigame/images/websitesprites_09.png": "6890774790614db63b0c5e61026004bd",
"assets/assets/minigame/images/websitesprites_10.png": "1a04833bd9bc2c1d50e94a2e038bacff",
"assets/assets/minigame/images/websitesprites_11.png": "0ef85a15d73d0f027ef6fba293eedacd",
"assets/assets/minigame/images/websitesprites_12.png": "c27164ed850971cbbf9882f83df5012c",
"assets/assets/minigame/images/websitesprites_13.png": "54c73e06702e306bb6c789a97ba271b2",
"assets/assets/minigame/images/websitesprites_14.png": "4ae67707ff1d29d22dda9a87fd638c04",
"assets/assets/minigame/images/websitesprites_15.png": "dd3d583f2dee98b10546a66be8a64853",
"assets/assets/minigame/images/websitesprites_16.png": "2d35bc2345b5750a6a1f155ca2187356",
"assets/assets/minigame/images/websitesprites_17.png": "43247eee2a5999b7f38194f9aaca0276",
"assets/assets/minigame/images/websitesprites_18.png": "c6029e2fc10ba57a4326a67b231e5a87",
"assets/assets/minigame/images/websitesprites_19.png": "45d62e32fa7d65d9e9915b728a1bd635",
"assets/assets/minigame/images/websitesprites_20.png": "7a0056fdc0e7bb3c664a08f044851031",
"assets/assets/minigame/images/websitesprites_21.png": "ef7645c161aa95673a2eea7861ee4b4a",
"assets/assets/minigame/images/websitesprites_22.png": "b55315c4d923c38cf3e9e752237879a5",
"assets/assets/minigame/images/websitesprites_23.png": "a2cd955f6c37161f3eef0020d9a41532",
"assets/assets/minigame/images/websitesprites_24.png": "2f85b2648814a6319030907dca8a5f19",
"assets/assets/minigame/images/websitesprites_25.png": "2aef44f7502f69059944502d2eac37f9",
"assets/assets/minigame/images/websitesprites_26.png": "177e860e2dfe402eaaab474a4e159cb5",
"assets/assets/minigame/images/websitesprites_27.png": "4bafb3133a77b341f9ccff747f88e751",
"assets/assets/minigame/images/websitesprites_28.png": "614376454f21cabd95349005c90a2e70",
"assets/assets/minigame/images/websitesprites_29.png": "934963521bc7d018d42b84f4ec89d912",
"assets/assets/minigame/images/websitesprites_30.png": "4ce85abbdc041a143888284f9adadeba",
"assets/assets/minigame/images/websitesprites_31.png": "61d6feae3ebc029bf7d815718a446e54",
"assets/assets/minigame/images/websitesprites_32.png": "f160c237bc60f3915f79f1836b68fde6",
"assets/assets/minigame/website_bar.png": "eb99520bba837b369b22fea2f75cd4af",
"assets/assets/minigame/website_outside.png": "7b302cc79cbc0fc1ec96be55232c1208",
"assets/assets/minigame/website_room.png": "31e1f75c5ceae348fcfc0567e6fdd546",
"assets/assets/ogimage.png": "fabbf65e1493387e662192235a1f2aca",
"assets/assets/PressKit.zip": "c5a1f3ced3513c5ba73bc1e330120214",
"assets/assets/steam.svg": "262c66033d489035a285be1ac29ed4f4",
"assets/FontManifest.json": "ea42279c51a3703180055bb6a829776b",
"assets/fonts/Hollowcraft.ttf": "b958a041d7fd73663174e67fda568660",
"assets/fonts/MaterialIcons-Regular.otf": "1288c9e28052e028aba623321f7826ac",
"assets/fonts/Minimal4.ttf": "e9ff1f07315fc1988e503060a858cf52",
"assets/fonts/monogram.ttf": "258eab896fa81a72b40c038a3d14268a",
"assets/fonts/RobotPC.ttf": "71112f21d4ad630ec9d2282bf58b4197",
"assets/NOTICES": "16047c270e81ef357b2845a4a0aae3d7",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/flutter_inappwebview/t_rex_runner/t-rex.css": "5a8d0222407e388155d7d1395a75d5b9",
"assets/packages/flutter_inappwebview/t_rex_runner/t-rex.html": "16911fcc170c8af1c5457940bd0bf055",
"favicon.png": "e743ca1035ae5d03bdad11dd5da8a752",
"icons/Icon-192.png": "5db454e745188cacc89b4731dba81552",
"icons/Icon-512.png": "c14b20101b3029e70e24a640a34ce885",
"index.html": "43ce95e9cdbc2f2718795c333f80b8b3",
"/": "43ce95e9cdbc2f2718795c333f80b8b3",
"main.dart.js": "4b7f0d605cbaf48ef324b6e66e4bf3e3",
"manifest.json": "5d9c00fba18bc5084fa70cb89413d60e",
"version.json": "494ba1fbbbdc56d8d64a1be4199896dc"
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
  self.skipWaiting();
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
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
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
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
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
  for (var resourceKey of Object.keys(RESOURCES)) {
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
