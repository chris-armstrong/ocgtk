class type link_button_t = object
  inherit GButton.button_t
  method on_activate_link : callback:(unit -> bool) -> Gobject.Signal.handler_id
  method get_uri : unit -> string
  method get_visited : unit -> bool
  method set_uri : string -> unit
  method set_visited : bool -> unit
  method as_link_button : Link_button.t
end

(* High-level class for LinkButton *)
class link_button (obj : Link_button.t) : link_button_t =
  object (self)
    inherit GButton.button (obj :> Button.t)

    method on_activate_link ~callback =
      Link_button.on_activate_link self#as_link_button ~callback

    method get_uri : unit -> string = fun () -> Link_button.get_uri obj
    method get_visited : unit -> bool = fun () -> Link_button.get_visited obj
    method set_uri : string -> unit = fun uri -> Link_button.set_uri obj uri

    method set_visited : bool -> unit =
      fun visited -> Link_button.set_visited obj visited

    method as_link_button = obj
  end

let new_ (uri : string) : link_button_t =
  let obj_ = Link_button.new_ uri in
  new link_button obj_

let new_with_label (uri : string) (label : string option) : link_button_t =
  let obj_ = Link_button.new_with_label uri label in
  new link_button obj_
