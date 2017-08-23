class RemoveVendorFromConsultants < ActiveRecord::Migration[5.1]
  def change
    remove_reference :consultants, :vendor
  end
end
