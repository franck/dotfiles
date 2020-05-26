#!/usr/bin/env ruby
# encoding: utf-8
require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'slop'
  gem 'byebug'
  gem 'rubyzip'
end

require 'rubygems'
require 'zip'

VERSION = "0.0.1"

opts = Slop.parse do |o|
  o.string '-d', '--date', 'Month to retrieve. Ex : 2019_11', required: true

  o.on '--version', 'print the version' do
    puts VERSION
    exit
  end
end


class FradeoAccounting

  attr_reader :month

  FOLDERS = [
    '/Users/franck/Documents/administratif/fradeo_factures',
    '/Users/franck/Documents/administratif/fradeo_docs/_Employes',
  ]

  def initialize(opts)
    @month = opts[:date]
  end

  def call
    delete_previous_zip_file
    create_zip_with_files(files)
  end

  private

    def create_zip_with_files(_files)
      Zip::File.open(zipfile_path, Zip::File::CREATE) do |zipfile|
        _files.each_with_index do |file_path, index|
          zipfile.add(File.basename(file_path), file_path)
        end
      end
    end

    def delete_previous_zip_file
      File.delete(zipfile_path) if File.exist?(zipfile_path)
    end

    def files
      FOLDERS.map{|folder| Dir.glob("#{folder}/**/*").grep(month_regexp) }.compact.flatten.uniq
    end


    def month_regexp
      Regexp.new(Regexp.escape(month))
    end

    def zipfile_path
      "./#{month}.zip"
    end

end

FradeoAccounting.new(opts).call


