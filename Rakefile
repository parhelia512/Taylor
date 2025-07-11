require "json"
require "fileutils"
require "rake/clean"
require "rake/loaders/makefile"

CLEAN.include("./build/*")
CLEAN.include("./dist/*")
CLEAN.include("./releases/*")
CLEAN.include("./src/ruby/**/*.cpp")
CLEAN.include("./src/raylib.cpp")
CLEAN.include("./include/raylib.h")
CLEAN.include("./include/ruby")

task default: "linux:build"

require_relative "rakelib/helpers"

ephemeral_files_for_ruby.each do |file|
  task file do
    FileUtils.mkdir_p("include/#{File.dirname(file)}")

    cpp_file = "src/#{file.ext}.cpp"
    ruby_code = File.read("src/#{file.ext}.rb")

    write_hpp_file(file)
    write_cpp_file(file, cpp_file, ruby_code)
  end
end

multitask setup_ephemeral_files: ephemeral_files_for_ruby

rule ".o" => ->(file) { source_for(file) } do |task|
  FileUtils.mkdir_p(File.dirname(task.name))
  sh Builder.o_command_for(task)
end

rule ".mf" => ->(file) { source_for(file) } do |task|
  data = `#{Builder.mf_command_for(task)}`

  file, deps = data.split(":")
  deps = deps.split.select { |dep| File.exist? dep }

  Rake::Task[file].enhance deps
end

PLATFORMS.each { |platform|
  VARIANTS.each { |variant|
    task "build:#{platform}:#{variant}" do |task|
      FileUtils.mkdir_p("./dist/#{platform}/#{variant}")
      Builder.builders[platform].variant = variant
      sh Builder.builders[platform].compile
    end
  }
}
