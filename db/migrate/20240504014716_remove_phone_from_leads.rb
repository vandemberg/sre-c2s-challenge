class RemovePhoneFromLeads < ActiveRecord::Migration[7.1]
  def change
    remove_column :leads, :phone, :decimal
  end
end
