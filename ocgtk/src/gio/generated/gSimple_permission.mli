class type simple_permission_t = object
  inherit GPermission.permission_t
  method as_simple_permission : Simple_permission.t
end

class simple_permission : Simple_permission.t -> simple_permission_t

val new_ : bool -> simple_permission_t
