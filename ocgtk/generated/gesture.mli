(** The base class for gesture recognition.

    Its methods, signals and properties are on {!class-type-gesture_t}. Its full
    description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Gesture}. *)

(** {1:class Class} *)

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
  [@@ocaml.doc
    "{b The methods, signals and properties of a [Gesture].}\n\n\
     Inherits from: \
     {{!Ocgtk.Event_controller.class-type-event_controller_t}Ocgtk.Event_controller}\n\n\
     The base class for gesture recognition.\n\n\
     Although [GtkGesture] is quite generalized to serve as a base for\n\
     multi-touch gestures, it is suitable to implement single-touch and\n\
     pointer-based gestures (using the special [NULL] [GdkEventSequence]\n\
     value for these).\n\n\
     The number of touches that a [GtkGesture] need to be recognized is\n\
     controlled by the [Gtk.Gesture:n-points] property, if a\n\
     gesture is keeping track of less or more than that number of sequences,\n\
     it won't check whether the gesture is recognized.\n\n\
     As soon as the gesture has the expected number of touches, it will check\n\
     regularly if it is recognized, the criteria to consider a gesture as\n\
     \"recognized\" is left to [GtkGesture] subclasses.\n\n\
     A recognized gesture will then emit the following signals:\n\n\
     - [Gtk.Gesture::begin] when the gesture is recognized.\n\
     - [Gtk.Gesture::update], whenever an input event is processed.\n\
     - [Gtk.Gesture::end] when the gesture is no longer recognized.\n\n\
     {b Event propagation}\n\n\
     In order to receive events, a gesture needs to set a propagation phase\n\
     through [Gtk.EventController.set_propagation_phase].\n\n\
     In the capture phase, events are propagated from the toplevel down\n\
     to the target widget, and gestures that are attached to containers\n\
     above the widget get a chance to interact with the event before it\n\
     reaches the target.\n\n\
     In the bubble phase, events are propagated up from the target widget\n\
     to the toplevel, and gestures that are attached to containers above\n\
     the widget get a chance to interact with events that have not been\n\
     handled yet.\n\n\
     {b States of a sequence}\n\n\
     Whenever input interaction happens, a single event may trigger a cascade\n\
     of [GtkGesture]s, both across the parents of the widget receiving the\n\
     event and in parallel within an individual widget. It is a responsibility\n\
     of the widgets using those gestures to set the state of touch sequences\n\
     accordingly in order to enable cooperation of gestures around the\n\
     [GdkEventSequence]s triggering those.\n\n\
     Within a widget, gestures can be grouped through [Gtk.Gesture.group].\n\
     Grouped gestures synchronize the state of sequences, so calling\n\
     [Gtk.Gesture.set_state] on one will effectively propagate\n\
     the state throughout the group.\n\n\
     By default, all sequences start out in the [GTK_EVENT_SEQUENCE_NONE] state,\n\
     sequences in this state trigger the gesture event handler, but event\n\
     propagation will continue unstopped by gestures.\n\n\
     If a sequence enters into the [GTK_EVENT_SEQUENCE_DENIED] state, the \
     gesture\n\
     group will effectively ignore the sequence, letting events go unstopped\n\
     through the gesture, but the \"slot\" will still remain occupied while\n\
     the touch is active.\n\n\
     If a sequence enters in the [GTK_EVENT_SEQUENCE_CLAIMED] state, the gesture\n\
     group will grab all interaction on the sequence, by:\n\n\
     - Setting the same sequence to [GTK_EVENT_SEQUENCE_DENIED] on every other\n\
     gesture group within the widget, and every gesture on parent widgets\n\
     in the propagation chain.\n\
     - Emitting [Gtk.Gesture::cancel] on every gesture in widgets\n\
     underneath in the propagation chain.\n\
     - Stopping event propagation after the gesture group handles the event.\n\n\
     Note: if a sequence is set early to [GTK_EVENT_SEQUENCE_CLAIMED] on\n\
     [GDK_TOUCH_BEGIN]/[GDK_BUTTON_PRESS] (so those events are captured before\n\
     reaching the event widget, this implies [GTK_PHASE_CAPTURE]), one similar\n\
     event will be emulated if the sequence changes to \
     [GTK_EVENT_SEQUENCE_DENIED].\n\
     This way event coherence is preserved before event propagation is unstopped\n\
     again.\n\n\
     Sequence states can't be changed freely.\n\
     See [Gtk.Gesture.set_state] to know about the possible\n\
     lifetimes of a [GdkEventSequence].\n\n\
     {b Touchpad gestures}\n\n\
     On the platforms that support it, [GtkGesture] will handle transparently\n\
     touchpad gesture events. The only precautions users of [GtkGesture] should\n\
     do to enable this support are:\n\n\
     - If the gesture has [GTK_PHASE_NONE], ensuring events of type\n\
     [GDK_TOUCHPAD_SWIPE] and [GDK_TOUCHPAD_PINCH] are handled by the \
     [GtkGesture]"]

