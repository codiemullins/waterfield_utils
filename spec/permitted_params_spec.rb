require 'spec_helper'

describe WaterfieldUtils::PermittedParams do
  subject { Meter.permitted_params }

  it { is_expected.to include(:asset_id, :asset, :number, :name) }
end
