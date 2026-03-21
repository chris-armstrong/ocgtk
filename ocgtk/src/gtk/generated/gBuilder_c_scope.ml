class type builder_c_scope_t = object
    method as_builder_c_scope : Builder_c_scope.t
end

(* High-level class for BuilderCScope *)
class builder_c_scope (obj : Builder_c_scope.t) : builder_c_scope_t = object (self)

    method as_builder_c_scope = obj
end

