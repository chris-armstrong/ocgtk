class type simple_permission_t = object
  inherit Permission.permission_t
  method as_simple_permission : Raw.Simple_permission.t
end

class simple_permission : Raw.Simple_permission.t -> simple_permission_t

val new_ : bool -> simple_permission_t
