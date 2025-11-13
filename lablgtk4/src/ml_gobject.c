/**************************************************************************/
/*                LablGTK4 - OCaml bindings for GTK4                      */
/*                                                                        */
/*    This program is free software; you can redistribute it              */
/*    and/or modify it under the terms of the GNU Library General         */
/*    Public License as published by the Free Software Foundation         */
/*    version 2, with the exception described in file COPYING which       */
/*    comes with the library.                                             */
/*                                                                        */
/**************************************************************************/

/* Minimal GObject C bindings for LablGTK4
 *
 * This file provides basic GObject functionality needed for GTK4:
 * - Object reference counting (ref/unref)
 * - Type system queries
 * - GValue handling (basic)
 *
 * Additional GObject bindings (properties, signals, etc.) will be
 * added in Phase 2.
 */

#include <string.h>
#include <glib.h>
#include <glib-object.h>
#include <gtk/gtk.h>

#include <caml/mlvalues.h>
#include <caml/alloc.h>
#include <caml/memory.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/custom.h>

#include "wrappers.h"
#include "gobject_tags.h"

/* ==================================================================== */
/* GObject Reference Counting */
/* ==================================================================== */

/* Increment reference count of a GObject */
CAMLprim value ml_g_object_ref(value obj)
{
    if (obj == Val_unit || Pointer_val(obj) == NULL)
        caml_invalid_argument("g_object_ref: NULL object");

    g_object_ref(Pointer_val(obj));
    return Val_unit;
}

/* Decrement reference count of a GObject */
CAMLprim value ml_g_object_unref(value obj)
{
    if (obj == Val_unit || Pointer_val(obj) == NULL)
        return Val_unit;  /* Silently ignore NULL */

    g_object_unref(Pointer_val(obj));
    return Val_unit;
}

/* Force immediate unreferencing (for testing/debugging) */
CAMLprim value ml_g_object_do_unref(value unit)
{
    /* This is a placeholder - actual implementation would track
       pending unrefs in a queue and process them */
    return Val_unit;
}

/* ==================================================================== */
/* Type System Queries */
/* ==================================================================== */

/* Get the GType of a GObject instance */
CAMLprim value ml_g_object_get_type(value obj)
{
    CAMLparam1(obj);
    GObject *gobj;

    if (obj == Val_unit || Pointer_val(obj) == NULL)
        caml_invalid_argument("g_object_get_type: NULL object");

    gobj = G_OBJECT(Pointer_val(obj));
    CAMLreturn(Val_long(G_OBJECT_TYPE(gobj)));
}

/* Get the name of a GType */
CAMLprim value ml_g_type_name(value type)
{
    const char *name = g_type_name(Long_val(type));
    if (name == NULL)
        return caml_copy_string("<invalid type>");
    return caml_copy_string(name);
}

/* Get parent type of a GType */
CAMLprim value ml_g_type_parent(value type)
{
    GType parent = g_type_parent(Long_val(type));
    return Val_long(parent);
}

/* Check if type is derived from another type */
CAMLprim value ml_g_type_is_a(value type, value is_a_type)
{
    gboolean result = g_type_is_a(Long_val(type), Long_val(is_a_type));
    return Val_bool(result);
}

/* ==================================================================== */
/* GValue Handling (Basic) */
/* ==================================================================== */

/* Custom block operations for GValue */
static void finalize_gvalue(value val)
{
    GValue *gv = (GValue *)Data_custom_val(val);
    if (G_IS_VALUE(gv)) {
        g_value_unset(gv);
    }
}

static struct custom_operations gvalue_ops = {
    "org.lablgtk.gvalue",
    finalize_gvalue,
    custom_compare_default,
    custom_hash_default,
    custom_serialize_default,
    custom_deserialize_default,
    custom_compare_ext_default,
    custom_fixed_length_default
};

/* Allocate a new GValue */
CAMLprim value ml_g_value_new(void)
{
    CAMLparam0();
    CAMLlocal1(val);

    val = caml_alloc_custom(&gvalue_ops, sizeof(GValue), 0, 1);
    memset(Data_custom_val(val), 0, sizeof(GValue));

    CAMLreturn(val);
}

/* Get GValue from OCaml value */
CAMLprim GValue *GValue_val(value val)
{
    return (GValue *)Data_custom_val(val);
}

/* Initialize a GValue with a specific type */
CAMLprim value ml_g_value_init(value val, value gtype)
{
    GValue *gv = GValue_val(val);
    g_value_init(gv, Long_val(gtype));
    return Val_unit;
}

/* Reset a GValue */
CAMLprim value ml_g_value_reset(value val)
{
    GValue *gv = GValue_val(val);
    if (G_IS_VALUE(gv)) {
        g_value_reset(gv);
    }
    return Val_unit;
}

/* Get integer from GValue */
CAMLprim value ml_g_value_get_int(value val)
{
    GValue *gv = GValue_val(val);
    if (!G_VALUE_HOLDS_INT(gv))
        caml_invalid_argument("g_value_get_int: not an int");
    return Val_int(g_value_get_int(gv));
}

/* Set integer in GValue */
CAMLprim value ml_g_value_set_int(value val, value i)
{
    GValue *gv = GValue_val(val);
    g_value_set_int(gv, Int_val(i));
    return Val_unit;
}

/* Get string from GValue */
CAMLprim value ml_g_value_get_string(value val)
{
    GValue *gv = GValue_val(val);
    if (!G_VALUE_HOLDS_STRING(gv))
        caml_invalid_argument("g_value_get_string: not a string");

    const char *str = g_value_get_string(gv);
    if (str == NULL)
        return caml_copy_string("");
    return caml_copy_string(str);
}

/* Set string in GValue */
CAMLprim value ml_g_value_set_string(value val, value str)
{
    GValue *gv = GValue_val(val);
    g_value_set_string(gv, String_val(str));
    return Val_unit;
}

/* Get boolean from GValue */
CAMLprim value ml_g_value_get_boolean(value val)
{
    GValue *gv = GValue_val(val);
    if (!G_VALUE_HOLDS_BOOLEAN(gv))
        caml_invalid_argument("g_value_get_boolean: not a boolean");
    return Val_bool(g_value_get_boolean(gv));
}

/* Set boolean in GValue */
CAMLprim value ml_g_value_set_boolean(value val, value b)
{
    GValue *gv = GValue_val(val);
    g_value_set_boolean(gv, Bool_val(b));
    return Val_unit;
}

/* ==================================================================== */
/* Object Creation */
/* ==================================================================== */

/* Create a new GObject instance - minimal version for Phase 1.5 */
CAMLprim value ml_g_object_new(value type)
{
    CAMLparam1(type);
    GObject *obj;

    obj = g_object_new(Long_val(type), NULL);
    if (obj == NULL)
        caml_failwith("g_object_new: failed to create object");

    CAMLreturn(Val_pointer(obj));
}
