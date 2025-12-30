(* GENERATED CODE - DO NOT EDIT *)
(* Event controller: Gesture *)

type t = [`gesture | `event_controller | `object_] Gobject.obj

val as_event_controller : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t

(* Methods *)
(** Separates @gesture into an isolated group. *)
external ungroup : t -> unit = "ml_gtk_gesture_ungroup"

(** Sets the state of all sequences that @gesture is currently
interacting with.

Sequences start in state %GTK_EVENT_SEQUENCE_NONE, and whenever
they change state, they can never go back to that state. Likewise,
sequences in state %GTK_EVENT_SEQUENCE_DENIED cannot turn back to
a not denied state. With these rules, the lifetime of an event
sequence is constrained to the next four:

* None
* None → Denied
* None → Claimed
* None → Claimed → Denied

Note: Due to event handling ordering, it may be unsafe to set the
state on another gesture within a [signal@Gtk.Gesture::begin] signal
handler, as the callback might be executed before the other gesture
knows about the sequence. A safe way to perform this could be:

```c
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
```

If both gestures are in the same group, just set the state on
the gesture emitting the event, the sequence will be already
be initialized to the group's global state when the second
gesture processes the event. *)
external set_state : t -> Gtk_enums.eventsequencestate -> bool = "ml_gtk_gesture_set_state"

(** Returns %TRUE if the gesture is currently recognized.

A gesture is recognized if there are as many interacting
touch sequences as required by @gesture. *)
external is_recognized : t -> bool = "ml_gtk_gesture_is_recognized"

(** Returns %TRUE if both gestures pertain to the same group. *)
external is_grouped_with : t -> t -> bool = "ml_gtk_gesture_is_grouped_with"

(** Returns %TRUE if the gesture is currently active.

A gesture is active while there are touch sequences
interacting with it. *)
external is_active : t -> bool = "ml_gtk_gesture_is_active"

(** Adds @gesture to the same group than @group_gesture.

Gestures are by default isolated in their own groups.

Both gestures must have been added to the same widget before
they can be grouped.

When gestures are grouped, the state of `GdkEventSequences`
is kept in sync for all of those, so calling
[method@Gtk.Gesture.set_sequence_state], on one will transfer
the same value to the others.

Groups also perform an "implicit grabbing" of sequences, if a
`GdkEventSequence` state is set to %GTK_EVENT_SEQUENCE_CLAIMED
on one group, every other gesture group attached to the same
`GtkWidget` will switch the state for that sequence to
%GTK_EVENT_SEQUENCE_DENIED. *)
external group : t -> t -> unit = "ml_gtk_gesture_group"

(** If there are touch sequences being currently handled by @gesture,
returns %TRUE and fills in @x and @y with the center of the bounding
box containing all active touches.

Otherwise, %FALSE will be returned. *)
external get_bounding_box_center : t -> bool * float * float = "ml_gtk_gesture_get_bounding_box_center"

(* Properties *)

(** Get property: n-points *)
external get_n_points : t -> int = "ml_gtk_gesture_get_n_points"

