class type simple_permission_t = object
  inherit Permission.permission_t
  method as_simple_permission : Raw.Simple_permission.t
end

(* High-level class for SimplePermission *)
class simple_permission (obj : Raw.Simple_permission.t) : simple_permission_t =
  object (self)
    inherit Permission.permission (obj :> Raw.Permission.t)
    method as_simple_permission = obj
  end

let new_ (allowed : bool) : simple_permission_t =
  let obj_ = Raw.Simple_permission.new_ allowed in
  new simple_permission obj_
