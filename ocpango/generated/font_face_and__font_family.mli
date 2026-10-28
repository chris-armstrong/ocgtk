(** The classes of {!Ocpango.Font_face}, {!Ocpango.Font_family}, defined
    together because they refer to each other. Each has a module of its own that
    re-exports it; use that module rather than this one. *)

(** {b The methods, signals and properties of a [FontFace].}

    Inherits from: [GObject.Object]

    A [PangoFontFace] is used to represent a group of fonts with the same
    family, slant, weight, and width, but varying sizes. *)
class type font_face_t = object
  (** {2:methods Methods} *)

  method describe : unit -> Raw.Font_description.t
  (** Returns a font description that matches the face.

      The resulting font description will have the family, style, variant,
      weight and stretch of the face, but its size field will be unset. *)

  method get_face_name : unit -> string
  (** Gets a name representing the style of this face.

      Note that a font family may contain multiple faces with the same name
      (e.g. a variable and a non-variable face for the same style). *)

  method get_family : unit -> font_family_t
  (** Gets the [PangoFontFamily] that [face] belongs to. *)

  method is_synthesized : unit -> bool
  (** Returns whether a [PangoFontFace] is synthesized.

      This will be the case if the underlying font rendering engine creates this
      face from another face, by shearing, emboldening, lightening or modifying
      it in some other way. *)

  (** {2:conversions Conversions} *)

  method as_font_face : Raw.Font_face.t
end

(** {b The methods, signals and properties of a [FontFamily].}

    Inherits from: [GObject.Object]

    Implements:
    - {{!Ocgio.List_model.class-type-list_model_t}Ocgio.List_model}

    A [PangoFontFamily] is used to represent a family of related font faces.

    The font faces in a family share a common design, but differ in slant,
    weight, width or other aspects. *)
and font_family_t = object
  inherit Ocgio.List_model.list_model_t

  (** {2:methods Methods} *)

  method get_face : string option -> font_face_t option
  (** Gets the [PangoFontFace] of [family] with the given name. *)

  method get_name : unit -> string
  (** Gets the name of the family.

      The name is unique among all fonts for the font backend and can be used in
      a [PangoFontDescription] to specify that a face from this family is
      desired. *)

  method is_monospace : unit -> bool
  (** A monospace font is a font designed for text display where the the
      characters form a regular grid.

      For Western languages this would mean that the advance width of all
      characters are the same, but this categorization also includes Asian fonts
      which include double-width characters: characters that occupy two grid
      cells. g_unichar_iswide() returns a result that indicates whether a
      character is typically double-width in a monospace font.

      The best way to find out the grid-cell size is to call
      [Pango.FontMetrics.get_approximate_digit_width], since the results of
      [Pango.FontMetrics.get_approximate_char_width] may be affected by
      double-width characters. *)

  method is_variable : unit -> bool
  (** A variable font is a font which has axes that can be modified to produce
      different faces.

      Such axes are also known as _variations_; see
      [Pango.FontDescription.set_variations] for more information. *)

  (** {2:properties Properties} *)

  method item_type : Gobject.Type.t
  (** The type of items contained in this list. *)

  method n_items : int
  (** The number of items contained in this list. *)

  (** {2:conversions Conversions} *)

  method as_font_family : Raw.Font_family.t
end

(** Wraps a raw handle of {!Ocpango.Raw.Font_face.t}. *)
class font_face : Raw.Font_face.t -> font_face_t
(** Wraps a raw handle of {!Ocpango.Raw.Font_family.t}. *)

and font_family : Raw.Font_family.t -> font_family_t
