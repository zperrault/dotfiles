const Browsers = {
  FirefoxDeveloperEdition: "Firefox Developer Edition",
  Chrome: "Google Chrome",
  Safari: "Safari"
};

module.exports = {
  defaultBrowser: "Firefox Developer Edition",
  handlers: [
    {
      match: finicky.matchHostnames(["meet.google.com", "hangouts.google.com"]),
      browser: Browsers.Chrome
    }
  ]
};
