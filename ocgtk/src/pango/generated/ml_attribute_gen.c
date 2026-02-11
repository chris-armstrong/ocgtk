/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Attribute */

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
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Copy function for PangoAttribute (value-like record with copy method) */
value copy_PangoAttribute(const PangoAttribute *ptr) {
  if (ptr == NULL) return Val_none;
  PangoAttribute *copy = pango_attribute_copy((PangoAttribute*)ptr);
  return ml_gir_record_val_ptr(g_new0(PangoAttribute, 1));
}


CAMLexport CAMLprim value ml_pango_attribute_init(value self, value arg1)
{
CAMLparam2(self, arg1);

pango_attribute_init(PangoAttribute_val(self), PangoAttrClass_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_pango_attribute_equal(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = pango_attribute_equal(PangoAttribute_val(self), PangoAttribute_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_pango_attribute_destroy(value self)
{
CAMLparam1(self);

pango_attribute_destroy(PangoAttribute_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_pango_attribute_copy(value self)
{
CAMLparam1(self);

PangoAttribute* result = pango_attribute_copy(PangoAttribute_val(self));
CAMLreturn(Val_PangoAttribute(result));
}

CAMLexport CAMLprim value ml_pango_attribute_as_string(value self)
{
CAMLparam1(self);

PangoAttrString* result = pango_attribute_as_string(PangoAttribute_val(self));
CAMLreturn(Val_option(result, Val_PangoAttrString));
}

CAMLexport CAMLprim value ml_pango_attribute_as_size(value self)
{
CAMLparam1(self);

PangoAttrSize* result = pango_attribute_as_size(PangoAttribute_val(self));
CAMLreturn(Val_option(result, Val_PangoAttrSize));
}

CAMLexport CAMLprim value ml_pango_attribute_as_shape(value self)
{
CAMLparam1(self);

PangoAttrShape* result = pango_attribute_as_shape(PangoAttribute_val(self));
CAMLreturn(Val_option(result, Val_PangoAttrShape));
}

CAMLexport CAMLprim value ml_pango_attribute_as_language(value self)
{
CAMLparam1(self);

PangoAttrLanguage* result = pango_attribute_as_language(PangoAttribute_val(self));
CAMLreturn(Val_option(result, Val_PangoAttrLanguage));
}

CAMLexport CAMLprim value ml_pango_attribute_as_int(value self)
{
CAMLparam1(self);

PangoAttrInt* result = pango_attribute_as_int(PangoAttribute_val(self));
CAMLreturn(Val_option(result, Val_PangoAttrInt));
}

CAMLexport CAMLprim value ml_pango_attribute_as_font_features(value self)
{
CAMLparam1(self);

PangoAttrFontFeatures* result = pango_attribute_as_font_features(PangoAttribute_val(self));
CAMLreturn(Val_option(result, Val_PangoAttrFontFeatures));
}

CAMLexport CAMLprim value ml_pango_attribute_as_font_desc(value self)
{
CAMLparam1(self);

PangoAttrFontDesc* result = pango_attribute_as_font_desc(PangoAttribute_val(self));
CAMLreturn(Val_option(result, Val_PangoAttrFontDesc));
}

CAMLexport CAMLprim value ml_pango_attribute_as_float(value self)
{
CAMLparam1(self);

PangoAttrFloat* result = pango_attribute_as_float(PangoAttribute_val(self));
CAMLreturn(Val_option(result, Val_PangoAttrFloat));
}

CAMLexport CAMLprim value ml_pango_attribute_as_color(value self)
{
CAMLparam1(self);

PangoAttrColor* result = pango_attribute_as_color(PangoAttribute_val(self));
CAMLreturn(Val_option(result, Val_PangoAttrColor));
}
