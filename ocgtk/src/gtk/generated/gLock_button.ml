(* High-level class for LockButton *)
class lock_button (obj : Lock_button.t) = object (self)

  method get_permission : unit -> Ocgtk_gio.Gio.permission option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gio.Gio.permission ret) (Lock_button.get_permission obj)

  method set_permission : 'p1. (#Ocgtk_gio.Gio.permission as 'p1) option -> unit =
    fun permission ->
      let permission = Option.map (fun (c) -> c#as_permission) permission in
      (Lock_button.set_permission obj permission)

  method text_lock = Lock_button.get_text_lock obj
  method set_text_lock v =  Lock_button.set_text_lock obj v

  method text_unlock = Lock_button.get_text_unlock obj
  method set_text_unlock v =  Lock_button.set_text_unlock obj v

  method tooltip_lock = Lock_button.get_tooltip_lock obj
  method set_tooltip_lock v =  Lock_button.set_tooltip_lock obj v

  method tooltip_not_authorized = Lock_button.get_tooltip_not_authorized obj
  method set_tooltip_not_authorized v =  Lock_button.set_tooltip_not_authorized obj v

  method tooltip_unlock = Lock_button.get_tooltip_unlock obj
  method set_tooltip_unlock v =  Lock_button.set_tooltip_unlock obj v

    method as_lock_button = obj
end

