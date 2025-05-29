'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "d23060d45516660ea93c232c7b5ecbf4",
"assets/AssetManifest.bin.json": "b68badf0276552db16bf9f04ca12da08",
"assets/AssetManifest.json": "cc3a5dbecdc95dbacd39a3fcf0ba9a9d",
"assets/assets/animations/cloud.json": "c7608114d21eff6bfd4328c8cb41dbf8",
"assets/assets/animations/coding_vibes.json": "e12a5e6adb412564b6d16707ebd311fe",
"assets/assets/animations/Man_coding.json": "ba58e5d73e0255ac0368d3b41ccf74b8",
"assets/assets/animations/man_vibing.json": "f96825fc6894cb8d18ffe88dde841dd2",
"assets/assets/animations/superhero.json": "dc2ba8fc8cd3fc27f7d4073b90c327da",
"assets/assets/fonts/Kalam-Bold.ttf": "c753b7274d6a2dab75f5c44b8e5c7b25",
"assets/assets/fonts/Kalam-Light.ttf": "4c79496352e7ef6dc4956f60ce095408",
"assets/assets/fonts/Kalam-Regular.ttf": "b3d0cb8286497ecfe76846476495927c",
"assets/assets/images/dash1.png": "2d7e887ddcde4b97b9955719b64aec5f",
"assets/assets/images/profile.jpg": "c16cc404ac2bd64200328b084c04c59b",
"assets/assets/project1/1.png": "f14453bead8a35567a074e66d561258e",
"assets/assets/project1/2.png": "673e102adde3b2c377d026c705f2fac8",
"assets/assets/project1/3.png": "f8f86aa073c5d190f7105f9266e6e4fb",
"assets/assets/project1/4.png": "4e34b33772fbb304b83346d554f5e039",
"assets/assets/project1/5.png": "c4abda709b8dd0dd3f550441d1c904e9",
"assets/assets/project1/6.png": "4a213d31fff1f5c275e6a6c3933bfd49",
"assets/assets/project2/1.png": "5ce3e903d053eb1e697e2bf0b8d3f122",
"assets/assets/project2/2.png": "49a6be7946483f25ca7f303a8984f622",
"assets/assets/project2/3.png": "adcb597cf704b3503769dd25f39e97c4",
"assets/assets/project2/4.png": "2f4fc6e28f1d79ce1cf5e9026355831d",
"assets/assets/project2/5.png": "3c354c6142183de53542908dcd661322",
"assets/assets/project2/6.png": "bf6ace4f440d3011fb40a05e4a790045",
"assets/assets/skills/api_icon.webp": "55bd5c3461205456b6914e559afa89ac",
"assets/assets/skills/dart_icon.png": "586ecc41d871afc1f3833c33c53294e4",
"assets/assets/skills/firebase_icon.png": "fe3e92c78eeac3337cd158cb7f351b7a",
"assets/assets/skills/flutter_icon.png": "3b527b0f7559f4bb0786fe84bee20e68",
"assets/assets/skills/git_hub.webp": "ea76ba6c2785210d491fff489a090fe9",
"assets/assets/skills/Git_icon.png": "a3902258c74abde2841881ced754e409",
"assets/assets/skills/hive_icon.jpg": "062773f714d14a6b7e5ad3e85f564bc0",
"assets/assets/skills/Lottie_icon.png": "9fb11cd617145a449393d5fcabf16cb1",
"assets/assets/skills/strapi_icon.webp": "e7b755eebe93d442c63d418f3d737468",
"assets/assets/social_media_icons/githubicon.png": "6b1e87cc7c75235d74bdef524e11cd29",
"assets/assets/social_media_icons/linkedin1.png": "d2db96c69a2b08a4361c5a94c1ac4abd",
"assets/assets/social_media_icons/linkedin2.png": "fd3b4c1c821b9060c47a0f85bf8bf141",
"assets/assets/social_media_icons/linkedinicon.png": "7403399e4afb4dddfc00f911359837dd",
"assets/assets/social_media_icons/upwork.png": "78fe4f78663fd94ab0dd1a30be70e4d5",
"assets/assets/social_media_icons/x.png": "dc14bf8657854c461a858844f8d04009",
"assets/assets/social_media_icons/x1.png": "127e754c3c1ecb6de2dc007a42ac4650",
"assets/assets/svg/background.svg": "a06aafcf2416be9bedebe662e017150d",
"assets/assets/svg/blurry-gradient-haikei.svg": "2485a7468d9634b538bb98c52a5545a6",
"assets/assets/svg/layered-steps-haikei.svg": "037b2c1c152169616b89427450cabdf8",
"assets/assets/svg/undraw_dev-productivity_5wps.svg": "bf0ec7039fbd9c5875810783a56e9771",
"assets/assets/svg/undraw_developer-avatar_f6ac.svg": "975423c67ecedbfe2f97c8277a791954",
"assets/assets/svg/undraw_easter-bunny_1v4n.svg": "87de9fcbc30fbae3bedf0ca11039c3db",
"assets/assets/svg/undraw_golden-gate-bridge_1c6x.svg": "5cec45683a6ad46b9848fce13628efce",
"assets/assets/svg/undraw_quiet-street_v45k.svg": "ac8e156d76aac92440a8561a08ee6fce",
"assets/assets/svg/undraw_space-exploration_dhu1.svg": "7274eeeb35465565bb7bf0337b961ae8",
"assets/assets/svg/undraw_to-the-moon_w1wa.svg": "f75f6030be7bd622ece8fb249412c29a",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "49eba0b49faa2d9db62caff7b1b84ade",
"assets/NOTICES": "9ec24ea26c84b88c1684740d655ab2eb",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "825e75415ebd366b740bb49659d7a5c6",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "27361387bc24144b46a745f1afe92b50",
"canvaskit/canvaskit.wasm": "a37f2b0af4995714de856e21e882325c",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "f7c5e5502d577306fb6d530b1864ff86",
"canvaskit/chromium/canvaskit.wasm": "c054c2c892172308ca5a0bd1d7a7754b",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "9fe690d47b904d72c7d020bd303adf16",
"canvaskit/skwasm.wasm": "1c93738510f202d9ff44d36a4760126b",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "695e731eba459fc7eb3f2355833d3651",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "4205686a4f4b72ef068f6fcea7ff7139",
"/": "4205686a4f4b72ef068f6fcea7ff7139",
"main.dart.js": "ec360b7c57352270ff674d68e01174c1",
"manifest.json": "6d3145996bc27cc3b26bebaf0344f8ec",
"version.json": "7f80e2b628dbf5066bfca9ee5b1e20bb"};
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
