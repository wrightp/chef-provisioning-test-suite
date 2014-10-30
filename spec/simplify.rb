require 'spec_helper'

describe 'simple tests' do
  before(:all) do
    seek_and_destroy
  end

  context 'local chef zero' do
    %w( aws fog-aws vagrant ).each { |driver|
      it driver do
        results = metal_run("simplify::#{driver}")
        expect(results.error?).to be false
      end
    }
  end

  after(:all) do
    seek_and_destroy
  end
end
