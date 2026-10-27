class type editable_t = object
  method on_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_delete_text :
    ?after:bool ->
    callback:(start_pos:int -> end_pos:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method delegate_get_accessible_platform_state :
    Enums.accessibleplatformstate -> bool

  method delete_selection : unit -> unit
  method delete_text : int -> int -> unit
  method finish_delegate : unit -> unit
  method get_alignment : unit -> float
  method get_chars : int -> int -> string
  method get_delegate : unit -> editable_t option
  method get_editable : unit -> bool
  method get_enable_undo : unit -> bool
  method get_max_width_chars : unit -> int
  method get_position : unit -> int
  method get_text : unit -> string
  method get_width_chars : unit -> int
  method init_delegate : unit -> unit
  method select_region : int -> int -> unit
  method set_alignment : float -> unit
  method set_editable : bool -> unit
  method set_enable_undo : bool -> unit
  method set_max_width_chars : int -> unit
  method set_position : int -> unit
  method set_text : string -> unit
  method set_width_chars : int -> unit
  method selection_bound : int
  method as_editable : Raw.Editable.t
end

(* High-level class for Editable *)
class editable (obj : Raw.Editable.t) : editable_t =
  object (self)
    method on_changed ?(after = false) ~callback () =
      Raw.Editable.on_changed ~after self#as_editable ~callback

    method on_delete_text ?(after = false) ~callback () =
      Raw.Editable.on_delete_text ~after self#as_editable ~callback

    method delegate_get_accessible_platform_state :
        Enums.accessibleplatformstate -> bool =
      fun state -> Raw.Editable.delegate_get_accessible_platform_state obj state

    method delete_selection : unit -> unit =
      fun () -> Raw.Editable.delete_selection obj

    method delete_text : int -> int -> unit =
      fun start_pos end_pos -> Raw.Editable.delete_text obj start_pos end_pos

    method finish_delegate : unit -> unit =
      fun () -> Raw.Editable.finish_delegate obj

    method get_alignment : unit -> float =
      fun () -> Raw.Editable.get_alignment obj

    method get_chars : int -> int -> string =
      fun start_pos end_pos -> Raw.Editable.get_chars obj start_pos end_pos

    method get_delegate : unit -> editable_t option =
      fun () ->
        Option.map (fun ret -> new editable ret) (Raw.Editable.get_delegate obj)

    method get_editable : unit -> bool = fun () -> Raw.Editable.get_editable obj

    method get_enable_undo : unit -> bool =
      fun () -> Raw.Editable.get_enable_undo obj

    method get_max_width_chars : unit -> int =
      fun () -> Raw.Editable.get_max_width_chars obj

    method get_position : unit -> int = fun () -> Raw.Editable.get_position obj
    method get_text : unit -> string = fun () -> Raw.Editable.get_text obj

    method get_width_chars : unit -> int =
      fun () -> Raw.Editable.get_width_chars obj

    method init_delegate : unit -> unit =
      fun () -> Raw.Editable.init_delegate obj

    method select_region : int -> int -> unit =
      fun start_pos end_pos -> Raw.Editable.select_region obj start_pos end_pos

    method set_alignment : float -> unit =
      fun xalign -> Raw.Editable.set_alignment obj xalign

    method set_editable : bool -> unit =
      fun is_editable -> Raw.Editable.set_editable obj is_editable

    method set_enable_undo : bool -> unit =
      fun enable_undo -> Raw.Editable.set_enable_undo obj enable_undo

    method set_max_width_chars : int -> unit =
      fun n_chars -> Raw.Editable.set_max_width_chars obj n_chars

    method set_position : int -> unit =
      fun position -> Raw.Editable.set_position obj position

    method set_text : string -> unit =
      fun text -> Raw.Editable.set_text obj text

    method set_width_chars : int -> unit =
      fun n_chars -> Raw.Editable.set_width_chars obj n_chars

    method selection_bound = Raw.Editable.get_selection_bound obj
    method as_editable = obj
  end
