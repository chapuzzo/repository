require './base'

class Child < Base
	def self.x
		:child
	end
end

class Child2 < Base
	def self.x
		:child2
	end
end

class Child3 < Child
	register :xxx

	def self.xx
		:child3
	end
end

