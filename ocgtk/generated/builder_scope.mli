class type builder_scope_t = object
  method as_builder_scope : Builder_scope.t
end

class builder_scope : Builder_scope.t -> builder_scope_t
