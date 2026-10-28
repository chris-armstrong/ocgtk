class type list_box_row_t = object
  inherit Widget.widget_t
  inherit Actionable.actionable_t

  (** {2:signals Signals} *)

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** This is a keybinding signal, which will cause this row to be activated.

      If you want to be notified when the user activates a row (by key or not),
      use the [Gtk.ListBox::row-activated] signal on the row’s parent
      [GtkListBox]. *)

  (** {2:methods Methods} *)

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

  method get_child : unit -> Widget.widget_t option
  (** Gets the child widget of [row]. *)

  method get_header : unit -> Widget.widget_t option
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

  method set_child : Widget.widget_t option -> unit
  (** Sets the child widget of [self]. *)

  method set_header : Widget.widget_t option -> unit
  (** Sets the current header of the [row].

      This is only allowed to be called from a [Gtk.ListBoxUpdateHeaderFunc]. It
      will replace any existing header in the row, and be shown in front of the
      row in the listbox. *)

  method set_selectable : bool -> unit
  (** Set whether the row can be selected. *)

  (** {2:conversions Conversions} *)

  method as_list_box_row : Raw.List_box_row.t
end

(* High-level class for ListBoxRow *)
class list_box_row (obj : Raw.List_box_row.t) : list_box_row_t =
  object (self)
    inherit Widget.widget (obj :> Raw.Widget.t)
    inherit Actionable.actionable (Raw.Actionable.from_gobject obj)

    method on_activate ?(after = false) ~callback () =
      Raw.List_box_row.on_activate ~after self#as_list_box_row ~callback

    method changed : unit -> unit = fun () -> Raw.List_box_row.changed obj

    method get_activatable : unit -> bool =
      fun () -> Raw.List_box_row.get_activatable obj

    method get_child : unit -> Widget.widget_t option =
      fun () ->
        Option.map
          (fun ret -> new Widget.widget ret)
          (Raw.List_box_row.get_child obj)

    method get_header : unit -> Widget.widget_t option =
      fun () ->
        Option.map
          (fun ret -> new Widget.widget ret)
          (Raw.List_box_row.get_header obj)

    method get_index : unit -> int = fun () -> Raw.List_box_row.get_index obj

    method get_selectable : unit -> bool =
      fun () -> Raw.List_box_row.get_selectable obj

    method is_selected : unit -> bool =
      fun () -> Raw.List_box_row.is_selected obj

    method set_activatable : bool -> unit =
      fun activatable -> Raw.List_box_row.set_activatable obj activatable

    method set_child : Widget.widget_t option -> unit =
      fun child ->
        let child = Option.map (fun c -> c#as_widget) child in
        Raw.List_box_row.set_child obj child

    method set_header : Widget.widget_t option -> unit =
      fun header ->
        let header = Option.map (fun c -> c#as_widget) header in
        Raw.List_box_row.set_header obj header

    method set_selectable : bool -> unit =
      fun selectable -> Raw.List_box_row.set_selectable obj selectable

    method as_list_box_row = obj
  end

let new_ () : list_box_row_t = new list_box_row (Raw.List_box_row.new_ ())
