package migrations

import (
	"github.com/pocketbase/dbx"
	m "github.com/pocketbase/pocketbase/migrations"
)

func init() {
	m.Register(func(db dbx.Builder) error {
		// add up queries...
		_, err := db.CreateUniqueIndex("userskill", "unique_userskill", "user", "skill").Execute()
		return err
	}, func(db dbx.Builder) error {
		// add down queries...
		_, err := db.DropIndex("userskill", "unique_userskill").Execute()
		return err
	})
}
