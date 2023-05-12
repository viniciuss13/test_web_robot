*** Settings ***
Library     SeleniumLibrary
Library     String
Resource    ../test_01_bdd_procedural_amazon\amazon_resources.robot


*** Variables ***
${ADD_CARRINHO}         //input[contains(@name,'submit.add-to-cart')]
${CLICK_CARRINHO}       //span[@aria-hidden='true'][contains(.,'Carrinho')]
${BTN_EXCLUIR}          //input[contains(@value,'Excluir')]
${VAZIO}                //h1[contains(.,'Seu carrinho de compras da Amazon está vazio.')]

*** Keywords ***
Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    Verificar o resultado da pesquisa, se está listando o produto "Console Xbox Series S"

Adicionar o produto "${PRODUTO}" no carrinho
    Wait Until Page Contains Element    locator=(//span[contains(.,'${PRODUTO}')])[2]
    Click Element    locator=(//span[contains(.,'${PRODUTO}')])[2]
    Wait Until Element Is Visible    ${ADD_CARRINHO}
    Click Element    ${ADD_CARRINHO}

 Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Wait Until Element Is Visible    ${CLICK_CARRINHO}
    Click Element    ${CLICK_CARRINHO}
    Wait Until Element Is Visible    locator=//span[@class='a-truncate-cut'][contains(.,'Console Xbox Series S')]


Remover o produto "Console Xbox Series S" do carrinho
    Wait Until Element Is Visible    ${BTN_EXCLUIR}
    Click Element    ${BTN_EXCLUIR}
Verificar se o carrinho fica vazio
    Should Be String    ${VAZIO} 

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br

Quando adicionar o produto "${PRODUTO}" no carrinho
    Adicionar o produto "Console Xbox Series S" no carrinho

Então o produto "Console Xbox Series S" deve ser mostrado no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

E existe o produto "Console Xbox Series S" no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

Quando remover o produto "Console Xbox Series S" do carrinho
    Remover o produto "Console Xbox Series S" do carrinho

Então o carrinho deve ficar vazio
    Verificar se o carrinho fica vazio

