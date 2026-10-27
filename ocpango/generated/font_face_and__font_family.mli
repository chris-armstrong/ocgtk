(** The classes of {!Ocpango.Font_face}, {!Ocpango.Font_family}, defined
    together because they refer to each other. Each has a module of its own that
    re-exports it; use that module rather than this one. *)

(** The methods, signals and properties of a [PangoFontFace]. *)
class type font_face_t = object
  method describe : unit -> Raw.Font_description.t
  method get_face_name : unit -> string
  method get_family : unit -> font_family_t
  method is_synthesized : unit -> bool
  method as_font_face : Raw.Font_face.t
end

(** The methods, signals and properties of a [PangoFontFamily]. *)
and font_family_t = object
  inherit Ocgio.List_model.list_model_t
  method get_face : string option -> font_face_t option
  method get_name : unit -> string
  method is_monospace : unit -> bool
  method is_variable : unit -> bool
  method item_type : Gobject.Type.t
  method n_items : int
  method as_font_family : Raw.Font_family.t
end

(** Wraps a layer 1 handle, {!Ocpango.Raw.Font_face.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [PangoFontFace], give one already wrapped. *)
class font_face : Raw.Font_face.t -> font_face_t
(** Wraps a layer 1 handle, {!Ocpango.Raw.Font_family.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [PangoFontFamily], give one already wrapped. *)

and font_family : Raw.Font_family.t -> font_family_t
