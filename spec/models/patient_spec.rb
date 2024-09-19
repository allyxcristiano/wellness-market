# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'when a product is added to the patient list' do
    let(:patient) { create(:patient, state:) }
    let(:category) { create(:category) }

    context 'when a product is allowed to be sold in this state' do
      let(:state) { create(:state) }

      context 'with a single product' do
        let(:product) { create(:product, category:) }

        before do
          create(:product_allowed_state, product:, state:)
        end

        it 'adds product to the patient list successfully' do
          patient.products << product
          expect(patient.products).to match([product])
        end
      end

      context 'with multiple products' do
        let(:products) { create_list(:product, 2, category:) }

        before do
          create(:product_allowed_state, product: products.first, state:)
          create(:product_allowed_state, product: products.second, state:)
        end

        it 'adds products to the patient list successfully' do
          patient.products << products
          expect(patient.products).to match(products)
        end
      end
    end

    context 'when a product is not allowed to be sold in this state' do
      let(:state) { create(:state) }

      context 'with a single product' do
        let(:product) { create(:product, category:) }

        it 'does not add the product to the patient list' do
          patient.products << product
          expect(patient.products).to be_empty
        end
      end

      context 'with multiple products' do
        let(:products) { create_list(:product, 2, category:) }

        it 'does not add the product to the patient list' do
          patient.products << products
          expect(patient.products).to be_empty
        end
      end
    end
  end
end
