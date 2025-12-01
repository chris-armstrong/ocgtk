(* Signal class defined in glabel_signals.ml *)

(* High-level class for Label *)
class label_skel (obj : Label.t) = object (self)
  inherit GObj.widget_impl (Label.as_widget obj)

  method connect = new Glabel_signals.label_signals obj

  method get_current_uri () = Label.get_current_uri obj
  method current_uri () = Label.get_current_uri obj

  method get_ellipsize () = Label.get_ellipsize obj
  method ellipsize () = Label.get_ellipsize obj

  method get_justify () = Label.get_justify obj
  method justify () = Label.get_justify obj

  method get_label () = Label.get_label obj
  method label () = Label.get_label obj

  method get_lines () = Label.get_lines obj
  method lines () = Label.get_lines obj

  method get_max_width_chars () = Label.get_max_width_chars obj
  method max_width_chars () = Label.get_max_width_chars obj

  method get_mnemonic_keyval () = Label.get_mnemonic_keyval obj
  method mnemonic_keyval () = Label.get_mnemonic_keyval obj

  method get_mnemonic_widget () = Label.get_mnemonic_widget obj
  method mnemonic_widget () = Label.get_mnemonic_widget obj

  method get_natural_wrap_mode () = Label.get_natural_wrap_mode obj
  method natural_wrap_mode () = Label.get_natural_wrap_mode obj

  method get_selectable () = Label.get_selectable obj
  method selectable () = Label.get_selectable obj

  method get_single_line_mode () = Label.get_single_line_mode obj
  method single_line_mode () = Label.get_single_line_mode obj

  method get_text () = Label.get_text obj
  method text () = Label.get_text obj

  method get_use_markup () = Label.get_use_markup obj
  method use_markup () = Label.get_use_markup obj

  method get_use_underline () = Label.get_use_underline obj
  method use_underline () = Label.get_use_underline obj

  method get_width_chars () = Label.get_width_chars obj
  method width_chars () = Label.get_width_chars obj

  method get_wrap () = Label.get_wrap obj
  method wrap () = Label.get_wrap obj

  method get_wrap_mode () = Label.get_wrap_mode obj
  method wrap_mode () = Label.get_wrap_mode obj

  method get_xalign () = Label.get_xalign obj
  method xalign () = Label.get_xalign obj

  method get_yalign () = Label.get_yalign obj
  method yalign () = Label.get_yalign obj

  method select_region start_offset end_offset = Label.select_region obj start_offset end_offset

  method set_ellipsize mode = Label.set_ellipsize obj mode

  method set_justify jtype = Label.set_justify obj jtype

  method set_label str = Label.set_label obj str

  method set_lines lines = Label.set_lines obj lines

  method set_markup str = Label.set_markup obj str

  method set_markup_with_mnemonic str = Label.set_markup_with_mnemonic obj str

  method set_max_width_chars n_chars = Label.set_max_width_chars obj n_chars

  method set_mnemonic_widget widget = Label.set_mnemonic_widget obj widget

  method set_natural_wrap_mode wrap_mode = Label.set_natural_wrap_mode obj wrap_mode

  method set_selectable setting = Label.set_selectable obj setting

  method set_single_line_mode single_line_mode = Label.set_single_line_mode obj single_line_mode

  method set_text str = Label.set_text obj str

  method set_text_with_mnemonic str = Label.set_text_with_mnemonic obj str

  method set_use_markup setting = Label.set_use_markup obj setting

  method set_use_underline setting = Label.set_use_underline obj setting

  method set_width_chars n_chars = Label.set_width_chars obj n_chars

  method set_wrap wrap = Label.set_wrap obj wrap

  method set_wrap_mode wrap_mode = Label.set_wrap_mode obj wrap_mode

  method set_xalign xalign = Label.set_xalign obj xalign

  method set_yalign yalign = Label.set_yalign obj yalign

end

class label obj = object
  inherit label_skel obj
end
