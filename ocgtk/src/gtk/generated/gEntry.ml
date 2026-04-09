(* Signal class defined in gentry_signals.ml *)

class type entry_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
    inherit Gentry_signals.entry_signals
    method get_activates_default : unit -> bool
    method get_alignment : unit -> float
    method get_attributes : unit -> Ocgtk_pango.Pango.Attr_list.attr_list_t option
    method get_buffer : unit -> GEntry_buffer.entry_buffer_t
    method get_completion : unit -> GEntry_completion.entry_completion_t option
    method get_current_icon_drag_source : unit -> int
    method get_extra_menu : unit -> Ocgtk_gio.Gio.Menu_model.menu_model_t option
    method get_has_frame : unit -> bool
    method get_icon_activatable : Gtk_enums.entryiconposition -> bool
    method get_icon_at_pos : int -> int -> int
    method get_icon_gicon : Gtk_enums.entryiconposition -> Ocgtk_gio.Gio.Icon.icon_t option
    method get_icon_name : Gtk_enums.entryiconposition -> string option
    method get_icon_paintable : Gtk_enums.entryiconposition -> Ocgtk_gdk.Gdk.Paintable.paintable_t option
    method get_icon_sensitive : Gtk_enums.entryiconposition -> bool
    method get_icon_storage_type : Gtk_enums.entryiconposition -> Gtk_enums.imagetype
    method get_icon_tooltip_markup : Gtk_enums.entryiconposition -> string option
    method get_icon_tooltip_text : Gtk_enums.entryiconposition -> string option
    method get_input_hints : unit -> Gtk_enums.inputhints
    method get_input_purpose : unit -> Gtk_enums.inputpurpose
    method get_invisible_char : unit -> int
    method get_max_length : unit -> int
    method get_overwrite_mode : unit -> bool
    method get_placeholder_text : unit -> string option
    method get_progress_fraction : unit -> float
    method get_progress_pulse_step : unit -> float
    method get_tabs : unit -> Ocgtk_pango.Pango.Tab_array.tab_array_t option
    method get_text_length : unit -> int
    method get_visibility : unit -> bool
    method grab_focus_without_selecting : unit -> bool
    method progress_pulse : unit -> unit
    method reset_im_context : unit -> unit
    method set_activates_default : bool -> unit
    method set_alignment : float -> unit
    method set_attributes : Ocgtk_pango.Pango.Attr_list.attr_list_t -> unit
    method set_buffer : GEntry_buffer.entry_buffer_t -> unit
    method set_completion : GEntry_completion.entry_completion_t option -> unit
    method set_extra_menu : Ocgtk_gio.Gio.Menu_model.menu_model_t option -> unit
    method set_has_frame : bool -> unit
    method set_icon_activatable : Gtk_enums.entryiconposition -> bool -> unit
    method set_icon_drag_source : Gtk_enums.entryiconposition -> Ocgtk_gdk.Gdk.Content_provider.content_provider_t -> Ocgtk_gdk.Gdk.dragaction -> unit
    method set_icon_from_gicon : Gtk_enums.entryiconposition -> Ocgtk_gio.Gio.Icon.icon_t option -> unit
    method set_icon_from_icon_name : Gtk_enums.entryiconposition -> string option -> unit
    method set_icon_from_paintable : Gtk_enums.entryiconposition -> Ocgtk_gdk.Gdk.Paintable.paintable_t option -> unit
    method set_icon_sensitive : Gtk_enums.entryiconposition -> bool -> unit
    method set_icon_tooltip_markup : Gtk_enums.entryiconposition -> string option -> unit
    method set_icon_tooltip_text : Gtk_enums.entryiconposition -> string option -> unit
    method set_input_hints : Gtk_enums.inputhints -> unit
    method set_input_purpose : Gtk_enums.inputpurpose -> unit
    method set_invisible_char : int -> unit
    method set_max_length : int -> unit
    method set_overwrite_mode : bool -> unit
    method set_placeholder_text : string option -> unit
    method set_progress_fraction : float -> unit
    method set_progress_pulse_step : float -> unit
    method set_tabs : Ocgtk_pango.Pango.Tab_array.tab_array_t option -> unit
    method set_visibility : bool -> unit
    method unset_invisible_char : unit -> unit
    method enable_emoji_completion : bool
    method set_enable_emoji_completion : bool -> unit
    method im_module : string
    method set_im_module : string -> unit
    method invisible_char_set : bool
    method set_invisible_char_set : bool -> unit
    method primary_icon_activatable : bool
    method set_primary_icon_activatable : bool -> unit
    method primary_icon_gicon : Ocgtk_gio.Gio.Icon.icon_t
    method set_primary_icon_gicon : Ocgtk_gio.Gio.Icon.icon_t -> unit
    method primary_icon_name : string
    method set_primary_icon_name : string -> unit
    method primary_icon_paintable : Ocgtk_gdk.Gdk.Paintable.paintable_t
    method set_primary_icon_paintable : Ocgtk_gdk.Gdk.Paintable.paintable_t -> unit
    method primary_icon_sensitive : bool
    method set_primary_icon_sensitive : bool -> unit
    method primary_icon_storage_type : Gtk_enums.imagetype
    method primary_icon_tooltip_markup : string
    method set_primary_icon_tooltip_markup : string -> unit
    method primary_icon_tooltip_text : string
    method set_primary_icon_tooltip_text : string -> unit
    method scroll_offset : int
    method secondary_icon_activatable : bool
    method set_secondary_icon_activatable : bool -> unit
    method secondary_icon_gicon : Ocgtk_gio.Gio.Icon.icon_t
    method set_secondary_icon_gicon : Ocgtk_gio.Gio.Icon.icon_t -> unit
    method secondary_icon_name : string
    method set_secondary_icon_name : string -> unit
    method secondary_icon_paintable : Ocgtk_gdk.Gdk.Paintable.paintable_t
    method set_secondary_icon_paintable : Ocgtk_gdk.Gdk.Paintable.paintable_t -> unit
    method secondary_icon_sensitive : bool
    method set_secondary_icon_sensitive : bool -> unit
    method secondary_icon_storage_type : Gtk_enums.imagetype
    method secondary_icon_tooltip_markup : string
    method set_secondary_icon_tooltip_markup : string -> unit
    method secondary_icon_tooltip_text : string
    method set_secondary_icon_tooltip_text : string -> unit
    method show_emoji_icon : bool
    method set_show_emoji_icon : bool -> unit
    method truncate_multiline : bool
    method set_truncate_multiline : bool -> unit
    method as_entry : Entry.t
