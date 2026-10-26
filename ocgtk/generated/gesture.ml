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
