# This file uses the slop gem to parse command line options, and call the rostering code

require 'slop'
require 'date'
require_relative './rostering.rb'

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

  def help_and_exit
    puts cli_flags
    exit
end

  def parse_arguments(command_line_options, parser)
    begin
      result = parser.parse command_line_options

      help_and_exit if result[:help]
      result.to_hash

    rescue Slop::UnknownOption, Slop::MissingRequiredOption
      help_and_exit
    end
  end

  def validate_arguments(arguments)
    if arguments[:end_date] <= arguments[:start_date]
      puts "End date must be after start date"
      help_and_exit
    end
  end

  def main(command_line_options=ARGV)
    parser = Slop::Parser.new cli_flags
    arguments = parse_arguments(command_line_options, parser)
    validate_arguments arguments

    puts "RUN WITH"
    puts arguments.inspect
  end
end

CLI.new.main