class type orientable_t = object
  method get_orientation : unit -> Gtk_enums.orientation
  method set_orientation : Gtk_enums.orientation -> unit
  method as_orientable : Orientable.t
end

(* High-level class for Orientable *)
class orientable (obj : Orientable.t) : orientable_t =
  object (self)
    method get_orientation : unit -> Gtk_enums.orientation =
      fun () -> Orientable.get_orientation obj

    method set_orientation : Gtk_enums.orientation -> unit =
      fun orientation -> Orientable.set_orientation obj orientation

    method as_orientable = obj
  end
