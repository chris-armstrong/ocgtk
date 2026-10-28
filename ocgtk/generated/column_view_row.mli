(** Configures how rows are displayed in a [Gtk.ColumnView].

    Its methods, signals and properties are on {!class-type-column_view_row_t}.
    Its full description is under {!section-description}. The functions it is
    built on are in {!Ocgtk.Raw.Column_view_row}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [ColumnViewRow].}

    Inherits from: [GObject.Object]

    Configures how rows are displayed in a [Gtk.ColumnView].

    It is not used to set the widgets displayed in the individual cells. For
    that see [GtkColumnViewColumn.set_factory] and [GtkColumnViewCell]. *)
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

class column_view_row : Raw.Column_view_row.t -> column_view_row_t
(** Wraps a raw handle of {!Ocgtk.Raw.Column_view_row.t}. *)

(** {1:description Description}

    Configures how rows are displayed in a [Gtk.ColumnView].

    It is not used to set the widgets displayed in the individual cells. For
    that see [GtkColumnViewColumn.set_factory] and [GtkColumnViewCell]. *)
