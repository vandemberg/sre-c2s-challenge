class AddPhoneToLeads < ActiveRecord::Migration[7.1]
  def change
    add_column :leads, :phone, :string
  end
end
