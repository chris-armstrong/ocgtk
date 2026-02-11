(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)
class font_face (obj : Font_face_and__font_family.Font_face.t) = object (self)

  method describe : unit -> Font_description.t =
    fun () ->
      (Font_face_and__font_family.Font_face.describe obj)

  method get_face_name : unit -> string =
    fun () ->
      (Font_face_and__font_family.Font_face.get_face_name obj)

  method get_family : unit -> font_family =
    fun () ->
      new  font_family(Font_face_and__font_family.Font_face.get_family obj)

  method is_synthesized : unit -> bool =
    fun () ->
      (Font_face_and__font_family.Font_face.is_synthesized obj)

    method as_font_face = obj
end

and font_family (obj : Font_face_and__font_family.Font_family.t) = object (self)

  method get_face : string option -> font_face option =
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
