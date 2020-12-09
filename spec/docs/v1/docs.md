

# Group Projects


## Projects [/projects]


### Get projects [GET /api/v1/projects]


+ Request return user`s projects
**GET**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": [
                {
                  "id": "7951",
                  "type": "project",
                  "attributes": {
                    "title": "Danger Pickpocket"
                  },
                  "relationships": {
                    "user": {
                      "data": {
                        "id": "6615",
                        "type": "user"
                      }
                    }
                  }
                },
                {
                  "id": "7952",
                  "type": "project",
                  "attributes": {
                    "title": "Journey of the Cousins"
                  },
                  "relationships": {
                    "user": {
                      "data": {
                        "id": "6615",
                        "type": "user"
                      }
                    }
                  }
                },
                {
                  "id": "7953",
                  "type": "project",
                  "attributes": {
                    "title": "The World from Across the Ocean"
                  },
                  "relationships": {
                    "user": {
                      "data": {
                        "id": "6615",
                        "type": "user"
                      }
                    }
                  }
                }
              ]
            }
