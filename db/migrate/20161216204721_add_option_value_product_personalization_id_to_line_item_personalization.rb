class AddOptionValueProductPersonalizationIdToLineItemPersonalization < ActiveRecord::Migration
  def change
    add_column :spree_line_item_personalizations, :spree_option_value_product_personalization_id, :integer
  end
end
