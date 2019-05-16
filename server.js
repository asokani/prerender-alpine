const prerender = require("prerender");
const server = prerender({
  chromeFlags: [
    "--no-sandbox",
    "--headless",
    "--disable-gpu",
    "--remote-debugging-port=9222",
    "--hide-scrollbars"
  ],
  waitAfterLastRequest: 300,
  followRedirects: true,
  forwardHeaders: true,
  chromeLocation: "/usr/bin/chromium-browser"
  //chromeLocation: "/opt/google/chrome/chrome"
});

server.use(require("prerender-request-blacklist"));
server.use(prerender.blacklist());
server.use(prerender.httpHeaders());

server.start();
