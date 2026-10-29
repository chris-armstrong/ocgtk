class type builder_scope_t = object
  (** {2:conversions Conversions} *)

  method as_builder_scope : Raw.Builder_scope.t
end

(* High-level class for BuilderScope *)
class builder_scope (obj : Raw.Builder_scope.t) : builder_scope_t =
  object (self)
    method as_builder_scope = obj
  end
