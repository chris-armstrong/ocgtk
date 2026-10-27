(** [GtkFontChooser] is an interface that can be implemented by widgets for
    choosing fonts.

    In GTK, the main objects that implement this interface are
    [Gtk.FontChooserWidget], [Gtk.FontChooserDialog] and [Gtk.FontButton].

    Its methods, signals and properties are on {!class-type-font_chooser_t}. The
    functions it is built on are in {!Ocgtk.Raw.Font_chooser}. *)

(** The methods, signals and properties of a [GtkFontChooser]. *)
class type font_chooser_t = object
  method on_font_activated :
    ?after:bool ->
    callback:(fontname:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method get_font : unit -> string option

  method get_font_desc :
    unit -> Ocpango.Font_description.font_description_t option

  method get_font_face : unit -> Ocpango.Font_face.font_face_t option
  method get_font_family : unit -> Ocpango.Font_family.font_family_t option
  method get_font_features : unit -> string
  method get_font_map : unit -> Ocpango.Font_map.font_map_t option
  method get_font_size : unit -> int
  method get_language : unit -> string
  method get_level : unit -> Enums.fontchooserlevel
  method get_preview_text : unit -> string
  method get_show_preview_entry : unit -> bool
  method set_font : string -> unit
  method set_font_desc : Ocpango.Font_description.font_description_t -> unit
  method set_font_map : Ocpango.Font_map.font_map_t option -> unit
  method set_language : string -> unit
  method set_level : Enums.fontchooserlevel -> unit
  method set_preview_text : string -> unit
  method set_show_preview_entry : bool -> unit
  method as_font_chooser : Raw.Font_chooser.t
end

class font_chooser : Raw.Font_chooser.t -> font_chooser_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Font_chooser.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkFontChooser], give one already wrapped. *)
