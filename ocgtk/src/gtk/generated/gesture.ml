(* GENERATED CODE - DO NOT EDIT *)
(* Gesture: Gesture *)

[@@@ocaml.text
"The base class for gesture recognition.\n\n\
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

type t = [ `gesture | `event_controller | `object_ ] Gobject.obj

(* Methods *)

external ungroup : t -> unit = "ml_gtk_gesture_ungroup"
(** Separates [gesture] into an isolated group. *)

external set_state : t -> Gtk_enums.eventsequencestate -> bool
  = "ml_gtk_gesture_set_state"
(** Sets the state of all sequences that [gesture] is currently interacting
    with.

    Sequences start in state [GTK_EVENT_SEQUENCE_NONE], and whenever they change
    state, they can never go back to that state. Likewise, sequences in state
    [GTK_EVENT_SEQUENCE_DENIED] cannot turn back to a not denied state. With
    these rules, the lifetime of an event sequence is constrained to the next
    four:

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

external set_sequence_state :
  t ->
  Ocgtk_gdk.Gdk.Wrappers.Event_sequence.t ->
  Gtk_enums.eventsequencestate ->
  bool = "ml_gtk_gesture_set_sequence_state"
(** Sets the state of [sequence] in [gesture].

    Sequences start in state [GTK_EVENT_SEQUENCE_NONE], and whenever they change
    state, they can never go back to that state. Likewise, sequences in state
    [GTK_EVENT_SEQUENCE_DENIED] cannot turn back to a not denied state. With
    these rules, the lifetime of an event sequence is constrained to the next
    four:

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

external is_recognized : t -> bool = "ml_gtk_gesture_is_recognized"
(** Returns [TRUE] if the gesture is currently recognized.

    A gesture is recognized if there are as many interacting touch sequences as
    required by [gesture]. *)

external is_grouped_with : t -> t -> bool = "ml_gtk_gesture_is_grouped_with"
(** Returns [TRUE] if both gestures pertain to the same group. *)

external is_active : t -> bool = "ml_gtk_gesture_is_active"
(** Returns [TRUE] if the gesture is currently active.

    A gesture is active while there are touch sequences interacting with it. *)

external handles_sequence :
  t -> Ocgtk_gdk.Gdk.Wrappers.Event_sequence.t option -> bool
  = "ml_gtk_gesture_handles_sequence"
(** Returns [TRUE] if [gesture] is currently handling events corresponding to
    [sequence]. *)

external group : t -> t -> unit = "ml_gtk_gesture_group"
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

external get_sequences : t -> Ocgtk_gdk.Gdk.Wrappers.Event_sequence.t list
  = "ml_gtk_gesture_get_sequences"
(** Returns the list of [GdkEventSequences] currently being interpreted by
    [gesture]. *)

external get_sequence_state :
  t -> Ocgtk_gdk.Gdk.Wrappers.Event_sequence.t -> Gtk_enums.eventsequencestate
  = "ml_gtk_gesture_get_sequence_state"
(** Returns the [sequence] state, as seen by [gesture]. *)

external get_point :
  t -> Ocgtk_gdk.Gdk.Wrappers.Event_sequence.t option -> bool * float * float
  = "ml_gtk_gesture_get_point"
(** If [sequence] is currently being interpreted by [gesture], returns [TRUE]
    and fills in [x] and [y] with the last coordinates stored for that event
    sequence.

    The coordinates are always relative to the widget allocation. *)

external get_last_updated_sequence :
  t -> Ocgtk_gdk.Gdk.Wrappers.Event_sequence.t option
  = "ml_gtk_gesture_get_last_updated_sequence"
(** Returns the [GdkEventSequence] that was last updated on [gesture]. *)

external get_last_event :
  t ->
  Ocgtk_gdk.Gdk.Wrappers.Event_sequence.t option ->
  Ocgtk_gdk.Gdk.Wrappers.Event.t option = "ml_gtk_gesture_get_last_event"
(** Returns the last event that was processed for [sequence].

    Note that the returned pointer is only valid as long as the [sequence] is
    still interpreted by the [gesture]. If in doubt, you should make a copy of
    the event. *)

external get_group : t -> t list = "ml_gtk_gesture_get_group"
(** Returns all gestures in the group of [gesture] *)

external get_device : t -> Ocgtk_gdk.Gdk.Wrappers.Device.t option
  = "ml_gtk_gesture_get_device"
(** Returns the logical [GdkDevice] that is currently operating on [gesture].

    This returns [NULL] if the gesture is not being interacted. *)

external get_bounding_box_center : t -> bool * float * float
  = "ml_gtk_gesture_get_bounding_box_center"
(** If there are touch sequences being currently handled by [gesture], returns
    [TRUE] and fills in [x] and [y] with the center of the bounding box
    containing all active touches.

    Otherwise, [FALSE] will be returned. *)

external get_bounding_box : t -> bool * Ocgtk_gdk.Gdk.Wrappers.Rectangle.t
  = "ml_gtk_gesture_get_bounding_box"
(** If there are touch sequences being currently handled by [gesture], returns
    [TRUE] and fills in [rect] with the bounding box containing all active
    touches.

    Otherwise, [FALSE] will be returned.

    Note: This function will yield unexpected results on touchpad gestures.
    Since there is no correlation between physical and pixel distances, these
    will look as if constrained in an infinitely small area, [rect] width and
    height will thus be 0 regardless of the number of touchpoints. *)

(* Properties *)

external get_n_points : t -> int = "ml_gtk_gesture_get_n_points"
(** Get property: n-points *)
