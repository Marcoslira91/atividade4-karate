Feature: Listar usuário
    Como uma pessoa qualquer
    Desejo consultar todos os usuários cadastrados
    Para ter as informações de todos os usuários

    Scenario: Consultar usuários
        Given url baseUrlCrud
        And path "users"
        When method get
        Then status 200
        And match response == "#array"
        And match response contains {id: "#string", name: "#string", email: "#string", createdAt: "#string", updatedAt: "#string"}