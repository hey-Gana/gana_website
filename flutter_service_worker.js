'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "03452a80f5b93086037eca61b3d9cc33",
"version.json": "c0d742574535163fe3320ebd3d2a66dd",
"index.html": "b353777469e47ee7b9aa3dda115b954f",
"/": "b353777469e47ee7b9aa3dda115b954f",
"main.dart.js": "d5becf6154d5cfe562d3512be54ca0f1",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "2ed46a93954e935ee7763dc38fba36ec",
"assets/images/lost_pride.JPG": "a88b4565a17cd0abaffd1187b669ddcd",
"assets/images/ducks.JPG": "4dea45ccf5bdf8099ea767268f181a1a",
"assets/images/freedom_slavery.JPG": "a8d60fa1a304e785c4baae2e3684afc3",
"assets/images/bridge.JPG": "060404434349f0648c55c03ecb17fc71",
"assets/images/cracked_hope.JPG": "66653586db924efc9ed912c3bbc87809",
"assets/images/carpet_of_clouds.JPG": "5d10bb4ddb43de2b82217dbe7a10cb39",
"assets/images/setSail.JPG": "4b534ae30a2eaccf1578b2370e286908",
"assets/images/stairwaysToHeaven.JPG": "a87293dfa8e6244e869e666643a68598",
"assets/images/autoApplyLn.png": "f7011b07effca4f8ab9b03f9b1003dee",
"assets/images/sastra.png": "0ded88e3fd51280a019a2765110fb274",
"assets/images/camo.JPG": "451eebe9827b7d6a8e8f1c05f24f4560",
"assets/images/cottonCandyClouds.JPG": "10b39c083ecb6a4a7115eb96ee573416",
"assets/images/TacTics_homepage.png": "1b9846b2613e2a5b61236f1d1f99cc3a",
"assets/images/GS_HS.png": "5b31c2efb9a21e2799e74a0c9acb9558",
"assets/images/iit.png": "2592d652690c428c0fc157ce90147c13",
"assets/images/yt2.jpg": "c039ddfc68e14bb719ec408e936be78d",
"assets/images/peace.JPG": "9f80256bc82a40f5912f495615bc7728",
"assets/images/Splitabill.png": "140c00449f0ef9e2e369ba28381395a7",
"assets/images/for_peace.JPG": "a253524b1bcd499ee1c4b375a1a8c929",
"assets/images/yt1.jpg": "e8a1a39128f44c9938081f3beee6ba57",
"assets/resume/Ganapathi_Subramaniam_S_Resume.pdf": "686a936f0f8272859d16aed811c2600c",
"assets/AssetManifest.json": "485c7615cfca8d4a993555efea79dc8a",
"assets/NOTICES": "a573a286d37a9cd9d4a0219379b14cff",
"assets/FontManifest.json": "215db93efaba633c7761eb4934c87b98",
"assets/AssetManifest.bin.json": "82d1f32fbb5f8c913b2bbdb464b468a4",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "35bee3e2045e20a24bedbb6d6ee03a5b",
"assets/fonts/MaterialIcons-Regular.otf": "86fa6400c4def23933e4943d842ac5bb",
"assets/assets/fonts/Roboto_Mono/static/RobotoMono-Medium.ttf": "3ee049c7379fa0111fa60753076ed13e",
"assets/assets/fonts/Roboto_Mono/static/RobotoMono-Regular.ttf": "139479e8be03b8933573510aeed5036c",
"assets/assets/fonts/Roboto_Mono/static/RobotoMono-Light.ttf": "f21ea2ee1c7372ae821e3ab4f21dceb3",
"assets/assets/fonts/Roboto_Mono/static/RobotoMono-Bold.ttf": "4ad1f8bd28473f905ff5d8d9ee6e46c4",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
