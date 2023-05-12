*** Settings ***
Documentation
Resource    ./amazon_resource.robot
Resource    ../amazon_resources.robot
Test Setup    Abrir o navegador


*** Test Cases ***
Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    Dado que estou na home page da Amazon.com.br
    Quando adicionar o produto "Console Xbox Series S" no carrinho
    Então o produto "Console Xbox Series S" deve ser mostrado no carrinho
 
Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    Dado que estou na home page da Amazon.com.br
    E existe o produto "Console Xbox Series S" no carrinho
    Quando remover o produto "Console Xbox Series S" do carrinho
    Então o carrinho deve ficar vazio


