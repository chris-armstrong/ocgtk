(* Entity_doc — see entity_doc.mli for the contract. *)

open StdLabels

(* Canned text is trusted markup and is not translated, so it has no
   references to resolve. *)
let canned text =
  Doc_emit.item_doc ~indent:"" ~fallback:text
    ~refs:(Doc_resolve.no_links ~namespace:"")
    ~context:Doc_translate.Member None

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

let translated ~refs class_doc =
  Option.bind class_doc (fun raw ->
      match String.trim (Doc_emit.translate ~refs Doc_translate.Member raw) with
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

let synopsis ~refs ~class_name ~class_doc =
  Option.bind (translated ~refs class_doc) first_paragraph
  |> Option.value ~default:(synopsis_fallback ~class_name)

(* The full class doc, unless the synopsis already says all of it. *)
let description_text ~refs ~class_name ~class_doc =
  Option.bind (translated ~refs class_doc) (fun text ->
      if String.equal text (synopsis ~refs ~class_name ~class_doc) then None
      else Some text)

let l1_module ~(refs : Doc_resolve.env) ~class_name ~class_doc =
  Doc_emit.item_doc ~indent:""
    ~fallback:(synopsis_fallback ~class_name)
    ~suffix:
      (Fmt.str "The class built on this module is in {!%s}."
         (layer2_path ~namespace:refs.namespace ~class_name))
    ~refs ~context:Doc_translate.Member class_doc

let l2_module ~(refs : Doc_resolve.env) ~class_name ~class_doc =
  let description =
    match description_text ~refs ~class_name ~class_doc with
    | Some _ -> " Its full description is under {!section-description}."
    | None -> ""
  in
  Doc_emit.item_doc ~indent:""
    ~fallback:(synopsis ~refs ~class_name ~class_doc)
    ~suffix:
      (Fmt.str
         "Its methods, signals and properties are on {!class-type-%s}.%s Its \
          constructors are under {!section-constructors}. The functions it is \
          built on are in {!%s}."
         (Utils.class_type_name class_name)
         description
         (layer1_path ~namespace:refs.namespace ~class_name))
    ~refs ~context:Doc_translate.Member None

let class_heading = "(** {1:class Class} *)"

let description ~refs ~class_name ~class_doc =
  Option.bind (description_text ~refs ~class_name ~class_doc) (fun text ->
      Doc_emit.item_doc ~indent:"" ~fallback:text
        ~prefix:"{1:description Description}" ~refs
        ~context:Doc_translate.Member None)

type ancestor =
  | Bound of { namespace : string; name : string }
  | Unbound of string

type inheritance = {
  parent : ancestor option;
  implements : ancestor list;
  requires : ancestor list;
}

let no_inheritance = { parent = None; implements = []; requires = [] }

let ancestor_ref = function
  | Bound { namespace; name } ->
      let path = Module_paths.cross_ns_layer2_module ~namespace name in
      Fmt.str "{{!%s.class-type-%s}%s}" path (Utils.class_type_name name) path
  | Unbound name -> Fmt.str "[%s]" name

let ancestor_list ~label = function
  | [] -> None
  | ancestors ->
      Some
        (String.concat ~sep:"\n"
           ((label ^ ":")
           :: List.map ancestors ~f:(fun a -> "- " ^ ancestor_ref a)))

let inheritance_paragraphs { parent; implements; requires } =
  List.filter_map ~f:Fun.id
    [
      Option.map (fun p -> "Inherits from: " ^ ancestor_ref p) parent;
      ancestor_list ~label:"Implements" implements;
      ancestor_list ~label:"Requires" requires;
    ]

let class_type ~refs ~class_name ~inheritance ~class_doc =
  let heading =
    Fmt.str "{b The methods, signals and properties of a [%s].}" class_name
  in
  Doc_emit.item_doc ~indent:""
    ~prefix:
      (String.concat ~sep:"\n\n"
         (heading :: inheritance_paragraphs inheritance))
    ~refs ~context:Doc_translate.Member class_doc

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

type instantiation = Abstract_class | Interface | Returned_only

let no_constructors instantiation =
  canned
    (match instantiation with
    | Abstract_class ->
        "This is an abstract class that can't be instantiated directly. Refer \
         to its subclasses for a concrete implementation."
    | Interface ->
        "This is an interface which can't be instantiated directly, but which \
         may be returned from a method or function."
    | Returned_only ->
        "This class is not instantiated directly - it is used as a return \
         value by methods on other classes.")

let constructor ~(refs : Doc_resolve.env) ~class_name
    (ctor : Types.gir_constructor) =
  let c_function = Fmt.str "[%s]" ctor.c_identifier in
  let wrapped =
    upstream_base_url refs.namespace
    |> Option.fold ~none:c_function ~some:(fun base ->
        Fmt.str "{{:%sctor.%s.%s.html}%s}" base class_name ctor.ctor_name
          c_function)
  in
  Doc_emit.item_doc ~indent:""
    ~ret_shape:(Doc_translate.ret_shape_of_throws ctor.throws)
    ~fallback:(Fmt.str "Create a new [%s]. Wraps %s." class_name wrapped)
    ~refs ~context:Doc_translate.Member ctor.ctor_doc

type accessor = Getter | Setter

(* A [default-value=] is a bare C value: [TRUE], [FALSE] and [NULL] read as the
   bindings spell them, anything else as is. *)
let default_value value : Doc_translate.inline =
  Doc_c_idiom.c_lit_of_name value
  |> Option.fold ~none:(Doc_translate.Code value) ~some:(fun lit ->
      Doc_translate.C_lit lit)

let property_fallback ~(refs : Doc_resolve.env) ~class_name ~accessor
    (prop : Types.gir_property) : string =
  let open Doc_translate in
  let verb = match accessor with Getter -> "Get" | Setter -> "Set" in
  let default =
    Option.fold prop.prop_default ~none:[] ~some:(fun value ->
        [ Text ", default "; default_value value ])
  in
  let construct_only =
    if prop.construct_only then [ Text " Construct-only." ] else []
  in
  let upstream =
    upstream_base_url refs.namespace
    |> Option.fold ~none:[] ~some:(fun base ->
        [
          Text " See ";
          Link
            {
              text = [ Text "upstream docs" ];
              url =
                Fmt.str "%sproperty.%s.%s.html" base class_name prop.prop_name;
            };
          Text ".";
        ])
  in
  let line =
    List.concat
      [
        [ Text (verb ^ " property: "); Code prop.prop_name; Text " (" ];
        Code prop.prop_type.name :: default;
        [ Text ")." ];
        construct_only;
        upstream;
      ]
  in
  String.trim (render_as Member { blocks = [ Para line ] })

let property ~refs ~class_name ~accessor (prop : Types.gir_property) =
  Doc_emit.item_doc ~indent:""
    ~fallback:(property_fallback ~refs ~class_name ~accessor prop)
    ~refs ~context:Doc_translate.Member prop.prop_doc
