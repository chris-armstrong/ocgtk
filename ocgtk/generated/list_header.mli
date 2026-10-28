(** Used by list widgets to represent the headers they display.

    Its methods, signals and properties are on {!class-type-list_header_t}. Its
    full description is under {!section-description}. The functions it is built
    on are in {!Ocgtk.Raw.List_header}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [ListHeader].}

    Used by list widgets to represent the headers they display.

    [GtkListHeader] objects are managed just like [Gtk.ListItem] objects via
    their factory, but provide a different set of properties suitable for
    managing the header instead of individual items. *)
class type list_header_t = object
  (** {2:methods Methods} *)

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Gets the child previously set via gtk_list_header_set_child() or [NULL] if
      none was set. *)

  method get_end : unit -> int
  (** Gets the end position in the model of the section that [self] is currently
      the header for.

      If [self] is unbound, [GTK_INVALID_LIST_POSITION] is returned. *)

  method get_item : unit -> [ `object_ ] Gobject.obj option
  (** Gets the model item at the start of the section. This is the item that
      occupies the list model at position [Gtk.ListHeader:start].

      If [self] is unbound, this function returns [NULL]. *)

  method get_n_items : unit -> int
  (** Gets the the number of items in the section.

      If [self] is unbound, 0 is returned. *)

  method get_start : unit -> int
  (** Gets the start position in the model of the section that [self] is
      currently the header for.

      If [self] is unbound, [GTK_INVALID_LIST_POSITION] is returned. *)

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit
  (** Sets the child to be used for this listitem.

      This function is typically called by applications when setting up a header
      so that the widget can be reused when binding it multiple times. *)

  (** {2:conversions Conversions} *)

  method as_list_header : Raw.List_header.t
end

class list_header : Raw.List_header.t -> list_header_t
(** Wraps a raw handle of {!Ocgtk.Raw.List_header.t}. *)

(** {1:description Description}

    Used by list widgets to represent the headers they display.

    [GtkListHeader] objects are managed just like [Gtk.ListItem] objects via
    their factory, but provide a different set of properties suitable for
    managing the header instead of individual items. *)
