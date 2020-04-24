require_relative '../../apps/web/services/dish'

describe Dish do
  before do
    payload = {:title=>"Fish & Chips"}.to_json
    described_class.push(payload)
  end

  it 'consume payload' do
    expect(described_class.list(1)).to eq [{"title"=>"Fish & Chips"}]
  end
end
