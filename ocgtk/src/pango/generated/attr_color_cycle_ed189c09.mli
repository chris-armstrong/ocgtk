(* GENERATED CODE - DO NOT EDIT *)
(* Combined modules for cyclic dependencies *)

module rec Attr_color : sig
  type t = [ `attr_color ] Gobject.obj

  (* Methods *)

  (* Record field accessors *)

  (* Getters *)
  external get_attr : t -> Attribute.t = "ml_pango_attr_color_get_attr"
  external get_color : t -> Color.t = "ml_pango_attr_color_get_color"

  (* Setters *)
  external set_attr : t -> Attribute.t -> unit = "ml_pango_attr_color_set_attr"
  external set_color : t -> Color.t -> unit = "ml_pango_attr_color_set_color"
  external make : Attribute.t -> Color.t -> t = "ml_pango_attr_color_make"
end

and Attr_float : sig
  type t = [ `attr_float ] Gobject.obj

  (* Methods *)

  (* Record field accessors *)

  (* Getters *)
  external get_attr : t -> Attribute.t = "ml_pango_attr_float_get_attr"
  external get_value : t -> float = "ml_pango_attr_float_get_value"

  (* Setters *)
  external set_attr : t -> Attribute.t -> unit = "ml_pango_attr_float_set_attr"
  external set_value : t -> float -> unit = "ml_pango_attr_float_set_value"
  external make : Attribute.t -> float -> t = "ml_pango_attr_float_make"
end

and Attr_font_desc : sig
  type t = [ `attr_font_desc ] Gobject.obj

  (* Methods *)

  (* Record field accessors *)

  (* Getters *)
  external get_attr : t -> Attribute.t = "ml_pango_attr_font_desc_get_attr"

  external get_desc : t -> Font_description.t
    = "ml_pango_attr_font_desc_get_desc"

  (* Setters *)
  external set_attr : t -> Attribute.t -> unit
    = "ml_pango_attr_font_desc_set_attr"

  external set_desc : t -> Font_description.t -> unit
    = "ml_pango_attr_font_desc_set_desc"

  external make : Attribute.t -> Font_description.t -> t
    = "ml_pango_attr_font_desc_make"
end

and Attr_font_features : sig
  type t = [ `attr_font_features ] Gobject.obj

  (* Methods *)

  (* Record field accessors *)

  (* Getters *)
  external get_attr : t -> Attribute.t = "ml_pango_attr_font_features_get_attr"

  external get_features : t -> string
    = "ml_pango_attr_font_features_get_features"

  (* Setters *)
  external set_attr : t -> Attribute.t -> unit
    = "ml_pango_attr_font_features_set_attr"

  external set_features : t -> string -> unit
    = "ml_pango_attr_font_features_set_features"

  external make : Attribute.t -> string -> t
    = "ml_pango_attr_font_features_make"
end

and Attr_int : sig
  type t = [ `attr_int ] Gobject.obj

  (* Methods *)

  (* Record field accessors *)

  (* Getters *)
  external get_attr : t -> Attribute.t = "ml_pango_attr_int_get_attr"
  external get_value : t -> int = "ml_pango_attr_int_get_value"

  (* Setters *)
  external set_attr : t -> Attribute.t -> unit = "ml_pango_attr_int_set_attr"
  external set_value : t -> int -> unit = "ml_pango_attr_int_set_value"
  external make : Attribute.t -> int -> t = "ml_pango_attr_int_make"
end

and Attr_language : sig
  type t = [ `attr_language ] Gobject.obj

  (* Methods *)

  (* Record field accessors *)

  (* Getters *)
  external get_attr : t -> Attribute.t = "ml_pango_attr_language_get_attr"
  external get_value : t -> Language.t = "ml_pango_attr_language_get_value"

  (* Setters *)
  external set_attr : t -> Attribute.t -> unit
    = "ml_pango_attr_language_set_attr"

  external set_value : t -> Language.t -> unit
    = "ml_pango_attr_language_set_value"

  external make : Attribute.t -> Language.t -> t = "ml_pango_attr_language_make"
end

