
class type layout_t = object
    method context_changed : unit -> unit
    method copy : unit -> layout_t
    method get_alignment : unit -> Pango_enums.alignment
    method get_attributes : unit -> Attr_list.t option
    method get_auto_dir : unit -> bool
    method get_baseline : unit -> int
    method get_character_count : unit -> int
    method get_context : unit -> GContext_and__font_and__font_map_and__fontset.context_t
    method get_direction : int -> Pango_enums.direction
    method get_ellipsize : unit -> Pango_enums.ellipsizemode
    method get_font_description : unit -> Font_description.t option
    method get_height : unit -> int
    method get_indent : unit -> int
    method get_iter : unit -> Layout_and__layout_iter.Layout_iter.t
    method get_justify : unit -> bool
    method get_justify_last_line : unit -> bool
    method get_line : int -> Layout_line.t option
    method get_line_count : unit -> int
    method get_line_readonly : int -> Layout_line.t option
    method get_line_spacing : unit -> float
    method get_lines : unit -> Layout_line.t list
    method get_lines_readonly : unit -> Layout_line.t list
    method get_serial : unit -> int
    method get_single_paragraph_mode : unit -> bool
    method get_spacing : unit -> int
    method get_tabs : unit -> Tab_array.t option
    method get_text : unit -> string
    method get_unknown_glyphs_count : unit -> int
    method get_width : unit -> int
    method get_wrap : unit -> Pango_enums.wrapmode
    method is_ellipsized : unit -> bool
    method is_wrapped : unit -> bool
    method serialize : Pango_enums.layoutserializeflags -> Glib_bytes.t
    method set_alignment : Pango_enums.alignment -> unit
    method set_attributes : Attr_list.t option -> unit
    method set_auto_dir : bool -> unit
    method set_ellipsize : Pango_enums.ellipsizemode -> unit
    method set_font_description : Font_description.t option -> unit
    method set_height : int -> unit
    method set_indent : int -> unit
    method set_justify : bool -> unit
    method set_justify_last_line : bool -> unit
    method set_line_spacing : float -> unit
    method set_markup : string -> int -> unit
    method set_single_paragraph_mode : bool -> unit
    method set_spacing : int -> unit
    method set_tabs : Tab_array.t option -> unit
    method set_text : string -> int -> unit
    method set_width : int -> unit
    method set_wrap : Pango_enums.wrapmode -> unit
    method write_to_file : Pango_enums.layoutserializeflags -> string -> (bool, GError.t) result
    method as_layout : Layout_and__layout_iter.Layout.t
end

and layout_iter_t = object
    method at_last_line : unit -> bool
    method copy : unit -> Layout_and__layout_iter.Layout_iter.t option
    method free : unit -> unit
    method get_baseline : unit -> int
    method get_index : unit -> int
    method get_layout : unit -> layout_t option
    method get_line : unit -> Layout_line.t option
    method get_line_readonly : unit -> Layout_line.t option
    method get_run_baseline : unit -> int
    method next_char : unit -> bool
    method next_cluster : unit -> bool
    method next_line : unit -> bool
    method next_run : unit -> bool
    method as_layout_iter : Layout_and__layout_iter.Layout_iter.t
end


class layout : Layout_and__layout_iter.Layout.t -> layout_t

and layout_iter : Layout_and__layout_iter.Layout_iter.t -> layout_iter_t
val new_ : GContext_and__font_and__font_map_and__fontset.context_t -> layout_t
