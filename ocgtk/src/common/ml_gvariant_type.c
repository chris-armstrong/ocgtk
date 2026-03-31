/**************************************************************************/
/*                ocgtk - OCaml bindings for GTK4                         */
/*                                                                        */
/*    This program is free software; you can redistribute it              */
/*    and/or modify it under the terms of the GNU Library General         */
/*    Public License version 2, as published by the           */
/*    Free Software Foundation with the exception described in file       */
/*    COPYING which comes with the library.                               */
/*                                                                        */
/*    Based on lablgtk3 /https://github.com/garrigue/lablgtk/             */
/*                                                                        */
/**************************************************************************/

/* GVariantType C bindings for ocgtk
 *
 * GVariantType describes the type of a GVariant value.
 * It is immutable and uses g_variant_type_copy/free for memory management.
 */

#include <string.h>
#include <stdio.h>
#include <glib.h>
#include <glib-object.h>

#include <caml/mlvalues.h>
#include <caml/alloc.h>
#include <caml/memory.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/custom.h>

#include "wrappers.h"

/* ==================================================================== */
/* GVariantType custom block with free finalizer                        */
/* ==================================================================== */

static void finalize_gvariant_type(value v) {
    GVariantType *type = *((GVariantType**)Data_custom_val(v));
    if (type != NULL) {
        g_variant_type_free(type);
    }
}

static struct custom_operations gvariant_type_custom_ops = {
    "ocgtk.gvariant_type",
    finalize_gvariant_type,
    custom_compare_default,
    custom_hash_default,
    custom_serialize_default,
    custom_deserialize_default,
    custom_compare_ext_default,
    custom_fixed_length_default
};

/* Wrap a GVariantType in a custom block with automatic free finalizer.
 * The type is copied when wrapped, so the caller can free the original.
 */
value Val_GVariantType(const GVariantType *type) {
    CAMLparam0();
    CAMLlocal1(v);

    if (type == NULL) {
        caml_failwith("Val_GVariantType: NULL type");
    }

    v = caml_alloc_custom(&gvariant_type_custom_ops, sizeof(GVariantType*), 0, 1);
    *((GVariantType**)Data_custom_val(v)) = g_variant_type_copy(type);

    CAMLreturn(v);
}

/* ==================================================================== */
/* Constructors                                                         */
/* ==================================================================== */

CAMLprim value ml_g_variant_type_new(value type_str) {
    CAMLparam1(type_str);
    const gchar *str = String_val(type_str);
    
    if (!g_variant_type_string_is_valid(str)) {
        caml_failwith("ml_g_variant_type_new: invalid type string");
    }
    
    CAMLlocal1(result);
    GVariantType *type = g_variant_type_new(str);
    result = Val_GVariantType(type);
    g_variant_type_free(type);
    CAMLreturn(result);
}

/* ==================================================================== */
/* Accessors                                                            */
/* ==================================================================== */

CAMLprim value ml_g_variant_type_get_string(value type) {
    CAMLparam1(type);
    CAMLlocal1(result);
    const GVariantType *t = GVariantType_val(type);
    gchar *str = g_variant_type_dup_string(t);
    result = caml_copy_string(str);
    g_free(str);
    CAMLreturn(result);
}

/* ==================================================================== */
/* Predicates                                                           */
/* ==================================================================== */

CAMLprim value ml_g_variant_type_is_basic(value type) {
    CAMLparam1(type);
    const GVariantType *t = GVariantType_val(type);
    CAMLreturn(Val_bool(g_variant_type_is_basic(t)));
}

CAMLprim value ml_g_variant_type_is_container(value type) {
    CAMLparam1(type);
    const GVariantType *t = GVariantType_val(type);
    CAMLreturn(Val_bool(g_variant_type_is_container(t)));
}

CAMLprim value ml_g_variant_type_is_array(value type) {
    CAMLparam1(type);
    const GVariantType *t = GVariantType_val(type);
    CAMLreturn(Val_bool(g_variant_type_is_array(t)));
}

