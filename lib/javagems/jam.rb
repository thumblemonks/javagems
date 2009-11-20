module JavaGems
  module Jam
    def self.classpath_from_options(options)
      classpath = [ENV["CLASSPATH"]]
      classpath += %w[-cp -classpath].map do |option|
        idx = options.index(option)
        options.slice!(idx..(idx + 1)).last if idx
      end
      [classpath.compact.join(File::PATH_SEPARATOR), options]
    end
  end # Jam
end # JamaGems
