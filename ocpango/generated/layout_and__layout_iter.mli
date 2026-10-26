class type layout_t = object
  method context_changed : unit -> unit
  method copy : unit -> layout_t
  method get_alignment : unit -> Enums.alignment
  method get_attributes : unit -> Raw.Attr_list.t option
  method get_auto_dir : unit -> bool
  method get_baseline : unit -> int
  method get_character_count : unit -> int

  method get_context :
    unit -> Context_and__font_and__font_map_and__fontset.context_t

  method get_direction : int -> Enums.direction
  method get_ellipsize : unit -> Enums.ellipsizemode
  method get_font_description : unit -> Raw.Font_description.t option
  method get_height : unit -> int
  method get_indent : unit -> int
  method get_iter : unit -> Raw.Layout_iter.t
  method get_justify : unit -> bool
  method get_justify_last_line : unit -> bool
  method get_line : int -> Raw.Layout_line.t option
  method get_line_count : unit -> int
  method get_line_readonly : int -> Raw.Layout_line.t option
  method get_line_spacing : unit -> float
  method get_lines : unit -> Raw.Layout_line.t list
  method get_lines_readonly : unit -> Raw.Layout_line.t list
  method get_serial : unit -> int
  method get_single_paragraph_mode : unit -> bool
  method get_spacing : unit -> int
  method get_tabs : unit -> Raw.Tab_array.t option
  method get_text : unit -> string
  method get_unknown_glyphs_count : unit -> int
  method get_width : unit -> int
  method get_wrap : unit -> Enums.wrapmode
  method is_ellipsized : unit -> bool
  method is_wrapped : unit -> bool
  method serialize : Enums.layoutserializeflags -> Glib_bytes.t
  method set_alignment : Enums.alignment -> unit
  method set_attributes : Raw.Attr_list.t option -> unit
  method set_auto_dir : bool -> unit
  method set_ellipsize : Enums.ellipsizemode -> unit
  method set_font_description : Raw.Font_description.t option -> unit
  method set_height : int -> unit
  method set_indent : int -> unit
  method set_justify : bool -> unit
  method set_justify_last_line : bool -> unit
  method set_line_spacing : float -> unit
  method set_markup : string -> int -> unit
  method set_single_paragraph_mode : bool -> unit
  method set_spacing : int -> unit
  method set_tabs : Raw.Tab_array.t option -> unit
  method set_text : string -> int -> unit
  method set_width : int -> unit
  method set_wrap : Enums.wrapmode -> unit

  method write_to_file :
    Enums.layoutserializeflags -> string -> (bool, GError.t) result

  method as_layout : Raw.Layout.t
end

and layout_iter_t = object
  method at_last_line : unit -> bool
  method get_baseline : unit -> int
  method get_index : unit -> int
  method get_layout : unit -> layout_t option
  method get_line : unit -> Raw.Layout_line.t option
  method get_line_readonly : unit -> Raw.Layout_line.t option
  method get_run_baseline : unit -> int
  method next_char : unit -> bool
  method next_cluster : unit -> bool
  method next_line : unit -> bool
  method next_run : unit -> bool
  method as_layout_iter : Raw.Layout_iter.t
end

class layout : Raw.Layout.t -> layout_t

and layout_iter : Raw.Layout_iter.t -> layout_iter_t

val new_ : Context_and__font_and__font_map_and__fontset.context_t -> layout_t
