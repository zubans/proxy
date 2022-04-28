class CreateConnections < ActiveRecord::Migration[7.0]
  def change
    create_table :connections do |t|
      t.string :address
      t.integer :port
      t.integer :bad_connections
      t.string :status

      t.timestamps
    end
  end
end
