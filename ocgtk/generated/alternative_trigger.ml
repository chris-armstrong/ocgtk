class type alternative_trigger_t = object
  inherit Shortcut_trigger.shortcut_trigger_t
  method get_first : unit -> Shortcut_trigger.shortcut_trigger_t
  method get_second : unit -> Shortcut_trigger.shortcut_trigger_t
  method as_alternative_trigger : Raw.Alternative_trigger.t
end

(* High-level class for AlternativeTrigger *)
class alternative_trigger (obj : Raw.Alternative_trigger.t) :
  alternative_trigger_t =
  object (self)
    inherit Shortcut_trigger.shortcut_trigger (obj :> Raw.Shortcut_trigger.t)

    method get_first : unit -> Shortcut_trigger.shortcut_trigger_t =
      fun () ->
        new Shortcut_trigger.shortcut_trigger
          (Raw.Alternative_trigger.get_first obj)

    method get_second : unit -> Shortcut_trigger.shortcut_trigger_t =
      fun () ->
        new Shortcut_trigger.shortcut_trigger
          (Raw.Alternative_trigger.get_second obj)

    method as_alternative_trigger = obj
  end

let new_ (first : Shortcut_trigger.shortcut_trigger_t)
    (second : Shortcut_trigger.shortcut_trigger_t) : alternative_trigger_t =
  let first = first#as_shortcut_trigger in
  let second = second#as_shortcut_trigger in
  let obj_ = Raw.Alternative_trigger.new_ first second in
  new alternative_trigger obj_
