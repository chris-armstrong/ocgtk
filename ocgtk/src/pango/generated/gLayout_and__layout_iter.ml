(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

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


class layout (obj : Layout_and__layout_iter.Layout.t) : layout_t = object (self)

  method context_changed : unit -> unit =
    fun () ->
      (Layout_and__layout_iter.Layout.context_changed obj)

  method copy : unit -> layout_t =
    fun () ->
      new  layout(Layout_and__layout_iter.Layout.copy obj)

  method get_alignment : unit -> Pango_enums.alignment =
    fun () ->
      (Layout_and__layout_iter.Layout.get_alignment obj)

  method get_attributes : unit -> Attr_list.t option =
    fun () ->
      (Layout_and__layout_iter.Layout.get_attributes obj)

  method get_auto_dir : unit -> bool =
    fun () ->
      (Layout_and__layout_iter.Layout.get_auto_dir obj)

  method get_baseline : unit -> int =
    fun () ->
      (Layout_and__layout_iter.Layout.get_baseline obj)

  method get_character_count : unit -> int =
    fun () ->
      (Layout_and__layout_iter.Layout.get_character_count obj)

  method get_context : unit -> GContext_and__font_and__font_map_and__fontset.context_t =
    fun () ->
      new  GContext_and__font_and__font_map_and__fontset.context(Layout_and__layout_iter.Layout.get_context obj)

  method get_direction : int -> Pango_enums.direction =
    fun index ->
      (Layout_and__layout_iter.Layout.get_direction obj index)

  method get_ellipsize : unit -> Pango_enums.ellipsizemode =
    fun () ->
      (Layout_and__layout_iter.Layout.get_ellipsize obj)

  method get_font_description : unit -> Font_description.t option =
    fun () ->
      (Layout_and__layout_iter.Layout.get_font_description obj)

  method get_height : unit -> int =
    fun () ->
      (Layout_and__layout_iter.Layout.get_height obj)

  method get_indent : unit -> int =
    fun () ->
      (Layout_and__layout_iter.Layout.get_indent obj)

  method get_iter : unit -> Layout_and__layout_iter.Layout_iter.t =
    fun () ->
      (Layout_and__layout_iter.Layout.get_iter obj)

  method get_justify : unit -> bool =
    fun () ->
      (Layout_and__layout_iter.Layout.get_justify obj)

  method get_justify_last_line : unit -> bool =
    fun () ->
      (Layout_and__layout_iter.Layout.get_justify_last_line obj)

  method get_line : int -> Layout_line.t option =
    fun line ->
      (Layout_and__layout_iter.Layout.get_line obj line)

  method get_line_count : unit -> int =
    fun () ->
      (Layout_and__layout_iter.Layout.get_line_count obj)

  method get_line_readonly : int -> Layout_line.t option =
    fun line ->
      (Layout_and__layout_iter.Layout.get_line_readonly obj line)

  method get_line_spacing : unit -> float =
    fun () ->
      (Layout_and__layout_iter.Layout.get_line_spacing obj)

  method get_serial : unit -> int =
    fun () ->
      (Layout_and__layout_iter.Layout.get_serial obj)

  method get_single_paragraph_mode : unit -> bool =
    fun () ->
      (Layout_and__layout_iter.Layout.get_single_paragraph_mode obj)

  method get_spacing : unit -> int =
    fun () ->
      (Layout_and__layout_iter.Layout.get_spacing obj)

  method get_tabs : unit -> Tab_array.t option =
    fun () ->
      (Layout_and__layout_iter.Layout.get_tabs obj)

  method get_text : unit -> string =
    fun () ->
      (Layout_and__layout_iter.Layout.get_text obj)

  method get_unknown_glyphs_count : unit -> int =
    fun () ->
      (Layout_and__layout_iter.Layout.get_unknown_glyphs_count obj)

  method get_width : unit -> int =
    fun () ->
      (Layout_and__layout_iter.Layout.get_width obj)

  method get_wrap : unit -> Pango_enums.wrapmode =
    fun () ->
      (Layout_and__layout_iter.Layout.get_wrap obj)

  method is_ellipsized : unit -> bool =
    fun () ->
      (Layout_and__layout_iter.Layout.is_ellipsized obj)

  method is_wrapped : unit -> bool =
    fun () ->
      (Layout_and__layout_iter.Layout.is_wrapped obj)

  method set_alignment : Pango_enums.alignment -> unit =
    fun alignment ->
      (Layout_and__layout_iter.Layout.set_alignment obj alignment)

  method set_attributes : Attr_list.t option -> unit =
    fun attrs ->
      (Layout_and__layout_iter.Layout.set_attributes obj attrs)

  method set_auto_dir : bool -> unit =
    fun auto_dir ->
      (Layout_and__layout_iter.Layout.set_auto_dir obj auto_dir)

  method set_ellipsize : Pango_enums.ellipsizemode -> unit =
    fun ellipsize ->
      (Layout_and__layout_iter.Layout.set_ellipsize obj ellipsize)

  method set_font_description : Font_description.t option -> unit =
    fun desc ->
      (Layout_and__layout_iter.Layout.set_font_description obj desc)

  method set_height : int -> unit =
    fun height ->
      (Layout_and__layout_iter.Layout.set_height obj height)

  method set_indent : int -> unit =
    fun indent ->
      (Layout_and__layout_iter.Layout.set_indent obj indent)

  method set_justify : bool -> unit =
    fun justify ->
      (Layout_and__layout_iter.Layout.set_justify obj justify)

  method set_justify_last_line : bool -> unit =
    fun justify ->
      (Layout_and__layout_iter.Layout.set_justify_last_line obj justify)

  method set_line_spacing : float -> unit =
    fun factor ->
      (Layout_and__layout_iter.Layout.set_line_spacing obj factor)

  method set_markup : string -> int -> unit =
    fun markup length ->
      (Layout_and__layout_iter.Layout.set_markup obj markup length)

  method set_single_paragraph_mode : bool -> unit =
    fun setting ->
      (Layout_and__layout_iter.Layout.set_single_paragraph_mode obj setting)

  method set_spacing : int -> unit =
    fun spacing ->
      (Layout_and__layout_iter.Layout.set_spacing obj spacing)

  method set_tabs : Tab_array.t option -> unit =
    fun tabs ->
      (Layout_and__layout_iter.Layout.set_tabs obj tabs)

  method set_text : string -> int -> unit =
    fun text length ->
      (Layout_and__layout_iter.Layout.set_text obj text length)

  method set_width : int -> unit =
    fun width ->
      (Layout_and__layout_iter.Layout.set_width obj width)

  method set_wrap : Pango_enums.wrapmode -> unit =
    fun wrap ->
      (Layout_and__layout_iter.Layout.set_wrap obj wrap)

  method write_to_file : Pango_enums.layoutserializeflags -> string -> (bool, GError.t) result =
    fun flags filename ->
      (Layout_and__layout_iter.Layout.write_to_file obj flags filename)

    method as_layout = obj
end

and layout_iter (obj : Layout_and__layout_iter.Layout_iter.t) : layout_iter_t = object (self)

  method at_last_line : unit -> bool =
    fun () ->
      (Layout_and__layout_iter.Layout_iter.at_last_line obj)

  method copy : unit -> Layout_and__layout_iter.Layout_iter.t option =
    fun () ->
      (Layout_and__layout_iter.Layout_iter.copy obj)

  method free : unit -> unit =
    fun () ->
      (Layout_and__layout_iter.Layout_iter.free obj)

  method get_baseline : unit -> int =
    fun () ->
      (Layout_and__layout_iter.Layout_iter.get_baseline obj)

  method get_index : unit -> int =
    fun () ->
      (Layout_and__layout_iter.Layout_iter.get_index obj)

  method get_layout : unit -> layout_t option =
    fun () ->
      Option.map (fun ret -> new layout ret) (Layout_and__layout_iter.Layout_iter.get_layout obj)

  method get_line : unit -> Layout_line.t option =
    fun () ->
      (Layout_and__layout_iter.Layout_iter.get_line obj)

  method get_line_readonly : unit -> Layout_line.t option =
    fun () ->
      (Layout_and__layout_iter.Layout_iter.get_line_readonly obj)

  method get_run_baseline : unit -> int =
    fun () ->
      (Layout_and__layout_iter.Layout_iter.get_run_baseline obj)

  method next_char : unit -> bool =
    fun () ->
      (Layout_and__layout_iter.Layout_iter.next_char obj)

  method next_cluster : unit -> bool =
    fun () ->
      (Layout_and__layout_iter.Layout_iter.next_cluster obj)

  method next_line : unit -> bool =
    fun () ->
      (Layout_and__layout_iter.Layout_iter.next_line obj)

  method next_run : unit -> bool =
    fun () ->
      (Layout_and__layout_iter.Layout_iter.next_run obj)

    method as_layout_iter = obj
end
let new_ (context : GContext_and__font_and__font_map_and__fontset.context_t) : layout_t =
  let context = context#as_context in
  let obj_ = Layout_and__layout_iter.Layout.new_ context in
  new layout obj_

