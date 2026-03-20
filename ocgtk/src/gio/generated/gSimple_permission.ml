class type simple_permission_t = object
    method as_simple_permission : Simple_permission.t
end

(* High-level class for SimplePermission *)
class simple_permission (obj : Simple_permission.t) : simple_permission_t = object (self)

    method as_simple_permission = obj
end

