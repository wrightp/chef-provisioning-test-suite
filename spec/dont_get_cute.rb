require 'spec_helper'

describe 'dont get cute' do
  before(:all) do
    seek_and_destroy
  end

  context 'local chef zero' do

    %w( aws fog-aws vagrant ).each { |driver|
      it driver do
        results = metal_run("dont-get-cute::#{driver}")
        expect(results.error?).to be false
      end

      it 'removed node and client data' do
      end
    }
  end

  after(:all) do
    seek_and_destroy
  end
end
