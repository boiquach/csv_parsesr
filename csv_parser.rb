require 'csv'
require './csv_row.rb'

def parse_csv(file_name)
    rows = []

    CSV.foreach(file_name) do |row|
        rows << CsvRow.new(row[0], row[1], row[2])
    end

    rows.each do |row|
        row.children = rows.select { |rr| rr.parent == row.id }
    end

    rows.select{ |row| row.parent == 'nil' }.each do |parent|
        puts parent.to_s
    end
end

parse_csv ARGV.first