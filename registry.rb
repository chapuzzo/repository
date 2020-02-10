require 'pry'

module Registry
	class Registry
		def classes
			@_classes ||= []
			@_classes
		end
	end

	module ClassMethods
=begin
		options: (ideally to get implemented)
			auto-register (register on inheritance/explicit registration)
			self-register (register own class in registry appart from descendants)
			sub-registries (nested registries & propagation to upper ones)
			key-method (method name to get key for class storage)
=end
		def register key = nil, klass = self
			return superclass.register(key, klass) if superclass.respond_to? :register
			
			@registry ||= Registry.new 
			@registry.classes << [key, klass]

			# ap self:self, registry: @registry, klass: klass
		end

		def classes
			@map ||= Hash[@registry.classes.map{|key, klass|
				# next if !klass.respond_to?(:x) && key.nil
				# ap klass.respond_to? :x

				# binding.pry
				[key || klass.x, klass]
			}]
		end

		def inherited klass
			register nil, klass
		end
	end

	def self.included(klass)
		klass.extend ClassMethods
	end
end