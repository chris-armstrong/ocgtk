(** Represents items in a cell in [Gtk.ColumnView].

    Its methods, signals and properties are on {!class-type-column_view_cell_t}.
    Its full description is under {!section-description}. The functions it is
    built on are in {!Ocgtk.Raw.Column_view_cell}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [ColumnViewCell].}

    Inherits from: {{!Ocgtk.List_item.class-type-list_item_t}Ocgtk.List_item}

    Represents items in a cell in [Gtk.ColumnView].

    The [GtkColumnViewCell]s are managed by the [Gtk.ColumnView] widget (with
    its factory) and cannot be created by applications, but they need to be
    populated by application code. This is done by calling
    [Gtk.ColumnViewCell.set_child].

    [GtkColumnViewCell]s exist in 2 stages:

    + The unbound stage where the listitem is not currently connected to an item
      in the list. In that case, the [Gtk.ColumnViewCell:item] property is set
      to [NULL].

    + The bound stage where the listitem references an item from the list. The
      [Gtk.ColumnViewCell:item] property is not [NULL]. *)
class type column_view_cell_t = object
  inherit List_item.list_item_t

  (** {2:conversions Conversions} *)

  method as_column_view_cell : Raw.Column_view_cell.t
end

class column_view_cell : Raw.Column_view_cell.t -> column_view_cell_t
(** Wraps a raw handle of {!Ocgtk.Raw.Column_view_cell.t}. *)

(** {1:description Description}

    Represents items in a cell in [Gtk.ColumnView].

    The [GtkColumnViewCell]s are managed by the [Gtk.ColumnView] widget (with
    its factory) and cannot be created by applications, but they need to be
    populated by application code. This is done by calling
    [Gtk.ColumnViewCell.set_child].

    [GtkColumnViewCell]s exist in 2 stages:

    + The unbound stage where the listitem is not currently connected to an item
      in the list. In that case, the [Gtk.ColumnViewCell:item] property is set
      to [NULL].

    + The bound stage where the listitem references an item from the list. The
      [Gtk.ColumnViewCell:item] property is not [NULL]. *)
