Dado("que eu acesso o site") do
  @home_page.go
end

Quando("eu adiciono um item ao carrinho e prossigo para o checkout") do
  @home_page.add_cart
  @helper.link_proceed_checkout
end

Quando("realizo o cadastro do cliente") do
  @helper.link_proceed_checkout
  @flow_purchease.insert_email
  @flow_purchease.fill_out_form @helper.address
end

Quando("aceito o termo e verifico se o valor está correto") do
  @helper.button_proceed_checkout
  find("#uniform-cgv").click
  @helper.button_proceed_checkout
  expect(@flow_purchease.valor_total).to eq(@flow_purchease.sum_value_correct)
end

Quando("escolho o método de pagamento e finalizo a compra") do
  @flow_purchease.payment_method
  @flow_purchease.button_confirm
end

Então("devo ver o produto {string} no carrinho e devo prosseguir") do |product|
  expect(@flow_purchease.summary).to eq(product)
  @helper.link_proceed_checkout
end

Então("devo ver se o endereço ficou correto") do
  expect(@flow_purchease.address_verification).to eq(@helper.address[:address])
  expect(@flow_purchease.address_city_verification).to eq("#{@helper.address[:city]}, #{@helper.address[:state]} #{@helper.address[:postcode]}")
  @helper.button_proceed_checkout
end

Então("devo ver {string}") do |message|
  expect(@flow_purchease.message_confirm).to eq(message.upcase)
end


