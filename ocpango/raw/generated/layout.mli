(* GENERATED CODE - DO NOT EDIT *)
(* Layout, a member of the cyclic module Layout_and__layout_iter *)

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

    The class built on this module is in {!Ocpango.Layout}. *)

include module type of struct
  include Layout_and__layout_iter.Layout
end
