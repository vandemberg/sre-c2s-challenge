class CreateLeads < ActiveRecord::Migration[7.1]
  def change
    create_table :leads do |t|
      t.string :name
      t.string :email
      t.decimal :phone

      t.timestamps
    end
  end
end
