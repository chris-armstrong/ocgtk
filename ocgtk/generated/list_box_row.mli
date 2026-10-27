(** The kind of widget that can be added to a [GtkListBox].

    [Gtk.ListBox] will automatically wrap its children in a [GtkListboxRow] when
    necessary.

    Its methods, signals and properties are on {!class-type-list_box_row_t}. The
    functions it is built on are in {!Ocgtk.Raw.List_box_row}. *)

(** The methods, signals and properties of a [GtkListBoxRow]. *)
class type list_box_row_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Actionable.actionable_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method changed : unit -> unit
  method get_activatable : unit -> bool

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_header :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_index : unit -> int
  method get_selectable : unit -> bool
  method is_selected : unit -> bool
  method set_activatable : bool -> unit

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_header :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_selectable : bool -> unit
  method as_list_box_row : Raw.List_box_row.t
end

class list_box_row : Raw.List_box_row.t -> list_box_row_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.List_box_row.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkListBoxRow], give one already wrapped. *)

val new_ : unit -> list_box_row_t
