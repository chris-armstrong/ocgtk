(* Utility Functions for GIR Code Generator *)

open StdLabels
open Printf

(* Convert CamelCase to snake_case *)
let to_snake_case s =
  let b = Buffer.create (String.length s + 10) in
  for i = 0 to String.length s - 1 do
    let c = String.get s i in
    if i > 0 && c >= 'A' && c <= 'Z' then
      Buffer.add_char b '_';
    Buffer.add_char b (Char.lowercase_ascii c)
  done;
  Buffer.contents b

(* Get attribute value from XML attributes list *)
let get_attr name attrs =
  try
    List.assoc ("", name) attrs |> fun x -> Some x
  with Not_found ->
    (* Try with c: namespace *)
    try
      List.assoc ("http://www.gtk.org/introspection/c/1.0", String.sub ~pos:2 ~len:(String.length name - 2) name) attrs |> fun x -> Some x
    with Not_found -> None

let parse_bool ?(default = false) attr =
  match attr with
  | Some "true" | Some "1"-> true
  | Some "false" | Some "0"-> false
  | Some "" -> default
  | Some x -> failwith (sprintf "Invalid boolean attribute value: %s" x)
  | None -> default

(* Extract namespace from C type name (e.g., "GtkAlign" -> "Gtk", "GdkGravity" -> "Gdk") *)
let extract_namespace_from_c_type c_type =
  let prefixes = ["Gtk"; "Gdk"; "Pango"; "Gio"; "GLib"; "GObject"; "Graphene"; "GdkPixbuf"; "Gsk"] in
  List.find_opt ~f:(fun prefix ->
    String.length c_type >= String.length prefix &&
    String.sub c_type ~pos:0 ~len:(String.length prefix) = prefix
  ) prefixes

(* Read filter file and return set of class names to generate *)
let read_filter_file filename =
  if not (Sys.file_exists filename) then
    []
  else
    let ic = open_in filename in
    let rec read_lines acc =
      try
        let line = input_line ic in
        let trimmed = String.trim line in
        (* Skip empty lines and comments *)
        if trimmed = "" || String.length trimmed > 0 && trimmed.[0] = '#' then
          read_lines acc
        else
          (* Extract class name (first word) *)
          let class_name =
            try
              let space_idx = String.index trimmed ' ' in
              String.sub trimmed ~pos:0 ~len:space_idx
            with Not_found -> trimmed
          in
          read_lines (class_name :: acc)
      with End_of_file ->
        close_in ic;
        List.rev acc
    in
    read_lines []
