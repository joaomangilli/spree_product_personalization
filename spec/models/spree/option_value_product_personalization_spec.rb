RSpec.describe Spree::OptionValueProductPersonalization do

  let(:product_personalization) { FactoryBot.create(:product_personalization_with_option_value) }
  let(:option_value_1) { product_personalization.option_values.first }
  let(:option_value_2) { product_personalization.option_values.second }
  let(:personalization) { Spree::OptionValueProductPersonalization.new(product_personalization: product_personalization, position: 1) }

  it 'returns the calculated price for the associated option value' do
    option_value_1.calculator.update(preferred_amount: 9.87)
    option_value_2.calculator.update(preferred_amount: 56.71)

    expect(personalization.product_personalization_amount).to eq(BigDecimal("9.87"))
    personalization.position = 2
    expect(personalization.product_personalization_amount).to eq(BigDecimal("56.71"))
  end
end
