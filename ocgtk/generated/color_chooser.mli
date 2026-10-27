(** [GtkColorChooser] is an interface that is implemented by widgets for
    choosing colors.

    Depending on the situation, colors may be allowed to have alpha
    (translucency).

    In GTK, the main widgets that implement this interface are
    [Gtk.ColorChooserWidget], [Gtk.ColorChooserDialog] and [Gtk.ColorButton].

    Its methods, signals and properties are on {!class-type-color_chooser_t}.
    The functions it is built on are in {!Ocgtk.Raw.Color_chooser}. *)

(** The methods, signals and properties of a [GtkColorChooser]. *)
class type color_chooser_t = object
  method add_palette :
    Enums.orientation -> int -> int -> Ocgdk.Raw.Rgb_a.t array option -> unit

  method get_use_alpha : unit -> bool
  method set_rgba : Ocgdk.Rgb_a.rgb_a_t -> unit
  method set_use_alpha : bool -> unit
  method as_color_chooser : Raw.Color_chooser.t
end

class color_chooser : Raw.Color_chooser.t -> color_chooser_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Color_chooser.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkColorChooser], give one already wrapped. *)
