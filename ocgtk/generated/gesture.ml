class type gesture_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .event_controller_t

  (** {2:methods Methods} *)

  method get_device : unit -> Ocgdk.Device.device_t option
  (** Returns the logical [GdkDevice] that is currently operating on [gesture].

      This returns [NULL] if the gesture is not being interacted. *)

  method get_group : unit -> gesture_t list
  (** Returns all gestures in the group of [gesture] *)

  method get_last_event :
    Ocgdk.Event_sequence.event_sequence_t option -> Ocgdk.Event.event_t option
  (** Returns the last event that was processed for [sequence].

      Note that the returned pointer is only valid as long as the [sequence] is
      still interpreted by the [gesture]. If in doubt, you should make a copy of
      the event. *)

  method get_last_updated_sequence :
    unit -> Ocgdk.Event_sequence.event_sequence_t option
  (** Returns the [GdkEventSequence] that was last updated on [gesture]. *)

  method get_sequence_state :
    Ocgdk.Event_sequence.event_sequence_t -> Enums.eventsequencestate
  (** Returns the [sequence] state, as seen by [gesture]. *)

  method get_sequences : unit -> Ocgdk.Event_sequence.event_sequence_t list
  (** Returns the list of [GdkEventSequences] currently being interpreted by
      [gesture]. *)

  method group : gesture_t -> unit
  [@@ocaml.doc
    "Adds [gesture] to the same group than [group_gesture].\n\n\
     Gestures are by default isolated in their own groups.\n\n\
     Both gestures must have been added to the same widget before\n\
     they can be grouped.\n\n\
     When gestures are grouped, the state of [GdkEventSequences]\n\
     is kept in sync for all of those, so calling\n\
     [Gtk.Gesture.set_sequence_state], on one will transfer\n\
     the same value to the others.\n\n\
     Groups also perform an \"implicit grabbing\" of sequences, if a\n\
     [GdkEventSequence] state is set to [GTK_EVENT_SEQUENCE_CLAIMED]\n\
     on one group, every other gesture group attached to the same\n\
     [GtkWidget] will switch the state for that sequence to\n\
     [GTK_EVENT_SEQUENCE_DENIED]."]

  method handles_sequence : Ocgdk.Event_sequence.event_sequence_t option -> bool
  (** Returns [TRUE] if [gesture] is currently handling events corresponding to
      [sequence]. *)

  method is_active : unit -> bool
  (** Returns [TRUE] if the gesture is currently active.

      A gesture is active while there are touch sequences interacting with it.
  *)

  method is_grouped_with : gesture_t -> bool
  (** Returns [TRUE] if both gestures pertain to the same group. *)

  method is_recognized : unit -> bool
  (** Returns [TRUE] if the gesture is currently recognized.

      A gesture is recognized if there are as many interacting touch sequences
      as required by [gesture]. *)

  method set_sequence_state :
    Ocgdk.Event_sequence.event_sequence_t -> Enums.eventsequencestate -> bool
  (** Sets the state of [sequence] in [gesture].

      Sequences start in state [GTK_EVENT_SEQUENCE_NONE], and whenever they
      change state, they can never go back to that state. Likewise, sequences in
      state [GTK_EVENT_SEQUENCE_DENIED] cannot turn back to a not denied state.
      With these rules, the lifetime of an event sequence is constrained to the
      next four:

      - None
      - None → Denied
      - None → Claimed
      - None → Claimed → Denied

      Note: Due to event handling ordering, it may be unsafe to set the state on
      another gesture within a [Gtk.Gesture::begin] signal handler, as the
      callback might be executed before the other gesture knows about the
      sequence. A safe way to perform this could be:

      {[
      static void
      first_gesture_begin_cb (GtkGesture       *first_gesture,
                              GdkEventSequence *sequence,
                              gpointer          user_data)
      {
        gtk_gesture_set_sequence_state (first_gesture, sequence, GTK_EVENT_SEQUENCE_CLAIMED);
        gtk_gesture_set_sequence_state (second_gesture, sequence, GTK_EVENT_SEQUENCE_DENIED);
      }

      static void
      second_gesture_begin_cb (GtkGesture       *second_gesture,
                               GdkEventSequence *sequence,
                               gpointer          user_data)
      {
        if (gtk_gesture_get_sequence_state (first_gesture, sequence) == GTK_EVENT_SEQUENCE_CLAIMED)
          gtk_gesture_set_sequence_state (second_gesture, sequence, GTK_EVENT_SEQUENCE_DENIED);
      }
      ]}

      If both gestures are in the same group, just set the state on the gesture
      emitting the event, the sequence will be already be initialized to the
      group's global state when the second gesture processes the event. *)

  method set_state : Enums.eventsequencestate -> bool
  (** Sets the state of all sequences that [gesture] is currently interacting
      with.

      Sequences start in state [GTK_EVENT_SEQUENCE_NONE], and whenever they
      change state, they can never go back to that state. Likewise, sequences in
      state [GTK_EVENT_SEQUENCE_DENIED] cannot turn back to a not denied state.
      With these rules, the lifetime of an event sequence is constrained to the
      next four:

      - None
      - None → Denied
      - None → Claimed
      - None → Claimed → Denied

      Note: Due to event handling ordering, it may be unsafe to set the state on
      another gesture within a [Gtk.Gesture::begin] signal handler, as the
      callback might be executed before the other gesture knows about the
      sequence. A safe way to perform this could be:

      {[
      static void
      first_gesture_begin_cb (GtkGesture       *first_gesture,
                              GdkEventSequence *sequence,
                              gpointer          user_data)
      {
        gtk_gesture_set_state (first_gesture, GTK_EVENT_SEQUENCE_CLAIMED);
        gtk_gesture_set_state (second_gesture, GTK_EVENT_SEQUENCE_DENIED);
      }

      static void
      second_gesture_begin_cb (GtkGesture       *second_gesture,
                               GdkEventSequence *sequence,
                               gpointer          user_data)
      {
        if (gtk_gesture_get_sequence_state (first_gesture, sequence) == GTK_EVENT_SEQUENCE_CLAIMED)
          gtk_gesture_set_state (second_gesture, GTK_EVENT_SEQUENCE_DENIED);
      }
      ]}

      If both gestures are in the same group, just set the state on the gesture
      emitting the event, the sequence will be already be initialized to the
      group's global state when the second gesture processes the event. *)

  method ungroup : unit -> unit
  (** Separates [gesture] into an isolated group. *)

  (** {2:properties Properties} *)

  method n_points : int
  (** The number of touch points that trigger recognition on this gesture. *)

  (** {2:conversions Conversions} *)

  method as_gesture : Raw.Gesture.t
end

(* High-level class for Gesture *)
class gesture (obj : Raw.Gesture.t) : gesture_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .event_controller
        (obj :> Raw.Event_controller.t)

    method get_device : unit -> Ocgdk.Device.device_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgdk.Device.device ret)
          (Raw.Gesture.get_device obj)

    method get_group : unit -> gesture_t list =
      fun () ->
        (List.map (fun ret -> new gesture ret)) (Raw.Gesture.get_group obj)

    method get_last_event :
        Ocgdk.Event_sequence.event_sequence_t option ->
        Ocgdk.Event.event_t option =
      fun sequence ->
        let sequence = Option.map (fun c -> c#as_event_sequence) sequence in
        Option.map
          (fun ret -> new Ocgdk.Event.event ret)
          (Raw.Gesture.get_last_event obj sequence)

    method get_last_updated_sequence :
        unit -> Ocgdk.Event_sequence.event_sequence_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgdk.Event_sequence.event_sequence ret)
          (Raw.Gesture.get_last_updated_sequence obj)

    method get_sequence_state :
        Ocgdk.Event_sequence.event_sequence_t -> Enums.eventsequencestate =
      fun sequence ->
        let sequence = sequence#as_event_sequence in
        Raw.Gesture.get_sequence_state obj sequence

    method get_sequences : unit -> Ocgdk.Event_sequence.event_sequence_t list =
      fun () ->
        (List.map (fun ret -> new Ocgdk.Event_sequence.event_sequence ret))
          (Raw.Gesture.get_sequences obj)

    method group : gesture_t -> unit =
      fun gesture ->
        let gesture = gesture#as_gesture in
        Raw.Gesture.group obj gesture

    method handles_sequence :
        Ocgdk.Event_sequence.event_sequence_t option -> bool =
      fun sequence ->
        let sequence = Option.map (fun c -> c#as_event_sequence) sequence in
        Raw.Gesture.handles_sequence obj sequence

    method is_active : unit -> bool = fun () -> Raw.Gesture.is_active obj

    method is_grouped_with : gesture_t -> bool =
      fun other ->
        let other = other#as_gesture in
        Raw.Gesture.is_grouped_with obj other

    method is_recognized : unit -> bool =
      fun () -> Raw.Gesture.is_recognized obj

    method set_sequence_state :
        Ocgdk.Event_sequence.event_sequence_t ->
        Enums.eventsequencestate ->
        bool =
      fun sequence state ->
        let sequence = sequence#as_event_sequence in
        Raw.Gesture.set_sequence_state obj sequence state

    method set_state : Enums.eventsequencestate -> bool =
      fun state -> Raw.Gesture.set_state obj state

    method ungroup : unit -> unit = fun () -> Raw.Gesture.ungroup obj
    method n_points = Raw.Gesture.get_n_points obj
    method as_gesture = obj
  end
