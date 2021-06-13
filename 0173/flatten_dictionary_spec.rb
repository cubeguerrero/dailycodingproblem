require_relative './flatten_dictionary'

RSpec.describe 'flatten_dictionary' do
  context 'non-nested dictionary input' do
    it 'returns the dictionary' do
      input = { "foo" => 3 }
      result = flatten_dictionary(input)

      expect(result).to eq input
    end
  end

  context 'single nested dictionary as input' do
    it 'returns a flattened dictionary' do
      expected = {
        "foo" => 3,
        "bar.baz" => 4
      }
      result = flatten_dictionary({
        "foo" => 3,
        "bar" => {
          "baz" => 4,
        }
      })

      expect(result).to eq expected
    end
  end

  context 'mult-layer nested disctionary as input' do
    it 'returns a flatten_dictionary' do
      input = {
        "key" => 3,
        "foo" => {
          "a" => 5,
          "bar" => {
            "baz" => 8
          }
        }
      }
      expected = {
        "key" => 3,
        "foo.a" => 5,
        "foo.bar.baz" => 8
      }

      result = flatten_dictionary(input)

      expect(result).to eq expected
    end
  end
end
