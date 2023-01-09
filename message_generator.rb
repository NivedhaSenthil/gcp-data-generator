require_relative "generator" 

def create_data_into_file filename, data_type, data_pattern, data_size
    data_size = data_size.to_i
    generator = Generator.new data_type, data_pattern, data_size
    File.open(filename, "w") do |f|     
        f.write(generator.generate)   
    end
end

create_data_into_file ARGV.shift, ARGV.shift, ARGV.shift, ARGV.shift