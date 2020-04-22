require_relative '../../apps/web/services/restaurant'

describe Restaurant do
  before do
    payload = {:name=>"Top Pizza 2"}.to_json
    described_class.push(payload)
  end

  it 'consume payload' do
    expect(described_class.list(1)).to eq [{:name=>"Top Pizza 2"}]
  end
end
