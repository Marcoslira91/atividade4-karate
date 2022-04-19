Feature: Encontra usuário
    Como uma pessoa qualquer
    Desejo consultar os dados de um usuário
    Para visualizar as informações deste usuário

Background: Informe Url
    Given url baseUrlCrud
    And path "users"

Scenario: Localizar usuário por Id
    * def registrar = call real("hook.feature@novoUsuario")
    And path registrar.response.id
    When method get
    Then status 200
    And match response contains {id: "#(registrar.response.id)", name: "Marcos Lira", email: "marcoslira@email.com", createdAt: "#string", updatedAt: "#string"}
    * def userId = registar.response.id
    * def deletar = call read("hook.feature@novoUsuario")

Scenario: Id não localizado
    And path java.util.UUID.randomUUID()
    When method get
    Then status 404