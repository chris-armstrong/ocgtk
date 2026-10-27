(** A CSS style change.

    Its methods, signals and properties are on {!class-type-css_style_change_t}.
    The functions it is built on are in {!Ocgtk.Raw.Css_style_change}. *)

(** The methods, signals and properties of a [GtkCssStyleChange]. *)
class type css_style_change_t = object
  method as_css_style_change : Raw.Css_style_change.t
end

class css_style_change : Raw.Css_style_change.t -> css_style_change_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Css_style_change.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkCssStyleChange], give one already wrapped. *)
