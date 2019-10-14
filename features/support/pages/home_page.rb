class HomePage
  include Capybara::DSL

  def go
    visit "http://automationpractice.com/index.php"
  end

  def add_cart
    find(".product-container", text: "Blouse").hover
    find(".ajax_add_to_cart_button").click
  end
end


