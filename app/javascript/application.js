// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import { Turbo } from "@hotwired/turbo-rails";
import "controllers";

import "jquery";
import "jquery-easing";
import "bootstrap";
import "fontawesome";
import "chart";
import "startbootstrap-sb-admin-2";
import "bootstrap-growl";
import "cocoon"

// Disable prefetch

document.addEventListener("turbo:before-fetch-request", (event) => {
  if (event.detail.fetchOptions.headers["Turbo-Prefetch"]) {
    event.preventDefault();
  }
});

// Disable turbo drive

Turbo.session.drive = false;
