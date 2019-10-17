#language:pt

Funcionalidade: Adicionar item ao carrinho
  Para que eu possa adicionar o item ao carrinho
  Sendo um cliente 

  @adicionar
  Cenario: Adicionando um item ao carrinho sendo um cliente não cadastrado

    Dado que eu acesso o site
    Quando eu adiciono um item ao carrinho e prossigo para o checkout
    Então devo ver o produto "Blouse" no carrinho e prosseguir
