class type io_extension_point_t = object
  (** {2:methods Methods} *)

  method get_extension_by_name : string -> Raw.Io_extension.t
  (** Finds a [GIOExtension] for an extension point by name. *)

  method get_extensions : unit -> Raw.Io_extension.t list
  (** Gets a list of all extensions that implement this extension point. The
      list is sorted by priority, beginning with the highest priority. *)

  method get_required_type : unit -> Gobject.Type.t
  (** Gets the required type for [extension_point]. *)

  method set_required_type : Gobject.Type.t -> unit
  (** Sets the required type for [extension_point] to [type]. All
      implementations must henceforth have this type. *)

  (** {2:conversions Conversions} *)

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
