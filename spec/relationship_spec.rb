require 'spec_helper'

describe WaterfieldUtils::Relationship do
  subject do
    WaterfieldUtils::Relationship.new :asset, Meter.reflections[:asset]
  end

  it do
    is_expected.to have_attributes(
      name: :asset,
      klass: Asset,
      asset?: false,
      company_code?: false,
      company?: false,
      find_by_field: :number,
    )
  end
end
