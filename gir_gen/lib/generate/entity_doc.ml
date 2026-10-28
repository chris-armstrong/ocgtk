(* Entity_doc — see entity_doc.mli for the contract. *)

open StdLabels

let canned text =
  Doc_emit.item_doc ~indent:"" ~fallback:text ~context:Doc_translate.Member None

let layer1_path ~namespace ~class_name =
  Fmt.str "%s.Raw.%s"
    (Module_paths.main_module namespace)
    (Utils.module_name_of_class class_name)

let layer2_path ~namespace ~class_name =
  Fmt.str "%s.%s"
    (Module_paths.main_module namespace)
    (Module_paths.layer2_module_name class_name)

(* The first paragraph is the module's synopsis on its parent's page too, where
   the class type is not in scope, so a module without a class doc starts with
   a sentence of its own rather than the navigation paragraph. *)
let synopsis_fallback ~class_name = Fmt.str "Bindings for [%s]." class_name

let translated class_doc =
  Option.bind class_doc (fun raw ->
      match String.trim (Doc_translate.translate Doc_translate.Member raw) with
      | "" -> None
      | text -> Some text)

let count c s =
  String.fold_left ~init:0 ~f:(fun n x -> if Char.equal x c then n + 1 else n) s

(* A paragraph that reads on its own as a synopsis: prose, not a block, a list
   or a tag, and with no markup left open for a later paragraph to close. *)
let standalone_paragraph p =
  let opens_block =
    List.exists
      [
        "{[";
        "{v";
        "{@";
        "{%";
        "{ul";
        "{ol";
        "{-";
        "{0";
        "{1";
        "{2";
        "{3";
        "{4";
        "{5";
        "{6";
        "{t";
        "{table";
        "- ";
        "+ ";
        "@";
      ] ~f:(fun prefix -> String.starts_with ~prefix p)
  in
  (not opens_block) && count '{' p = count '}' p && count '[' p = count ']' p

let first_paragraph text =
  match Re.Str.bounded_split (Re.Str.regexp "\n[ \t]*\n") text 2 with
  | first :: _ when standalone_paragraph (String.trim first) ->
      Some (String.trim first)
  | _ -> None

let synopsis ~class_name ~class_doc =
  Option.bind (translated class_doc) first_paragraph
  |> Option.value ~default:(synopsis_fallback ~class_name)

(* The full class doc, unless the synopsis already says all of it. *)
let description_text ~class_name ~class_doc =
  Option.bind (translated class_doc) (fun text ->
      if String.equal text (synopsis ~class_name ~class_doc) then None
      else Some text)

let l1_module ~namespace ~class_name ~class_doc =
  Doc_emit.item_doc ~indent:""
    ~fallback:(synopsis_fallback ~class_name)
    ~suffix:
      (Fmt.str "The class built on this module is in {!%s}."
         (layer2_path ~namespace ~class_name))
    ~context:Doc_translate.Member class_doc

let l2_module ~namespace ~class_name ~has_constructors ~class_doc =
  let constructors =
    if has_constructors then
      " Its constructors are under {!section-constructors}."
    else ""
  in
  let description =
    match description_text ~class_name ~class_doc with
    | Some _ -> " Its full description is under {!section-description}."
    | None -> ""
  in
  Doc_emit.item_doc ~indent:""
    ~fallback:(synopsis ~class_name ~class_doc)
    ~suffix:
      (Fmt.str
         "Its methods, signals and properties are on {!class-type-%s}.%s%s The \
          functions it is built on are in {!%s}."
         (Utils.class_type_name class_name)
         description constructors
         (layer1_path ~namespace ~class_name))
    ~context:Doc_translate.Member None

let class_heading = "(** {1:class Class} *)"

let description ~class_name ~class_doc =
  Option.bind (description_text ~class_name ~class_doc) (fun text ->
      Doc_emit.item_doc ~indent:"" ~fallback:text
        ~prefix:"{1:description Description}" ~context:Doc_translate.Member None)

let class_type ~class_name ~class_doc =
  Doc_emit.item_doc ~indent:""
    ~prefix:
      (Fmt.str "{b The methods, signals and properties of a [%s].}" class_name)
    ~context:Doc_translate.Member class_doc

let class_ ~namespace ~class_name =
  canned
    (Fmt.str "Wraps a raw handle of {!%s.t}."
       (layer1_path ~namespace ~class_name))

type layer = Layer1 | Layer2

let combined_module ~namespace ~layer ~class_names =
  let path, what =
    match layer with
    | Layer1 -> (layer1_path ~namespace, "layer 1 modules")
    | Layer2 -> (layer2_path ~namespace, "classes")
  in
  let links =
    List.sort ~cmp:String.compare class_names
    |> List.map ~f:(fun class_name -> Fmt.str "{!%s}" (path ~class_name))
  in
  canned
    (Fmt.str
       "The %s of %s, defined together because they refer to each other. Each \
        has a module of its own that re-exports it; use that module rather \
        than this one."
       what
       (String.concat ~sep:", " links))

(* gi-docgen sites; cairo and Graphene have none. *)
let upstream_base_url = function
  | "Gtk" -> Some "https://docs.gtk.org/gtk4/"
  | "Gdk" -> Some "https://docs.gtk.org/gdk4/"
  | "Gsk" -> Some "https://docs.gtk.org/gsk4/"
  | "Gio" -> Some "https://docs.gtk.org/gio/"
  | "Pango" -> Some "https://docs.gtk.org/Pango/"
  | "PangoCairo" -> Some "https://docs.gtk.org/PangoCairo/"
  | "GdkPixbuf" -> Some "https://docs.gtk.org/gdk-pixbuf/"
  | _ -> None

let constructors_heading = "(** {1:constructors Constructors} *)"

let constructor ~namespace ~class_name (ctor : Types.gir_constructor) =
  let c_function = Fmt.str "[%s]" ctor.c_identifier in
  let wrapped =
    upstream_base_url namespace
    |> Option.fold ~none:c_function ~some:(fun base ->
        Fmt.str "{{:%sctor.%s.%s.html}%s}" base class_name ctor.ctor_name
          c_function)
  in
  Doc_emit.item_doc ~indent:""
    ~fallback:(Fmt.str "Create a new [%s]. Wraps %s." class_name wrapped)
    ~context:Doc_translate.Member ctor.ctor_doc

type accessor = Getter | Setter

let property ~accessor (prop : Types.gir_property) =
  let verb = match accessor with Getter -> "Get" | Setter -> "Set" in
  Doc_emit.item_doc ~indent:""
    ~fallback:(Fmt.str "%s property: %s" verb prop.prop_name)
    ~context:Doc_translate.Member prop.prop_doc
