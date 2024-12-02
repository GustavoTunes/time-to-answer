# Pin npm packages by running ./bin/importmap
pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"

# Bibliotecas externas (via CDN)
pin "jquery", to: "https://code.jquery.com/jquery-3.7.1.min.js"
pin "bootstrap", to: "https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
pin "@fortawesome/fontawesome-free", to: "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/js/all.min.js"
pin "chart.js", to: "https://cdn.jsdelivr.net/npm/chart.js@4.4.6/dist/chart.min.js"
pin "startbootstrap-sb-admin-2", to: "https://cdn.jsdelivr.net/npm/startbootstrap-sb-admin-2@4.0.2/dist/js/sb-admin-2.min.js"
pin "startbootstrap-sb-admin-2-css", to: "https://cdn.jsdelivr.net/npm/startbootstrap-sb-admin-2@4.0.2/dist/css/sb-admin-2.min.css"
pin "jquery-easing", to: "https://cdn.jsdelivr.net/npm/jquery.easing@3.1.1/jquery.easing.min.js"

