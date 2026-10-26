class type builder_c_scope_t = object
  inherit Builder_scope.builder_scope_t
  method as_builder_c_scope : Raw.Builder_c_scope.t
end

(* High-level class for BuilderCScope *)
class builder_c_scope (obj : Raw.Builder_c_scope.t) : builder_c_scope_t =
  object (self)
    inherit Builder_scope.builder_scope (Raw.Builder_scope.from_gobject obj)
    method as_builder_c_scope = obj
  end

let new_ () : builder_c_scope_t =
  new builder_c_scope (Raw.Builder_c_scope.new_ ())
