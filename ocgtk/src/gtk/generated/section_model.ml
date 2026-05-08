(* GENERATED CODE - DO NOT EDIT *)
(* SectionModel: SectionModel *)

type t = [ `section_model ] Gobject.obj

external from_gobject : 'a Gobject.obj -> t
  = "ml_gtk_section_model_from_gobject"

(* Methods *)
external sections_changed : t -> int -> int -> unit
  = "ml_gtk_section_model_sections_changed"

external get_section : t -> int -> int * int
  = "ml_gtk_section_model_get_section"
(** Query the section that covers the given position. The number of items in the
    section can be computed by `out_end - out_start`.

    If the position is larger than the number of items, a single range from
    n_items to G_MAXUINT will be returned. *)

let on_sections_changed ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let position =
          let v = Gobject.Closure.nth argv ~pos:1 in
          Gobject.Value.get_uint v
        in
        let n_items =
          let v = Gobject.Closure.nth argv ~pos:2 in
          Gobject.Value.get_uint v
        in
        callback ~position ~n_items)
  in
  Gobject.Signal.connect obj ~name:"sections-changed" ~callback:closure
    ~after:(Option.value after ~default:false)
