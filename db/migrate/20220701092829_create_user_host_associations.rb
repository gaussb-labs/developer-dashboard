class CreateUserHostAssociations < ActiveRecord::Migration[7.0]
  def change
    create_table :user_host_associations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :host, null: false, foreign_key: true

      t.timestamps
    end
  end
end
