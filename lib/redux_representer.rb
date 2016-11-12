# module ReduxRepresenter
#   def self.included(klass)
#     klass.send :include, Trailblazer::Operation::Representer
#     klass.send :include, self::JsonMethods # need to be included after Representer
#   end
#
#   module JsonMethods
#     def as_json(*)
#       { "type" => self.class.name, "representation" => self.class.representer.new(model).as_json }
#     end
#
#     def to_json(*args)
#       as_json(*args).to_json
#     end
#   end
# end
