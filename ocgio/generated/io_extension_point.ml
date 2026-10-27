class type io_extension_point_t = object
  method get_extension_by_name : string -> Raw.Io_extension.t
  method get_extensions : unit -> Raw.Io_extension.t list
  method get_required_type : unit -> Gobject.Type.t
  method set_required_type : Gobject.Type.t -> unit
  method as_io_extension_point : Raw.Io_extension_point.t
end

(* High-level class for IOExtensionPoint *)
class io_extension_point (obj : Raw.Io_extension_point.t) : io_extension_point_t
  =
  object (self)
    method get_extension_by_name : string -> Raw.Io_extension.t =
      fun name -> Raw.Io_extension_point.get_extension_by_name obj name

    method get_extensions : unit -> Raw.Io_extension.t list =
      fun () -> Raw.Io_extension_point.get_extensions obj

    method get_required_type : unit -> Gobject.Type.t =
      fun () -> Raw.Io_extension_point.get_required_type obj

    method set_required_type : Gobject.Type.t -> unit =
      fun type_ -> Raw.Io_extension_point.set_required_type obj type_

    method as_io_extension_point = obj
  end
