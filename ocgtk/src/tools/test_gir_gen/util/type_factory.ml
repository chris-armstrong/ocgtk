open Gir_gen_lib.Types

let make_return_type ~name ~c_type ?nullable ?transfer_ownership ?array () =
  {
    name;
    c_type;
    nullable = Option.value nullable ~default:false;
    transfer_ownership = Option.value transfer_ownership ~default:TransferNone;
    array;
  }

let make_gir_type ~name ?c_type ?nullable ?transfer_ownership ?array () =
  { name; c_type; nullable = Option.value nullable ~default:false; transfer_ownership = Option.value transfer_ownership ~default:TransferNone; array }

let make_gir_array ?length ?(zero_terminated = false) ?fixed_size ?array_name ~element_type () =
  { length; zero_terminated; fixed_size; array_name; element_type }

let make_gir_param ~param_name ~param_type ?direction ?nullable ?varargs ?caller_allocates () =
  { param_name; param_type; direction = Option.value direction ~default:In; nullable = Option.value nullable ~default:false; varargs = Option.value varargs ~default:false; caller_allocates = Option.value caller_allocates ~default:false }

let make_gir_method ~method_name ~c_identifier ~return_type ?parameters ?doc ?throws ?introspectable ?get_property ?set_property ?version () =
  {
    method_name;
    c_identifier;
    return_type;
    parameters = Option.value parameters ~default:[];
    doc;
    throws = Option.value throws ~default:false;
    introspectable = Option.value introspectable ~default:true;
    get_property;
    set_property;
    version;
  }

let make_gir_function ~function_name ~c_identifier ~return_type ?parameters ?doc ?throws ?introspectable ?version () =
  {
    function_name;
    c_identifier;
    return_type;
    parameters = Option.value parameters ~default:[];
    doc;
    throws = Option.value throws ~default:false;
    introspectable = Option.value introspectable ~default:true;
    version;
  }

let make_gir_signal ~signal_name ~return_type ?(sig_parameters = []) ?doc ?version () =
  { signal_name; return_type; sig_parameters; doc; version }

let make_gir_constructor ~ctor_name ~c_identifier ?(ctor_parameters = []) ?ctor_doc ?throws ?ctor_introspectable ?version () =
  {
    ctor_name;
    c_identifier;
    ctor_parameters;
    ctor_doc;
    throws = Option.value throws ~default:false;
    ctor_introspectable = Option.value ctor_introspectable ~default:true;
    version;
  }

let make_gir_property ~prop_name ~prop_type ?(readable = true) ?(writable = true) ?(construct_only = false) ?prop_doc ?version () =
  { prop_name; prop_type; readable; writable; construct_only; prop_doc; version }

let make_gir_record_field ~field_name ?field_type ?(readable = true) ?(writable = false) ?field_doc () =
  { field_name; field_type; readable; writable; field_doc }

let make_gir_record ?(record_name = "TestRecord") ?(c_type = "TestRecord") ?glib_type_name ?glib_get_type ?(opaque = false) ?(disguised = false) ?(introspectable = true) ?c_symbol_prefix ?is_gtype_struct_for ?(fields = []) ?(constructors = []) ?(methods = []) ?(functions = []) ?record_doc ?version () =
  {
    record_name;
    c_type;
    glib_type_name;
    glib_get_type;
    opaque;
    disguised;
    introspectable;
    c_symbol_prefix;
    is_gtype_struct_for;
    fields;
    constructors;
    methods;
    functions;
    record_doc;
    version;
  }

let make_gir_enum_member ?(member_name = "NONE") ?(member_value = 0) ?(c_identifier = "TEST_NONE") ?member_doc () =
  { member_name; member_value; c_identifier; member_doc }

let make_gir_enum ?(enum_name = "TestEnum") ?(enum_c_type = "TestEnum") ?(members = []) ?(functions = []) ?enum_doc ?enum_version () =
  { enum_name; enum_c_type; members; functions; enum_doc; enum_version }

let make_gir_bitfield_member ?(flag_name = "NONE") ?(flag_value = 0) ?(flag_c_identifier = "TEST_NONE") ?flag_doc () =
  { flag_name; flag_value; flag_c_identifier; flag_doc }

let make_gir_bitfield ?(bitfield_name = "TestFlags") ?(bitfield_c_type = "TestFlags") ?(flags = []) ?bitfield_doc ?bitfield_version () =
  { bitfield_name; bitfield_c_type; flags; bitfield_doc; bitfield_version }

