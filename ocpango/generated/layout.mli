(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Layout from cyclic group Layout_and__layout_iter *)

(** A [PangoLayout] structure represents an entire paragraph of text.

    While complete access to the layout capabilities of Pango is provided using
    the detailed interfaces for itemization and shaping, using that
    functionality directly involves writing a fairly large amount of code.
    [PangoLayout] provides a high-level driver for formatting entire paragraphs
    of text at once. This includes paragraph-level functionality such as line
    breaking, justification, alignment and ellipsization.

    A [PangoLayout] is initialized with a [PangoContext], UTF-8 string and set
    of attributes for that string. Once that is done, the set of formatted lines
    can be extracted from the object, the layout can be rendered, and conversion
    between logical character positions within the layout's text, and the
    physical position of the resulting glyphs can be made.

    There are a number of parameters to adjust the formatting of a
    [PangoLayout]. The following image shows adjustable parameters (on the left)
    and font metrics (on the right):

    Pango Layout Parameters

    The following images demonstrate the effect of alignment and justification
    on the layout of text:

    It is possible, as well, to ignore the 2-D setup, and simply treat the
    results of a [PangoLayout] as a list of lines.

    Its methods, signals and properties are on {!class-type-layout_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocpango.Raw.Layout}. *)

class type layout_t = Layout_and__layout_iter.layout_t
(** The methods, signals and properties of a [Layout]. *)

class layout : Raw.Layout.t -> layout_t
(** Wraps a raw handle of {!Ocpango.Raw.Layout.t}. *)

(** {2:constructors Constructors} *)

val new_ : Context_and__font_and__font_map_and__fontset.context_t -> layout_t
(** Create a new [PangoLayout] object with attributes initialized to default
    values for a particular [PangoContext]. *)
