class type builder_c_scope_t = object
    method as_builder_c_scope : Builder_c_scope.t
end

class builder_c_scope : Builder_c_scope.t -> builder_c_scope_t

val new_ : unit -> builder_c_scope_t
