require 'spec_helper'

describe WaterfieldUtils::AutoFixer do
  describe '#find_by_field' do

    describe 'without override' do
      subject { Meter.find_by_field }
      it { is_expected.to eq :number }
    end
  end

  describe '#fix_relationships' do

    describe Meter do
      subject { Meter.fix_relationships }

      it 'should return an Array of relationship objects' do
        is_expected.to eq [
          {
            name: :asset,
            association_klass: Asset,
            find_by_field: :number,
            asset: false,
            company_code: false,
            company: false,
          }
        ]
      end
    end
  end
end
