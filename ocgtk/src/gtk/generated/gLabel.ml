(* Signal class defined in glabel_signals.ml *)

(* High-level class for Label *)
class label (obj : Label.t) = object (self)
  inherit Glabel_signals.label_signals obj

  method get_attributes : unit -> Ocgtk_pango.Pango.attr_list option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_pango.Pango.attr_list ret) (Label.get_attributes obj)

  method get_current_uri : unit -> string option =
    fun () ->
      (Label.get_current_uri obj)

  method get_ellipsize : unit -> Ocgtk_pango.Pango.ellipsizemode =
    fun () ->
      (Label.get_ellipsize obj)

  method get_extra_menu : unit -> Ocgtk_gio.Gio.menu_model option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gio.Gio.menu_model ret) (Label.get_extra_menu obj)

  method get_justify : unit -> Gtk_enums.justification =
    fun () ->
      (Label.get_justify obj)

  method get_label : unit -> string =
    fun () ->
      (Label.get_label obj)

  method get_layout : unit -> Ocgtk_pango.Pango.layout =
    fun () ->
      new  Ocgtk_pango.Pango.layout(Label.get_layout obj)

  method get_lines : unit -> int =
    fun () ->
      (Label.get_lines obj)

  method get_max_width_chars : unit -> int =
    fun () ->
      (Label.get_max_width_chars obj)

  method get_mnemonic_keyval : unit -> int =
    fun () ->
      (Label.get_mnemonic_keyval obj)

  method get_mnemonic_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option =
    fun () ->
      Option.map (fun ret -> new GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget ret) (Label.get_mnemonic_widget obj)

  method get_natural_wrap_mode : unit -> Gtk_enums.naturalwrapmode =
    fun () ->
      (Label.get_natural_wrap_mode obj)

  method get_selectable : unit -> bool =
    fun () ->
      (Label.get_selectable obj)

  method get_single_line_mode : unit -> bool =
    fun () ->
      (Label.get_single_line_mode obj)

  method get_tabs : unit -> Ocgtk_pango.Pango.tab_array option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_pango.Pango.tab_array ret) (Label.get_tabs obj)

  method get_text : unit -> string =
    fun () ->
      (Label.get_text obj)

  method get_use_markup : unit -> bool =
    fun () ->
      (Label.get_use_markup obj)

  method get_use_underline : unit -> bool =
    fun () ->
      (Label.get_use_underline obj)

  method get_width_chars : unit -> int =
    fun () ->
      (Label.get_width_chars obj)

  method get_wrap : unit -> bool =
    fun () ->
      (Label.get_wrap obj)

  method get_wrap_mode : unit -> Ocgtk_pango.Pango.wrapmode =
    fun () ->
      (Label.get_wrap_mode obj)

  method get_xalign : unit -> float =
    fun () ->
      (Label.get_xalign obj)

  method get_yalign : unit -> float =
    fun () ->
      (Label.get_yalign obj)

  method select_region : int -> int -> unit =
    fun start_offset end_offset ->
      (Label.select_region obj start_offset end_offset)

  method set_attributes : 'p1. (#Ocgtk_pango.Pango.attr_list as 'p1) option -> unit =
    fun attrs ->
      let attrs = Option.map (fun (c) -> c#as_attr_list) attrs in
      (Label.set_attributes obj attrs)

  method set_ellipsize : Ocgtk_pango.Pango.ellipsizemode -> unit =
    fun mode ->
      (Label.set_ellipsize obj mode)

  method set_extra_menu : 'p1. (#Ocgtk_gio.Gio.menu_model as 'p1) option -> unit =
    fun model ->
      let model = Option.map (fun (c) -> c#as_menu_model) model in
      (Label.set_extra_menu obj model)

  method set_justify : Gtk_enums.justification -> unit =
    fun jtype ->
      (Label.set_justify obj jtype)

  method set_label : string -> unit =
    fun str ->
      (Label.set_label obj str)

  method set_lines : int -> unit =
    fun lines ->
      (Label.set_lines obj lines)

  method set_markup : string -> unit =
    fun str ->
      (Label.set_markup obj str)

  method set_markup_with_mnemonic : string -> unit =
    fun str ->
      (Label.set_markup_with_mnemonic obj str)

  method set_max_width_chars : int -> unit =
    fun n_chars ->
      (Label.set_max_width_chars obj n_chars)

  method set_mnemonic_widget : 'p1. (#GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget as 'p1) option -> unit =
    fun widget ->
      let widget = Option.map (fun (c) -> c#as_widget) widget in
      (Label.set_mnemonic_widget obj widget)

  method set_natural_wrap_mode : Gtk_enums.naturalwrapmode -> unit =
    fun wrap_mode ->
      (Label.set_natural_wrap_mode obj wrap_mode)

  method set_selectable : bool -> unit =
    fun setting ->
      (Label.set_selectable obj setting)

  method set_single_line_mode : bool -> unit =
    fun single_line_mode ->
      (Label.set_single_line_mode obj single_line_mode)

  method set_tabs : 'p1. (#Ocgtk_pango.Pango.tab_array as 'p1) option -> unit =
    fun tabs ->
      let tabs = Option.map (fun (c) -> c#as_tab_array) tabs in
      (Label.set_tabs obj tabs)

  method set_text : string -> unit =
    fun str ->
      (Label.set_text obj str)

  method set_text_with_mnemonic : string -> unit =
    fun str ->
      (Label.set_text_with_mnemonic obj str)

  method set_use_markup : bool -> unit =
    fun setting ->
      (Label.set_use_markup obj setting)

  method set_use_underline : bool -> unit =
    fun setting ->
      (Label.set_use_underline obj setting)

  method set_width_chars : int -> unit =
    fun n_chars ->
      (Label.set_width_chars obj n_chars)

  method set_wrap : bool -> unit =
    fun wrap ->
      (Label.set_wrap obj wrap)

  method set_wrap_mode : Ocgtk_pango.Pango.wrapmode -> unit =
    fun wrap_mode ->
      (Label.set_wrap_mode obj wrap_mode)

  method set_xalign : float -> unit =
    fun xalign ->
      (Label.set_xalign obj xalign)

  method set_yalign : float -> unit =
    fun yalign ->
      (Label.set_yalign obj yalign)

    method as_label = obj
end

