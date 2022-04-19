Feature: Pesquisar usuário
    Como uma pessoa qualquer
    Desejo pesquisar usuário por nome ou e-mail
    Para ser capaz de encontrar um usuário cadastrado facilmente

    Scenario: Procurar usuário por nome
        * def registrar = call read("hook.feature@novoUsuario")
        And param value = "Marcos Lira"
        When method get
        Then status 200
        And match response == "#array"
        And match responde containes {id: "#string", name: "#string", email: "#string", createdAt: "#string", updatedAt: "#string"}
        And match responde containes {id: "#(registrar.response.id)", name: "#(registrar.response.name)", email: "#(registrar.response.email)", createdAt: "#(registrar.response.createdAt)", updatedAt: "#(registrar.response.updatedAt)"}
        * def usersId = registrar.response.id
        * def deletar = call read ("hook.feature@deletar")

    Scenario: Procurar usuário por e-mail
        * def registrar = call read("hook.feature@novoUsuario")
        And param value = "marcoslira@email.com"
        When method get
        Then status 200
        And match response == "#array"
        And match responde containes {id: "#string", name: "#string", email: "#string", createdAt: "#string", updatedAt: "#string"}
        And match responde containes {id: "#(registrar.response.id)", name: "#(registrar.response.name)", email: "#(registrar.response.email)", createdAt: "#(registrar.response.createdAt)", updatedAt: "#(registrar.response.updatedAt)"}
        * def usersId = registrar.response.id
        * def deletar = call read ("hook.feature@deletar")