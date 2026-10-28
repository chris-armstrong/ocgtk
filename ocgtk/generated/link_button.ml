class type link_button_t = object
  inherit Button.button_t

  (** {2:signals Signals} *)

  method on_activate_link :
    ?after:bool -> callback:(unit -> bool) -> unit -> Gobject.Signal.handler_id
  (** Emitted each time the [GtkLinkButton] is clicked.

      The default handler will call [Gtk.FileLauncher.launch] with the URI
      stored inside the [Gtk.LinkButton:uri] property.

      To override the default behavior, you can connect to the ::activate-link
      signal and stop the propagation of the signal by returning [true] from
      your handler. *)

  (** {2:methods Methods} *)

  method get_uri : unit -> string
  (** Retrieves the URI of the [GtkLinkButton]. *)

  method get_visited : unit -> bool
  (** Retrieves the “visited” state of the [GtkLinkButton].

      The button becomes visited when it is clicked. If the URI is changed on
      the button, the “visited” state is unset again.

      The state may also be changed using [Gtk.LinkButton.set_visited]. *)

  method set_uri : string -> unit
  (** Sets [uri] as the URI where the [GtkLinkButton] points.

      As a side-effect this unsets the “visited” state of the button. *)

  method set_visited : bool -> unit
  (** Sets the “visited” state of the [GtkLinkButton].

      See [Gtk.LinkButton.get_visited] for more details. *)

  (** {2:conversions Conversions} *)

  method as_link_button : Raw.Link_button.t
end

(* High-level class for LinkButton *)
class link_button (obj : Raw.Link_button.t) : link_button_t =
  object (self)
    inherit Button.button (obj :> Raw.Button.t)

    method on_activate_link ?(after = false) ~callback () =
      Raw.Link_button.on_activate_link ~after self#as_link_button ~callback

    method get_uri : unit -> string = fun () -> Raw.Link_button.get_uri obj

    method get_visited : unit -> bool =
      fun () -> Raw.Link_button.get_visited obj

    method set_uri : string -> unit = fun uri -> Raw.Link_button.set_uri obj uri

    method set_visited : bool -> unit =
      fun visited -> Raw.Link_button.set_visited obj visited

    method as_link_button = obj
  end

let new_ (uri : string) : link_button_t =
  let obj_ = Raw.Link_button.new_ uri in
  new link_button obj_

let new_with_label (uri : string) (label : string option) : link_button_t =
  let obj_ = Raw.Link_button.new_with_label uri label in
  new link_button obj_
