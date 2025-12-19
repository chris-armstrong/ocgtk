(* Utility Functions for GIR Code Generator *)

open StdLabels
open Printf

let stripLeadingNumbers name =
  if String.length name = 0 then name
  else (
    match name.[0] with
    | '0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9' -> {js|x|js} ^ name
    | _ -> name)

(* Convert CamelCase to snake_case *)
let uppercaseStartRe = Str.regexp "^\\([A-Z]*\\)\\(.*\\)$"
let uppercaseRe = Str.regexp "\\([A-Z][A-Z0-9]+[A-Z]\\|[A-Z]+\\)\\([^A-Z]*\\)"
let to_snake_case name =
  let start_pos = ref 0 in
  let name_len = String.length name in
  let components : string list ref = ref [] in

  while !start_pos < name_len do
    try
      let next_pos = Str.search_forward uppercaseRe name !start_pos in
      if not (Int.equal next_pos !start_pos) then begin
        (*first section not uppercase - add first section as_is*)
        let len = next_pos - !start_pos in
        let group = String.sub ~pos:!start_pos ~len name in
        components := group :: !components;
        start_pos := next_pos
      end;

      let upperpart = Str.matched_group 1 name in
      let lowerpart = Str.matched_group 2 name in
      if String.length upperpart > 1 then (
        (* sequence of uppercase characters - convert all but one to their own group *)
        let group_len = String.length upperpart - 1 in
        let group = Str.string_before upperpart group_len |> String.lowercase_ascii in
        components := group :: !components;
        start_pos := !start_pos + group_len)
      else (
        (* one uppercase followed by some not-upper *)
        let group_len = String.length lowerpart + 1 in
        let group = String.lowercase_ascii upperpart ^ lowerpart in
        components := group :: !components;
        start_pos := !start_pos + group_len)
    with Stdlib.Not_found ->
      components := Str.string_after name !start_pos :: !components;
      start_pos := name_len + 1
  done;
  !components |> List.rev |> String.concat ~sep:"_" |> stripLeadingNumbers
  (* let b = Buffer.create (String.length s + 10) in
  for i = 0 to String.length s - 1 do
    let c = String.get s i in
    if i > 0 && c >= 'A' && c <= 'Z' then
      Buffer.add_char b '_';
    Buffer.add_char b (Char.lowercase_ascii c)
  done;
  Buffer.contents b *)

(* Get attribute value from XML attributes list *)
let get_attr name attrs =
  let glib_ns = "http://www.gtk.org/introspection/glib/1.0" in
  try
    List.assoc ("", name) attrs |> fun x -> Some x
  with Not_found ->
    (* Try with c: namespace *)
    try
      List.assoc ("http://www.gtk.org/introspection/c/1.0", String.sub ~pos:2 ~len:(String.length name - 2) name) attrs |> fun x -> Some x
    with Not_found ->
      (* Try with glib namespace (used for signals and annotations) *)
      try
        List.assoc (glib_ns, name) attrs |> fun x -> Some x
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

(* Normalize a GIR class name for comparisons (strip namespace/prefix) *)
let normalize_class_name name =
  let without_namespace =
    try
      let dot_idx = String.rindex name '.' in
      String.sub name ~pos:(dot_idx + 1) ~len:(String.length name - dot_idx - 1)
    with Not_found -> name
  in
  if String.length without_namespace > 3 &&
     String.sub without_namespace ~pos:0 ~len:3 = "Gtk" &&
     (* Avoid stripping short names like "Gtl" accidentally *)
     (let c = String.get without_namespace 3 in Char.uppercase_ascii c = c)
  then
    String.sub without_namespace ~pos:3 ~len:(String.length without_namespace - 3)
  else
    without_namespace

(* Convert a class name to the expected OCaml module name (file name capitalized) *)
let module_name_of_class class_name =
  class_name |> to_snake_case |> String.capitalize_ascii

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



