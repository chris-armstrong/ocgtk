class type simple_permission_t = object
    inherit GPermission.permission_t
    method as_simple_permission : Simple_permission.t
end

(* High-level class for SimplePermission *)
class simple_permission (obj : Simple_permission.t) : simple_permission_t = object (self)
  inherit GPermission.permission (obj :> Permission.t)

    method as_simple_permission = obj
end

let new_ (allowed : bool) : simple_permission_t =
  new simple_permission (Simple_permission.new_ allowed)

