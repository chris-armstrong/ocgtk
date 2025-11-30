class label_signals : Label.t ->
  object
    method activate_current_link : callback:(unit -> unit) -> int
    method activate_link : callback:(unit -> unit) -> int
    method copy_clipboard : callback:(unit -> unit) -> int
    method move_cursor : callback:(unit -> unit) -> int
  end

class label_skel : Label.t ->
  object
    inherit GObj.widget_impl
    method connect : label_signals
    method get_current_uri : unit -> string option
    method current_uri : unit -> string option
    method get_ellipsize : unit -> Pango.ellipsizemode
    method ellipsize : unit -> Pango.ellipsizemode
    method get_justify : unit -> Gtk_enums.justification
    method justify : unit -> Gtk_enums.justification
    method get_label : unit -> string
    method label : unit -> string
    method get_lines : unit -> int
    method lines : unit -> int
    method get_max_width_chars : unit -> int
    method max_width_chars : unit -> int
    method get_mnemonic_keyval : unit -> int
    method mnemonic_keyval : unit -> int
    method get_mnemonic_widget : unit -> Gtk.widget option
    method mnemonic_widget : unit -> Gtk.widget option
    method get_natural_wrap_mode : unit -> Gtk_enums.naturalwrapmode
    method natural_wrap_mode : unit -> Gtk_enums.naturalwrapmode
    method get_selectable : unit -> bool
    method selectable : unit -> bool
    method get_single_line_mode : unit -> bool
    method single_line_mode : unit -> bool
    method get_text : unit -> string
    method text : unit -> string
    method get_use_markup : unit -> bool
    method use_markup : unit -> bool
    method get_use_underline : unit -> bool
    method use_underline : unit -> bool
    method get_width_chars : unit -> int
    method width_chars : unit -> int
    method get_wrap : unit -> bool
    method wrap : unit -> bool
    method get_wrap_mode : unit -> Pango.wrapmode
    method wrap_mode : unit -> Pango.wrapmode
    method get_xalign : unit -> float
    method xalign : unit -> float
    method get_yalign : unit -> float
    method yalign : unit -> float
    method select_region : int -> int -> unit
    method set_ellipsize : Pango.ellipsizemode -> unit
    method set_justify : Gtk_enums.justification -> unit
    method set_label : string -> unit
    method set_lines : int -> unit
    method set_markup : string -> unit
    method set_markup_with_mnemonic : string -> unit
    method set_max_width_chars : int -> unit
    method set_mnemonic_widget : Gtk.widget option -> unit
    method set_natural_wrap_mode : Gtk_enums.naturalwrapmode -> unit
    method set_selectable : bool -> unit
    method set_single_line_mode : bool -> unit
    method set_text : string -> unit
    method set_text_with_mnemonic : string -> unit
    method set_use_markup : bool -> unit
    method set_use_underline : bool -> unit
    method set_width_chars : int -> unit
    method set_wrap : bool -> unit
    method set_wrap_mode : Pango.wrapmode -> unit
    method set_xalign : float -> unit
    method set_yalign : float -> unit
  end

class label : Label.t ->
  object
    inherit label_skel
  end
