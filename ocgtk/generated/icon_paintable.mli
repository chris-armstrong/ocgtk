(** Contains information found when looking up an icon in [GtkIconTheme] or
    loading it from a file.

    [GtkIconPaintable] implements [GdkPaintable] and [GtkSymbolicPaintable].

    Its methods, signals and properties are on {!class-type-icon_paintable_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgtk.Raw.Icon_paintable}. *)

(** The methods, signals and properties of a [IconPaintable]. *)
class type icon_paintable_t = object
  inherit Ocgdk.Paintable.paintable_t
  inherit Symbolic_paintable.symbolic_paintable_t

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

  method scale : int
  method set_scale : int -> unit
  method size : int
  method set_size : int -> unit
  method as_icon_paintable : Raw.Icon_paintable.t
end

class icon_paintable : Raw.Icon_paintable.t -> icon_paintable_t
(** Wraps a raw handle of {!Ocgtk.Raw.Icon_paintable.t}. *)

(** {2:constructors Constructors} *)

val new_for_file : Ocgio.File.file_t -> int -> int -> icon_paintable_t
(** Creates a [GtkIconPaintable] for a file with a given size and scale.

    The icon can then be rendered by using it as a [GdkPaintable]. *)
