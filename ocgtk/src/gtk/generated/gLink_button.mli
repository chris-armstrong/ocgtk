class type link_button_t = object
    inherit GButton.button_t
    inherit Glink_button_signals.link_button_signals
    method get_uri : unit -> string
    method get_visited : unit -> bool
    method set_uri : string -> unit
    method set_visited : bool -> unit
    method as_link_button : Link_button.t
end

class link_button : Link_button.t -> link_button_t

