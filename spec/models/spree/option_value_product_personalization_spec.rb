require 'spec_helper'

describe Spree::OptionValueProductPersonalization do

  let(:product_personalization) { FactoryGirl.create(:product_personalization_with_option_value) }
  let(:option_value) { product_personalization.option_values.first }
  let(:personalization) { Spree::OptionValueProductPersonalization.new(product_personalization: product_personalization, position: 1) }

  it 'returns the calculated price for the associated option value' do
    option_value.calculator.update(preferred_amount: 9.87)
    expect(personalization.product_personalization_amount).to eq(BigDecimal("9.87"))
  end
end
