Feature: Atualizar usuário
    Como uma pessoa qualquer
    Desejo atualizar as informações de determinado usuário
    Para ter o registro de suas informações atualizadas

Background: Base url Crud
    Given url baseUrlCrud
    * def email = java.util.UUID.randomUUID() + "@email.com";

    * def payloadUpdate = { name: "Marcos Lira", email: "#(email)" }
    * def payload = { name: "Marcos", email: "#(email)" }
    Given request payload
    When method post
    Then status 201
    * def userId = response.id

Scenario: Atualizar usuário cadastrado
    Given path userId
    And request payloadUpdate
    When method put
    Then status 200
    And match response contains payloadUpdate

Scenario: Atualizar usuário por id não existente
    When method put
    Then status 404

Scenario: Atualizar usuário com email invalido
    And request {name: "Marcos", email: "#(email)" }
    When method put
    Then status 400

Scenario: Atualizar usuário com mesmo email
    And request {name: "Marcos", email: "#(email)" }
    When method put
    Then status 422
    And matc response contains {error: "E-mail already in use"}
