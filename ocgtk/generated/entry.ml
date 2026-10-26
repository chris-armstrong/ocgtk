class type entry_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Cell_editable.cell_editable_t
  inherit Editable.editable_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_icon_press :
    ?after:bool ->
    callback:(icon_pos:Enums.entryiconposition -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_icon_release :
    ?after:bool ->
    callback:(icon_pos:Enums.entryiconposition -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method get_activates_default : unit -> bool
  method get_attributes : unit -> Ocpango.Attr_list.attr_list_t option
  method get_buffer : unit -> Entry_buffer.entry_buffer_t
  method get_completion : unit -> Entry_completion.entry_completion_t option
  method get_current_icon_drag_source : unit -> int
  method get_extra_menu : unit -> Ocgio.Menu_model.menu_model_t option
  method get_has_frame : unit -> bool
  method get_icon_activatable : Enums.entryiconposition -> bool
  method get_icon_at_pos : int -> int -> int
  method get_icon_gicon : Enums.entryiconposition -> Ocgio.Icon.icon_t option
  method get_icon_name : Enums.entryiconposition -> string option

  method get_icon_paintable :
    Enums.entryiconposition -> Ocgdk.Paintable.paintable_t option

  method get_icon_sensitive : Enums.entryiconposition -> bool
  method get_icon_storage_type : Enums.entryiconposition -> Enums.imagetype
  method get_icon_tooltip_markup : Enums.entryiconposition -> string option
  method get_icon_tooltip_text : Enums.entryiconposition -> string option
  method get_input_hints : unit -> Enums.inputhints
  method get_input_purpose : unit -> Enums.inputpurpose
  method get_invisible_char : unit -> int
  method get_max_length : unit -> int
  method get_menu_entry_icon_text : Enums.entryiconposition -> string option
  method get_overwrite_mode : unit -> bool
  method get_placeholder_text : unit -> string option
  method get_progress_fraction : unit -> float
  method get_progress_pulse_step : unit -> float
  method get_tabs : unit -> Ocpango.Tab_array.tab_array_t option
  method get_text_length : unit -> UInt16.t
  method get_visibility : unit -> bool
  method grab_focus_without_selecting : unit -> bool
  method progress_pulse : unit -> unit
  method reset_im_context : unit -> unit
  method set_activates_default : bool -> unit
  method set_attributes : Ocpango.Attr_list.attr_list_t -> unit
  method set_buffer : Entry_buffer.entry_buffer_t -> unit
  method set_completion : Entry_completion.entry_completion_t option -> unit
  method set_extra_menu : Ocgio.Menu_model.menu_model_t option -> unit
  method set_has_frame : bool -> unit
  method set_icon_activatable : Enums.entryiconposition -> bool -> unit

  method set_icon_drag_source :
    Enums.entryiconposition ->
    Ocgdk.Content_provider.content_provider_t ->
    Ocgdk.Enums.dragaction ->
    unit

  method set_icon_from_gicon :
    Enums.entryiconposition -> Ocgio.Icon.icon_t option -> unit

  method set_icon_from_icon_name :
    Enums.entryiconposition -> string option -> unit

  method set_icon_from_paintable :
    Enums.entryiconposition -> Ocgdk.Paintable.paintable_t option -> unit

  method set_icon_sensitive : Enums.entryiconposition -> bool -> unit

  method set_icon_tooltip_markup :
    Enums.entryiconposition -> string option -> unit

  method set_icon_tooltip_text :
    Enums.entryiconposition -> string option -> unit

  method set_input_hints : Enums.inputhints -> unit
  method set_input_purpose : Enums.inputpurpose -> unit
  method set_invisible_char : int -> unit
  method set_max_length : int -> unit
  method set_menu_entry_icon_text : Enums.entryiconposition -> string -> unit
  method set_overwrite_mode : bool -> unit
  method set_placeholder_text : string option -> unit
  method set_progress_fraction : float -> unit
  method set_progress_pulse_step : float -> unit
  method set_tabs : Ocpango.Tab_array.tab_array_t option -> unit
  method set_visibility : bool -> unit
  method unset_invisible_char : unit -> unit
  method enable_emoji_completion : bool
  method set_enable_emoji_completion : bool -> unit
  method im_module : string
  method set_im_module : string -> unit
  method invisible_char_set : bool
  method set_invisible_char_set : bool -> unit
  method menu_entry_icon_primary_text : string
  method set_menu_entry_icon_primary_text : string -> unit
  method menu_entry_icon_secondary_text : string
  method set_menu_entry_icon_secondary_text : string -> unit
  method primary_icon_activatable : bool
  method set_primary_icon_activatable : bool -> unit
  method primary_icon_gicon : Ocgio.Icon.icon_t
  method set_primary_icon_gicon : Ocgio.Icon.icon_t -> unit
  method primary_icon_name : string
  method set_primary_icon_name : string -> unit
  method primary_icon_paintable : Ocgdk.Paintable.paintable_t
  method set_primary_icon_paintable : Ocgdk.Paintable.paintable_t -> unit
  method primary_icon_sensitive : bool
  method set_primary_icon_sensitive : bool -> unit
  method primary_icon_storage_type : Enums.imagetype
  method primary_icon_tooltip_markup : string
  method set_primary_icon_tooltip_markup : string -> unit
  method primary_icon_tooltip_text : string
  method set_primary_icon_tooltip_text : string -> unit
  method scroll_offset : int
  method secondary_icon_activatable : bool
  method set_secondary_icon_activatable : bool -> unit
  method secondary_icon_gicon : Ocgio.Icon.icon_t
  method set_secondary_icon_gicon : Ocgio.Icon.icon_t -> unit
  method secondary_icon_name : string
  method set_secondary_icon_name : string -> unit
  method secondary_icon_paintable : Ocgdk.Paintable.paintable_t
  method set_secondary_icon_paintable : Ocgdk.Paintable.paintable_t -> unit
  method secondary_icon_sensitive : bool
  method set_secondary_icon_sensitive : bool -> unit
  method secondary_icon_storage_type : Enums.imagetype
  method secondary_icon_tooltip_markup : string
  method set_secondary_icon_tooltip_markup : string -> unit
  method secondary_icon_tooltip_text : string
  method set_secondary_icon_tooltip_text : string -> unit
  method show_emoji_icon : bool
  method set_show_emoji_icon : bool -> unit
  method truncate_multiline : bool
  method set_truncate_multiline : bool -> unit
  method as_entry : Raw.Entry.t
end

(* High-level class for Entry *)
class entry (obj : Raw.Entry.t) : entry_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    inherit Cell_editable.cell_editable (Raw.Cell_editable.from_gobject obj)
    inherit Editable.editable (Raw.Editable.from_gobject obj)

    method on_activate ?(after = false) ~callback () =
      Raw.Entry.on_activate ~after self#as_entry ~callback

    method on_icon_press ?(after = false) ~callback () =
      Raw.Entry.on_icon_press ~after self#as_entry ~callback

    method on_icon_release ?(after = false) ~callback () =
      Raw.Entry.on_icon_release ~after self#as_entry ~callback

    method get_activates_default : unit -> bool =
      fun () -> Raw.Entry.get_activates_default obj

    method get_attributes : unit -> Ocpango.Attr_list.attr_list_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocpango.Attr_list.attr_list ret)
          (Raw.Entry.get_attributes obj)

    method get_buffer : unit -> Entry_buffer.entry_buffer_t =
      fun () -> new Entry_buffer.entry_buffer (Raw.Entry.get_buffer obj)

    method get_completion : unit -> Entry_completion.entry_completion_t option =
      fun () ->
        Option.map
          (fun ret -> new Entry_completion.entry_completion ret)
          (Raw.Entry.get_completion obj)

    method get_current_icon_drag_source : unit -> int =
      fun () -> Raw.Entry.get_current_icon_drag_source obj

    method get_extra_menu : unit -> Ocgio.Menu_model.menu_model_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgio.Menu_model.menu_model ret)
          (Raw.Entry.get_extra_menu obj)

    method get_has_frame : unit -> bool = fun () -> Raw.Entry.get_has_frame obj

    method get_icon_activatable : Enums.entryiconposition -> bool =
      fun icon_pos -> Raw.Entry.get_icon_activatable obj icon_pos

    method get_icon_at_pos : int -> int -> int =
      fun x y -> Raw.Entry.get_icon_at_pos obj x y

    method get_icon_gicon : Enums.entryiconposition -> Ocgio.Icon.icon_t option
        =
      fun icon_pos ->
        Option.map
          (fun ret -> new Ocgio.Icon.icon ret)
          (Raw.Entry.get_icon_gicon obj icon_pos)

    method get_icon_name : Enums.entryiconposition -> string option =
      fun icon_pos -> Raw.Entry.get_icon_name obj icon_pos

    method get_icon_paintable :
        Enums.entryiconposition -> Ocgdk.Paintable.paintable_t option =
      fun icon_pos ->
        Option.map
          (fun ret -> new Ocgdk.Paintable.paintable ret)
          (Raw.Entry.get_icon_paintable obj icon_pos)

    method get_icon_sensitive : Enums.entryiconposition -> bool =
      fun icon_pos -> Raw.Entry.get_icon_sensitive obj icon_pos

    method get_icon_storage_type : Enums.entryiconposition -> Enums.imagetype =
      fun icon_pos -> Raw.Entry.get_icon_storage_type obj icon_pos

    method get_icon_tooltip_markup : Enums.entryiconposition -> string option =
      fun icon_pos -> Raw.Entry.get_icon_tooltip_markup obj icon_pos

    method get_icon_tooltip_text : Enums.entryiconposition -> string option =
      fun icon_pos -> Raw.Entry.get_icon_tooltip_text obj icon_pos

    method get_input_hints : unit -> Enums.inputhints =
      fun () -> Raw.Entry.get_input_hints obj

    method get_input_purpose : unit -> Enums.inputpurpose =
      fun () -> Raw.Entry.get_input_purpose obj

    method get_invisible_char : unit -> int =
      fun () -> Raw.Entry.get_invisible_char obj

    method get_max_length : unit -> int = fun () -> Raw.Entry.get_max_length obj

    method get_menu_entry_icon_text : Enums.entryiconposition -> string option =
      fun icon_pos -> Raw.Entry.get_menu_entry_icon_text obj icon_pos

    method get_overwrite_mode : unit -> bool =
      fun () -> Raw.Entry.get_overwrite_mode obj

    method get_placeholder_text : unit -> string option =
      fun () -> Raw.Entry.get_placeholder_text obj

    method get_progress_fraction : unit -> float =
      fun () -> Raw.Entry.get_progress_fraction obj

    method get_progress_pulse_step : unit -> float =
      fun () -> Raw.Entry.get_progress_pulse_step obj

    method get_tabs : unit -> Ocpango.Tab_array.tab_array_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocpango.Tab_array.tab_array ret)
          (Raw.Entry.get_tabs obj)

    method get_text_length : unit -> UInt16.t =
      fun () -> Raw.Entry.get_text_length obj

    method get_visibility : unit -> bool =
      fun () -> Raw.Entry.get_visibility obj

    method grab_focus_without_selecting : unit -> bool =
      fun () -> Raw.Entry.grab_focus_without_selecting obj

    method progress_pulse : unit -> unit =
      fun () -> Raw.Entry.progress_pulse obj

    method reset_im_context : unit -> unit =
      fun () -> Raw.Entry.reset_im_context obj

    method set_activates_default : bool -> unit =
      fun setting -> Raw.Entry.set_activates_default obj setting

    method set_attributes : Ocpango.Attr_list.attr_list_t -> unit =
      fun attrs ->
        let attrs = attrs#as_attr_list in
        Raw.Entry.set_attributes obj attrs

    method set_buffer : Entry_buffer.entry_buffer_t -> unit =
      fun buffer ->
        let buffer = buffer#as_entry_buffer in
        Raw.Entry.set_buffer obj buffer

    method set_completion : Entry_completion.entry_completion_t option -> unit =
      fun completion ->
        let completion =
          Option.map (fun c -> c#as_entry_completion) completion
        in
        Raw.Entry.set_completion obj completion

    method set_extra_menu : Ocgio.Menu_model.menu_model_t option -> unit =
      fun model ->
        let model = Option.map (fun c -> c#as_menu_model) model in
        Raw.Entry.set_extra_menu obj model

    method set_has_frame : bool -> unit =
      fun setting -> Raw.Entry.set_has_frame obj setting

    method set_icon_activatable : Enums.entryiconposition -> bool -> unit =
      fun icon_pos activatable ->
        Raw.Entry.set_icon_activatable obj icon_pos activatable

    method set_icon_drag_source :
        Enums.entryiconposition ->
        Ocgdk.Content_provider.content_provider_t ->
        Ocgdk.Enums.dragaction ->
        unit =
      fun icon_pos provider actions ->
        let provider = provider#as_content_provider in
        Raw.Entry.set_icon_drag_source obj icon_pos provider actions

    method set_icon_from_gicon :
        Enums.entryiconposition -> Ocgio.Icon.icon_t option -> unit =
      fun icon_pos icon ->
        let icon = Option.map (fun c -> c#as_icon) icon in
        Raw.Entry.set_icon_from_gicon obj icon_pos icon

    method set_icon_from_icon_name :
        Enums.entryiconposition -> string option -> unit =
      fun icon_pos icon_name ->
        Raw.Entry.set_icon_from_icon_name obj icon_pos icon_name

    method set_icon_from_paintable :
        Enums.entryiconposition -> Ocgdk.Paintable.paintable_t option -> unit =
      fun icon_pos paintable ->
        let paintable = Option.map (fun c -> c#as_paintable) paintable in
        Raw.Entry.set_icon_from_paintable obj icon_pos paintable

    method set_icon_sensitive : Enums.entryiconposition -> bool -> unit =
      fun icon_pos sensitive ->
        Raw.Entry.set_icon_sensitive obj icon_pos sensitive

    method set_icon_tooltip_markup :
        Enums.entryiconposition -> string option -> unit =
      fun icon_pos tooltip ->
        Raw.Entry.set_icon_tooltip_markup obj icon_pos tooltip

    method set_icon_tooltip_text :
        Enums.entryiconposition -> string option -> unit =
      fun icon_pos tooltip ->
        Raw.Entry.set_icon_tooltip_text obj icon_pos tooltip

    method set_input_hints : Enums.inputhints -> unit =
      fun hints -> Raw.Entry.set_input_hints obj hints

    method set_input_purpose : Enums.inputpurpose -> unit =
      fun purpose -> Raw.Entry.set_input_purpose obj purpose

    method set_invisible_char : int -> unit =
      fun ch -> Raw.Entry.set_invisible_char obj ch

    method set_max_length : int -> unit =
      fun max -> Raw.Entry.set_max_length obj max

    method set_menu_entry_icon_text : Enums.entryiconposition -> string -> unit
        =
      fun icon_pos text -> Raw.Entry.set_menu_entry_icon_text obj icon_pos text

    method set_overwrite_mode : bool -> unit =
      fun overwrite -> Raw.Entry.set_overwrite_mode obj overwrite

    method set_placeholder_text : string option -> unit =
      fun text -> Raw.Entry.set_placeholder_text obj text

    method set_progress_fraction : float -> unit =
      fun fraction -> Raw.Entry.set_progress_fraction obj fraction

    method set_progress_pulse_step : float -> unit =
      fun fraction -> Raw.Entry.set_progress_pulse_step obj fraction

    method set_tabs : Ocpango.Tab_array.tab_array_t option -> unit =
      fun tabs ->
        let tabs = Option.map (fun c -> c#as_tab_array) tabs in
        Raw.Entry.set_tabs obj tabs

    method set_visibility : bool -> unit =
      fun visible -> Raw.Entry.set_visibility obj visible

    method unset_invisible_char : unit -> unit =
      fun () -> Raw.Entry.unset_invisible_char obj

    method enable_emoji_completion = Raw.Entry.get_enable_emoji_completion obj

    method set_enable_emoji_completion v =
      Raw.Entry.set_enable_emoji_completion obj v

    method im_module = Raw.Entry.get_im_module obj
    method set_im_module v = Raw.Entry.set_im_module obj v
    method invisible_char_set = Raw.Entry.get_invisible_char_set obj
    method set_invisible_char_set v = Raw.Entry.set_invisible_char_set obj v

    method menu_entry_icon_primary_text =
      Raw.Entry.get_menu_entry_icon_primary_text obj

    method set_menu_entry_icon_primary_text v =
      Raw.Entry.set_menu_entry_icon_primary_text obj v

    method menu_entry_icon_secondary_text =
      Raw.Entry.get_menu_entry_icon_secondary_text obj

    method set_menu_entry_icon_secondary_text v =
      Raw.Entry.set_menu_entry_icon_secondary_text obj v

    method primary_icon_activatable = Raw.Entry.get_primary_icon_activatable obj

    method set_primary_icon_activatable v =
      Raw.Entry.set_primary_icon_activatable obj v

    method primary_icon_gicon =
      new Ocgio.Icon.icon (Raw.Entry.get_primary_icon_gicon obj)

    method set_primary_icon_gicon : Ocgio.Icon.icon_t -> unit =
      fun v -> Raw.Entry.set_primary_icon_gicon obj v#as_icon

    method primary_icon_name = Raw.Entry.get_primary_icon_name obj
    method set_primary_icon_name v = Raw.Entry.set_primary_icon_name obj v

    method primary_icon_paintable =
      new Ocgdk.Paintable.paintable (Raw.Entry.get_primary_icon_paintable obj)

    method set_primary_icon_paintable : Ocgdk.Paintable.paintable_t -> unit =
      fun v -> Raw.Entry.set_primary_icon_paintable obj v#as_paintable

    method primary_icon_sensitive = Raw.Entry.get_primary_icon_sensitive obj

    method set_primary_icon_sensitive v =
      Raw.Entry.set_primary_icon_sensitive obj v

    method primary_icon_storage_type =
      Raw.Entry.get_primary_icon_storage_type obj

    method primary_icon_tooltip_markup =
      Raw.Entry.get_primary_icon_tooltip_markup obj

    method set_primary_icon_tooltip_markup v =
      Raw.Entry.set_primary_icon_tooltip_markup obj v

    method primary_icon_tooltip_text =
      Raw.Entry.get_primary_icon_tooltip_text obj

    method set_primary_icon_tooltip_text v =
      Raw.Entry.set_primary_icon_tooltip_text obj v

    method scroll_offset = Raw.Entry.get_scroll_offset obj

    method secondary_icon_activatable =
      Raw.Entry.get_secondary_icon_activatable obj

    method set_secondary_icon_activatable v =
      Raw.Entry.set_secondary_icon_activatable obj v

    method secondary_icon_gicon =
      new Ocgio.Icon.icon (Raw.Entry.get_secondary_icon_gicon obj)

    method set_secondary_icon_gicon : Ocgio.Icon.icon_t -> unit =
      fun v -> Raw.Entry.set_secondary_icon_gicon obj v#as_icon

    method secondary_icon_name = Raw.Entry.get_secondary_icon_name obj
    method set_secondary_icon_name v = Raw.Entry.set_secondary_icon_name obj v

    method secondary_icon_paintable =
      new Ocgdk.Paintable.paintable (Raw.Entry.get_secondary_icon_paintable obj)

    method set_secondary_icon_paintable : Ocgdk.Paintable.paintable_t -> unit =
      fun v -> Raw.Entry.set_secondary_icon_paintable obj v#as_paintable

    method secondary_icon_sensitive = Raw.Entry.get_secondary_icon_sensitive obj

    method set_secondary_icon_sensitive v =
      Raw.Entry.set_secondary_icon_sensitive obj v

    method secondary_icon_storage_type =
      Raw.Entry.get_secondary_icon_storage_type obj

    method secondary_icon_tooltip_markup =
      Raw.Entry.get_secondary_icon_tooltip_markup obj

    method set_secondary_icon_tooltip_markup v =
      Raw.Entry.set_secondary_icon_tooltip_markup obj v

    method secondary_icon_tooltip_text =
      Raw.Entry.get_secondary_icon_tooltip_text obj

    method set_secondary_icon_tooltip_text v =
      Raw.Entry.set_secondary_icon_tooltip_text obj v

    method show_emoji_icon = Raw.Entry.get_show_emoji_icon obj
    method set_show_emoji_icon v = Raw.Entry.set_show_emoji_icon obj v
    method truncate_multiline = Raw.Entry.get_truncate_multiline obj
    method set_truncate_multiline v = Raw.Entry.set_truncate_multiline obj v
    method as_entry = obj
  end

let new_ () : entry_t = new entry (Raw.Entry.new_ ())

let new_with_buffer (buffer : Entry_buffer.entry_buffer_t) : entry_t =
  let buffer = buffer#as_entry_buffer in
  let obj_ = Raw.Entry.new_with_buffer buffer in
  new entry obj_
