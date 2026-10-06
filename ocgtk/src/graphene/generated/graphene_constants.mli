(* GENERATED CODE - DO NOT EDIT *)
(* Graphene Constants *)

val pi : float
val pi_2 : float

val vec2_len : int
[@@ocaml.doc
  "Evaluates to the number of components of a #graphene_vec2_t.\n\n\
   This symbol is useful when declaring a C array of floating\n\
   point values to be used with graphene_vec2_init_from_float() and\n\
   graphene_vec2_to_float(), e.g.\n\n\
   {[\n\
  \  float v[GRAPHENE_VEC2_LEN];\n\n\
  \  // vec is defined elsewhere\n\
  \  graphene_vec2_to_float (&vec, v);\n\n\
  \  for (int i = 0; i < GRAPHENE_VEC2_LEN; i++)\n\
  \    fprintf (stdout, \"component %d: %g\\n\", i, v[i]);\n\
   ]}\n\
  \    @since 1.0"]

val vec3_len : int
[@@ocaml.doc
  "Evaluates to the number of components of a #graphene_vec3_t.\n\n\
   This symbol is useful when declaring a C array of floating\n\
   point values to be used with graphene_vec3_init_from_float() and\n\
   graphene_vec3_to_float(), e.g.\n\n\
   {[\n\
  \  float v[GRAPHENE_VEC3_LEN];\n\n\
  \  // vec is defined elsewhere\n\
  \  graphene_vec3_to_float (&vec, v);\n\n\
  \  for (int i = 0; i < GRAPHENE_VEC2_LEN; i++)\n\
  \    fprintf (stdout, \"component %d: %g\\n\", i, v[i]);\n\
   ]}\n\
  \    @since 1.0"]

val vec4_len : int
[@@ocaml.doc
  "Evaluates to the number of components of a #graphene_vec4_t.\n\n\
   This symbol is useful when declaring a C array of floating\n\
   point values to be used with graphene_vec4_init_from_float() and\n\
   graphene_vec4_to_float(), e.g.\n\n\
   {[\n\
  \  float v[GRAPHENE_VEC4_LEN];\n\n\
  \  // vec is defined elsewhere\n\
  \  graphene_vec4_to_float (&vec, v);\n\n\
  \  for (int i = 0; i < GRAPHENE_VEC4_LEN; i++)\n\
  \    fprintf (stdout, \"component %d: %g\\n\", i, v[i]);\n\
   ]}\n\
  \    @since 1.0"]