and Attr_shape : sig
  type t = [ `attr_shape ] Gobject.obj

  (* Methods *)

  (* Record field accessors *)

  (* Getters *)
  external get_attr : t -> Attribute.t = "ml_pango_attr_shape_get_attr"
  external get_ink_rect : t -> Rectangle.t = "ml_pango_attr_shape_get_ink_rect"

  external get_logical_rect : t -> Rectangle.t
    = "ml_pango_attr_shape_get_logical_rect"

  external get_destroy_func : t -> unit = "ml_pango_attr_shape_get_destroy_func"

  (* Setters *)
  external set_attr : t -> Attribute.t -> unit = "ml_pango_attr_shape_set_attr"

  external set_ink_rect : t -> Rectangle.t -> unit
    = "ml_pango_attr_shape_set_ink_rect"

  external set_logical_rect : t -> Rectangle.t -> unit
    = "ml_pango_attr_shape_set_logical_rect"

  external set_destroy_func : t -> unit -> unit
    = "ml_pango_attr_shape_set_destroy_func"

  external make : Attribute.t -> Rectangle.t -> Rectangle.t -> unit -> t
    = "ml_pango_attr_shape_make"
end

and Attr_size : sig
  type t = [ `attr_size ] Gobject.obj

  (* Methods *)

  (* Record field accessors *)

  (* Getters *)
  external get_attr : t -> Attribute.t = "ml_pango_attr_size_get_attr"
  external get_size : t -> int = "ml_pango_attr_size_get_size"
  external get_absolute : t -> int = "ml_pango_attr_size_get_absolute"

  (* Setters *)
  external set_attr : t -> Attribute.t -> unit = "ml_pango_attr_size_set_attr"
  external set_size : t -> int -> unit = "ml_pango_attr_size_set_size"
  external set_absolute : t -> int -> unit = "ml_pango_attr_size_set_absolute"
  external make : Attribute.t -> int -> int -> t = "ml_pango_attr_size_make"
end

and Attr_string : sig
  type t = [ `attr_string ] Gobject.obj

  (* Methods *)

  (* Record field accessors *)

  (* Getters *)
  external get_attr : t -> Attribute.t = "ml_pango_attr_string_get_attr"
  external get_value : t -> string = "ml_pango_attr_string_get_value"

  (* Setters *)
  external set_attr : t -> Attribute.t -> unit = "ml_pango_attr_string_set_attr"
  external set_value : t -> string -> unit = "ml_pango_attr_string_set_value"
  external make : Attribute.t -> string -> t = "ml_pango_attr_string_make"
end

and Attribute : sig
  type t = [ `attribute ] Gobject.obj

  (* Methods *)

  external init : t -> Attr_class.t -> unit = "ml_pango_attribute_init"
  (** Initializes @attr's klass to @klass, it's start_index to
  %PANGO_ATTR_INDEX_FROM_TEXT_BEGINNING and end_index to
  %PANGO_ATTR_INDEX_TO_TEXT_END such that the attribute applies
  to the entire text by default. *)

  external equal : t -> t -> bool = "ml_pango_attribute_equal"
  (** Compare two attributes for equality.

      This compares only the actual value of the two attributes and not the
      ranges that the attributes apply to. *)

  external destroy : t -> unit = "ml_pango_attribute_destroy"
  (** Destroy a `PangoAttribute` and free all associated memory. *)

  external as_string : t -> Attr_string.t option
    = "ml_pango_attribute_as_string"
  (** Returns the attribute cast to `PangoAttrString`.

      This is mainly useful for language bindings. *)

  external as_size : t -> Attr_size.t option = "ml_pango_attribute_as_size"
  (** Returns the attribute cast to `PangoAttrSize`.

      This is mainly useful for language bindings. *)

  external as_shape : t -> Attr_shape.t option = "ml_pango_attribute_as_shape"
  (** Returns the attribute cast to `PangoAttrShape`.

      This is mainly useful for language bindings. *)

  external as_language : t -> Attr_language.t option
    = "ml_pango_attribute_as_language"
  (** Returns the attribute cast to `PangoAttrLanguage`.

      This is mainly useful for language bindings. *)

  external as_int : t -> Attr_int.t option = "ml_pango_attribute_as_int"
  (** Returns the attribute cast to `PangoAttrInt`.

      This is mainly useful for language bindings. *)

  external as_font_features : t -> Attr_font_features.t option
    = "ml_pango_attribute_as_font_features"
  (** Returns the attribute cast to `PangoAttrFontFeatures`.

      This is mainly useful for language bindings. *)

  external as_font_desc : t -> Attr_font_desc.t option
    = "ml_pango_attribute_as_font_desc"
  (** Returns the attribute cast to `PangoAttrFontDesc`.

      This is mainly useful for language bindings. *)

  external as_float : t -> Attr_float.t option = "ml_pango_attribute_as_float"
  (** Returns the attribute cast to `PangoAttrFloat`.

      This is mainly useful for language bindings. *)

  external as_color : t -> Attr_color.t option = "ml_pango_attribute_as_color"
  (** Returns the attribute cast to `PangoAttrColor`.

      This is mainly useful for language bindings. *)

  (* Record field accessors *)

  (* Getters *)
  external get_start_index : t -> int = "ml_pango_attribute_get_start_index"
  external get_end_index : t -> int = "ml_pango_attribute_get_end_index"

  (* Setters *)
  external set_start_index : t -> int -> unit
    = "ml_pango_attribute_set_start_index"

  external set_end_index : t -> int -> unit = "ml_pango_attribute_set_end_index"
  external make : int -> int -> t = "ml_pango_attribute_make"
end
