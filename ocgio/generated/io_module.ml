class type io_module_t = object
  (** {2:conversions Conversions} *)

  method as_io_module : Raw.Io_module.t
end

(* High-level class for IOModule *)
class io_module (obj : Raw.Io_module.t) : io_module_t =
  object (self)
    method as_io_module = obj
  end

let new_ (filename : string) : io_module_t =
  let obj_ = Raw.Io_module.new_ filename in
  new io_module obj_
