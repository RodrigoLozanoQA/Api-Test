Feature: Project Clean
  Scenario: como usuario quiero verificar el crud del project por api

    Given using token in todo.ly
    When send POST request "/api/projects.json" with body
    """
    {
      "Content":"Cucumber_TAREA_1",
      "Icon":1
    }
    """
    Then response code should be 200
    And the attribute "Content" should be "Cucumber_TAREA_1"
    And save "Id" in the variable "$ID_PROJECT"
    When send PUT request "/api/projects/$ID_PROJECT.json" with body
    """
    {
      "Content":"Cucumber_TAREA_2"
    }
    """
    Then response code should be 200
    And the attribute "Content" should be "Cucumber_TAREA_2"
    When send DELETE request "/api/projects/$ID_PROJECT.json" with body
    """
    """
    Then response code should be 200
    And the attribute "Content" should be "Cucumber_TAREA_2"