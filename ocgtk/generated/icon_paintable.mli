(** Contains information found when looking up an icon in [GtkIconTheme] or
    loading it from a file.

    [GtkIconPaintable] implements [GdkPaintable] and [GtkSymbolicPaintable].

    Its methods, signals and properties are on {!class-type-icon_paintable_t}.
    The functions it is built on are in {!Ocgtk.Raw.Icon_paintable}. *)

(** The methods, signals and properties of a [GtkIconPaintable]. *)
class type icon_paintable_t = object
  inherit Ocgdk.Paintable.paintable_t
  inherit Symbolic_paintable.symbolic_paintable_t
  method get_file : unit -> Ocgio.File.file_t option
  method get_icon_name : unit -> string option
  method is_symbolic : unit -> bool
  method scale : int
  method set_scale : int -> unit
  method size : int
  method set_size : int -> unit
  method as_icon_paintable : Raw.Icon_paintable.t
end

class icon_paintable : Raw.Icon_paintable.t -> icon_paintable_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Icon_paintable.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkIconPaintable], give one already wrapped. *)

val new_for_file : Ocgio.File.file_t -> int -> int -> icon_paintable_t
