/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TlsFileDatabase */

#include <gio/gio.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gio/gunixoutputstream.h>
#include <gio/gunixmounts.h>
#include <gio/gunixinputstream.h>
#include <gio/gunixfdmessage.h>
#include <gio/gio.h>
#include <gio/gfiledescriptorbased.h>
#include <gio/gdesktopappinfo.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"


CAMLexport CAMLprim value ml_gtk_tls_file_database_get_anchors(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GTlsFileDatabase *obj = (GTlsFileDatabase *)GTlsFileDatabase_val(self);
    gchar* *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "anchors");
if (pspec == NULL) caml_failwith("ml_gtk_tls_file_database_get_anchors: property 'anchors' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
g_object_get_property(G_OBJECT(obj), "anchors", &prop_gvalue);
    prop_value = g_value_get_string(&prop_gvalue);

result = caml_copy_string(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_tls_file_database_set_anchors(value self, value new_value)
{
CAMLparam2(self, new_value);
GTlsFileDatabase *obj = (GTlsFileDatabase *)GTlsFileDatabase_val(self);
    ML_DECL_CONST_STRING(c_value, String_val(new_value));
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "anchors");
if (pspec == NULL) caml_failwith("ml_gtk_tls_file_database_set_anchors: property 'anchors' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
    g_value_set_string(&prop_gvalue, c_value);
g_object_set_property(G_OBJECT(obj), "anchors", &prop_gvalue);
g_value_unset(&prop_gvalue);
CAMLreturn(Val_unit);
}
