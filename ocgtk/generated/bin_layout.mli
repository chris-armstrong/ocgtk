(** A layout manager for widgets with a single child.

    [GtkBinLayout] will stack each child of a widget on top of each other, using
    the [Gtk.Widget:hexpand], [Gtk.Widget:vexpand], [Gtk.Widget:halign], and
    [Gtk.Widget:valign] properties of each child to determine where they should
    be positioned.

    Its methods, signals and properties are on {!class-type-bin_layout_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgtk.Raw.Bin_layout}. *)

(** The methods, signals and properties of a [BinLayout]. *)
class type bin_layout_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .layout_manager_t

  method as_bin_layout : Raw.Bin_layout.t
end

class bin_layout : Raw.Bin_layout.t -> bin_layout_t
(** Wraps a raw handle of {!Ocgtk.Raw.Bin_layout.t}. *)

(** {2:constructors Constructors} *)

val new_ : unit -> bin_layout_t
(** Creates a new [GtkBinLayout] instance. *)
