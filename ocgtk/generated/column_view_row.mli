(** Configures how rows are displayed in a [Gtk.ColumnView].

    It is not used to set the widgets displayed in the individual cells. For
    that see [GtkColumnViewColumn.set_factory] and [GtkColumnViewCell].

    Its methods, signals and properties are on {!class-type-column_view_row_t}.
    The functions it is built on are in {!Ocgtk.Raw.Column_view_row}. *)

(** The methods, signals and properties of a [GtkColumnViewRow]. *)
class type column_view_row_t = object
  method get_accessible_description : unit -> string
  method get_accessible_label : unit -> string
  method get_activatable : unit -> bool
  method get_focusable : unit -> bool
  method get_item : unit -> [ `object_ ] Gobject.obj option
  method get_position : unit -> int
  method get_selectable : unit -> bool
  method get_selected : unit -> bool
  method set_accessible_description : string -> unit
  method set_accessible_label : string -> unit
  method set_activatable : bool -> unit
  method set_focusable : bool -> unit
  method set_selectable : bool -> unit
  method as_column_view_row : Raw.Column_view_row.t
end

class column_view_row : Raw.Column_view_row.t -> column_view_row_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Column_view_row.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkColumnViewRow], give one already wrapped. *)
