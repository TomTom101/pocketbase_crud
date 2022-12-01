package migrations

import (
	"encoding/json"

	"github.com/pocketbase/dbx"
	"github.com/pocketbase/pocketbase/daos"
	m "github.com/pocketbase/pocketbase/migrations"
	"github.com/pocketbase/pocketbase/models"
)

// Auto generated migration with the most recent collections configuration.
func init() {
	m.Register(func(db dbx.Builder) error {
		jsonData := `[
			{
				"id": "_pb_users_auth_",
				"created": "2022-11-21 13:33:39.078Z",
				"updated": "2022-11-21 13:55:52.653Z",
				"name": "users",
				"type": "auth",
				"system": false,
				"schema": [
					{
						"system": false,
						"id": "users_name",
						"name": "name",
						"type": "text",
						"required": false,
						"unique": false,
						"options": {
							"min": null,
							"max": null,
							"pattern": ""
						}
					},
					{
						"system": false,
						"id": "users_avatar",
						"name": "avatar",
						"type": "file",
						"required": false,
						"unique": false,
						"options": {
							"maxSelect": 1,
							"maxSize": 5242880,
							"mimeTypes": [
								"image/jpg",
								"image/jpeg",
								"image/png",
								"image/svg+xml",
								"image/gif"
							],
							"thumbs": null
						}
					},
					{
						"system": false,
						"id": "izqicfd9",
						"name": "admin",
						"type": "bool",
						"required": false,
						"unique": false,
						"options": {}
					}
				],
				"listRule": "",
				"viewRule": "",
				"createRule": "",
				"updateRule": "id = @request.auth.id",
				"deleteRule": "id = @request.auth.id",
				"options": {
					"allowEmailAuth": true,
					"allowOAuth2Auth": true,
					"allowUsernameAuth": true,
					"exceptEmailDomains": null,
					"manageRule": null,
					"minPasswordLength": 8,
					"onlyEmailDomains": null,
					"requireEmail": false
				}
			},
			{
				"id": "6cecd8dalnuldag",
				"created": "2022-11-21 13:34:41.792Z",
				"updated": "2022-11-21 13:52:55.718Z",
				"name": "skills",
				"type": "base",
				"system": false,
				"schema": [
					{
						"system": false,
						"id": "gug4qx3u",
						"name": "name",
						"type": "text",
						"required": false,
						"unique": true,
						"options": {
							"min": null,
							"max": null,
							"pattern": ""
						}
					}
				],
				"listRule": "",
				"viewRule": "",
				"createRule": "",
				"updateRule": "",
				"deleteRule": null,
				"options": {}
			},
			{
				"id": "d574hoj745pf0td",
				"created": "2022-11-21 13:35:45.925Z",
				"updated": "2022-11-21 14:04:18.967Z",
				"name": "userskill",
				"type": "base",
				"system": false,
				"schema": [
					{
						"system": false,
						"id": "1bv0atxo",
						"name": "user",
						"type": "relation",
						"required": false,
						"unique": false,
						"options": {
							"maxSelect": 1,
							"collectionId": "_pb_users_auth_",
							"cascadeDelete": false
						}
					},
					{
						"system": false,
						"id": "vpsqgtne",
						"name": "skill",
						"type": "relation",
						"required": false,
						"unique": false,
						"options": {
							"maxSelect": 1,
							"collectionId": "6cecd8dalnuldag",
							"cascadeDelete": true
						}
					},
					{
						"system": false,
						"id": "hiort7cu",
						"name": "level",
						"type": "number",
						"required": false,
						"unique": false,
						"options": {
							"min": 0,
							"max": 10
						}
					}
				],
				"listRule": "",
				"viewRule": "",
				"createRule": "",
				"updateRule": "",
				"deleteRule": "user.id = @request.auth.id",
				"options": {}
			}
		]`

		collections := []*models.Collection{}
		if err := json.Unmarshal([]byte(jsonData), &collections); err != nil {
			return err
		}

		return daos.New(db).ImportCollections(collections, true, nil)
	}, func(db dbx.Builder) error {
		// no revert since the configuration on the environment, on which
		// the migration was executed, could have changed via the UI/API
		return nil
	})
}
