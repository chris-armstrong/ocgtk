class type menu_button_t = object
  inherit Widget.widget_t

  (** {2:signals Signals} *)

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted to when the menu button is activated.

      The [::activate] signal on [GtkMenuButton] is an action signal and
      emitting it causes the button to pop up its menu. *)

  (** {2:methods Methods} *)

  method get_active : unit -> bool
  (** Returns whether the menu button is active. *)

  method get_always_show_arrow : unit -> bool
  (** Gets whether to show a dropdown arrow even when using an icon or a custom
      child. *)

  method get_can_shrink : unit -> bool
  (** Retrieves whether the button can be smaller than the natural size of its
      contents. *)

  method get_child : unit -> Widget.widget_t option
  (** Gets the child widget of [menu_button]. *)

  method get_has_frame : unit -> bool
  (** Returns whether the button has a frame. *)

  method get_icon_name : unit -> string option
  (** Gets the name of the icon shown in the button. *)

  method get_label : unit -> string option
  (** Gets the label shown in the button *)

  method get_menu_model : unit -> Ocgio.Menu_model.menu_model_t option
  (** Returns the [GMenuModel] used to generate the popup. *)

  method get_popover : unit -> Popover.popover_t option
  (** Returns the [GtkPopover] that pops out of the button.

      If the button is not using a [GtkPopover], this function returns [NULL].
  *)

  method get_primary : unit -> bool
  (** Returns whether the menu button acts as a primary menu. *)

  method get_use_underline : unit -> bool
  (** Returns whether an embedded underline in the text indicates a mnemonic. *)

  method popdown : unit -> unit
  (** Dismiss the menu. *)

  method popup : unit -> unit
  (** Pop up the menu. *)

  method set_active : bool -> unit
  (** Sets whether the menu button is active. *)

  method set_always_show_arrow : bool -> unit
  (** Sets whether to show a dropdown arrow even when using an icon or a custom
      child. *)

  method set_can_shrink : bool -> unit
  (** Sets whether the button size can be smaller than the natural size of its
      contents.

      For text buttons, setting [can_shrink] to true will ellipsize the label.

      For icon buttons, this function has no effect. *)

  method set_child : Widget.widget_t option -> unit
  (** Sets the child widget of [menu_button].

      Setting a child resets [Gtk.MenuButton:label] and
      [Gtk.MenuButton:icon-name].

      If [Gtk.MenuButton:always-show-arrow] is set to [TRUE] and
      [Gtk.MenuButton:direction] is not [GTK_ARROW_NONE], a dropdown arrow will
      be shown next to the child. *)

  method set_has_frame : bool -> unit
  (** Sets the style of the button. *)

  method set_icon_name : string -> unit
  (** Sets the name of an icon to show inside the menu button.

      Setting icon name resets [Gtk.MenuButton:label] and
      [Gtk.MenuButton:child].

      If [Gtk.MenuButton:always-show-arrow] is set to [TRUE] and
      [Gtk.MenuButton:direction] is not [GTK_ARROW_NONE], a dropdown arrow will
      be shown next to the icon. *)

  method set_label : string -> unit
  (** Sets the label to show inside the menu button.

      Setting a label resets [Gtk.MenuButton:icon-name] and
      [Gtk.MenuButton:child].

      If [Gtk.MenuButton:direction] is not [GTK_ARROW_NONE], a dropdown arrow
      will be shown next to the label. *)

  method set_menu_model : Ocgio.Menu_model.menu_model_t option -> unit
  (** Sets the [GMenuModel] from which the popup will be constructed.

      If [menu_model] is [NULL], the button is disabled.

      A [Gtk.Popover] will be created from the menu model with
      [Gtk.PopoverMenu.new_from_model]. Actions will be connected as documented
      for this function.

      If [Gtk.MenuButton:popover] is already set, it will be dissociated from
      the [menu_button], and the property is set to [NULL]. *)

  method set_popover : Popover.popover_t option -> unit
  (** Sets the [GtkPopover] that will be popped up when the [menu_button] is
      clicked.

      If [popover] is [NULL], the button is disabled.

      If [Gtk.MenuButton:menu-model] is set, the menu model is dissociated from
      the [menu_button], and the property is set to [NULL]. *)

  method set_primary : bool -> unit
  (** Sets whether menu button acts as a primary menu.

      Primary menus can be opened with the <kbd>F10</kbd> key. *)

  method set_use_underline : bool -> unit
  (** If true, an underline in the text indicates a mnemonic. *)

  (** {2:conversions Conversions} *)

  method as_menu_button : Raw.Menu_button.t
