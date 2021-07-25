module Mapp
  module CLI
    def self.start
      has_mundler = File.file?(File.join(Dir.pwd, "Mundlefile"))

      mrbc = "mrbc"
      mrbc = "mundle exec mrbc" if has_mundler

      mruby = "mruby"
      mruby = "mundle exec mruby" if has_mundler

      file = Tempfile.new('foo')
      output = file.path

      app_files = Dir.glob(File.join("app", "**", "*.rb"))
      additional = Dir.glob(File.join(__dir__, "mruby", "*.rb"))
      additional.map! { |f| File.expand_path(f) }

      compile = (%W(#{mrbc} -g -o#{output}) + app_files + additional).join(" ")
      chmod = "chmod +x #{output}"
      execute = "#{mruby} -d #{output}"

      # TODO: build
      # build = (%W(#{mrbc} -Bapp -g -o./build.c) + app_files + additional).join(" ")
      # system(build)

      system(compile) || raise("Failed to compiled")
      system(chmod) || raise("Failed to chmod")
      begin
        system(execute)
      rescue Interrupt
      end
    ensure
      if file
        file.close
        file.unlink
      end
    end
  end
end
