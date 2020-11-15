## Models

Display models defined in `_data/models.json`.


### Usage

1. Create file: `_data/models.json`

```json
[
  {
    "name": "identity",
    "db_name": "identities",
    "desc": "AWS Cognito identities",
    "fields": [
      {
        "name": "id",
        "type": "uuid"
      },
      {
        "name": "provider_id",
        "type": "string"
      },
      {
        "name": "provider_type",
        "type": "string"
      },
      {
        "name": "user_id",
        "type": "uuid"
      }
    ],
    "relations": [
      {
        "resource": "user",
        "type": "belongs_to"
      }
    ]
  },
  {
    "name": "location",
    "db_name": "locations",
    "desc": "Location model",
    "fields": [
      {
        "name": "id",
        "type": "uuid"
      },
      {
        "name": "city",
        "type": "string"
      },
      {
        "name": "address",
        "type": "string"
      },
      {
        "name": "number_of_rooms",
        "type": "integer"
      }
    ],
    "relations": [
      {
        "resource": "user",
        "type": "has_many_and_belongs_to_many"
      }
    ]
  },
  {
    "name": "user",
    "db_name": "users",
    "desc": "User model",
    "fields": [
      {
        "name": "id",
        "type": "uuid"
      },
      {
        "name": "name",
        "type": "string"
      },
      {
        "name": "email",
        "type": "string"
      },
      {
        "name": "phone",
        "type": "string"
      },
      {
        "name": "address",
        "type": "string"
      }
    ],
    "relations": [
      {
        "resource": "location",
        "type": "has_many_and_belongs_to_many"
      },
      {
        "resource": "identity",
        "type": "has_many"
      }
    ]
  }
]

```



2. Import include:

```md
{% include models/_models_list.html models=site.data.models %}
```


### Properties

TODO: Explain fields and options from `models.json`.
