/* GENERATED CODE - DO NOT EDIT */
/* C bindings for ContentProvider */

#include <gdk/gdk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gdk/gdk.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"


CAMLexport CAMLprim value ml_gdk_content_provider_ref_storable_formats(value self)
{
CAMLparam1(self);

GdkContentFormats* result = gdk_content_provider_ref_storable_formats(GdkContentProvider_val(self));
CAMLreturn(Val_GdkContentFormats(result));
}

CAMLexport CAMLprim value ml_gdk_content_provider_ref_formats(value self)
{
CAMLparam1(self);

GdkContentFormats* result = gdk_content_provider_ref_formats(GdkContentProvider_val(self));
CAMLreturn(Val_GdkContentFormats(result));
}

CAMLexport CAMLprim value ml_gdk_content_provider_content_changed(value self)
{
CAMLparam1(self);

gdk_content_provider_content_changed(GdkContentProvider_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_content_provider_get_formats(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GdkContentProvider *obj = (GdkContentProvider *)GdkContentProvider_val(self);
    GdkContentFormats *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "formats");
if (pspec == NULL) caml_failwith("ml_gtk_content_provider_get_formats: property 'formats' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "formats", &prop_gvalue);
          prop_value = (GdkContentFormats*)g_value_get_boxed(&prop_gvalue);

      result = Val_GdkContentFormats(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}

CAMLexport CAMLprim value ml_gtk_content_provider_get_storable_formats(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GdkContentProvider *obj = (GdkContentProvider *)GdkContentProvider_val(self);
    GdkContentFormats *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "storable-formats");
if (pspec == NULL) caml_failwith("ml_gtk_content_provider_get_storable_formats: property 'storable-formats' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "storable-formats", &prop_gvalue);
          prop_value = (GdkContentFormats*)g_value_get_boxed(&prop_gvalue);

      result = Val_GdkContentFormats(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}
