(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ListBoxRow *)

type t = [`list_box_row | `widget] Gobject.obj

let as_widget (obj : t) : Gtk.widget = Obj.magic obj

(** Create a new ListBoxRow *)
external new_ : unit -> t = "ml_gtk_list_box_row_new"

(* Properties *)

(** Set whether the row can be selected. *)
external set_selectable : t -> bool -> unit = "ml_gtk_list_box_row_set_selectable"

(** Sets the current header of the @row.

This is only allowed to be called
from a [callback@Gtk.ListBoxUpdateHeaderFunc].
It will replace any existing header in the row,
and be shown in front of the row in the listbox. *)
external set_header : t -> Gtk.widget option -> unit = "ml_gtk_list_box_row_set_header"

(** Sets the child widget of @self. *)
external set_child : t -> Gtk.widget option -> unit = "ml_gtk_list_box_row_set_child"

(** Set whether the row is activatable. *)
external set_activatable : t -> bool -> unit = "ml_gtk_list_box_row_set_activatable"

(** Returns whether the child is currently selected in its
`GtkListBox` container. *)
external is_selected : t -> bool = "ml_gtk_list_box_row_is_selected"

(** Gets whether the row can be selected. *)
external get_selectable : t -> bool = "ml_gtk_list_box_row_get_selectable"

(** Gets the current index of the @row in its `GtkListBox` container. *)
external get_index : t -> int = "ml_gtk_list_box_row_get_index"

(** Returns the current header of the @row.

This can be used
in a [callback@Gtk.ListBoxUpdateHeaderFunc] to see if
there is a header set already, and if so to update
the state of it. *)
external get_header : t -> Gtk.widget = "ml_gtk_list_box_row_get_header"

(** Gets the child widget of @row. *)
external get_child : t -> Gtk.widget = "ml_gtk_list_box_row_get_child"

(** Gets whether the row is activatable. *)
external get_activatable : t -> bool = "ml_gtk_list_box_row_get_activatable"

(** Marks @row as changed, causing any state that depends on this
to be updated.

This affects sorting, filtering and headers.

Note that calls to this method must be in sync with the data
used for the row functions. For instance, if the list is
mirroring some external data set, and *two* rows changed in the
external data set then when you call gtk_list_box_row_changed()
on the first row the sort function must only read the new data
for the first of the two changed rows, otherwise the resorting
of the rows will be wrong.

This generally means that if you don’t fully control the data
model you have to duplicate the data that affects the listbox
row functions into the row widgets themselves. Another alternative
is to call [method@Gtk.ListBox.invalidate_sort] on any model change,
but that is more expensive. *)
external changed : t -> unit = "ml_gtk_list_box_row_changed"

