require 'spec_helper'

describe 'AutoFixer' do
  describe '#find_by_field' do

    describe 'without override' do
      subject { Hickwall.find_by_field }
      it { is_expected.to eq nil }
    end

    describe 'with override of wickwall_number' do
      subject { Wickwall.find_by_field :wickwall_number }
      it('should equal wickwall_number') { is_expected.to eq :wickwall_number }
    end
  end
end
