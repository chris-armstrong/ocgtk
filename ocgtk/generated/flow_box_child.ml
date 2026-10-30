class type flow_box_child_t = object
  inherit Widget.widget_t

  (** {2:signals Signals} *)

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the user activates a child widget in a [GtkFlowBox].

      This can happen either by clicking or double-clicking, or via a
      keybinding.

      This is a keybinding signal, but it can be used by applications for their
      own purposes.

      The default bindings are <kbd>Space</kbd> and <kbd>Enter</kbd>. *)

  (** {2:methods Methods} *)

  method changed : unit -> unit
  (** Marks [child] as changed, causing any state that depends on this to be
      updated.

      This affects sorting and filtering.

      Note that calls to this method must be in sync with the data used for the
      sorting and filtering functions. For instance, if the list is mirroring
      some external data set, and {i two} children changed in the external data
      set when you call [gtk_flow_box_child_changed ()] on the first child, the
      sort function must only read the new data for the first of the two changed
      children, otherwise the resorting of the children will be wrong.

      This generally means that if you don’t fully control the data model, you
      have to duplicate the data that affects the sorting and filtering
      functions into the widgets themselves.

      Another alternative is to call [Gtk.FlowBox.invalidate_sort] on any model
      change, but that is more expensive. *)

  method get_child : unit -> Widget.widget_t option
  (** Gets the child widget of [self]. *)

  method get_index : unit -> int
  (** Gets the current index of the [child] in its [GtkFlowBox] container. *)

  method is_selected : unit -> bool
  (** Returns whether the [child] is currently selected in its [GtkFlowBox]
      container. *)

  method set_child : Widget.widget_t option -> unit
  (** Sets the child widget of [self]. *)

  (** {2:conversions Conversions} *)

  method as_flow_box_child : Raw.Flow_box_child.t
end

(* High-level class for FlowBoxChild *)
class flow_box_child (obj : Raw.Flow_box_child.t) : flow_box_child_t =
  object (self)
    inherit Widget.widget (obj :> Raw.Widget.t)

    method on_activate ?(after = false) ~callback () =
      Raw.Flow_box_child.on_activate ~after self#as_flow_box_child ~callback

    method changed : unit -> unit = fun () -> Raw.Flow_box_child.changed obj

    method get_child : unit -> Widget.widget_t option =
      fun () ->
        Option.map
          (fun ret -> new Widget.widget ret)
          (Raw.Flow_box_child.get_child obj)

    method get_index : unit -> int = fun () -> Raw.Flow_box_child.get_index obj

    method is_selected : unit -> bool =
      fun () -> Raw.Flow_box_child.is_selected obj

    method set_child : Widget.widget_t option -> unit =
      fun child ->
        let child = Option.map (fun c -> c#as_widget) child in
        Raw.Flow_box_child.set_child obj child

    method as_flow_box_child = obj
  end

let new_ () : flow_box_child_t = new flow_box_child (Raw.Flow_box_child.new_ ())
