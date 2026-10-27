(** Supports switching between multiple input methods.

    Text widgets such as [GtkText] or [GtkTextView] use a [GtkIMMultiContext] to
    implement their [im-module] property for switching between different input
    methods.

    Its methods, signals and properties are on {!class-type-im_multicontext_t}.
    The functions it is built on are in {!Ocgtk.Raw.Im_multicontext}. *)

(** The methods, signals and properties of a [GtkIMMulticontext]. *)
class type im_multicontext_t = object
  inherit Im_context.im_context_t
  method get_context_id : unit -> string
  method set_context_id : string option -> unit
  method as_im_multicontext : Raw.Im_multicontext.t
end

class im_multicontext : Raw.Im_multicontext.t -> im_multicontext_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Im_multicontext.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkIMMulticontext], give one already wrapped. *)

val new_ : unit -> im_multicontext_t
