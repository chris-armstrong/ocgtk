class label : Label.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Glabel_signals.label_signals
    method label : string
    method set_label : string -> unit
    method lines : int
    method set_lines : int -> unit
    method max_width_chars : int
    method set_max_width_chars : int -> unit
    method mnemonic_keyval : int
    method selectable : bool
    method set_selectable : bool -> unit
    method single_line_mode : bool
    method set_single_line_mode : bool -> unit
    method use_markup : bool
    method set_use_markup : bool -> unit
    method use_underline : bool
    method set_use_underline : bool -> unit
    method width_chars : int
    method set_width_chars : int -> unit
    method wrap : bool
    method set_wrap : bool -> unit
    method xalign : float
    method set_xalign : float -> unit
    method yalign : float
    method set_yalign : float -> unit
    method get_current_uri : unit -> string option
    method get_ellipsize : unit -> Pango.ellipsizemode
    method get_justify : unit -> Gtk_enums.justification
    method get_mnemonic_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method get_natural_wrap_mode : unit -> Gtk_enums.naturalwrapmode
    method get_text : unit -> string
    method get_wrap_mode : unit -> Pango.wrapmode
    method select_region : int -> int -> unit
    method set_ellipsize : Pango.ellipsizemode -> unit
    method set_justify : Gtk_enums.justification -> unit
    method set_markup : string -> unit
    method set_markup_with_mnemonic : string -> unit
    method set_mnemonic_widget : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
    method set_natural_wrap_mode : Gtk_enums.naturalwrapmode -> unit
    method set_text : string -> unit
    method set_text_with_mnemonic : string -> unit
    method set_wrap_mode : Pango.wrapmode -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_label : Label.t
  end

