[@@@ocaml.text
"A single-line text entry widget.\n\n\
 An example GtkEntry\n\n\
 A fairly large set of key bindings are supported by default. If the\n\
 entered text is longer than the allocation of the widget, the widget\n\
 will scroll so that the cursor position is visible.\n\n\
 When using an entry for passwords and other sensitive information, it\n\
 can be put into “password mode” using [Gtk.Entry.set_visibility].\n\
 In this mode, entered text is displayed using a “invisible” character.\n\
 By default, GTK picks the best invisible character that is available\n\
 in the current font, but it can be changed with\n\
 [Gtk.Entry.set_invisible_char].\n\n\
 [GtkEntry] has the ability to display progress or activity\n\
 information behind the text. To make an entry display such information,\n\
 use [Gtk.Entry.set_progress_fraction] or\n\
 [Gtk.Entry.set_progress_pulse_step].\n\n\
 Additionally, [GtkEntry] can show icons at either side of the entry.\n\
 These icons can be activatable by clicking, can be set up as drag source\n\
 and can have tooltips. To add an icon, use\n\
 [Gtk.Entry.set_icon_from_gicon] or one of the various other functions\n\
 that set an icon from an icon name or a paintable. To trigger an action when\n\
 the user clicks an icon, connect to the [Gtk.Entry::icon-press] signal.\n\
 To allow DND operations from an icon, use\n\
 [Gtk.Entry.set_icon_drag_source]. To set a tooltip on an icon, use\n\
 [Gtk.Entry.set_icon_tooltip_text] or the corresponding function\n\
 for markup.\n\n\
 Note that functionality or information that is only available by clicking\n\
 on an icon in an entry may not be accessible at all to users which are not\n\
 able to use a mouse or other pointing device. It is therefore recommended\n\
 that any such functionality should also be available by other means, e.g.\n\
 via the context menu of the entry.\n\n\
 {b CSS nodes}\n\n\
 {[\n\
 entry[.flat][.warning][.error]\n\
 ├── text[.readonly]\n\
 ├── image.left\n\
 ├── image.right\n\
 ╰── [progress[.pulse]]\n\
 ]}\n\n\
 [GtkEntry] has a main node with the name entry. Depending on the properties\n\
 of the entry, the style classes .read-only and .flat may appear. The style\n\
 classes .warning and .error may also be used with entries.\n\n\
 When the entry shows icons, it adds subnodes with the name image and the\n\
 style class .left or .right, depending on where the icon appears.\n\n\
 When the entry shows progress, it adds a subnode with the name progress.\n\
 The node has the style class .pulse when the shown progress is pulsing.\n\n\
 For all the subnodes added to the text node in various situations,\n\
 see [Gtk.Text].\n\n\
 {b GtkEntry as GtkBuildable}\n\n\
 The [GtkEntry] implementation of the [GtkBuildable] interface supports a\n\
 custom [<attributes>] element, which supports any number of [<attribute>]\n\
 elements. The [<attribute>] element has attributes named “name“, “value“,\n\
 “start“ and “end“ and allows you to specify [PangoAttribute] values for\n\
 this label.\n\n\
 An example of a UI definition fragment specifying Pango attributes:\n\n\
 {[\n\
 <object class=\"GtkEntry\">\n\
\  <attributes>\n\
\    <attribute name=\"weight\" value=\"PANGO_WEIGHT_BOLD\"/>\n\
\    <attribute name=\"background\" value=\"red\" start=\"5\" end=\"10\"/>\n\
\  </attributes>\n\
 </object>\n\
 ]}\n\n\
 The start and end attributes specify the range of characters to which the\n\
 Pango attribute applies. If start and end are not specified, the attribute\n\
 is applied to the whole text. Note that specifying ranges does not make much\n\
 sense with translatable attributes. Use markup embedded in the translatable\n\
 content instead.\n\n\
 {b Accessibility}\n\n\
 [GtkEntry] uses the [Gtk.AccessibleRole.text_box] role.\n\n\
 Its methods, signals and properties are on {!class-type-entry_t}. The \
 functions it is built on are in {!Ocgtk.Raw.Entry}."]

(** The methods, signals and properties of a [GtkEntry]. *)
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

class entry : Raw.Entry.t -> entry_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Entry.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkEntry], give one already wrapped. *)

val new_ : unit -> entry_t
val new_with_buffer : Entry_buffer.entry_buffer_t -> entry_t
