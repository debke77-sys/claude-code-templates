const CACHE_NAAM = "zorgplanner-cache-v1";
const BESTANDEN = [
  "./",
  "./index.html",
  "./manifest.json",
  "./icons/icon-192.png",
  "./icons/icon-512.png",
];

self.addEventListener("install", (event) => {
  event.waitUntil(
    caches.open(CACHE_NAAM).then((cache) => cache.addAll(BESTANDEN)).then(() => self.skipWaiting())
  );
});

self.addEventListener("activate", (event) => {
  event.waitUntil(
    caches.keys().then((namen) =>
      Promise.all(namen.filter((n) => n !== CACHE_NAAM).map((n) => caches.delete(n)))
    ).then(() => self.clients.claim())
  );
});

self.addEventListener("fetch", (event) => {
  if (event.request.method !== "GET") return;
  event.respondWith(
    caches.match(event.request).then((gecached) => {
      const netwerkOphalen = fetch(event.request)
        .then((response) => {
          if (response && response.status === 200) {
            const kopie = response.clone();
            caches.open(CACHE_NAAM).then((cache) => cache.put(event.request, kopie));
          }
          return response;
        })
        .catch(() => gecached);
      return gecached || netwerkOphalen;
    })
  );
});
