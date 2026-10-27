(** Points at a location inside a CSS stream.

    Its methods, signals and properties are on {!class-type-css_location_t}. The
    functions it is built on are in {!Ocgtk.Raw.Css_location}. *)

(** The methods, signals and properties of a [GtkCssLocation]. *)
class type css_location_t = object
  method as_css_location : Raw.Css_location.t
end

class css_location : Raw.Css_location.t -> css_location_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Css_location.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkCssLocation], give one already wrapped. *)
