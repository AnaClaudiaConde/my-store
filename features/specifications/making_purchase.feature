#language:pt

Funcionalidade: Realizando uma compra com sucesso
  Para que eu possa realizar uma compra 
  Sendo um cliente 
  Devo adicionar um item ao carrinho e criar uma conta

  @create_account
  Cenario: Criando conta do cliente no fluxo da compra

    Dado que eu acesso o site
    Quando eu adiciono um item ao carrinho e prossigo para o checkout
    E realizo o cadastro do cliente 
    Então devo ver se o endereço ficou correto

  @flow
  Cenario: Realizando a compra com sucesso
    Dado que eu acesso o site
    Quando eu adiciono um item ao carrinho e prossigo para o checkout
    E realizo o cadastro do cliente
    E aceito o termo e verifico se o valor está correto
    E escolho o método de pagamento e finalizo a compra
    Então devo ver "Order confirmation"
