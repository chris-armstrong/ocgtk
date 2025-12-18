(* Signal class defined in glabel_signals.ml *)

(* High-level class for Label *)
class label (obj : Label.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Label.as_widget obj)
  inherit Glabel_signals.label_signals obj

  method label = Label.get_label obj
  method set_label v = Label.set_label obj v

  method lines = Label.get_lines obj
  method set_lines v = Label.set_lines obj v

  method max_width_chars = Label.get_max_width_chars obj
  method set_max_width_chars v = Label.set_max_width_chars obj v

  method mnemonic_keyval = Label.get_mnemonic_keyval obj

  method selectable = Label.get_selectable obj
  method set_selectable v = Label.set_selectable obj v

  method single_line_mode = Label.get_single_line_mode obj
  method set_single_line_mode v = Label.set_single_line_mode obj v

  method use_markup = Label.get_use_markup obj
  method set_use_markup v = Label.set_use_markup obj v

  method use_underline = Label.get_use_underline obj
  method set_use_underline v = Label.set_use_underline obj v

  method width_chars = Label.get_width_chars obj
  method set_width_chars v = Label.set_width_chars obj v

  method wrap = Label.get_wrap obj
  method set_wrap v = Label.set_wrap obj v

  method xalign = Label.get_xalign obj
  method set_xalign v = Label.set_xalign obj v

  method yalign = Label.get_yalign obj
  method set_yalign v = Label.set_yalign obj v

  method get_current_uri : unit -> string option = fun () -> (Label.get_current_uri obj )

  method get_ellipsize : unit -> Pango.ellipsizemode = fun () -> (Label.get_ellipsize obj )

  method get_justify : unit -> Gtk_enums.justification = fun () -> (Label.get_justify obj )

  method get_mnemonic_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option = fun () -> Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Label.get_mnemonic_widget obj )

  method get_natural_wrap_mode : unit -> Gtk_enums.naturalwrapmode = fun () -> (Label.get_natural_wrap_mode obj )

  method get_text : unit -> string = fun () -> (Label.get_text obj )

  method get_wrap_mode : unit -> Pango.wrapmode = fun () -> (Label.get_wrap_mode obj )

  method select_region : int -> int -> unit = fun start_offset end_offset -> (Label.select_region obj start_offset end_offset)

  method set_ellipsize : Pango.ellipsizemode -> unit = fun mode -> (Label.set_ellipsize obj mode)

  method set_justify : Gtk_enums.justification -> unit = fun jtype -> (Label.set_justify obj jtype)

  method set_markup : string -> unit = fun str -> (Label.set_markup obj str)

  method set_markup_with_mnemonic : string -> unit = fun str -> (Label.set_markup_with_mnemonic obj str)

  method set_mnemonic_widget : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun widget ->
      let widget = Option.map (fun (c) -> c#as_widget) widget in
      (Label.set_mnemonic_widget obj widget)

  method set_natural_wrap_mode : Gtk_enums.naturalwrapmode -> unit = fun wrap_mode -> (Label.set_natural_wrap_mode obj wrap_mode)

  method set_text : string -> unit = fun str -> (Label.set_text obj str)

  method set_text_with_mnemonic : string -> unit = fun str -> (Label.set_text_with_mnemonic obj str)

  method set_wrap_mode : Pango.wrapmode -> unit = fun wrap_mode -> (Label.set_wrap_mode obj wrap_mode)

  method as_widget = (Label.as_widget obj)
    method as_label = obj
end

