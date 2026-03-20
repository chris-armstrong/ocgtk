(* Signal class defined in glink_button_signals.ml *)

class type link_button_t = object
    inherit Glink_button_signals.link_button_signals
    method get_uri : unit -> string
    method get_visited : unit -> bool
    method set_uri : string -> unit
    method set_visited : bool -> unit
    method as_link_button : Link_button.t
end

(* High-level class for LinkButton *)
class link_button (obj : Link_button.t) : link_button_t = object (self)
  inherit Glink_button_signals.link_button_signals obj

  method get_uri : unit -> string =
    fun () ->
      (Link_button.get_uri obj)

  method get_visited : unit -> bool =
    fun () ->
      (Link_button.get_visited obj)

  method set_uri : string -> unit =
    fun uri ->
      (Link_button.set_uri obj uri)

  method set_visited : bool -> unit =
    fun visited ->
      (Link_button.set_visited obj visited)

    method as_link_button = obj
end

