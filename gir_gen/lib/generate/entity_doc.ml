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
let synopsis_fallback ~c_type = Fmt.str "Bindings for [%s]." c_type

let l1_module ~namespace ~class_name ~c_type ~class_doc =
  Doc_emit.item_doc ~indent:""
    ~fallback:(synopsis_fallback ~c_type)
    ~suffix:
      (Fmt.str "The class built on this module is in {!%s}."
         (layer2_path ~namespace ~class_name))
    ~context:Doc_translate.Member class_doc

let l2_module ~namespace ~class_name ~c_type ~has_constructors ~class_doc =
  let constructors =
    if has_constructors then
      " Its constructors are under {!section-constructors}."
    else ""
  in
  Doc_emit.item_doc ~indent:""
    ~fallback:(synopsis_fallback ~c_type)
    ~suffix:
      (Fmt.str
         "Its methods, signals and properties are on {!class-type-%s}.%s The \
          functions it is built on are in {!%s}."
         (Utils.class_type_name class_name)
         constructors
         (layer1_path ~namespace ~class_name))
    ~context:Doc_translate.Member class_doc

let class_type ~c_type =
  canned (Fmt.str "The methods, signals and properties of a [%s]." c_type)

let class_ ~namespace ~class_name ~c_type =
  canned
    (Fmt.str
       "Wraps a layer 1 handle, {!%s.t}. Apply it directly only to convert a \
        handle obtained from layer 1: constructors, and methods that return a \
        [%s], give one already wrapped."
       (layer1_path ~namespace ~class_name)
       c_type)

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

let constructors_heading = "(** {2:constructors Constructors} *)"

let constructor ~namespace ~class_name ~c_type (ctor : Types.gir_constructor) =
  let c_function = Fmt.str "[%s]" ctor.c_identifier in
  let wrapped =
    upstream_base_url namespace
    |> Option.fold ~none:c_function ~some:(fun base ->
        Fmt.str "{{:%sctor.%s.%s.html}%s}" base class_name ctor.ctor_name
          c_function)
  in
  Doc_emit.item_doc ~indent:""
    ~fallback:(Fmt.str "Create a new [%s]. Wraps %s." c_type wrapped)
    ~context:Doc_translate.Member ctor.ctor_doc
