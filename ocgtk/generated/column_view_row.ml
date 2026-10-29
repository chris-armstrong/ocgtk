class type column_view_row_t = object
  (** {2:methods Methods} *)

  method get_accessible_description : unit -> string
  (** Gets the accessible description of [self]. *)

  method get_accessible_label : unit -> string
  (** Gets the accessible label of [self]. *)

  method get_activatable : unit -> bool
  (** Checks if the row has been set to be activatable via
      gtk_column_view_row_set_activatable(). *)

  method get_focusable : unit -> bool
  (** Checks if a row item has been set to be focusable via
      gtk_column_view_row_set_focusable(). *)

  method get_item : unit -> [ `object_ ] Gobject.obj option
  (** Gets the model item that associated with [self].

      If [self] is unbound, this function returns [NULL]. *)

  method get_position : unit -> int
  (** Gets the position in the model that [self] currently displays.

      If [self] is unbound, [GTK_INVALID_LIST_POSITION] is returned. *)

  method get_selectable : unit -> bool
  (** Checks if the row has been set to be selectable via
      gtk_column_view_row_set_selectable().

      Do not confuse this function with [Gtk.ColumnViewRow.get_selected]. *)

  method get_selected : unit -> bool
  (** Checks if the item is selected that this row corresponds to.

      The selected state is maintained by the list widget and its model and
      cannot be set otherwise. *)

  method set_accessible_description : string -> unit
  (** Sets the accessible description for the row, which may be used by e.g.
      screen readers. *)

  method set_accessible_label : string -> unit
  (** Sets the accessible label for the row, which may be used by e.g. screen
      readers. *)

  method set_activatable : bool -> unit
  (** Sets [self] to be activatable.

      If a row is activatable, double-clicking on the row, using the Return key
      or calling gtk_widget_activate() will activate the row. Activating
      instructs the containing columnview to emit the [Gtk.ColumnView::activate]
      signal.

      By default, row are activatable. *)

  method set_focusable : bool -> unit
  (** Sets [self] to be focusable.

      If a row is focusable, it can be focused using the keyboard. This works
      similar to [Gtk.Widget.set_focusable].

      Note that if row are not focusable, the contents of cells can still be
      focused if they are focusable.

      By default, rows are focusable. *)

  method set_selectable : bool -> unit
  (** Sets [self] to be selectable.

      If a row is selectable, clicking on the row or using the keyboard will try
      to select or unselect the row. Whether this succeeds is up to the model to
      determine, as it is managing the selected state.

      Note that this means that making a row non-selectable has no influence on
      the selected state at all. A non-selectable row may still be selected.

      By default, rows are selectable. *)

  (** {2:conversions Conversions} *)

  method as_column_view_row : Raw.Column_view_row.t
end

(* High-level class for ColumnViewRow *)
class column_view_row (obj : Raw.Column_view_row.t) : column_view_row_t =
  object (self)
    method get_accessible_description : unit -> string =
      fun () -> Raw.Column_view_row.get_accessible_description obj

    method get_accessible_label : unit -> string =
      fun () -> Raw.Column_view_row.get_accessible_label obj

    method get_activatable : unit -> bool =
      fun () -> Raw.Column_view_row.get_activatable obj

    method get_focusable : unit -> bool =
      fun () -> Raw.Column_view_row.get_focusable obj

    method get_item : unit -> [ `object_ ] Gobject.obj option =
      fun () -> Raw.Column_view_row.get_item obj

    method get_position : unit -> int =
      fun () -> Raw.Column_view_row.get_position obj

    method get_selectable : unit -> bool =
      fun () -> Raw.Column_view_row.get_selectable obj

    method get_selected : unit -> bool =
      fun () -> Raw.Column_view_row.get_selected obj

    method set_accessible_description : string -> unit =
      fun description ->
        Raw.Column_view_row.set_accessible_description obj description

    method set_accessible_label : string -> unit =
      fun label -> Raw.Column_view_row.set_accessible_label obj label

    method set_activatable : bool -> unit =
      fun activatable -> Raw.Column_view_row.set_activatable obj activatable

    method set_focusable : bool -> unit =
      fun focusable -> Raw.Column_view_row.set_focusable obj focusable

    method set_selectable : bool -> unit =
      fun selectable -> Raw.Column_view_row.set_selectable obj selectable

    method as_column_view_row = obj
  end
