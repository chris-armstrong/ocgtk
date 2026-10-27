(** Arranges children in a single row or column.

    Whether it is a row or column depends on the value of its
    [Gtk.Orientable:orientation] property. Within the other dimension all
    children all allocated the same size. The [GtkBoxLayout] will respect the
    [Gtk.Widget:halign] and [Gtk.Widget:valign] properties of each child widget.

    If you want all children to be assigned the same size, you can use the
    [Gtk.BoxLayout:homogeneous] property.

    If you want to specify the amount of space placed between each child, you
    can use the [Gtk.BoxLayout:spacing] property.

    Its methods, signals and properties are on {!class-type-box_layout_t}. The
    functions it is built on are in {!Ocgtk.Raw.Box_layout}. *)

(** The methods, signals and properties of a [GtkBoxLayout]. *)
class type box_layout_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .layout_manager_t

  inherit Orientable.orientable_t
  method get_baseline_child : unit -> int
  method get_baseline_position : unit -> Enums.baselineposition
  method get_homogeneous : unit -> bool
  method get_spacing : unit -> int
  method set_baseline_child : int -> unit
  method set_baseline_position : Enums.baselineposition -> unit
  method set_homogeneous : bool -> unit
  method set_spacing : int -> unit
  method as_box_layout : Raw.Box_layout.t
end

class box_layout : Raw.Box_layout.t -> box_layout_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Box_layout.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkBoxLayout], give one already wrapped. *)

val new_ : Enums.orientation -> box_layout_t
