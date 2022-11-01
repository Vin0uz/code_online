module CodeOnline
  class Client
    HOMEPAGE_URL = "https://codeonline.fr/dashboard/list".freeze
    LOGIN_URL = "https://codeonline.fr/login".freeze

    def initialize(email:, password:)
      @browser = Watir::Browser.new

      login(email: email, password: password)
    end

    def create_ean(product_name:, weight:)
      browser.button(id: "button-basic").click
      browser.link(visible_text: "Créer un GTIN").click

      browser.radio(visible_text: "de votre propre marque").select
      browser.button(visible_text: "J'ai compris").click

      browser.span(visible_text: "Équipements de Marquage Sportif").click
      browser.text_field(id: "brand").set("Grinta")
      browser.text_field(id: "product-name-item-value-0").set(product_name)
      browser.text_field(id: "net-content-item-input-0").set(weight)
      browser.select(class: "net-content-item-unit").select("Gramme")
      browser.button(visible_text: "Suivant").click
      browser.button(visible_text: "Terminer et afficher la fiche produit").click

      browser.span(class: "gtixnValue").text
    end

    private

    attr_reader :browser

    def login(email:, password:)
      browser.goto(HOMEPAGE_URL)

      if browser.url == LOGIN_URL
        browser.button(visible_text: "Se connecter").click
        browser.text_field(id: "Email").set(email)
        browser.button(id: "connexion_button").click

        browser.wait_until { |b| b.text_field(id: "password-field").exists? }
        browser.text_field(id: "password-field").set(password)
        browser.button(id: "SubmitPassword").click
        browser.wait_until { |b| b.url == HOMEPAGE_URL }
      end

      if browser.url != HOMEPAGE_URL
        raise "Connexion to CodeOnline didn't go well!"
      end
    end
  end
end