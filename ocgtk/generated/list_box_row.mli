(** The kind of widget that can be added to a [GtkListBox].

    [Gtk.ListBox] will automatically wrap its children in a [GtkListboxRow] when
    necessary.

    Its methods, signals and properties are on {!class-type-list_box_row_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgtk.Raw.List_box_row}. *)

(** The methods, signals and properties of a [ListBoxRow]. *)
class type list_box_row_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Actionable.actionable_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** This is a keybinding signal, which will cause this row to be activated.

      If you want to be notified when the user activates a row (by key or not),
      use the [Gtk.ListBox::row-activated] signal on the row’s parent
      [GtkListBox]. *)

  method changed : unit -> unit
  (** Marks [row] as changed, causing any state that depends on this to be
      updated.

      This affects sorting, filtering and headers.

      Note that calls to this method must be in sync with the data used for the
      row functions. For instance, if the list is mirroring some external data
      set, and {i two} rows changed in the external data set then when you call
      gtk_list_box_row_changed() on the first row the sort function must only
      read the new data for the first of the two changed rows, otherwise the
      resorting of the rows will be wrong.

      This generally means that if you don’t fully control the data model you
      have to duplicate the data that affects the listbox row functions into the
      row widgets themselves. Another alternative is to call
      [Gtk.ListBox.invalidate_sort] on any model change, but that is more
      expensive. *)

  method get_activatable : unit -> bool
  (** Gets whether the row is activatable. *)

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Gets the child widget of [row]. *)

  method get_header :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Returns the current header of the [row].

      This can be used in a [Gtk.ListBoxUpdateHeaderFunc] to see if there is a
      header set already, and if so to update the state of it. *)

  method get_index : unit -> int
  (** Gets the current index of the [row] in its [GtkListBox] container. *)

  method get_selectable : unit -> bool
  (** Gets whether the row can be selected. *)

  method is_selected : unit -> bool
  (** Returns whether the child is currently selected in its [GtkListBox]
      container. *)

  method set_activatable : bool -> unit
  (** Set whether the row is activatable. *)

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit
  (** Sets the child widget of [self]. *)

  method set_header :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit
  (** Sets the current header of the [row].

      This is only allowed to be called from a [Gtk.ListBoxUpdateHeaderFunc]. It
      will replace any existing header in the row, and be shown in front of the
      row in the listbox. *)

  method set_selectable : bool -> unit
  (** Set whether the row can be selected. *)

  method as_list_box_row : Raw.List_box_row.t
end

class list_box_row : Raw.List_box_row.t -> list_box_row_t
(** Wraps a raw handle of {!Ocgtk.Raw.List_box_row.t}. *)

(** {2:constructors Constructors} *)

val new_ : unit -> list_box_row_t
(** Creates a new [GtkListBoxRow]. *)
