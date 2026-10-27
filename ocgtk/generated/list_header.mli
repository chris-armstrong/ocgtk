(** Used by list widgets to represent the headers they display.

    [GtkListHeader] objects are managed just like [Gtk.ListItem] objects via
    their factory, but provide a different set of properties suitable for
    managing the header instead of individual items.

    Its methods, signals and properties are on {!class-type-list_header_t}. The
    functions it is built on are in {!Ocgtk.Raw.List_header}. *)

(** The methods, signals and properties of a [GtkListHeader]. *)
class type list_header_t = object
  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_end : unit -> int
  method get_item : unit -> [ `object_ ] Gobject.obj option
  method get_n_items : unit -> int
  method get_start : unit -> int

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method as_list_header : Raw.List_header.t
end

class list_header : Raw.List_header.t -> list_header_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.List_header.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkListHeader], give one already wrapped. *)
