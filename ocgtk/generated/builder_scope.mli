class type builder_scope_t = object
  method as_builder_scope : Raw.Builder_scope.t
end

class builder_scope : Raw.Builder_scope.t -> builder_scope_t
