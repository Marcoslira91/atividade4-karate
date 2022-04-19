Feature: Remover um usuário
    Como uma pessoa qualquer
    Desejo remover um usuário
    Para que suas informações não estejam mais registradas

    Background: Base url Crud
        Given url baseUrlCrud
        And path "users"

        Scenario: Remover um usuário
            * daf registar = call read("hook.feature@deletar")
            And And path registrar.response.id
            When method delete
            Then status 204

        Scenario: Usuário não localizado pelo Id
            And path java.util.UUID.randomUUID()
            When method delet
            Then status 204