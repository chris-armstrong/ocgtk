class type editable_label_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Editable.editable_t

  method get_editing : unit -> bool
  (** Returns whether the label is currently in “editing mode”. *)

  method start_editing : unit -> unit
  (** Switches the label into “editing mode”. *)

  method stop_editing : bool -> unit
  (** Switches the label out of “editing mode”.

      If [commit] is [TRUE], the resulting text is kept as the
      [Gtk.Editable:text] property value, otherwise the resulting text is
      discarded and the label will keep its previous [Gtk.Editable:text]
      property value. *)

  method as_editable_label : Raw.Editable_label.t
end

(* High-level class for EditableLabel *)
class editable_label (obj : Raw.Editable_label.t) : editable_label_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    inherit Editable.editable (Raw.Editable.from_gobject obj)

    method get_editing : unit -> bool =
      fun () -> Raw.Editable_label.get_editing obj

    method start_editing : unit -> unit =
      fun () -> Raw.Editable_label.start_editing obj

    method stop_editing : bool -> unit =
      fun commit -> Raw.Editable_label.stop_editing obj commit

    method as_editable_label = obj
  end

let new_ (str : string) : editable_label_t =
  let obj_ = Raw.Editable_label.new_ str in
  new editable_label obj_
