module Spree
  class LineItemPersonalization < ActiveRecord::Base
    belongs_to :line_item
    belongs_to :product_personalization, class_name: "Spree::ProductPersonalization", foreign_key: "spree_product_personalization_id"
    belongs_to :option_value_product_personalization, class_name: "Spree::OptionValueProductPersonalization", foreign_key: "spree_option_value_product_personalization_id"

    validate :value_length

    before_validation { self.value = self.value.try(:strip) }

    COMPARISON_KEYS = [:name, :value, :price, :currency]

    def self.permitted_attributes
      [:name, :value, :option_value_id]
    end

    def match?(olp)
      return false if olp.blank?

      olp[:value] = olp[:value].strip if olp[:value]
      self.slice(*COMPARISON_KEYS) == olp.slice(*COMPARISON_KEYS)
    end

    def option_value_id
      @option_value_id
    end

    def option_value_id=(value)
      option_value = Spree::OptionValue.find_by(id: value)
      self.value = option_value.name
      @option_value_id = value

      ovpp = option_value.option_value_product_personalizations.find_by(option_value_id: value)
      self.spree_option_value_product_personalization_id = ovpp.try(:id)
    end

    def product_personalization_amount
      product_personalization.increase_price
    end

    def has_option_value_personalizations?
      !option_value_product_personalization.blank?
    end


    private

    def value_length
      if value.size < 1
        errors.add(:base, { name => Spree.t('errors.line_item_personalization_value_is_required', name: name) })
      elsif value.size > limit
        errors.add(:base, { name => Spree.t('errors.line_item_personalization_value_is_too_long', name: name, size: limit) })
      end
    end
  end
end
