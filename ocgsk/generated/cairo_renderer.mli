(** Renders a GSK rendernode tree with cairo.

    Its methods, signals and properties are on {!class-type-cairo_renderer_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgsk.Raw.Cairo_renderer}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [CairoRenderer].}

    Renders a GSK rendernode tree with cairo.

    Since it is using cairo, this renderer cannot support 3D transformations. *)
class type cairo_renderer_t = object
  inherit Renderer.renderer_t
  method as_cairo_renderer : Raw.Cairo_renderer.t
end

class cairo_renderer : Raw.Cairo_renderer.t -> cairo_renderer_t
(** Wraps a raw handle of {!Ocgsk.Raw.Cairo_renderer.t}. *)

(** {1:description Description}

    Renders a GSK rendernode tree with cairo.

    Since it is using cairo, this renderer cannot support 3D transformations. *)

(** {1:constructors Constructors} *)

val new_ : unit -> cairo_renderer_t
(** Creates a new Cairo renderer.

    The Cairo renderer is the fallback renderer drawing in ways similar to how
    GTK 3 drew its content. Its primary use is as comparison tool.

    The Cairo renderer is incomplete. It cannot render 3D transformed content
    and will instead render an error marker. Its usage should be avoided. *)
