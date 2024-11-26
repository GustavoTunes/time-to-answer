# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"

pin "jquery" # @3.7.1
pin "bootstrap" # @5.3.3
pin "@fortawesome/fontawesome-free", to: "@fortawesome--fontawesome-free.js" # @6.7.1
pin "chart.js" # @4.4.6
pin "@kurkle/color", to: "@kurkle--color.js" # @0.3.4
