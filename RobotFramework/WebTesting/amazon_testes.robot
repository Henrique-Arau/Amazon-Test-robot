*** Settings ***
Documentation    Essa suite testa o site da Amazon.com.br
Resource         amazon_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
caso de testes 01 - Acesso ao menu "Eletronicos"
    [Documentation]  esse teste verifica o menu eletronico do site da Amazon.com.br
    ...              e verifica a categoria Computadores e Informatica
    [Tags]           menus  categorias
    Acessar a home page do site Amazon.com.br
    Entrar no menu "Eletrônicos"
    Verificar se o titulo da pagina fica "Eletronicos e Tecnologia | Amazon.com.br"
    Verificar se aparece a frase "Eletronicos e Tecnologia"
    Verificar se aparece a categoria "Computadores e informatica"

caso de teste 02 - Pesquisa de um Produto
    [Documentation]  Esse teste verifica a busca de um poduto
    [Tags]           busca_produtos  lista_busca
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo Pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto pesquisado