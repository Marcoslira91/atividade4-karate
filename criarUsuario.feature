Feature: Criar usuário
    Como uma pessoa qualquer
    Desejo registrar informações de usuário
    Para poder manipular estas informações livremente

    Background: Base url Crud
        Given url baseUrlCrud
        And path "users"
        * def userName = "Marco Lira"
        * def userNameUpdate = "Marcos Lira"
        * def payload = {userName: "Marco Lira", firstName: "Marcos", lastName: "Lira", email: "marcoslira@email.com"}

    Scenario: Registra um novo usuário
        And request payload
        When method post
        Then status 201
        And match response contains { code: 201, name: "Marcos Lira", email: "marcoslira@email.com" }
        * def name = response.id
        * def newName = call read("hook.feature@deletar")

    Scenario: Registra um novo usuário com email inválido
        And request {name: "Marcos Lira", email: "marcosliraemail.com"}
        When method post
        Then status 400

    Scenario: Registra um novo usuário com email já existente
        And request {name: "Marcos Lira", email: "marcoslira@email.com"}
        When method post
        Then status 422
        And match response contains {error: "User already exists"}
                * def name = id.response.id
        * def newName = call read("hook.feature@deletar")
    
    Scenario: Cadastrar usuário com mais de 100 caracteres
        And request {name: "masdolerta55dyuismnd8peslu987wspçd4d7swimasdolerta55dyuismnd8peslu987wspçd4d7swiloaps2esucw7scyw8clfhapdmcy"}
        When method post
        Then status 500

    Scenario: Cadastrar email com mais de 60 caracteres
        And path "users"
        And request {email: "masdolerta55dyuismnd8peslu987wspçd4d7swimasdolerta55dyuismn8@email.com"}
        When method post
        Then status 500