CAMLprim value ml_g_variant_type_is_dict_entry(value type) {
    CAMLparam1(type);
    const GVariantType *t = GVariantType_val(type);
    CAMLreturn(Val_bool(g_variant_type_is_dict_entry(t)));
}

CAMLprim value ml_g_variant_type_is_tuple(value type) {
    CAMLparam1(type);
    const GVariantType *t = GVariantType_val(type);
    CAMLreturn(Val_bool(g_variant_type_is_tuple(t)));
}

CAMLprim value ml_g_variant_type_is_variant(value type) {
    CAMLparam1(type);
    const GVariantType *t = GVariantType_val(type);
    CAMLreturn(Val_bool(g_variant_type_is_variant(t)));
}

/* ==================================================================== */
/* Type Constants                                                       */
/* ==================================================================== */

CAMLprim value ml_g_variant_type_unit(value unit) {
    CAMLparam1(unit);
    (void)unit;
    CAMLreturn(Val_GVariantType(G_VARIANT_TYPE_UNIT));
}

CAMLprim value ml_g_variant_type_boolean(value unit) {
    CAMLparam1(unit);
    (void)unit;
    CAMLreturn(Val_GVariantType(G_VARIANT_TYPE_BOOLEAN));
}

CAMLprim value ml_g_variant_type_int32(value unit) {
    CAMLparam1(unit);
    (void)unit;
    CAMLreturn(Val_GVariantType(G_VARIANT_TYPE_INT32));
}

CAMLprim value ml_g_variant_type_int64(value unit) {
    CAMLparam1(unit);
    (void)unit;
    CAMLreturn(Val_GVariantType(G_VARIANT_TYPE_INT64));
}

CAMLprim value ml_g_variant_type_double(value unit) {
    CAMLparam1(unit);
    (void)unit;
    CAMLreturn(Val_GVariantType(G_VARIANT_TYPE_DOUBLE));
}

CAMLprim value ml_g_variant_type_string(value unit) {
    CAMLparam1(unit);
    (void)unit;
    CAMLreturn(Val_GVariantType(G_VARIANT_TYPE_STRING));
}

CAMLprim value ml_g_variant_type_object_path(value unit) {
    CAMLparam1(unit);
    (void)unit;
    CAMLreturn(Val_GVariantType(G_VARIANT_TYPE_OBJECT_PATH));
}

CAMLprim value ml_g_variant_type_signature(value unit) {
    CAMLparam1(unit);
    (void)unit;
    CAMLreturn(Val_GVariantType(G_VARIANT_TYPE_SIGNATURE));
}

CAMLprim value ml_g_variant_type_variant(value unit) {
    CAMLparam1(unit);
    (void)unit;
    CAMLreturn(Val_GVariantType(G_VARIANT_TYPE_VARIANT));
}

CAMLprim value ml_g_variant_type_byte(value unit) {
    CAMLparam1(unit);
    (void)unit;
    CAMLreturn(Val_GVariantType(G_VARIANT_TYPE_BYTE));
}

CAMLprim value ml_g_variant_type_int16(value unit) {
    CAMLparam1(unit);
    (void)unit;
    CAMLreturn(Val_GVariantType(G_VARIANT_TYPE_INT16));
}

CAMLprim value ml_g_variant_type_uint16(value unit) {
    CAMLparam1(unit);
    (void)unit;
    CAMLreturn(Val_GVariantType(G_VARIANT_TYPE_UINT16));
}

CAMLprim value ml_g_variant_type_uint32(value unit) {
    CAMLparam1(unit);
    (void)unit;
    CAMLreturn(Val_GVariantType(G_VARIANT_TYPE_UINT32));
}

CAMLprim value ml_g_variant_type_uint64(value unit) {
    CAMLparam1(unit);
    (void)unit;
    CAMLreturn(Val_GVariantType(G_VARIANT_TYPE_UINT64));
}

CAMLprim value ml_g_variant_type_handle(value unit) {
    CAMLparam1(unit);
    (void)unit;
    CAMLreturn(Val_GVariantType(G_VARIANT_TYPE_HANDLE));
}
