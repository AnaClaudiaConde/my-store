class FlowPurchease
  include Capybara::DSL

  def summary
    sleep(1)
    find(".product-name").text 
  end

  def insert_email
    generated_email = Faker::Internet.email
    find("#email_create").set generated_email
    click_button "Create an account"
  end

  def fill_out_form(address)
    choose "Mr."
    find("#customer_firstname").set "Jose Eduardo"
    find("#customer_lastname").set "Santos Pereira"
    find("#passwd").set "teste123"
    find("#days option[value='12']").select_option
    find("#months option[value='9']").select_option
    find("#years option[value='1994']").select_option
    find("#company").set "Teste"
    find("#address1").set address[:address]
    find("#city").set address[:city]
    find("#id_state option[value='2']").select_option
    find("#postcode").set address[:postcode]
    find("#phone_mobile").set "119922333343"
    click_button "Register"
  end

  def address_verification
    all(:css, ".address_address2")[0].text
  end

  def address_city_verification
    all(:css, ".address_city")[0].text
  end

  def valor_total
    find("#total_price").text
  end

  def sum_value_correct
    products = find("#total_product").text
    product_as_number = products[1..-1].to_f.round(3)
    
    shipping = find("#total_shipping").text
    shipping_as_number = shipping[1..-1].to_f.round(2)

    total = product_as_number + shipping_as_number
    total_with_precision = sprintf "%.2f", total
    total_formated = "$#{total_with_precision}"
  end

  def payment_method
    click_link "Pay by bank wire"
  end

  def button_confirm
    click_button "I confirm my order"
  end

  def message_confirm
    find(".page-heading").text
  end

end
