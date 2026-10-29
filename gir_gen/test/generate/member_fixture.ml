(* A small Gtk namespace whose members exercise each drop and rename that
   Emitted_members knows about. Shared by the Emitted_members and Doc_resolve
   tests. *)

open Gir_gen_lib
open Gir_gen_lib.Types
open Type_factory

let namespace =
  make_gir_namespace ~namespace_name:"Gtk" ~namespace_version:"4.0" ()

let string_param = make_string_param ~param_name:"label" ()
let int_param = make_int_param ~param_name:"value" ()

let out_param =
  make_gir_param ~param_name:"width" ~param_type:gint_type ~direction:Out ()

let varargs_param =
  make_gir_param ~param_name:"first" ~param_type:utf8_type ~varargs:true ()

let property ?readable ?writable ?construct_only prop_name prop_type =
  make_gir_property ~prop_name ~prop_type ?readable ?writable ?construct_only ()

let widget =
  make_gir_class ~class_name:"Widget" ~c_type:"GtkWidget"
    ~methods:
      [
        make_int_method ~method_name:"get_direction"
          ~c_identifier:"gtk_widget_get_direction" ();
        make_void_method ~method_name:"set_direction"
          ~c_identifier:"gtk_widget_set_direction" ~parameters:[ int_param ] ();
        make_void_method ~method_name:"show" ~c_identifier:"gtk_widget_show" ();
      ]
    ()

let button =
  make_gir_class ~class_name:"Button" ~c_type:"GtkButton" ~parent:"Widget"
    ~constructors:
      [
        make_gir_constructor ~ctor_name:"new" ~c_identifier:"gtk_button_new" ();
        make_gir_constructor ~ctor_name:"new_with_label"
          ~c_identifier:"gtk_button_new_with_label"
          ~ctor_parameters:[ string_param ] ();
        make_gir_constructor ~ctor_name:"new_with_items"
          ~c_identifier:"gtk_button_new_with_items"
          ~ctor_parameters:[ varargs_param ] ();
      ]
    ~methods:
      [
        make_gir_method ~method_name:"get_label" ~return_type:utf8_type
          ~c_identifier:"gtk_button_get_label" ~get_property:"label" ();
        make_gir_method ~method_name:"set_label" ~return_type:void_type
          ~c_identifier:"gtk_button_set_label" ~parameters:[ string_param ]
          ~set_property:"label" ();
        (* Not introspectable: dropped at both layers *)
        make_gir_method ~method_name:"get_private"
          ~c_identifier:"gtk_button_get_private" ~return_type:void_type
          ~introspectable:false ();
        (* An out parameter: layer 1 only *)
        make_void_method ~method_name:"get_size"
          ~c_identifier:"gtk_button_get_size" ~parameters:[ out_param ] ();
        (* Same signature as [Widget.show]: inherited at layer 2 *)
        make_void_method ~method_name:"show" ~c_identifier:"gtk_button_show" ();
        (* A keyword: renamed *)
        make_void_method ~method_name:"open" ~c_identifier:"gtk_button_open" ();
      ]
    ~properties:
      [
        property "label" utf8_type;
        property "use-underline" gboolean_type;
        property "secret" utf8_type ~readable:false;
        property "seed" gint_type ~readable:false ~construct_only:true;
      ]
    ~signals:
      [
        make_gir_signal ~signal_name:"clicked" ~return_type:void_type ();
        make_gir_signal ~signal_name:"activate-link" ~return_type:void_type ();
        (* An out parameter: never emitted *)
        make_gir_signal ~signal_name:"get-size" ~return_type:void_type
          ~sig_parameters:[ out_param ] ();
      ]
    ()

(* [get_direction] and [set_direction] claim [direction] but conflict with
   [Widget]'s: layer 2 comments them out. *)
let menu_button =
  make_gir_class ~class_name:"MenuButton" ~c_type:"GtkMenuButton"
    ~parent:"Widget"
    ~methods:
      [
        make_gir_method ~method_name:"get_direction" ~return_type:utf8_type
          ~c_identifier:"gtk_menu_button_get_direction"
          ~get_property:"direction" ();
        make_gir_method ~method_name:"set_direction" ~return_type:void_type
          ~c_identifier:"gtk_menu_button_set_direction"
          ~parameters:[ string_param ] ~set_property:"direction" ();
      ]
    ~properties:[ property "direction" utf8_type ]
    ()

let classes = [ widget; button; menu_button ]

let enums =
  [
    make_gir_enum ~enum_name:"Orientation" ~enum_c_type:"GtkOrientation"
      ~members:
        [
          make_gir_enum_member ~member_name:"horizontal"
            ~c_identifier:"GTK_ORIENTATION_HORIZONTAL" ();
          make_gir_enum_member ~member_name:"vertical" ~member_value:1
            ~c_identifier:"GTK_ORIENTATION_VERTICAL" ();
        ]
      ();
    make_gir_enum ~enum_name:"DirectionType" ~enum_c_type:"GtkDirectionType"
      ~members:
        [
          make_gir_enum_member ~member_name:"tab_forward"
            ~c_identifier:"GTK_DIR_TAB_FORWARD" ();
        ]
      ();
  ]

let bitfields =
  [
    make_gir_bitfield ~bitfield_name:"StateFlags"
      ~bitfield_c_type:"GtkStateFlags"
      ~flags:
        [
          make_gir_bitfield_member ~flag_name:"active"
            ~flag_c_identifier:"GTK_STATE_FLAG_ACTIVE" ();
          make_gir_bitfield_member ~flag_name:"dir_ltr" ~flag_value:1
            ~flag_c_identifier:"GTK_STATE_FLAG_DIR_LTR" ();
        ]
      ();
  ]

let ctx ?(classes = classes) () =
  make_generation_context ~namespace ~classes ~enums ~bitfields
    ~target_library:Main_library ()

let entities ?(classes = classes) () = List.map entity_of_class classes

let entity name =
  match
    List.find_opt (fun (e : entity) -> String.equal e.name name) (entities ())
  with
  | Some entity -> entity
  | None -> Alcotest.failf "no fixture entity %s" name

(* The index for generating the fixture namespace, with its member tables. *)
let index ?(classes = classes) ?(interfaces = []) ?(records = [])
    ?(constants = []) ?(cross_references = StringMap.empty) () =
  let ctx = ctx ~classes () in
  let ctx =
    {
      ctx with
      doc_index =
        Generate.Doc_index.build ~namespace:"Gtk" ~classes ~interfaces ~records
          ~enums ~bitfields ~constants ~cross_references;
    }
  in
  Generate.Doc_index.with_members ~ctx (entities ~classes ())
