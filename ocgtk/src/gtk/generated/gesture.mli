(* GENERATED CODE - DO NOT EDIT *)
(* Gesture: Gesture *)

(** The base class for gesture recognition.

    Although [GtkGesture] is quite generalized to serve as a base for
    multi-touch gestures, it is suitable to implement single-touch and
    pointer-based gestures (using the special [NULL] [GdkEventSequence] value
    for these).

    The number of touches that a [GtkGesture] need to be recognized is
    controlled by the [Gtk.Gesture:n-points] property, if a gesture is keeping
    track of less or more than that number of sequences, it won't check whether
    the gesture is recognized.

    As soon as the gesture has the expected number of touches, it will check
    regularly if it is recognized, the criteria to consider a gesture as
    “recognized” is left to [GtkGesture] subclasses.

    A recognized gesture will then emit the following signals:

    - [Gtk.Gesture::begin] when the gesture is recognized.
    - [Gtk.Gesture::update], whenever an input event is processed.
    - [Gtk.Gesture::end] when the gesture is no longer recognized.

    {b Event propagation}

    In order to receive events, a gesture needs to set a propagation phase
    through [Gtk.EventController.set_propagation_phase].

    In the capture phase, events are propagated from the toplevel down to the
    target widget, and gestures that are attached to containers above the widget
    get a chance to interact with the event before it reaches the target.

    In the bubble phase, events are propagated up from the target widget to the
    toplevel, and gestures that are attached to containers above the widget get
    a chance to interact with events that have not been handled yet.

    {b States of a sequence}

    Whenever input interaction happens, a single event may trigger a cascade of
    [GtkGesture]s, both across the parents of the widget receiving the event and
    in parallel within an individual widget. It is a responsibility of the
    widgets using those gestures to set the state of touch sequences accordingly
    in order to enable cooperation of gestures around the [GdkEventSequence]s
    triggering those.

    Within a widget, gestures can be grouped through [Gtk.Gesture.group].
    Grouped gestures synchronize the state of sequences, so calling
    [Gtk.Gesture.set_state] on one will effectively propagate the state
    throughout the group.

    By default, all sequences start out in the [GTK_EVENT_SEQUENCE_NONE] state,
    sequences in this state trigger the gesture event handler, but event
    propagation will continue unstopped by gestures.

    If a sequence enters into the [GTK_EVENT_SEQUENCE_DENIED] state, the gesture
    group will effectively ignore the sequence, letting events go unstopped
    through the gesture, but the “slot” will still remain occupied while the
    touch is active.

    If a sequence enters in the [GTK_EVENT_SEQUENCE_CLAIMED] state, the gesture
    group will grab all interaction on the sequence, by:

    - Setting the same sequence to [GTK_EVENT_SEQUENCE_DENIED] on every other
      gesture group within the widget, and every gesture on parent widgets in
      the propagation chain.
    - Emitting [Gtk.Gesture::cancel] on every gesture in widgets underneath in
      the propagation chain.
    - Stopping event propagation after the gesture group handles the event.

    Note: if a sequence is set early to [GTK_EVENT_SEQUENCE_CLAIMED] on
    [GDK_TOUCH_BEGIN]/[GDK_BUTTON_PRESS] (so those events are captured before
    reaching the event widget, this implies [GTK_PHASE_CAPTURE]), one similar
    event will be emulated if the sequence changes to
    [GTK_EVENT_SEQUENCE_DENIED]. This way event coherence is preserved before
    event propagation is unstopped again.

    Sequence states can't be changed freely. See [Gtk.Gesture.set_state] to know
    about the possible lifetimes of a [GdkEventSequence].

    {b Touchpad gestures}

    On the platforms that support it, [GtkGesture] will handle transparently
    touchpad gesture events. The only precautions users of [GtkGesture] should
    do to enable this support are:

    - If the gesture has [GTK_PHASE_NONE], ensuring events of type
      [GDK_TOUCHPAD_SWIPE] and [GDK_TOUCHPAD_PINCH] are handled by the
      [GtkGesture] *)

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
(** Adds [gesture] to the same group than [group_gesture].

    Gestures are by default isolated in their own groups.

    Both gestures must have been added to the same widget before they can be
    grouped.

    When gestures are grouped, the state of [GdkEventSequences] is kept in sync
    for all of those, so calling [Gtk.Gesture.set_sequence_state], on one will
    transfer the same value to the others.

    Groups also perform an “implicit grabbing” of sequences, if a
    [GdkEventSequence] state is set to [GTK_EVENT_SEQUENCE_CLAIMED] on one
    group, every other gesture group attached to the same [GtkWidget] will
    switch the state for that sequence to [GTK_EVENT_SEQUENCE_DENIED]. *)

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
