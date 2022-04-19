Feature: Hook

    @novoUsuario
    Scenario: Registra um novo usuário
        * def payload = read("payloadUsers.json")
        Given url baseUrlCrud
        And path "users"
        And request payload
        When method post
        Then status 201