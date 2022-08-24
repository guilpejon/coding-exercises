# frozen_string_literal: true

require_relative '../reader'

RSpec.describe Reader do
  context '#tail with invalid parameters' do
    let(:reader) { Reader.new('invalid_file.txt').tail }
    let(:reader2) { Reader.new('invalid_file.txt', -1).tail }

    it 'expects to return error with invalid file' do
      expect { reader }.to raise_error(Errno::ENOENT)
    end

    it 'expects to return error with invalid number of lines' do
      expect { reader2 }.to raise_error('Invalid number of lines')
    end
  end

  context '#tail with valid parameters' do
    let(:reader) { Reader.new('file2.txt').tail }
    let(:reader2) { Reader.new('file2.txt', 5).tail }

    it 'expects to not return an error' do
      expect { reader }.to_not raise_error
    end

    it 'expects to return default value of number_of_lines' do
      file_content = ["\n", "Line 6\n", "\n", "Line 7\n", "\n", "Line 8\n", "\n", "Line 9\n", "\n", "Line 10\n"]
      expect(reader).to eq(file_content)
    end

    it 'expects to return 5 last lines' do
      file_content = ["Line 8\n", "\n", "Line 9\n", "\n", "Line 10\n"]
      expect(reader2).to eq(file_content)
    end
  end
end
