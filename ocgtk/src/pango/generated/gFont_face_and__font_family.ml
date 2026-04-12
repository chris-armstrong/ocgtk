(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

class type font_face_t = object
    method describe : unit -> Font_description.t
    method get_face_name : unit -> string
    method get_family : unit -> font_family_t
    method is_synthesized : unit -> bool
    method as_font_face : Font_face_and__font_family.Font_face.t
end

and font_family_t = object
    inherit Ocgtk_gio.Gio.List_model.list_model_t
    method get_face : string option -> font_face_t option
    method get_name : unit -> string
    method is_monospace : unit -> bool
    method is_variable : unit -> bool
    method n_items : int
    method as_font_family : Font_face_and__font_family.Font_family.t
end


class font_face (obj : Font_face_and__font_family.Font_face.t) : font_face_t = object (self)

  method describe : unit -> Font_description.t =
    fun () ->
      (Font_face_and__font_family.Font_face.describe obj)

  method get_face_name : unit -> string =
    fun () ->
      (Font_face_and__font_family.Font_face.get_face_name obj)

  method get_family : unit -> font_family_t =
    fun () ->
      new  font_family(Font_face_and__font_family.Font_face.get_family obj)

  method is_synthesized : unit -> bool =
    fun () ->
      (Font_face_and__font_family.Font_face.is_synthesized obj)

    method as_font_face = obj
end

and font_family (obj : Font_face_and__font_family.Font_family.t) : font_family_t = object (self)
  inherit Ocgtk_gio.Gio.List_model.list_model (Ocgtk_gio.Gio.Wrappers.List_model.from_gobject obj)

  method get_face : string option -> font_face_t option =
    fun name ->
      Option.map (fun ret -> new font_face ret) (Font_face_and__font_family.Font_family.get_face obj name)

  method get_name : unit -> string =
    fun () ->
      (Font_face_and__font_family.Font_family.get_name obj)

  method is_monospace : unit -> bool =
    fun () ->
      (Font_face_and__font_family.Font_family.is_monospace obj)

  method is_variable : unit -> bool =
    fun () ->
      (Font_face_and__font_family.Font_family.is_variable obj)

  method n_items = Font_face_and__font_family.Font_family.get_n_items obj

    method as_font_family = obj
end
