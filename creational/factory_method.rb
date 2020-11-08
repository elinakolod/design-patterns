# frozen_string_literal: true

require 'csv'
require 'yaml'
require 'json'

class CsvReport
  def format(data)
    p CSV.parse(data.values.join(','), headers: data.keys.join(','))
  end
end

class JsonReport
  def format(data)
    p data.to_json
  end
end

class YamlReport
  def format(data)
    p data.to_yaml
  end
end

class Formatter
  TYPES = {
    csv: CsvReport,
    json: JsonReport,
    yml: YamlReport
  }.freeze

  def self.for(type)
    TYPES.fetch(type).new
  rescue KeyError
    puts 'Unsupported type of report'
  end
end

class ReportGenerator
  def generate(data, type)
    Formatter.for(type).format(data)
  end
end

report_data = { name: 'Ivan', job_title: 'Rubiest', salary: 1_000_000 }
generator = ReportGenerator.new
generator.generate(report_data, :csv)
generator.generate(report_data, :yml)
generator.generate(report_data, :json)
