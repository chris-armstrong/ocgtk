/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AttrFontFeatures */

#include <pango/pango.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <pango/pango.h>
/* Include library-specific type conversions and forward declarations */
#include "pango_decls.h"

#if PANGO_VERSION_CHECK(1,38,0)
/* Conversion functions for PangoAttrFontFeatures (opaque record with hidden fields) */
PangoAttrFontFeatures *PangoAttrFontFeatures_val(value v) {
  return (PangoAttrFontFeatures *)ml_gir_record_ptr_val(v, "PangoAttrFontFeatures");
}

value Val_PangoAttrFontFeatures(const PangoAttrFontFeatures *ptr) {
  if (ptr == NULL) return Val_none;
  return ml_gir_record_val_ptr(ptr);
}

value Val_PangoAttrFontFeatures_option(const PangoAttrFontFeatures *ptr) {
  if (ptr == NULL) return Val_none;
  return Val_some(Val_PangoAttrFontFeatures(ptr));
}
#endif

#if PANGO_VERSION_CHECK(1,38,0)

\
CAMLexport CAMLprim value ml_pango_attr_font_features_get_features(value self)
{
    CAMLparam1(self);
    PangoAttrFontFeatures *rec = PangoAttrFontFeatures_val(self);
    CAMLreturn(caml_copy_string(rec->features));
}

\
CAMLexport CAMLprim value ml_pango_attr_font_features_set_features(value self, value v_val)
{
    CAMLparam2(self, v_val);
    PangoAttrFontFeatures *rec = PangoAttrFontFeatures_val(self);
    g_free(rec->features);
    rec->features = g_strdup(String_val(v_val));
    CAMLreturn(Val_unit);
}

\
CAMLexport CAMLprim value ml_pango_attr_font_features_make(value v_features)
{
    CAMLparam1(v_features);
    PangoAttrFontFeatures *obj = g_new0(PangoAttrFontFeatures, 1);
    if (obj == NULL) caml_failwith("allocation failed");
    obj->features = g_strdup(String_val(v_features));
    CAMLreturn(Val_PangoAttrFontFeatures(obj));
}


#else


#endif
