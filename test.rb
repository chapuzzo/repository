# require './registry'
require './base'
require './child' 
require 'ap'

# ap base: Base.classes
# ap child: Child.classes
ap registry: Base.classes
ap registry: Child.classes
# binding.pry

# ap Base.ancestors
# ap Base.classes
# ap base: [Base.respond_to?(:register), Base.classes]
# ap child: [Child.respond_to?(:register), Child.classes]
# ap child3: [Child3.respond_to?(:register), Child3.classes]
# ap Child3.classes

# ap Registry.classes
