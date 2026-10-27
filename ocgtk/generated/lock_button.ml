class type lock_button_t = object
  inherit Button.button_t

  method get_permission : unit -> Ocgio.Permission.permission_t option
  (** Obtains the [GPermission] object that controls [button]. *)

  method set_permission : Ocgio.Permission.permission_t option -> unit
  (** Sets the [GPermission] object that controls [button]. *)

  method text_lock : string
  (** The text to display when prompting the user to lock. *)

  method set_text_lock : string -> unit
  (** The text to display when prompting the user to lock. *)

  method text_unlock : string
  (** The text to display when prompting the user to unlock. *)

  method set_text_unlock : string -> unit
  (** The text to display when prompting the user to unlock. *)

  method tooltip_lock : string
  (** The tooltip to display when prompting the user to lock. *)

  method set_tooltip_lock : string -> unit
  (** The tooltip to display when prompting the user to lock. *)

  method tooltip_not_authorized : string
  (** The tooltip to display when the user cannot obtain authorization. *)

  method set_tooltip_not_authorized : string -> unit
  (** The tooltip to display when the user cannot obtain authorization. *)

  method tooltip_unlock : string
  (** The tooltip to display when prompting the user to unlock. *)

  method set_tooltip_unlock : string -> unit
  (** The tooltip to display when prompting the user to unlock. *)

  method as_lock_button : Raw.Lock_button.t
end

(* High-level class for LockButton *)
class lock_button (obj : Raw.Lock_button.t) : lock_button_t =
  object (self)
    inherit Button.button (obj :> Raw.Button.t)

    method get_permission : unit -> Ocgio.Permission.permission_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgio.Permission.permission ret)
          (Raw.Lock_button.get_permission obj)

    method set_permission : Ocgio.Permission.permission_t option -> unit =
      fun permission ->
        let permission = Option.map (fun c -> c#as_permission) permission in
        Raw.Lock_button.set_permission obj permission

    method text_lock = Raw.Lock_button.get_text_lock obj
    method set_text_lock v = Raw.Lock_button.set_text_lock obj v
    method text_unlock = Raw.Lock_button.get_text_unlock obj
    method set_text_unlock v = Raw.Lock_button.set_text_unlock obj v
    method tooltip_lock = Raw.Lock_button.get_tooltip_lock obj
    method set_tooltip_lock v = Raw.Lock_button.set_tooltip_lock obj v

    method tooltip_not_authorized =
      Raw.Lock_button.get_tooltip_not_authorized obj

    method set_tooltip_not_authorized v =
      Raw.Lock_button.set_tooltip_not_authorized obj v

    method tooltip_unlock = Raw.Lock_button.get_tooltip_unlock obj
    method set_tooltip_unlock v = Raw.Lock_button.set_tooltip_unlock obj v
    method as_lock_button = obj
  end

let new_ (permission : Ocgio.Permission.permission_t option) : lock_button_t =
  let permission = Option.map (fun c -> c#as_permission) permission in
  let obj_ = Raw.Lock_button.new_ permission in
  new lock_button obj_
