class type builder_scope_t = object
  method as_builder_scope : Builder_scope.t
end

(* High-level class for BuilderScope *)
class builder_scope (obj : Builder_scope.t) : builder_scope_t =
  object (self)
    method as_builder_scope = obj
  end
