@setupApplicationTest
Feature: dc / components /acl filter: Acl Filter
  In order to find the acl token I'm looking for easier
  As a user
  I should be able to filter by type and freetext search tokens by name and token
  Scenario: Filtering [Model]
    Given 1 datacenter model with the value "dc-1"
    And 2 [Model] models
    When I visit the [Page] page for yaml
    ---
      dc: dc-1
    ---
    Then the url should be [Url]

    Then I see 2 [Model] models
    And I see allIsSelected on the filter

    When I click management on the filter
    Then I see managementIsSelected on the filter
    And I see 1 [Model] model

    When I click client on the filter
    Then I see clientIsSelected on the filter
    And I see 1 [Model] model

    When I click all on the filter
    Then I see allIsSelected on the filter
    Then I type with yaml
    ---
    s: Anonymous Token
    ---
    And I see 1 [Model] model with the name "Anonymous Token"
    Then the url should be [Url]?filter=Anonymous%20Token
    Then I type with yaml
    ---
    s: Master|Anonymous
    ---
    And I see 2 [Model] models
    Then the url should be [Url]?filter=Master%7CAnonymous
    Then I type with yaml
    ---
    s: secret
    ---
    And I see 1 [Model] model with the name "Master Token"
    Then the url should be [Url]?filter=secret

  Where:
    -------------------------------------------------
    | Model   | Page     | Url                       |
    | acl     | acls     | /dc-1/acls                |
    -------------------------------------------------