end

(* High-level class for Entry *)
class entry (obj : Entry.t) : entry_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (obj :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t)
  inherit Gentry_signals.entry_signals obj

  method get_activates_default : unit -> bool =
    fun () ->
      (Entry.get_activates_default obj)

  method get_alignment : unit -> float =
    fun () ->
      (Entry.get_alignment obj)

  method get_attributes : unit -> Ocgtk_pango.Pango.Attr_list.attr_list_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_pango.Pango.Attr_list.attr_list ret) (Entry.get_attributes obj)

  method get_buffer : unit -> GEntry_buffer.entry_buffer_t =
    fun () ->
      new  GEntry_buffer.entry_buffer(Entry.get_buffer obj)

  method get_completion : unit -> GEntry_completion.entry_completion_t option =
    fun () ->
      Option.map (fun ret -> new GEntry_completion.entry_completion ret) (Entry.get_completion obj)

  method get_current_icon_drag_source : unit -> int =
    fun () ->
      (Entry.get_current_icon_drag_source obj)

  method get_extra_menu : unit -> Ocgtk_gio.Gio.Menu_model.menu_model_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gio.Gio.Menu_model.menu_model ret) (Entry.get_extra_menu obj)

  method get_has_frame : unit -> bool =
    fun () ->
      (Entry.get_has_frame obj)

  method get_icon_activatable : Gtk_enums.entryiconposition -> bool =
    fun icon_pos ->
      (Entry.get_icon_activatable obj icon_pos)

  method get_icon_at_pos : int -> int -> int =
    fun x y ->
      (Entry.get_icon_at_pos obj x y)

  method get_icon_gicon : Gtk_enums.entryiconposition -> Ocgtk_gio.Gio.Icon.icon_t option =
    fun icon_pos ->
      Option.map (fun ret -> new Ocgtk_gio.Gio.Icon.icon ret) (Entry.get_icon_gicon obj icon_pos)

  method get_icon_name : Gtk_enums.entryiconposition -> string option =
    fun icon_pos ->
      (Entry.get_icon_name obj icon_pos)

  method get_icon_paintable : Gtk_enums.entryiconposition -> Ocgtk_gdk.Gdk.Paintable.paintable_t option =
    fun icon_pos ->
      Option.map (fun ret -> new Ocgtk_gdk.Gdk.Paintable.paintable ret) (Entry.get_icon_paintable obj icon_pos)

  method get_icon_sensitive : Gtk_enums.entryiconposition -> bool =
    fun icon_pos ->
      (Entry.get_icon_sensitive obj icon_pos)

  method get_icon_storage_type : Gtk_enums.entryiconposition -> Gtk_enums.imagetype =
    fun icon_pos ->
      (Entry.get_icon_storage_type obj icon_pos)

  method get_icon_tooltip_markup : Gtk_enums.entryiconposition -> string option =
    fun icon_pos ->
      (Entry.get_icon_tooltip_markup obj icon_pos)

  method get_icon_tooltip_text : Gtk_enums.entryiconposition -> string option =
    fun icon_pos ->
      (Entry.get_icon_tooltip_text obj icon_pos)

  method get_input_hints : unit -> Gtk_enums.inputhints =
    fun () ->
      (Entry.get_input_hints obj)

  method get_input_purpose : unit -> Gtk_enums.inputpurpose =
    fun () ->
      (Entry.get_input_purpose obj)

  method get_invisible_char : unit -> int =
    fun () ->
      (Entry.get_invisible_char obj)

  method get_max_length : unit -> int =
    fun () ->
      (Entry.get_max_length obj)

  method get_overwrite_mode : unit -> bool =
    fun () ->
      (Entry.get_overwrite_mode obj)

  method get_placeholder_text : unit -> string option =
    fun () ->
      (Entry.get_placeholder_text obj)

  method get_progress_fraction : unit -> float =
    fun () ->
      (Entry.get_progress_fraction obj)

  method get_progress_pulse_step : unit -> float =
    fun () ->
      (Entry.get_progress_pulse_step obj)

  method get_tabs : unit -> Ocgtk_pango.Pango.Tab_array.tab_array_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_pango.Pango.Tab_array.tab_array ret) (Entry.get_tabs obj)

  method get_text_length : unit -> int =
    fun () ->
      (Entry.get_text_length obj)

  method get_visibility : unit -> bool =
    fun () ->
      (Entry.get_visibility obj)

  method grab_focus_without_selecting : unit -> bool =
    fun () ->
      (Entry.grab_focus_without_selecting obj)

  method progress_pulse : unit -> unit =
    fun () ->
      (Entry.progress_pulse obj)

  method reset_im_context : unit -> unit =
    fun () ->
      (Entry.reset_im_context obj)

  method set_activates_default : bool -> unit =
    fun setting ->
      (Entry.set_activates_default obj setting)

  method set_alignment : float -> unit =
    fun xalign ->
      (Entry.set_alignment obj xalign)

  method set_attributes : Ocgtk_pango.Pango.Attr_list.attr_list_t -> unit =
    fun attrs ->
      let attrs = attrs#as_attr_list in
      (Entry.set_attributes obj attrs)

  method set_buffer : GEntry_buffer.entry_buffer_t -> unit =
    fun buffer ->
      let buffer = buffer#as_entry_buffer in
      (Entry.set_buffer obj buffer)

  method set_completion : GEntry_completion.entry_completion_t option -> unit =
    fun completion ->
      let completion = Option.map (fun (c) -> c#as_entry_completion) completion in
      (Entry.set_completion obj completion)

  method set_extra_menu : Ocgtk_gio.Gio.Menu_model.menu_model_t option -> unit =
    fun model ->
      let model = Option.map (fun (c) -> c#as_menu_model) model in
      (Entry.set_extra_menu obj model)

  method set_has_frame : bool -> unit =
    fun setting ->
      (Entry.set_has_frame obj setting)

  method set_icon_activatable : Gtk_enums.entryiconposition -> bool -> unit =
    fun icon_pos activatable ->
      (Entry.set_icon_activatable obj icon_pos activatable)

  method set_icon_drag_source : Gtk_enums.entryiconposition -> Ocgtk_gdk.Gdk.Content_provider.content_provider_t -> Ocgtk_gdk.Gdk.dragaction -> unit =
    fun icon_pos provider actions ->
      let provider = provider#as_content_provider in
      (Entry.set_icon_drag_source obj icon_pos provider actions)

  method set_icon_from_gicon : Gtk_enums.entryiconposition -> Ocgtk_gio.Gio.Icon.icon_t option -> unit =
    fun icon_pos icon ->
      let icon = Option.map (fun (c) -> c#as_icon) icon in
      (Entry.set_icon_from_gicon obj icon_pos icon)

  method set_icon_from_icon_name : Gtk_enums.entryiconposition -> string option -> unit =
    fun icon_pos icon_name ->
      (Entry.set_icon_from_icon_name obj icon_pos icon_name)

  method set_icon_from_paintable : Gtk_enums.entryiconposition -> Ocgtk_gdk.Gdk.Paintable.paintable_t option -> unit =
    fun icon_pos paintable ->
      let paintable = Option.map (fun (c) -> c#as_paintable) paintable in
      (Entry.set_icon_from_paintable obj icon_pos paintable)

  method set_icon_sensitive : Gtk_enums.entryiconposition -> bool -> unit =
    fun icon_pos sensitive ->
      (Entry.set_icon_sensitive obj icon_pos sensitive)

  method set_icon_tooltip_markup : Gtk_enums.entryiconposition -> string option -> unit =
    fun icon_pos tooltip ->
      (Entry.set_icon_tooltip_markup obj icon_pos tooltip)

  method set_icon_tooltip_text : Gtk_enums.entryiconposition -> string option -> unit =
    fun icon_pos tooltip ->
      (Entry.set_icon_tooltip_text obj icon_pos tooltip)

  method set_input_hints : Gtk_enums.inputhints -> unit =
    fun hints ->
      (Entry.set_input_hints obj hints)

  method set_input_purpose : Gtk_enums.inputpurpose -> unit =
    fun purpose ->
      (Entry.set_input_purpose obj purpose)

  method set_invisible_char : int -> unit =
    fun ch ->
      (Entry.set_invisible_char obj ch)

  method set_max_length : int -> unit =
    fun max ->
      (Entry.set_max_length obj max)

  method set_overwrite_mode : bool -> unit =
    fun overwrite ->
      (Entry.set_overwrite_mode obj overwrite)

  method set_placeholder_text : string option -> unit =
    fun text ->
      (Entry.set_placeholder_text obj text)

  method set_progress_fraction : float -> unit =
    fun fraction ->
      (Entry.set_progress_fraction obj fraction)

  method set_progress_pulse_step : float -> unit =
    fun fraction ->
      (Entry.set_progress_pulse_step obj fraction)

  method set_tabs : Ocgtk_pango.Pango.Tab_array.tab_array_t option -> unit =
    fun tabs ->
      let tabs = Option.map (fun (c) -> c#as_tab_array) tabs in
      (Entry.set_tabs obj tabs)

  method set_visibility : bool -> unit =
    fun visible ->
      (Entry.set_visibility obj visible)

  method unset_invisible_char : unit -> unit =
    fun () ->
      (Entry.unset_invisible_char obj)

  method enable_emoji_completion = Entry.get_enable_emoji_completion obj
  method set_enable_emoji_completion v =  Entry.set_enable_emoji_completion obj v

  method im_module = Entry.get_im_module obj
  method set_im_module v =  Entry.set_im_module obj v

  method invisible_char_set = Entry.get_invisible_char_set obj
  method set_invisible_char_set v =  Entry.set_invisible_char_set obj v

  method primary_icon_activatable = Entry.get_primary_icon_activatable obj
  method set_primary_icon_activatable v =  Entry.set_primary_icon_activatable obj v

  method primary_icon_gicon = new Ocgtk_gio.Gio.Icon.icon (Entry.get_primary_icon_gicon obj)
  method set_primary_icon_gicon : Ocgtk_gio.Gio.Icon.icon_t -> unit  = fun v ->  Entry.set_primary_icon_gicon obj v#as_icon

  method primary_icon_name = Entry.get_primary_icon_name obj
  method set_primary_icon_name v =  Entry.set_primary_icon_name obj v

  method primary_icon_paintable = new Ocgtk_gdk.Gdk.Paintable.paintable (Entry.get_primary_icon_paintable obj)
  method set_primary_icon_paintable : Ocgtk_gdk.Gdk.Paintable.paintable_t -> unit  = fun v ->  Entry.set_primary_icon_paintable obj v#as_paintable

  method primary_icon_sensitive = Entry.get_primary_icon_sensitive obj
  method set_primary_icon_sensitive v =  Entry.set_primary_icon_sensitive obj v

  method primary_icon_storage_type = Entry.get_primary_icon_storage_type obj

  method primary_icon_tooltip_markup = Entry.get_primary_icon_tooltip_markup obj
  method set_primary_icon_tooltip_markup v =  Entry.set_primary_icon_tooltip_markup obj v

  method primary_icon_tooltip_text = Entry.get_primary_icon_tooltip_text obj
  method set_primary_icon_tooltip_text v =  Entry.set_primary_icon_tooltip_text obj v

  method scroll_offset = Entry.get_scroll_offset obj

  method secondary_icon_activatable = Entry.get_secondary_icon_activatable obj
  method set_secondary_icon_activatable v =  Entry.set_secondary_icon_activatable obj v

  method secondary_icon_gicon = new Ocgtk_gio.Gio.Icon.icon (Entry.get_secondary_icon_gicon obj)
  method set_secondary_icon_gicon : Ocgtk_gio.Gio.Icon.icon_t -> unit  = fun v ->  Entry.set_secondary_icon_gicon obj v#as_icon

  method secondary_icon_name = Entry.get_secondary_icon_name obj
  method set_secondary_icon_name v =  Entry.set_secondary_icon_name obj v

  method secondary_icon_paintable = new Ocgtk_gdk.Gdk.Paintable.paintable (Entry.get_secondary_icon_paintable obj)
  method set_secondary_icon_paintable : Ocgtk_gdk.Gdk.Paintable.paintable_t -> unit  = fun v ->  Entry.set_secondary_icon_paintable obj v#as_paintable

  method secondary_icon_sensitive = Entry.get_secondary_icon_sensitive obj
  method set_secondary_icon_sensitive v =  Entry.set_secondary_icon_sensitive obj v

  method secondary_icon_storage_type = Entry.get_secondary_icon_storage_type obj

  method secondary_icon_tooltip_markup = Entry.get_secondary_icon_tooltip_markup obj
  method set_secondary_icon_tooltip_markup v =  Entry.set_secondary_icon_tooltip_markup obj v

  method secondary_icon_tooltip_text = Entry.get_secondary_icon_tooltip_text obj
  method set_secondary_icon_tooltip_text v =  Entry.set_secondary_icon_tooltip_text obj v

  method show_emoji_icon = Entry.get_show_emoji_icon obj
  method set_show_emoji_icon v =  Entry.set_show_emoji_icon obj v

  method truncate_multiline = Entry.get_truncate_multiline obj
  method set_truncate_multiline v =  Entry.set_truncate_multiline obj v

    method as_entry = obj
end

let new_ () : entry_t =
  new entry (Entry.new_ ())

let new_with_buffer (buffer : GEntry_buffer.entry_buffer_t) : entry_t =
  let buffer = buffer#as_entry_buffer in
  let obj_ = Entry.new_with_buffer buffer in
  new entry obj_

