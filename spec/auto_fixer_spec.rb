require 'spec_helper'

describe WaterfieldUtils::AutoFixer do
  describe '#find_by_field' do

    describe 'without override' do
      subject { Meter.find_by_field }
      it { is_expected.to eq :number }
    end
  end

  describe 'Meter.fix_relationships' do
    subject { Meter.fix_relationships }
    it { is_expected.to include(a_kind_of(WaterfieldUtils::Relationship)) }
  end
end