let make_gir_class ?(class_name = "TestClass") ?(c_type = "TestClass") ?parent ?(implements = []) ?(introspectable = true) ?(constructors = []) ?(methods = []) ?(properties = []) ?(signals = []) ?class_doc ?version () =
  {
    class_name;
    c_type;
    parent;
    implements;
    introspectable;
    constructors;
    methods;
    properties;
    signals;
    class_doc;
    version;
  }

let make_gir_interface ?(interface_name = "TestInterface") ?(c_type = "TestInterface") ?(c_symbol_prefix = "test_interface") ?(methods = []) ?(properties = []) ?(signals = []) ?interface_doc ?version () =
  {
    interface_name;
    c_type;
    c_symbol_prefix;
    methods;
    properties;
    signals;
    interface_doc;
    version;
  }

let make_entity ?(kind = Class (make_gir_class ())) ?(name = "TestEntity") ?(c_type = "TestEntity") ?doc ?parent ?(implements = []) ?(constructors = []) ?(methods = []) ?(properties = []) ?(signals = []) ?version () =
  { kind; name; c_type; doc; parent; implements; constructors; methods; properties; signals; version }

let make_ocaml_class ?(class_module = "Test") ?(class_type = "test") ?(class_layer1_accessor = "test") () =
  { class_module; class_type; class_layer1_accessor }

let make_type_mapping ~ocaml_type ~c_type ~c_to_ml ~ml_to_c ?layer2_class ?(is_value_type_record = false) () =
  { ocaml_type; c_type; c_to_ml; ml_to_c; layer2_class; is_value_type_record }

let make_gir_namespace ?(namespace_name = "Test") ?(namespace_version = "1.0") ?(namespace_shared_library = "libtest.so") ?(namespace_c_identifier_prefixes = "Test") ?(namespace_c_symbol_prefixes = "test") () =
  {
    namespace_name;
    namespace_version;
    namespace_shared_library;
    namespace_c_identifier_prefixes;
    namespace_c_symbol_prefixes;
  }

let make_gir_include ?(include_name = "GObject") ?(include_version = "2.0") () =
  { include_name; include_version }

let make_gir_repository ?(repository_includes = []) ?(repository_c_includes = []) ?(repository_packages = []) () =
  { repository_includes; repository_c_includes; repository_packages }

let make_cross_reference_type ?parent = function
  | `Class -> Crt_Class { parent }
  | `Interface -> Crt_Interface
  | `Record opaque -> Crt_Record { opaque }
  | `Enum -> Crt_Enum
  | `Bitfield -> Crt_Bitfield

let make_cross_reference_entity ?(cr_name = "TestEntity") ?(cr_type = Crt_Interface) ?(cr_c_type = "TestEntity") () =
  { cr_name; cr_type; cr_c_type }

let make_cross_reference_namespace ?(cr_namespace_name = "Test") ?(cr_namespace_packages = []) ?(cr_namespace_includes = []) ?(cr_namespace_c_includes = []) ?(cr_entities = []) () =
  {
    cr_namespace_name;
    cr_namespace_packages;
    cr_namespace_includes;
    cr_namespace_c_includes;
    cr_entities;
  }

let make_generation_context ?(namespace = make_gir_namespace ()) ?(repository = make_gir_repository ()) ?(classes = []) ?(interfaces = []) ?(enums = []) ?(bitfields = []) ?(records = []) ?module_groups ?(current_cycle_classes = []) ?(cross_references = StringMap.empty) () =
  let module_groups_table = match module_groups with
    | None -> Hashtbl.create 0
    | Some items ->
        let ht = Hashtbl.create (List.length items) in
        List.iter (fun (k, v) -> Hashtbl.add ht k v) items;
        ht
  in
  {
    namespace;
    repository;
    classes;
    interfaces;
    enums;
    bitfields;
    records;
    module_groups = module_groups_table;
    current_cycle_classes;
    cross_references;
  }

let void_type = make_gir_type ~name:"none" ~c_type:"void" ()

let utf8_type = make_gir_type ~name:"utf8" ~c_type:"const gchar*" ()

let gint_type = make_gir_type ~name:"gint" ~c_type:"gint" ()

let guint_type = make_gir_type ~name:"guint" ~c_type:"guint" ()

let gdouble_type = make_gir_type ~name:"gdouble" ~c_type:"gdouble" ()

let gboolean_type = make_gir_type ~name:"gboolean" ~c_type:"gboolean" ()

let make_widget_type ?(nullable = false) () =
  make_gir_type ~name:"GtkWidget" ~c_type:"GtkWidget*" ~nullable ()