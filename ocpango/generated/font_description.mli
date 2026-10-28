(** A [PangoFontDescription] describes a font in an implementation-independent
    manner.

    Its methods, signals and properties are on {!class-type-font_description_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocpango.Raw.Font_description}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [FontDescription].}

    A [PangoFontDescription] describes a font in an implementation-independent
    manner.

    [PangoFontDescription] structures are used both to list what fonts are
    available on the system and also for specifying the characteristics of a
    font to load. *)
class type font_description_t = object
  (** {2:methods Methods} *)

  method better_match :
    Raw.Font_description.t option -> Raw.Font_description.t -> bool
  (** Determines if the style attributes of [new_match] are a closer match for
      [desc] than those of [old_match] are, or if [old_match] is [NULL],
      determines if [new_match] is a match at all.

      Approximate matching is done for weight and style; other style attributes
      must match exactly. Style attributes are all attributes other than family
      and size-related attributes. Approximate matching for style considers
      [PANGO_STYLE_OBLIQUE] and [PANGO_STYLE_ITALIC] as matches, but not as good
      a match as when the styles are equal.

      Note that [old_match] must match [desc]. *)

  method copy_static : unit -> Raw.Font_description.t option
  (** Make a copy of a [PangoFontDescription], but don't duplicate allocated
      fields.

      This is like [Pango.FontDescription.copy], but only a shallow copy is made
      of the family name and other allocated fields. The result can only be used
      until [desc] is modified or freed. This is meant to be used when the copy
      is only needed temporarily. *)

  method equal : Raw.Font_description.t -> bool
  (** Compares two font descriptions for equality.

      Two font descriptions are considered equal if the fonts they describe are
      provably identical. This means that their masks do not have to match, as
      long as other fields are all the same. (Two font descriptions may result
      in identical fonts being loaded, but still compare [FALSE].) *)

  method get_color : unit -> Enums.fontcolor
  (** Returns the color field of the font description.

      This field determines whether the font description should match fonts that
      have color glyphs, or fonts that don't. *)

  method get_family : unit -> string option
  (** Gets the family name field of a font description.

      See [Pango.FontDescription.set_family]. *)

  method get_features : unit -> string option
  (** Gets the features field of a font description.

      See [Pango.FontDescription.set_features]. *)

  method get_gravity : unit -> Enums.gravity
  (** Gets the gravity field of a font description.

      See [Pango.FontDescription.set_gravity]. *)

  method get_set_fields : unit -> Enums.fontmask
  (** Determines which fields in a font description have been set. *)

  method get_size : unit -> int
  (** Gets the size field of a font description.

      See [Pango.FontDescription.set_size]. *)

  method get_size_is_absolute : unit -> bool
  (** Determines whether the size of the font is in points (not absolute) or
      device units (absolute).

      See [Pango.FontDescription.set_size] and
      [Pango.FontDescription.set_absolute_size]. *)

  method get_stretch : unit -> Enums.stretch
  (** Gets the stretch field of a font description.

      See [Pango.FontDescription.set_stretch]. *)

  method get_style : unit -> Enums.style
  (** Gets the style field of a [PangoFontDescription].

      See [Pango.FontDescription.set_style]. *)

  method get_variant : unit -> Enums.variant
  (** Gets the variant field of a [PangoFontDescription].

      See [Pango.FontDescription.set_variant]. *)

  method get_variations : unit -> string option
  (** Gets the variations field of a font description.

      See [Pango.FontDescription.set_variations]. *)

  method get_weight : unit -> Enums.weight
  (** Gets the weight field of a font description.

      See [Pango.FontDescription.set_weight]. *)

  method hash : unit -> int
  (** Computes a hash of a [PangoFontDescription] structure.

      This is suitable to be used, for example, as an argument to
      g_hash_table_new(). The hash value is independent of [desc]->mask. *)

  method merge : Raw.Font_description.t option -> bool -> unit
  (** Merges the fields that are set in [desc_to_merge] into the fields in
      [desc].

      If [replace_existing] is [FALSE], only fields in [desc] that are not
      already set are affected. If [TRUE], then fields that are already set will
      be replaced as well.

      If [desc_to_merge] is [NULL], this function performs nothing. *)

  method merge_static : Raw.Font_description.t -> bool -> unit
  (** Merges the fields that are set in [desc_to_merge] into the fields in
      [desc], without copying allocated fields.

      This is like [Pango.FontDescription.merge], but only a shallow copy is
      made of the family name and other allocated fields. [desc] can only be
      used until [desc_to_merge] is modified or freed. This is meant to be used
      when the merged font description is only needed temporarily. *)

  method set_absolute_size : float -> unit
  (** Sets the size field of a font description, in device units.

      This is mutually exclusive with [Pango.FontDescription.set_size] which
      sets the font size in points. *)

  method set_color : Enums.fontcolor -> unit
  (** Sets the color field of a font description.

      This field determines whether the font description should match fonts that
      have color glyphs, or fonts that don't. *)

  method set_family : string -> unit
  (** Sets the family name field of a font description.

      The family name represents a family of related font styles, and will
      resolve to a particular [PangoFontFamily]. In some uses of
      [PangoFontDescription], it is also possible to use a comma separated list
      of family names for this field. *)

  method set_family_static : string -> unit
  (** Sets the family name field of a font description, without copying the
      string.

      This is like [Pango.FontDescription.set_family], except that no copy of
      [family] is made. The caller must make sure that the string passed in
      stays around until [desc] has been freed or the name is set again. This
      function can be used if [family] is a static string such as a C string
      literal, or if [desc] is only needed temporarily. *)

  method set_features : string option -> unit
  (** Sets the features field of a font description.

      OpenType font features allow to enable or disable certain optional
      features of a font, such as tabular numbers.

      The format of the features string is comma-separated list of feature
      assignments, with each assignment being one of these forms:

      FEATURE=n

      where FEATURE must be a 4 character tag that identifies and OpenType
      feature, and n an integer (depending on the feature, the allowed values
      may be 0, 1 or bigger numbers). Unknown features are ignored.

      Note that font features set in this way are enabled for the entire text
      that is using the font, which is not appropriate for all OpenType
      features. The intended use case is to select character variations
      (features cv01 - c99), style sets (ss01 - ss20) and the like.

      Pango does not currently have a way to find supported OpenType features of
      a font. Both harfbuzz and freetype have API for this. See for example
      {{:https://harfbuzz.github.io/harfbuzz-hb-ot-layout.html#hb-ot-layout-table-get-feature-tags}hb_ot_layout_table_get_feature_tags}.

      Features that are not supported by the font are silently ignored. *)

  method set_features_static : string -> unit
  (** Sets the features field of a font description.

      This is like [Pango.FontDescription.set_features], except that no copy of
      [featuresis] made. The caller must make sure that the string passed in
      stays around until [desc] has been freed or the name is set again. This
      function can be used if [features] is a static string such as a C string
      literal, or if [desc] is only needed temporarily. *)

  method set_gravity : Enums.gravity -> unit
  (** Sets the gravity field of a font description.

      The gravity field specifies how the glyphs should be rotated. If [gravity]
      is [PANGO_GRAVITY_AUTO], this actually unsets the gravity mask on the font
      description.

      This function is seldom useful to the user. Gravity should normally be set
      on a [PangoContext]. *)

  method set_size : int -> unit
  (** Sets the size field of a font description in fractional points.

      This is mutually exclusive with [Pango.FontDescription.set_absolute_size].
  *)

  method set_stretch : Enums.stretch -> unit
  (** Sets the stretch field of a font description.

      The [Pango.Stretch] field specifies how narrow or wide the font should be.
  *)

  method set_style : Enums.style -> unit
  (** Sets the style field of a [PangoFontDescription].

      The [Pango.Style] enumeration describes whether the font is slanted and
      the manner in which it is slanted; it can be either [PANGO_STYLE_NORMAL],
      [PANGO_STYLE_ITALIC], or [PANGO_STYLE_OBLIQUE].

      Most fonts will either have a italic style or an oblique style, but not
      both, and font matching in Pango will match italic specifications with
      oblique fonts and vice-versa if an exact match is not found. *)

  method set_variant : Enums.variant -> unit
  (** Sets the variant field of a font description.

      The [Pango.Variant] can either be [PANGO_VARIANT_NORMAL] or
      [PANGO_VARIANT_SMALL_CAPS]. *)

  method set_variations : string option -> unit
  (** Sets the variations field of a font description.

      OpenType font variations allow to select a font instance by specifying
      values for a number of axes, such as width or weight.

      The format of the variations string is

      AXIS1=VALUE,AXIS2=VALUE...

      with each AXIS a 4 character tag that identifies a font axis, and each
      VALUE a floating point number. Unknown axes are ignored, and values are
      clamped to their allowed range.

      Pango does not currently have a way to find supported axes of a font. Both
      harfbuzz and freetype have API for this. See for example
      {{:https://harfbuzz.github.io/harfbuzz-hb-ot-var.html#hb-ot-var-get-axis-infos}hb_ot_var_get_axis_infos}.
  *)

  method set_variations_static : string -> unit
  (** Sets the variations field of a font description.

      This is like [Pango.FontDescription.set_variations], except that no copy
      of [variations] is made. The caller must make sure that the string passed
      in stays around until [desc] has been freed or the name is set again. This
      function can be used if [variations] is a static string such as a C string
      literal, or if [desc] is only needed temporarily. *)

  method set_weight : Enums.weight -> unit
  (** Sets the weight field of a font description.

      The weight field specifies how bold or light the font should be. In
      addition to the values of the [Pango.Weight] enumeration, other
      intermediate numeric values are possible. *)

  method to_filename : unit -> string option
  (** Creates a filename representation of a font description.

      The filename is identical to the result from calling
      [Pango.FontDescription.to_string], but with underscores instead of
      characters that are untypical in filenames, and in lower case only. *)

  method to_string : unit -> string
  (** Creates a string representation of a font description.

      See [Pango.FontDescription.from_string] for a description of the format of
      the string representation. The family list in the string description will
      only have a terminating comma if the last word of the list is a valid
      style option. *)

  method unset_fields : Enums.fontmask -> unit
  (** Unsets some of the fields in a [PangoFontDescription].

      The unset fields will get back to their default values. *)

  (** {2:conversions Conversions} *)

  method as_font_description : Raw.Font_description.t
end

class font_description : Raw.Font_description.t -> font_description_t
(** Wraps a raw handle of {!Ocpango.Raw.Font_description.t}. *)

(** {1:description Description}

    A [PangoFontDescription] describes a font in an implementation-independent
    manner.

    [PangoFontDescription] structures are used both to list what fonts are
    available on the system and also for specifying the characteristics of a
    font to load. *)

(** {1:constructors Constructors} *)

val new_ : unit -> font_description_t
(** Creates a new font description structure with all fields unset. *)
