class Helper
  include Capybara::DSL

  def link_proceed_checkout
    click_link "Proceed to checkout"
  end

  def button_proceed_checkout
    click_button "Proceed to checkout"
  end

  def address
    Hash[
      address: "Sol",
      city: "Barueri",
      state: "Alaska",
      postcode: "00000"
    ]
  end
end