end

(* High-level class for MenuButton *)
class menu_button (obj : Raw.Menu_button.t) : menu_button_t =
  object (self)
    inherit Widget.widget (obj :> Raw.Widget.t)

    method on_activate ?(after = false) ~callback () =
      Raw.Menu_button.on_activate ~after self#as_menu_button ~callback

    method get_active : unit -> bool = fun () -> Raw.Menu_button.get_active obj

    method get_always_show_arrow : unit -> bool =
      fun () -> Raw.Menu_button.get_always_show_arrow obj

    method get_can_shrink : unit -> bool =
      fun () -> Raw.Menu_button.get_can_shrink obj

    method get_child : unit -> Widget.widget_t option =
      fun () ->
        Option.map
          (fun ret -> new Widget.widget ret)
          (Raw.Menu_button.get_child obj)

    method get_has_frame : unit -> bool =
      fun () -> Raw.Menu_button.get_has_frame obj

    method get_icon_name : unit -> string option =
      fun () -> Raw.Menu_button.get_icon_name obj

    method get_label : unit -> string option =
      fun () -> Raw.Menu_button.get_label obj

    method get_menu_model : unit -> Ocgio.Menu_model.menu_model_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgio.Menu_model.menu_model ret)
          (Raw.Menu_button.get_menu_model obj)

    method get_popover : unit -> Popover.popover_t option =
      fun () ->
        Option.map
          (fun ret -> new Popover.popover ret)
          (Raw.Menu_button.get_popover obj)

    method get_primary : unit -> bool =
      fun () -> Raw.Menu_button.get_primary obj

    method get_use_underline : unit -> bool =
      fun () -> Raw.Menu_button.get_use_underline obj

    method popdown : unit -> unit = fun () -> Raw.Menu_button.popdown obj
    method popup : unit -> unit = fun () -> Raw.Menu_button.popup obj

    method set_active : bool -> unit =
      fun active -> Raw.Menu_button.set_active obj active

    method set_always_show_arrow : bool -> unit =
      fun always_show_arrow ->
        Raw.Menu_button.set_always_show_arrow obj always_show_arrow

    method set_can_shrink : bool -> unit =
      fun can_shrink -> Raw.Menu_button.set_can_shrink obj can_shrink

    method set_child : Widget.widget_t option -> unit =
      fun child ->
        let child = Option.map (fun c -> c#as_widget) child in
        Raw.Menu_button.set_child obj child

    method set_has_frame : bool -> unit =
      fun has_frame -> Raw.Menu_button.set_has_frame obj has_frame

    method set_icon_name : string -> unit =
      fun icon_name -> Raw.Menu_button.set_icon_name obj icon_name

    method set_label : string -> unit =
      fun label -> Raw.Menu_button.set_label obj label

    method set_menu_model : Ocgio.Menu_model.menu_model_t option -> unit =
      fun menu_model ->
        let menu_model = Option.map (fun c -> c#as_menu_model) menu_model in
        Raw.Menu_button.set_menu_model obj menu_model

    method set_popover : Popover.popover_t option -> unit =
      fun popover ->
        let popover = Option.map (fun c -> c#as_popover) popover in
        Raw.Menu_button.set_popover obj popover

    method set_primary : bool -> unit =
      fun primary -> Raw.Menu_button.set_primary obj primary

    method set_use_underline : bool -> unit =
      fun use_underline -> Raw.Menu_button.set_use_underline obj use_underline

    method as_menu_button = obj
  end

let new_ () : menu_button_t = new menu_button (Raw.Menu_button.new_ ())
