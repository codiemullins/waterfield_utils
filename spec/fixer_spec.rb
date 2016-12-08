require 'spec_helper'

describe 'fix_with_root' do
  subject { Meter.new }

  it 'converts strings to objects' do
    params = { asset_number: 'Asset 1', company_code_name: 'Company X', number: 'Meter 123', name: 'Meter 123' }
    actual_params = subject.fix_with_root(params, subject)
    expect(actual_params).to eq(
      asset: Asset.find_by_number('Asset 1'),
      number: 'Meter 123',
      name: 'Meter 123',
    )
  end
end
