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
 [GDK_TOUCHPAD_SWIPE] and [GDK_TOUCHPAD_PINCH] are handled by the [GtkGesture]\n\n\
 Its methods, signals and properties are on {!class-type-gesture_t}. The \
 functions it is built on are in {!Ocgtk.Raw.Gesture}."]

(** The methods, signals and properties of a [GtkGesture]. *)
class type gesture_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .event_controller_t

  method get_device : unit -> Ocgdk.Device.device_t option
  method get_group : unit -> gesture_t list

  method get_last_event :
    Ocgdk.Event_sequence.event_sequence_t option -> Ocgdk.Event.event_t option

  method get_last_updated_sequence :
    unit -> Ocgdk.Event_sequence.event_sequence_t option

  method get_sequence_state :
    Ocgdk.Event_sequence.event_sequence_t -> Enums.eventsequencestate

  method get_sequences : unit -> Ocgdk.Event_sequence.event_sequence_t list
  method group : gesture_t -> unit
  method handles_sequence : Ocgdk.Event_sequence.event_sequence_t option -> bool
  method is_active : unit -> bool
  method is_grouped_with : gesture_t -> bool
  method is_recognized : unit -> bool

  method set_sequence_state :
    Ocgdk.Event_sequence.event_sequence_t -> Enums.eventsequencestate -> bool

  method set_state : Enums.eventsequencestate -> bool
  method ungroup : unit -> unit
  method n_points : int
  method as_gesture : Raw.Gesture.t
end

class gesture : Raw.Gesture.t -> gesture_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Gesture.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkGesture], give one already wrapped. *)
