class CreateInquiries < ActiveRecord::Migration
  def change
    create_table :inquiries do |t|
        # t.boolean :service
        # t.boolean :recruit
        # t.boolean :media

      t.timestamps null: false
    end
  end
end
