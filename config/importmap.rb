# Pin npm packages by running ./bin/importmap
pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"

# Bibliotecas externas (via CDN)
pin "jquery", to: "https://code.jquery.com/jquery-3.6.0.min.js"
pin "bootstrap", to: "https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
pin "fontawesome", to: "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
pin "chart", to: "https://cdn.jsdelivr.net/npm/chart.js@3.0.0/dist/chart.min.js"
pin "jquery-easing", to: "https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"
pin "startbootstrap-sb-admin-2", to: "https://cdn.jsdelivr.net/npm/startbootstrap-sb-admin-2@4.1.4/js/sb-admin-2.min.js"
pin "bootstrap-growl", to: "https://cdn.jsdelivr.net/npm/bootstrap-growl-ifightcrime@1.1.0/jquery.bootstrap-growl.min.js"
