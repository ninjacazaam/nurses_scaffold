# This file uses the slop gem to parse command line options, and call the rostering code

require 'slop'
require 'date'
require_relative './rostering.rb'

require 'rostering/io/nurses_file.rb'
require 'rostering/io/roster.rb'

module Slop
  class DateOption < Option
    def call(value)
      Date.parse(value)
    end
  end
end

class CLI
  def cli_flags
    options = Slop::Options.new
    options.string '-f', '--filename', 'a file to import', required: true
    options.date '-s', '--start-date', 'the first date of the period to roster, in YYYY-MM-DD format', required: true
    options.date '-e', '--end-date', 'the final date of the period to roster, in YYYY-MM-DD format', required: true
    options.bool '-h', '--help', 'Help and usage information'
    options
  end

  def main(command_line_options = ARGV)
    parser = Slop::Parser.new cli_flags
    arguments = parse_arguments(command_line_options, parser)
    validate_arguments arguments

    build_roster arguments
  end

  private

  def build_roster(arguments)
    date_range = arguments[:start_date]..arguments[:end_date]
    nurses = Rostering::IO::NursesFile.read(arguments[:filename])

    puts "Calculating roster for #{arguments[:start_date].iso8601} until #{arguments[:end_date].iso8601}"
    puts "With #{nurses.length} nurses\n\n"

    builder = Rostering::RosterBuilder.new
    roster = builder.build(date_range, nurses)

    puts "RESULT ROSTER"
    puts "============="
    puts Rostering::IO::Roster.text_format roster
  end

  def help_and_exit
    puts cli_flags
    exit
  end

  def parse_arguments(command_line_options, parser)
    result = parser.parse command_line_options

    help_and_exit if result[:help]
    result.to_hash
  rescue Slop::UnknownOption, Slop::MissingRequiredOption
    help_and_exit
  end

  def validate_arguments(arguments)
    if arguments[:end_date] <= arguments[:start_date]
      puts 'End date must be after start date'
      help_and_exit
    end
  end
end

CLI.new.main
