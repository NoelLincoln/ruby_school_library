require 'json'

module FileOperations
  def save_to_file(filename, data)
    File.open(filename, 'w') do |file|
      file.puts JSON.generate(data.map(&:to_hash))
    end
  end

  def load_from_file(filename, &block)
    return unless File.exist?(filename)

    json_data = File.read(filename)
    data = JSON.parse(json_data)
    block.call(data)
  end
end
