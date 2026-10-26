class type adjustment_t = object
  method on_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_value_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method clamp_page : float -> float -> unit
  method configure : float -> float -> float -> float -> float -> float -> unit
  method get_lower : unit -> float
  method get_minimum_increment : unit -> float
  method get_page_increment : unit -> float
  method get_page_size : unit -> float
  method get_step_increment : unit -> float
  method get_upper : unit -> float
  method get_value : unit -> float
  method set_lower : float -> unit
  method set_page_increment : float -> unit
  method set_page_size : float -> unit
  method set_step_increment : float -> unit
  method set_upper : float -> unit
  method set_value : float -> unit
  method as_adjustment : Raw.Adjustment.t
end

(* High-level class for Adjustment *)
class adjustment (obj : Raw.Adjustment.t) : adjustment_t =
  object (self)
    method on_changed ?(after = false) ~callback () =
      Raw.Adjustment.on_changed ~after self#as_adjustment ~callback

    method on_value_changed ?(after = false) ~callback () =
      Raw.Adjustment.on_value_changed ~after self#as_adjustment ~callback

    method clamp_page : float -> float -> unit =
      fun lower upper -> Raw.Adjustment.clamp_page obj lower upper

    method configure :
        float -> float -> float -> float -> float -> float -> unit =
      fun value lower upper step_increment page_increment page_size ->
        Raw.Adjustment.configure obj value lower upper step_increment
          page_increment page_size

    method get_lower : unit -> float = fun () -> Raw.Adjustment.get_lower obj

    method get_minimum_increment : unit -> float =
      fun () -> Raw.Adjustment.get_minimum_increment obj

    method get_page_increment : unit -> float =
      fun () -> Raw.Adjustment.get_page_increment obj

    method get_page_size : unit -> float =
      fun () -> Raw.Adjustment.get_page_size obj

    method get_step_increment : unit -> float =
      fun () -> Raw.Adjustment.get_step_increment obj

    method get_upper : unit -> float = fun () -> Raw.Adjustment.get_upper obj
    method get_value : unit -> float = fun () -> Raw.Adjustment.get_value obj

    method set_lower : float -> unit =
      fun lower -> Raw.Adjustment.set_lower obj lower

    method set_page_increment : float -> unit =
      fun page_increment -> Raw.Adjustment.set_page_increment obj page_increment

    method set_page_size : float -> unit =
      fun page_size -> Raw.Adjustment.set_page_size obj page_size

    method set_step_increment : float -> unit =
      fun step_increment -> Raw.Adjustment.set_step_increment obj step_increment

    method set_upper : float -> unit =
      fun upper -> Raw.Adjustment.set_upper obj upper

    method set_value : float -> unit =
      fun value -> Raw.Adjustment.set_value obj value

    method as_adjustment = obj
  end

let new_ (value : float) (lower : float) (upper : float)
    (step_increment : float) (page_increment : float) (page_size : float) :
    adjustment_t =
  let obj_ =
    Raw.Adjustment.new_ value lower upper step_increment page_increment
      page_size
  in
  new adjustment obj_
