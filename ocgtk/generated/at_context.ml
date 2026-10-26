(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for ATContext from cyclic group At_context_and__accessible *)

class type at_context_t = GAt_context_and__accessible.at_context_t

class at_context = GAt_context_and__accessible.at_context

let create (accessible_role : Gtk_enums.accessiblerole)
    (accessible : GAt_context_and__accessible.accessible_t)
    (display : Ocgtk_gdk.Gdk.Display.display_t) : at_context_t =
  let accessible = accessible#as_accessible in
  let display = display#as_display in
  let obj_ =
    At_context_and__accessible.At_context.create accessible_role accessible
      display
  in
  new at_context obj_
