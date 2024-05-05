class ChangePhoneColumnTypeInLeads < ActiveRecord::Migration[7.1]
  def up
    change_column :leads, :phone, :decimal
  end

  def down
    change_column :leads, :phone, :string
  end
end
