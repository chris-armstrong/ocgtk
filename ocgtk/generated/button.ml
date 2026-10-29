class type button_t = object
  inherit Widget.widget_t
  inherit Actionable.actionable_t

  (** {2:signals Signals} *)

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted to animate press then release.

      This is an action signal. Applications should never connect to this
      signal, but use the [Gtk.Button::clicked] signal.

      The default bindings for this signal are all forms of the <kbd>␣</kbd> and
      <kbd>Enter</kbd> keys. *)

  method on_clicked :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the button has been activated (pressed and released). *)

  (** {2:methods Methods} *)

  method get_can_shrink : unit -> bool
  (** Retrieves whether the button can be smaller than the natural size of its
      contents. *)

  method get_child : unit -> Widget.widget_t option
  (** Gets the child widget of [button]. *)

  method get_has_frame : unit -> bool
  (** Returns whether the button has a frame. *)

  method get_icon_name : unit -> string option
  (** Returns the icon name of the button.

      If the icon name has not been set with [Gtk.Button.set_icon_name] the
      return value will be [NULL]. This will be the case if you create an empty
      button with [Gtk.Button.new] to use as a container. *)

  method get_label : unit -> string option
  (** Fetches the text from the label of the button.

      If the label text has not been set with [Gtk.Button.set_label] the return
      value will be [NULL]. This will be the case if you create an empty button
      with [Gtk.Button.new] to use as a container. *)

  method get_use_underline : unit -> bool
  (** gets whether underlines are interpreted as mnemonics.

      See [Gtk.Button.set_use_underline]. *)

  method set_can_shrink : bool -> unit
  (** Sets whether the button size can be smaller than the natural size of its
      contents.

      For text buttons, setting [can_shrink] to true will ellipsize the label.

      For icons and custom children, this function has no effect. *)

  method set_child : Widget.widget_t option -> unit
  (** Sets the child widget of [button].

      Note that by using this API, you take full responsibility for setting up
      the proper accessibility label and description information for [button].
      Most likely, you'll either set the accessibility label or description for
      [button] explicitly, or you'll set a labelled-by or described-by relations
      from [child] to [button]. *)

  method set_has_frame : bool -> unit
  (** Sets the style of the button.

      Buttons can have a flat appearance or have a frame drawn around them. *)

  method set_icon_name : string -> unit
  (** Adds a [GtkImage] with the given icon name as a child.

      If [button] already contains a child widget, that child widget will be
      removed and replaced with the image. *)

  method set_label : string -> unit
  (** Sets the text of the label of the button to [label].

      This will also clear any previously set labels. *)

  method set_use_underline : bool -> unit
  (** Sets whether to use underlines as mnemonics.

      If true, an underline in the text of the button label indicates the next
      character should be used for the mnemonic accelerator key. *)

  (** {2:conversions Conversions} *)

  method as_button : Raw.Button.t
end

(* High-level class for Button *)
class button (obj : Raw.Button.t) : button_t =
  object (self)
    inherit Widget.widget (obj :> Raw.Widget.t)
    inherit Actionable.actionable (Raw.Actionable.from_gobject obj)

    method on_activate ?(after = false) ~callback () =
      Raw.Button.on_activate ~after self#as_button ~callback

    method on_clicked ?(after = false) ~callback () =
      Raw.Button.on_clicked ~after self#as_button ~callback

    method get_can_shrink : unit -> bool =
      fun () -> Raw.Button.get_can_shrink obj

    method get_child : unit -> Widget.widget_t option =
      fun () ->
        Option.map (fun ret -> new Widget.widget ret) (Raw.Button.get_child obj)

    method get_has_frame : unit -> bool = fun () -> Raw.Button.get_has_frame obj

    method get_icon_name : unit -> string option =
      fun () -> Raw.Button.get_icon_name obj

    method get_label : unit -> string option =
      fun () -> Raw.Button.get_label obj

    method get_use_underline : unit -> bool =
      fun () -> Raw.Button.get_use_underline obj

    method set_can_shrink : bool -> unit =
      fun can_shrink -> Raw.Button.set_can_shrink obj can_shrink

    method set_child : Widget.widget_t option -> unit =
      fun child ->
        let child = Option.map (fun c -> c#as_widget) child in
        Raw.Button.set_child obj child

    method set_has_frame : bool -> unit =
      fun has_frame -> Raw.Button.set_has_frame obj has_frame

    method set_icon_name : string -> unit =
      fun icon_name -> Raw.Button.set_icon_name obj icon_name

    method set_label : string -> unit =
      fun label -> Raw.Button.set_label obj label

    method set_use_underline : bool -> unit =
      fun use_underline -> Raw.Button.set_use_underline obj use_underline

    method as_button = obj
  end

let new_ () : button_t = new button (Raw.Button.new_ ())

let new_from_icon_name (icon_name : string) : button_t =
  let obj_ = Raw.Button.new_from_icon_name icon_name in
  new button obj_

let new_with_label (label : string) : button_t =
  let obj_ = Raw.Button.new_with_label label in
  new button obj_

let new_with_mnemonic (label : string) : button_t =
  let obj_ = Raw.Button.new_with_mnemonic label in
  new button obj_
