class ChangePhoneTypeInLeads < ActiveRecord::Migration[7.1]
  def change
    change_column :leads, :phone, :string
  end
end