let reserved_identifiers = [
  "and"; "as"; "assert"; "begin"; "class"; "constraint"; "do"; "done";
  "downto"; "else"; "end"; "exception"; "external"; "false"; "for";
  "fun"; "function"; "functor"; "if"; "in"; "include"; "inherit"; "initializer";
  "land"; "lazy"; "let"; "lor"; "lsl"; "lsr"; "lxor"; "match"; "method";
  "mod"; "module"; "mutable"; "new"; "nonrec"; "object"; "of"; "open";
  "or"; "private"; "rec"; "sig"; "struct"; "then"; "to"; "true"; "try";
  "type"; "val"; "virtual"; "when"; "while"; "with";
]

let sanitize_identifier id =
  if List.mem id ~set:reserved_identifiers then id ^ "_" else id

let sanitize_property_name name =
  name |> sanitize_identifier |> String.map ~f:(function '-' -> '_' | c -> c) |> to_snake_case

(* let strip_function_prefix ~class_name ?c_type ?c_symbol_prefix c_identifier =
  let snake_identifier = to_snake_case c_identifier in
  let prefixes =
    let base = [
      to_snake_case class_name;
    ] in
    let base =
      match c_symbol_prefix with
      | Some prefix when prefix <> "" -> (to_snake_case prefix) :: base
      | _ -> base
    in
    match c_type with
    | Some ct -> (to_snake_case ct) :: base
    | None -> base
  in
  let sorted_prefixes =
    prefixes
    |> List.sort_uniq ~cmp:String.compare
    |> List.sort ~cmp:(fun a b -> compare (String.length b) (String.length a))
  in
  let rec strip name = function
    | [] -> name
    | prefix :: rest ->
      let prefix_with_sep = prefix ^ "_" in
      if String.length name >= String.length prefix_with_sep &&
         String.sub name ~pos:0 ~len:(String.length prefix_with_sep) = prefix_with_sep
      then
        String.sub name ~pos:(String.length prefix_with_sep) ~len:(String.length name - String.length prefix_with_sep)
      else
        strip name rest
  in
  sanitize_identifier (strip snake_identifier sorted_prefixes) *)

let ocaml_function_name ~class_name:_ ?c_type:_ ?c_symbol_prefix:_ (method_name:string) =
  method_name |> to_snake_case |> sanitize_identifier

  (* strip_function_prefix ~class_name ?c_type ?c_symbol_prefix c_identifier *)

let kebab_to_snake = String.map ~f:(function '-' -> '_' | c -> c)

let ocaml_method_name ~class_name ?c_type ?c_symbol_prefix method_identifier =
  ocaml_function_name ~class_name ?c_type ?c_symbol_prefix method_identifier

(** calculate property name, but does not sanitize the identifier (as it will have get_/set_ added to calles). sanitize_identifier will still be
   needed for getter method names*)
let ocaml_property_name name = 
  name  |> kebab_to_snake |> to_snake_case

  let ocaml_parameter_name name = 
   name  |> kebab_to_snake |> to_snake_case |> sanitize_identifier

let ocaml_class_name cn = cn 
  |>  normalize_class_name 
  |> kebab_to_snake  
  |> to_snake_case 
  |> sanitize_identifier

let ocaml_constructor_name ~class_name:_ (ctor: Types.gir_constructor) = ctor.ctor_name |> kebab_to_snake |> to_snake_case |> sanitize_identifier

let ml_method_name ~class_name:_ ({ c_identifier; _ }: Types.gir_method) =
  "ml_" ^ c_identifier

let ml_property_name ~class_name (prop: Types.gir_property) =
    let prop_name_cleaned = String.map ~f:(function '-' -> '_' | c -> c) prop.prop_name in
  let prop_snake = to_snake_case prop_name_cleaned in
  let class_snake = to_snake_case class_name in
  sprintf "ml_gtk_%s_get_%s" class_snake prop_snake