class gesture : Raw.Gesture.t -> gesture_t
(** Wraps a raw handle of {!Ocgtk.Raw.Gesture.t}. *)

[@@@ocaml.text
"{1:description Description}\n\n\
 The base class for gesture recognition.\n\n\
 Although [GtkGesture] is quite generalized to serve as a base for\n\
 multi-touch gestures, it is suitable to implement single-touch and\n\
 pointer-based gestures (using the special [NULL] [GdkEventSequence]\n\
 value for these).\n\n\
 The number of touches that a [GtkGesture] need to be recognized is\n\
 controlled by the [Gtk.Gesture:n-points] property, if a\n\
 gesture is keeping track of less or more than that number of sequences,\n\
 it won't check whether the gesture is recognized.\n\n\
 As soon as the gesture has the expected number of touches, it will check\n\
 regularly if it is recognized, the criteria to consider a gesture as\n\
 \"recognized\" is left to [GtkGesture] subclasses.\n\n\
 A recognized gesture will then emit the following signals:\n\n\
 - [Gtk.Gesture::begin] when the gesture is recognized.\n\
 - [Gtk.Gesture::update], whenever an input event is processed.\n\
 - [Gtk.Gesture::end] when the gesture is no longer recognized.\n\n\
 {b Event propagation}\n\n\
 In order to receive events, a gesture needs to set a propagation phase\n\
 through [Gtk.EventController.set_propagation_phase].\n\n\
 In the capture phase, events are propagated from the toplevel down\n\
 to the target widget, and gestures that are attached to containers\n\
 above the widget get a chance to interact with the event before it\n\
 reaches the target.\n\n\
 In the bubble phase, events are propagated up from the target widget\n\
 to the toplevel, and gestures that are attached to containers above\n\
 the widget get a chance to interact with events that have not been\n\
 handled yet.\n\n\
 {b States of a sequence}\n\n\
 Whenever input interaction happens, a single event may trigger a cascade\n\
 of [GtkGesture]s, both across the parents of the widget receiving the\n\
 event and in parallel within an individual widget. It is a responsibility\n\
 of the widgets using those gestures to set the state of touch sequences\n\
 accordingly in order to enable cooperation of gestures around the\n\
 [GdkEventSequence]s triggering those.\n\n\
 Within a widget, gestures can be grouped through [Gtk.Gesture.group].\n\
 Grouped gestures synchronize the state of sequences, so calling\n\
 [Gtk.Gesture.set_state] on one will effectively propagate\n\
 the state throughout the group.\n\n\
 By default, all sequences start out in the [GTK_EVENT_SEQUENCE_NONE] state,\n\
 sequences in this state trigger the gesture event handler, but event\n\
 propagation will continue unstopped by gestures.\n\n\
 If a sequence enters into the [GTK_EVENT_SEQUENCE_DENIED] state, the gesture\n\
 group will effectively ignore the sequence, letting events go unstopped\n\
 through the gesture, but the \"slot\" will still remain occupied while\n\
 the touch is active.\n\n\
 If a sequence enters in the [GTK_EVENT_SEQUENCE_CLAIMED] state, the gesture\n\
 group will grab all interaction on the sequence, by:\n\n\
 - Setting the same sequence to [GTK_EVENT_SEQUENCE_DENIED] on every other\n\
 gesture group within the widget, and every gesture on parent widgets\n\
 in the propagation chain.\n\
 - Emitting [Gtk.Gesture::cancel] on every gesture in widgets\n\
 underneath in the propagation chain.\n\
 - Stopping event propagation after the gesture group handles the event.\n\n\
 Note: if a sequence is set early to [GTK_EVENT_SEQUENCE_CLAIMED] on\n\
 [GDK_TOUCH_BEGIN]/[GDK_BUTTON_PRESS] (so those events are captured before\n\
 reaching the event widget, this implies [GTK_PHASE_CAPTURE]), one similar\n\
 event will be emulated if the sequence changes to [GTK_EVENT_SEQUENCE_DENIED].\n\
 This way event coherence is preserved before event propagation is unstopped\n\
 again.\n\n\
 Sequence states can't be changed freely.\n\
 See [Gtk.Gesture.set_state] to know about the possible\n\
 lifetimes of a [GdkEventSequence].\n\n\
 {b Touchpad gestures}\n\n\
 On the platforms that support it, [GtkGesture] will handle transparently\n\
 touchpad gesture events. The only precautions users of [GtkGesture] should\n\
 do to enable this support are:\n\n\
 - If the gesture has [GTK_PHASE_NONE], ensuring events of type\n\
 [GDK_TOUCHPAD_SWIPE] and [GDK_TOUCHPAD_PINCH] are handled by the [GtkGesture]"]

(** {1:constructors Constructors} *)

(** This is an abstract class that can't be instantiated directly. Refer to its
    subclasses for a concrete implementation. *)
