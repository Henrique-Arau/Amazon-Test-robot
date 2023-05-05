*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                 https://www.amazon.com.br
${MENU_ELETRONICOS}    //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}  //h1[contains(.,'Eletrônicos e Tecnologia')]
${TEXTO_HEADER_ELETRONICOS}    Eletrônicos e Tecnologia


*** Keywords ***

Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    url=${URL} 
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
    Click Element     locator=${MENU_ELETRONICOS}


Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Wait Until Page Contains  text=${TEXTO_HEADER_ELETRONICOS}
    Wait Until Element Is Visible     locator=${HEADER_ELETRONICOS}

Verificar se o titulo da pagina fica "${TITULO}"
    Title Should Be  title=${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible  locator=(//a[@aria-label='${NOME_CATEGORIA}'])[2]

Digitar o nome de produto "${PRODUTO}" no campo Pesquisa
    Input Text    locator=twotabsearchtextbox    text=${PRODUTO}

Clicar no botão de pesquisa
    Click Element     locator=nav-search-submit-button

Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=(//span[contains(.,'${PRODUTO}')])[3]


#GHERKIN STEPS

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    Verificar se o titulo da pagina fica "Amazon.com.br | Tudo pra você, de A a Z."

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"

Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
     Verificar se aparece a frase "Eletrônicos e Tecnologia"
E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se o titulo da pagina fica "Eletrônicos e Tecnologia | Amazon.com.br"
E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"


Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo Pesquisa
    Clicar no botão de pesquisa

E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa se está listando o produto "Xbox Series S"