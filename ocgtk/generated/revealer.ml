class type revealer_t = object
  inherit Widget.widget_t

  (** {2:methods Methods} *)

  method get_child : unit -> Widget.widget_t option
  (** Gets the child widget of [revealer]. *)

  method get_child_revealed : unit -> bool
  (** Returns whether the child is fully revealed.

      In other words, this returns whether the transition to the revealed state
      is completed. *)

  method get_reveal_child : unit -> bool
  (** Returns whether the child is currently revealed.

      This function returns [true] as soon as the transition is to the revealed
      state is started. To learn whether the child is fully revealed (ie the
      transition is completed), use [Gtk.Revealer.get_child_revealed]. *)

  method get_transition_duration : unit -> int
  (** Returns the amount of time (in milliseconds) that transitions will take.
  *)

  method get_transition_type : unit -> Enums.revealertransitiontype
  (** Gets the type of animation that will be used for transitions in
      [revealer]. *)

  method set_child : Widget.widget_t option -> unit
  (** Sets the child widget of [revealer]. *)

  method set_reveal_child : bool -> unit
  (** Tells the [GtkRevealer] to reveal or conceal its child.

      The transition will be animated with the current transition type of
      [revealer]. *)

  method set_transition_duration : int -> unit
  (** Sets the duration that transitions will take. *)

  method set_transition_type : Enums.revealertransitiontype -> unit
  (** Sets the type of animation that will be used for transitions in
      [revealer].

      Available types include various kinds of fades and slides. *)

  (** {2:conversions Conversions} *)

  method as_revealer : Raw.Revealer.t
end

(* High-level class for Revealer *)
class revealer (obj : Raw.Revealer.t) : revealer_t =
  object (self)
    inherit Widget.widget (obj :> Raw.Widget.t)

    method get_child : unit -> Widget.widget_t option =
      fun () ->
        Option.map
          (fun ret -> new Widget.widget ret)
          (Raw.Revealer.get_child obj)

    method get_child_revealed : unit -> bool =
      fun () -> Raw.Revealer.get_child_revealed obj

    method get_reveal_child : unit -> bool =
      fun () -> Raw.Revealer.get_reveal_child obj

    method get_transition_duration : unit -> int =
      fun () -> Raw.Revealer.get_transition_duration obj

    method get_transition_type : unit -> Enums.revealertransitiontype =
      fun () -> Raw.Revealer.get_transition_type obj

    method set_child : Widget.widget_t option -> unit =
      fun child ->
        let child = Option.map (fun c -> c#as_widget) child in
        Raw.Revealer.set_child obj child

    method set_reveal_child : bool -> unit =
      fun reveal_child -> Raw.Revealer.set_reveal_child obj reveal_child

    method set_transition_duration : int -> unit =
      fun duration -> Raw.Revealer.set_transition_duration obj duration

    method set_transition_type : Enums.revealertransitiontype -> unit =
      fun transition -> Raw.Revealer.set_transition_type obj transition

    method as_revealer = obj
  end

let new_ () : revealer_t = new revealer (Raw.Revealer.new_ ())
