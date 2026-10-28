class type action_bar_t = object
  inherit Widget.widget_t

  (** {2:methods Methods} *)

  method get_center_widget : unit -> Widget.widget_t option
  (** Retrieves the center bar widget of the bar. *)

  method get_revealed : unit -> bool
  (** Gets whether the contents of the action bar are revealed. *)

  method pack_end : Widget.widget_t -> unit
  (** Adds a child to the action bar, packed with reference to the end of the
      action bar. *)

  method pack_start : Widget.widget_t -> unit
  (** Adds a child to the action, packed with reference to the start of the
      action bar. *)

  method remove : Widget.widget_t -> unit
  (** Removes a child from the action bar. *)

  method set_center_widget : Widget.widget_t option -> unit
  (** Sets the center widget for the action bar. *)

  method set_revealed : bool -> unit
  (** Reveals or conceals the content of the action bar.

      Note: this does not show or hide the action bar in the
      [Gtk.Widget:visible] sense, so revealing has no effect if the action bar
      is hidden. *)

  (** {2:conversions Conversions} *)

  method as_action_bar : Raw.Action_bar.t
end

(* High-level class for ActionBar *)
class action_bar (obj : Raw.Action_bar.t) : action_bar_t =
  object (self)
    inherit Widget.widget (obj :> Raw.Widget.t)

    method get_center_widget : unit -> Widget.widget_t option =
      fun () ->
        Option.map
          (fun ret -> new Widget.widget ret)
          (Raw.Action_bar.get_center_widget obj)

    method get_revealed : unit -> bool =
      fun () -> Raw.Action_bar.get_revealed obj

    method pack_end : Widget.widget_t -> unit =
      fun child ->
        let child = child#as_widget in
        Raw.Action_bar.pack_end obj child

    method pack_start : Widget.widget_t -> unit =
      fun child ->
        let child = child#as_widget in
        Raw.Action_bar.pack_start obj child

    method remove : Widget.widget_t -> unit =
      fun child ->
        let child = child#as_widget in
        Raw.Action_bar.remove obj child

    method set_center_widget : Widget.widget_t option -> unit =
      fun center_widget ->
        let center_widget = Option.map (fun c -> c#as_widget) center_widget in
        Raw.Action_bar.set_center_widget obj center_widget

    method set_revealed : bool -> unit =
      fun revealed -> Raw.Action_bar.set_revealed obj revealed

    method as_action_bar = obj
  end

let new_ () : action_bar_t = new action_bar (Raw.Action_bar.new_ ())
