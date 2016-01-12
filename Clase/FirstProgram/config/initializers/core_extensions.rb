Dir[File.expand_path '././FirstProgram/lib/core_extend/*.rb'].each do |file|
	require_relative(file)
end