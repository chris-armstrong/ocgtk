class type lock_button_t = object
  inherit GButton.button_t
  method get_permission : unit -> Ocgtk_gio.Gio.Permission.permission_t option
  method set_permission : Ocgtk_gio.Gio.Permission.permission_t option -> unit
  method text_lock : string
  method set_text_lock : string -> unit
  method text_unlock : string
  method set_text_unlock : string -> unit
  method tooltip_lock : string
  method set_tooltip_lock : string -> unit
  method tooltip_not_authorized : string
  method set_tooltip_not_authorized : string -> unit
  method tooltip_unlock : string
  method set_tooltip_unlock : string -> unit
  method as_lock_button : Lock_button.t
end

(* High-level class for LockButton *)
class lock_button (obj : Lock_button.t) : lock_button_t =
  object (self)
    inherit GButton.button (obj :> Button.t)

    method get_permission : unit -> Ocgtk_gio.Gio.Permission.permission_t option
        =
      fun () ->
        Option.map
          (fun ret -> new Ocgtk_gio.Gio.Permission.permission ret)
          (Lock_button.get_permission obj)

    method set_permission : Ocgtk_gio.Gio.Permission.permission_t option -> unit
        =
      fun permission ->
        let permission = Option.map (fun c -> c#as_permission) permission in
        Lock_button.set_permission obj permission

    method text_lock = Lock_button.get_text_lock obj
    method set_text_lock v = Lock_button.set_text_lock obj v
    method text_unlock = Lock_button.get_text_unlock obj
    method set_text_unlock v = Lock_button.set_text_unlock obj v
    method tooltip_lock = Lock_button.get_tooltip_lock obj
    method set_tooltip_lock v = Lock_button.set_tooltip_lock obj v
    method tooltip_not_authorized = Lock_button.get_tooltip_not_authorized obj

    method set_tooltip_not_authorized v =
      Lock_button.set_tooltip_not_authorized obj v

    method tooltip_unlock = Lock_button.get_tooltip_unlock obj
    method set_tooltip_unlock v = Lock_button.set_tooltip_unlock obj v
    method as_lock_button = obj
  end

let new_ (permission : Ocgtk_gio.Gio.Permission.permission_t option) :
    lock_button_t =
  let permission = Option.map (fun c -> c#as_permission) permission in
  let obj_ = Lock_button.new_ permission in
  new lock_button obj_
