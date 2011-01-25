class BLM
	def initialize(source)
		@source = source
	end
	
	def header
		return @header if defined?(@header)
		@header = {}
		
		get_contents(@source, "#HEADER#", "#").each_line do |line|
			next if line.empty?
			key, value = line.split(" : ")
			@header[key.downcase.to_sym] = value.strip
		end
		return @header
	end
	
	private
	def get_contents(string, start, finish)
		start = string.index(start) + start.size
		finish = string.index(finish, start) - finish.size
		string[start..finish].strip
	end
end
