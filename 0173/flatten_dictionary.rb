def flatten_dictionary(dictionary)
  return dictionary unless dictionary.values.any? { |v| v.is_a? Hash }

  result = {}
  dictionary.each do |k, v|
    if v.is_a?(Hash)
      new_v = flatten_dictionary(v)
      new_v.each do |inner_k, inner_v|
        result[k + '.' + inner_k] = inner_v
      end
    else
      result[k] = v
    end
  end

  result
end
