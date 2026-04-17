(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for ATContext from cyclic group At_context_and__accessible *)

class type at_context_t = GAt_context_and__accessible.at_context_t

class at_context : At_context_and__accessible.At_context.t -> at_context_t
val create : Gtk_enums.accessiblerole -> GAt_context_and__accessible.accessible_t -> Ocgtk_gdk.Gdk.Display.display_t -> at_context_t

