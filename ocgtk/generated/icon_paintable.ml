class type icon_paintable_t = object
  inherit Ocgdk.Paintable.paintable_t
  inherit Symbolic_paintable.symbolic_paintable_t

  (** {2:methods Methods} *)

  method get_file : unit -> Ocgio.File.file_t option
  (** Gets the [GFile] that was used to load the icon.

      Returns [NULL] if the icon was not loaded from a file. *)

  method get_icon_name : unit -> string option
  [@@ocaml.doc
    "Get the icon name being used for this icon.\n\n\
     When an icon looked up in the icon theme was not available, the\n\
     icon theme may use fallback icons - either those specified to\n\
     gtk_icon_theme_lookup_icon() or the always-available\n\
     \"image-missing\". The icon chosen is returned by this function.\n\n\
     If the icon was created without an icon theme, this function\n\
     returns [NULL]."]

  method is_symbolic : unit -> bool
  (** Checks if the icon is symbolic or not.

      This currently uses only the file name and not the file contents for
      determining this. This behaviour may change in the future. *)

  (** {2:properties Properties} *)

  method scale : int
  (** Get property: scale *)

  method set_scale : int -> unit
  (** Set property: scale *)

  method size : int
  (** Get property: size *)

  method set_size : int -> unit
  (** Set property: size *)

  (** {2:conversions Conversions} *)

  method as_icon_paintable : Raw.Icon_paintable.t
end

(* High-level class for IconPaintable *)
class icon_paintable (obj : Raw.Icon_paintable.t) : icon_paintable_t =
  object (self)
    inherit Ocgdk.Paintable.paintable (Ocgdk.Raw.Paintable.from_gobject obj)

    inherit
      Symbolic_paintable.symbolic_paintable
        (Raw.Symbolic_paintable.from_gobject obj)

    method get_file : unit -> Ocgio.File.file_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgio.File.file ret)
          (Raw.Icon_paintable.get_file obj)

    method get_icon_name : unit -> string option =
      fun () -> Raw.Icon_paintable.get_icon_name obj

    method is_symbolic : unit -> bool =
      fun () -> Raw.Icon_paintable.is_symbolic obj

    method scale = Raw.Icon_paintable.get_scale obj
    method set_scale v = Raw.Icon_paintable.set_scale obj v
    method size = Raw.Icon_paintable.get_size obj
    method set_size v = Raw.Icon_paintable.set_size obj v
    method as_icon_paintable = obj
  end

let new_for_file (file : Ocgio.File.file_t) (size : int) (scale : int) :
    icon_paintable_t =
  let file = file#as_file in
  let obj_ = Raw.Icon_paintable.new_for_file file size scale in
  new icon_paintable obj_
