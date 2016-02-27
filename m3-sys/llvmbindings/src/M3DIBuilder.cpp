// File: projects/Modula3Extras/lib/cbindings/LLVMDIBuilder.cpp
// Implementation of a C binding to DIBuilder.  
// Derived From: 

//===--- llvm/DIBuilder.h - Debug Information Builder -----------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file defines a DIBuilder that is useful for creating debugging
// information entries in LLVM IR form.
//
//===----------------------------------------------------------------------===//

#include "./M3DIBuilder.h" // This binding's header:

#include "llvm/IR/Metadata.h" 
#include "llvm/IR/Module.h"
#include "llvm/IR/Value.h" 
#include "llvm/IR/Function.h" 
#include "llvm/IR/Instruction.h" 
#include "llvm/IR/BasicBlock.h" 
#include "llvm/ADT/ArrayRef.h"
#include "llvm/ADT/StringRef.h"
#include "llvm/IR/DebugInfo.h"
//#include "llvm/Support/CBindingWrapping.h" 
#include "llvm/IR/DIBuilder.h" // The C++ code this binds to.

// wrap and unwrap functions for DI* types. 
// These are for DIBuilder types that are classes containing a single
// data member of type DINode.  

// This is confusing.  Following the convention established by Core.cpp, we use the
// name "wrap" to mean converting from a C++ type to a suitable C type for passing
// in and out of functions in the binding, and "unwrap" for the reverse conversion.
// But "wrap", by this convention, entails removing the MDNode pointer from a class
// instance, and "unwrap" entails putting the pointer back inside a class instance.  

// FIXME: We need to make a result-type-specific unwrap, similar to the 
// template <typename T> unwrap<T> found in DEFINE_ISA_CONVERSION_FUNCTIONS 
// in inclue/llvm/Support/CBindingWrapping.h, so we get proper runtime type
// checking.  

// FIXME: CHECK CAREFULLY!: 
// The unwrap here is extremely suspicious.  It returns, by value, a struct
// that is structurally equivalent in its data member content to what C++ code
// expects (llvm::DIDescriptor).  But could it pass the above check?  There
// must be runtime type info stored somewhere in the C++ class object for the 
// test to even function.  CDebugInfo would not have this, or it would nto be right.
// And do we really know that all the subclasses of llvm:DIDescriptor have lack any
// additional data members and no virtual methods?     

#define DEFINE_DI_MDNODE_CONVERSION_FUNCTIONS(Ty)\
  inline Ty *wrap(llvm::Ty llvmNode) {\
  return reinterpret_cast <Ty*>\
          ((reinterpret_cast<struct CDebugInfo *>(&llvmNode))->DbgPtr); \
  }\
  inline llvm::Ty unwrap(Ty *CNode) {\
    struct CDebugInfo Node;\
    Node.DbgPtr = reinterpret_cast<OpaqueMetadata *>(CNode);\
    return *(reinterpret_cast<llvm::Ty*>(&Node));\
  }

DEFINE_DI_MDNODE_CONVERSION_FUNCTIONS(DIBasicType) 
DEFINE_DI_MDNODE_CONVERSION_FUNCTIONS(DICompileUnit)
DEFINE_DI_MDNODE_CONVERSION_FUNCTIONS(DICompositeType)
DEFINE_DI_MDNODE_CONVERSION_FUNCTIONS(DIDerivedType)
DEFINE_DI_MDNODE_CONVERSION_FUNCTIONS(DIDescriptor)
DEFINE_DI_MDNODE_CONVERSION_FUNCTIONS(DIFile)
DEFINE_DI_MDNODE_CONVERSION_FUNCTIONS(DIEnumerator)
DEFINE_DI_MDNODE_CONVERSION_FUNCTIONS(DIType)
DEFINE_DI_MDNODE_CONVERSION_FUNCTIONS(DITypeArray)
DEFINE_DI_MDNODE_CONVERSION_FUNCTIONS(DIArray)
DEFINE_DI_MDNODE_CONVERSION_FUNCTIONS(DIGlobalVariable)
DEFINE_DI_MDNODE_CONVERSION_FUNCTIONS(DIExpression)
DEFINE_DI_MDNODE_CONVERSION_FUNCTIONS(DIImportedEntity)
DEFINE_DI_MDNODE_CONVERSION_FUNCTIONS(DINameSpace)
DEFINE_DI_MDNODE_CONVERSION_FUNCTIONS(DIVariable)
DEFINE_DI_MDNODE_CONVERSION_FUNCTIONS(DISubrange)
DEFINE_DI_MDNODE_CONVERSION_FUNCTIONS(DILexicalBlockFile)
DEFINE_DI_MDNODE_CONVERSION_FUNCTIONS(DILexicalBlock)
DEFINE_DI_MDNODE_CONVERSION_FUNCTIONS(DIScope)
DEFINE_DI_MDNODE_CONVERSION_FUNCTIONS(DISubprogram)
DEFINE_DI_MDNODE_CONVERSION_FUNCTIONS(DITemplateTypeParameter)
DEFINE_DI_MDNODE_CONVERSION_FUNCTIONS(DITemplateValueParameter)
DEFINE_DI_MDNODE_CONVERSION_FUNCTIONS(DIObjCProperty)

// wrap and unwrap functions for other types. 
// These are for DIBuilder types that are classes containing a single
// data member of type DINode.  

// For our purposes, DITypeRef works just like, e.g., DIType, but it is 
// a different C++ class, has a different field name (Val) for the MDNode
// (which doesn't matter, since we access it only by casting to/from our 
// own CDebugInfo), and different methods.  These functions preserve the 
// non-overloaded names that were once necessary for other reasons, and 
// are still a big improvement in maintainability. 

inline DITypeRef *wrapDITypeRef(llvm::DITypeRef llvmNode) {
  return reinterpret_cast <DITypeRef*>
          ((reinterpret_cast<struct CDebugInfo *>(&llvmNode))->DbgPtr);
  }

inline llvm::DITypeRef unwrapDITypeRef(DITypeRef *CNode) {
  struct CDebugInfo Node;
  Node.DbgPtr = reinterpret_cast<OpaqueMetadata *>(CNode);
  return *(reinterpret_cast<llvm::DITypeRef*>(&Node));
}

// [un]wrap functions missing from Core.h: 

DEFINE_SIMPLE_CONVERSION_FUNCTIONS(llvm::Constant, LLVMConstantRef) 

// [un]wrap functions for DIBUILDER: 
// These are the same as would be generated by 
// DEFINE_SIMPLE_CONVERSION_FUNCTIONS(llvm::DIBuilder, LLVMDIBuilderRef),
// except they have probably non-overloaded names: 

inline llvm::DIBuilder *unwrapBuilder(LLVMDIBuilderRef wrapped) {
  return reinterpret_cast<llvm::DIBuilder *>(wrapped); 
}

inline LLVMDIBuilderRef wrapDIBuilder(const llvm::DIBuilder *unwrapped) {
  return reinterpret_cast<LLVMDIBuilderRef>(const_cast<llvm::DIBuilder*>(unwrapped)); 
}

// unwrap functions for misc. types in llvm: 

const char NullChar = 0; 
const char * NullCharPtr = & NullChar;  

#if 0 
// From DIBuilderBindings.cpp: 
template <typename T> T unwrapDI(LLVMMetadataPtr v) {
  return v ? T(unwrap<llvm::MDNode>(v)) : T();
}
#endif 

inline llvm::StringRef unwrapStringRef(LLVMStringRef R) {
  if (R->Data == NULL) { return llvm::StringRef (NullCharPtr, 0); } 
  else { return llvm::StringRef (R->Data, R->Length); }
}

inline llvm::Value ** unwrapValueRefStar(LLVMValueRef * RefPtr) {
  return reinterpret_cast<llvm::Value **>(RefPtr); 
}

inline llvm::Metadata **unwrapMetadataPtrPtr(LLVMMetadataPtr *Node) {
  return reinterpret_cast<llvm::Metadata **>(Node); 
}

inline llvm::ArrayRef<llvm::Metadata *> unwrapAOfM(LLVMArrayRefOfMetadataPtr R){
  return llvm::ArrayRef<llvm::Metadata *> (unwrapMetadataPtrPtr(R.Data), R.Length); 
}

inline llvm::ArrayRef<int64_t> unwrapAOfI64(LLVMArrayRefOfint64_t R){
  return llvm::ArrayRef<int64_t> (R.Data, R.Length); 
}

inline llvm::MDNode *unwrapMDNodePtr(LLVMMDNodePtr Node) {
  return reinterpret_cast<llvm::MDNode *>(Node); 
}

//template<typename T> inline T *unwrap(LLVMValueRef P) { 
//    return reinterpret_cast<T*>(unwrap(P));
// TODO: ^dynamic_cast would provide detection of type errors in clients of
// this binding, but it is disallowed because the build system apparently 
// specifies -fno-rtti.  But there are other instances of dynamic_cast
// in this code base.  Ferret this out.  
//}

/// Constructor of a DIBuilder.  
LLVMDIBuilderRef 
DIBBuilderCreate(LLVMModuleRef Mod, LLVMBool AllowUnresolved) {
  return wrapDIBuilder
           (new llvm::DIBuilder(*llvm::unwrap(Mod), AllowUnresolved)); 
}

/// finalize - Construct any deferred debug info descriptors.
void DIBfinalize(LLVMDIBuilderRef Builder) {
  unwrapBuilder(Builder)-> finalize();
}

/// Free - Deallocate a DIBuilder
void DIBFree(LLVMDIBuilderRef Builder) {
  llvm::DIBuilder *B = unwrapBuilder(Builder);
  free(B); 
}

/* The debug info node constructors: */ 

/// NOTE: Unlike regular llvm IR nodes, the DI* types are small classes that 
/// contain a pointer to an MDNode.  They are passed in and returned by value, 
/// as structs, with no pointer thereto.  Thus, they require no [un]wrap. 


/// createCompileUnit - A CompileUnit provides an anchor for all debugging
/// information generated during this instance of compilation.
/// @param Lang     Source programming language, eg. dwarf::DW_LANG_C99
/// @param File     File name
/// @param Dir      Directory
/// @param Producer String identify producer of debugging information.
///                 Usually this is a compiler version string.
/// @param isOptimized A boolean flag which indicates whether optimization
///                    is ON or not.
/// @param Flags    This string lists command line options. This string is
///                 directly embedded in debug info output which may be used
///                 by a tool analyzing generated debugging information.
/// @param RV       This indicates runtime version for languages like
///                 Objective-C.
/// @param SplitName The name of the file that we'll split debug info out
///                  into.
LLVMDICompileUnit DIBcreateCompileUnit(LLVMDIBuilderRef Builder,  
                                unsigned Lang,  
                                LLVMStringRef File,
                                LLVMStringRef Dir,  
                                LLVMStringRef Producer,
                                LLVMBool isOptimized,  
                                LLVMStringRef Flags,
                                unsigned RV,
                                LLVMStringRef SplitName,
                                llvm::DIBuilder::DebugEmissionKind Kind,
                                LLVMBool EmitDebugInfo) {
  return wrap(unwrapBuilder(Builder)-> createCompileUnit(
                                /*unsigned*/ Lang,  
                                unwrapStringRef(File),
                                unwrapStringRef(Dir),  
                                unwrapStringRef(Producer),
                                /*LLVMBool*/ isOptimized,  
                                unwrapStringRef(Flags),
                                /*unsigned*/ RV,
                                unwrapStringRef(SplitName),
                                Kind,
                                EmitDebugInfo));
}

/// createFile - Create a file descriptor to hold debugging information
/// for a file.
LLVMDIFile DIBcreateFile(LLVMDIBuilderRef Builder,  
                                LLVMStringRef Filename,  
                                LLVMStringRef Directory) {
  return wrap(unwrapBuilder(Builder)-> createFile(
                                unwrapStringRef(Filename),  
                                unwrapStringRef(Directory)));
}

/// createEnumerator - Create a single enumerator value.
LLVMDIEnumerator DIBcreateEnumerator(LLVMDIBuilderRef Builder,
                                LLVMStringRef Name,
                                int64_t Val) {
  return wrap(unwrapBuilder(Builder)-> createEnumerator(
                                unwrapStringRef(Name),
                                /*int64_t*/ Val));
}

/// \brief Create a DWARF unspecified type.
LLVMDIBasicType DIBcreateUnspecifiedType(LLVMDIBuilderRef Builder,
                                LLVMStringRef Name) {
  return wrap(unwrapBuilder(Builder)-> createUnspecifiedType(
                                unwrapStringRef(Name)));
}

/// \brief Create C++11 nullptr type.
LLVMDIBasicType DIBcreateNullPtrType(LLVMDIBuilderRef Builder) {
  return wrap(unwrapBuilder(Builder)-> createNullPtrType());
}

/// createBasicType - Create debugging information entry for a basic
/// type.
/// @param Name        Type name.
/// @param SizeInBits  Size of the type.
/// @param AlignInBits Type alignment.
/// @param Encoding    DWARF encoding code, e.g. dwarf::DW_ATE_float.
LLVMDIBasicType DIBcreateBasicType(LLVMDIBuilderRef Builder,
                           LLVMStringRef Name,
                           uint64_t SizeInBits,
                           uint64_t AlignInBits,
                           unsigned Encoding) {

  return wrap(unwrapBuilder(Builder)-> createBasicType(
                           unwrapStringRef(Name),
                           /*uint64_t*/ SizeInBits,
                           /*uint64_t*/ AlignInBits,
                           /*unsigned*/ Encoding));
}

/// createQualifiedType - Create debugging information entry for a qualified
/// type, e.g. 'const int'.
/// @param Tag         Tag identifing type, e.g. dwarf::TAG_volatile_type
/// @param FromTy      Base Type.
LLVMDIDerivedType DIBcreateQualifiedType(LLVMDIBuilderRef Builder,
                                unsigned Tag,
                                LLVMDIType FromTy) {
  return wrap(unwrapBuilder(Builder)-> createQualifiedType(
                                /*unsigned*/ Tag,
                                unwrap(/*LLVMDIType*/ FromTy)));
}

/// createPointerType - Create debugging information entry for a pointer.
/// @param PointeeTy   Type pointed by this pointer.
/// @param SizeInBits  Size.
/// @param AlignInBits Alignment. (optional)
/// @param Name        Pointer type name. (optional)
LLVMDIDerivedType DIBcreatePointerType(LLVMDIBuilderRef Builder,
                                LLVMDIType PointeeTy,
                                uint64_t SizeInBits,
                                uint64_t AlignInBits,
                                LLVMStringRef Name) {
  return wrap(unwrapBuilder(Builder)-> createPointerType(
                                unwrap(/*LLVMDIType*/ PointeeTy),
                                /*uint64_t*/ SizeInBits,
                                /*uint64_t*/ AlignInBits,
                                unwrapStringRef(Name)));
}

/// \brief Create debugging information entry for a pointer to member.
/// @param PointeeTy Type pointed to by this pointer.
/// @param Class Type for which this pointer points to members of.
/// @param SizeInBits  Size.
/// @param AlignInBits Alignment. (optional)
LLVMDIDerivedType DIBcreateMemberPointerType(LLVMDIBuilderRef Builder,
                                LLVMDIType PointeeTy,
                                LLVMDIType Class,
                                uint64_t SizeInBits,
                                uint64_t AlignInBits) {
  return wrap(unwrapBuilder(Builder)-> createMemberPointerType(
                                unwrap(/*LLVMDIType*/ PointeeTy),
                                unwrap(/*LLVMDIType*/ Class),
                                /*uint64_t*/ SizeInBits,
                                /*uint64_t*/ AlignInBits));
}

/// createReferenceType - Create debugging information entry for a c++
/// style reference or rvalue reference type.
LLVMDIDerivedType DIBcreateReferenceType(LLVMDIBuilderRef Builder,
                                unsigned Tag,
                                LLVMDIType RTy) {
  return wrap(unwrapBuilder(Builder)-> createReferenceType(
                                /*unsigned*/ Tag,
                                unwrap(/*LLVMDIType*/ RTy)));
}

/// createTypedef - Create debugging information entry for a typedef.
/// @param Ty          Original type.
/// @param Name        Typedef name.
/// @param File        File where this type is defined.
/// @param LineNo      Line number.
/// @param Context     The surrounding context for the typedef.
LLVMDIDerivedType DIBcreateTypedef( LLVMDIBuilderRef Builder,
                                LLVMDIType Ty,
                                LLVMStringRef Name,
                                LLVMDIFile File,
                                unsigned LineNo,
                                LLVMDIDescriptor Context) {
  return wrap(unwrapBuilder(Builder)-> createTypedef(
                                unwrap(/*LLVMDIType*/ Ty),
                                unwrapStringRef(Name),
                                unwrap(/*LLVMDIFile*/ File),
                                /*unsigned*/ LineNo,
                                unwrap(/*LLVMDIDescriptor*/ Context)));
}

/// createFriend - Create debugging information entry for a 'friend'.
LLVMDIDerivedType DIBcreateFriend(  LLVMDIBuilderRef Builder,
                                LLVMDIType Ty,
                                LLVMDIType FriendTy) {
  return wrap(unwrapBuilder(Builder)-> createFriend(
                                unwrap(/*LLVMDIType*/ Ty),
                                unwrap(/*LLVMDIType*/ FriendTy)));
}

/// createInheritance - Create debugging information entry to establish
/// inheritance relationship between two types.
/// @param Ty           Original type.
/// @param BaseTy       Base type. Ty is inherits from base.
/// @param BaseOffset   Base offset.
/// @param Flags        Flags to describe inheritance attribute,
///                     e.g. private
LLVMDIDerivedType DIBcreateInheritance(LLVMDIBuilderRef Builder,
                                LLVMDIType Ty,
                                LLVMDIType BaseTy,
                                uint64_t BaseOffset,
                                unsigned Flags) {
  return wrap(unwrapBuilder(Builder)-> createInheritance(
                                unwrap(/*LLVMDIType*/ Ty),
                                unwrap(/*LLVMDIType*/ BaseTy),
                                /*uint64_t*/ BaseOffset,
                                /*unsigned*/ Flags));
}


/// createMemberType - Create debugging information entry for a member.
/// @param Scope        Member scope.
/// @param Name         Member name.
/// @param File         File where this member is defined.
/// @param LineNo       Line number.
/// @param SizeInBits   Member size.
/// @param AlignInBits  Member alignment.
/// @param OffsetInBits Member offset.
/// @param Flags        Flags to encode member attribute, e.g. private
/// @param Ty           Parent type.
LLVMDIDerivedType DIBcreateMemberType(LLVMDIBuilderRef Builder,
                                LLVMDIDescriptor Scope,
                                LLVMStringRef Name,
                                LLVMDIFile File,
                                unsigned LineNo,
                                uint64_t SizeInBits,
                                uint64_t AlignInBits,
                                uint64_t OffsetInBits,
                                unsigned Flags,
                                LLVMDIType Ty) {
  return wrap(unwrapBuilder(Builder)-> createMemberType(
                                unwrap(/*LLVMDIDescriptor*/ Scope),
                                unwrapStringRef(Name),
                                unwrap(/*LLVMDIFile*/ File),
                                /*unsigned*/ LineNo,
                                /*uint64_t*/ SizeInBits,
                                /*uint64_t*/ AlignInBits,
                                /*uint64_t*/ OffsetInBits,
                                /*unsigned*/ Flags,
                                unwrap(/*LLVMDIType*/ Ty)));
}


/// createStaticMemberType - Create debugging information entry for a
/// C++ static data member.
/// @param Scope      Member scope.
/// @param Name       Member name.
/// @param File       File where this member is declared.
/// @param LineNo     Line number.
/// @param Ty         Type of the static member.
/// @param Flags      Flags to encode member attribute, e.g. private.
/// @param Val        Const initializer of the member.
LLVMDIDerivedType DIBcreateStaticMemberType(LLVMDIBuilderRef Builder,
                                LLVMDIDescriptor Scope,
                                LLVMStringRef Name,
                                LLVMDIFile File,
                                unsigned LineNo,
                                LLVMDIType Ty,
                                unsigned Flags,
                                LLVMConstantRef Val) {
  return wrap(unwrapBuilder(Builder)-> createStaticMemberType(
                                unwrap(/*LLVMDIDescriptor*/ Scope),
                                unwrapStringRef(Name),
                                unwrap(/*LLVMDIFile*/ File),
                                /*unsigned*/ LineNo,
                                unwrap(/*LLVMDIType*/ Ty),
                                /*unsigned*/ Flags,
                                unwrap(/*LLVMConstantRef*/ Val)));
}

/// createObjCIVar - Create debugging information entry for Objective-C
/// instance variable.
/// @param Name         Member name.
/// @param File         File where this member is defined.
/// @param LineNo       Line number.
/// @param SizeInBits   Member size.
/// @param AlignInBits  Member alignment.
/// @param OffsetInBits Member offset.
/// @param Flags        Flags to encode member attribute, e.g. private
/// @param Ty           Parent type.
/// @param PropertyNode Property associated with this ivar.
LLVMDIDerivedType DIBcreateObjCIVar(LLVMDIBuilderRef Builder,
                                LLVMStringRef Name,
                                LLVMDIFile File,
                                unsigned LineNo,
                                uint64_t SizeInBits,
                                uint64_t AlignInBits,
                                uint64_t OffsetInBits,
                                unsigned Flags,
                                LLVMDIType Ty,
                                LLVMMDNodePtr PropertyNode) {
  return wrap(unwrapBuilder(Builder)-> createObjCIVar(
                                unwrapStringRef(Name),
                                unwrap(/*LLVMDIFile*/ File),
                                /*unsigned*/ LineNo,
                                /*uint64_t*/ SizeInBits,
                                /*uint64_t*/ AlignInBits,
                                /*uint64_t*/ OffsetInBits,
                                /*unsigned*/ Flags,
                                unwrap(/*LLVMDIType*/ Ty),
                                unwrapMDNodePtr(PropertyNode)));
}


/// createObjCProperty - Create debugging information entry for Objective-C
/// property.
/// @param Name         Property name.
/// @param File         File where this property is defined.
/// @param LineNumber   Line number.
/// @param GetterName   Name of the Objective C property getter selector.
/// @param SetterName   Name of the Objective C property setter selector.
/// @param PropertyAttributes Objective C property attributes.
/// @param Ty           Type.
LLVMDIObjCProperty DIBcreateObjCProperty(LLVMDIBuilderRef Builder,
                                LLVMStringRef Name,
                                LLVMDIFile File,
                                unsigned LineNumber,
                                LLVMStringRef GetterName,
                                LLVMStringRef SetterName,
                                unsigned PropertyAttributes,
                                LLVMDIType Ty) {
  return wrap(unwrapBuilder(Builder)-> createObjCProperty(
                                unwrapStringRef(Name),
                                unwrap(/*LLVMDIFile*/ File),
                                /*unsigned*/ LineNumber,
                                unwrapStringRef(GetterName),
                                unwrapStringRef(SetterName),
                                /*unsigned*/ PropertyAttributes,
                                unwrap(/*LLVMDIType*/ Ty)));
}


/// createClassType - Create debugging information entry for a class.
/// @param Scope        Scope in which this class is defined.
/// @param Name         class name.
/// @param File         File where this member is defined.
/// @param LineNumber   Line number.
/// @param SizeInBits   Member size.
/// @param AlignInBits  Member alignment.
/// @param OffsetInBits Member offset.
/// @param Flags        Flags to encode member attribute, e.g. private
/// @param Elements     class members.
/// @param VTableHolder Debug info of the base class that contains vtable
///                     for this type. This is used in
///                     DW_AT_containing_type. See DWARF documentation
///                     for more info.
/// @param TemplateParms Template type parameters.
/// @param UniqueIdentifier A unique identifier for the class.
LLVMDICompositeType DIBcreateClassType(LLVMDIBuilderRef Builder,
                                LLVMDIDescriptor Scope,
                                LLVMStringRef Name,
                                LLVMDIFile File,
                                unsigned LineNumber,
                                uint64_t SizeInBits,
                                uint64_t AlignInBits,
                                uint64_t OffsetInBits,
                                unsigned Flags,
                                LLVMDIType DerivedFrom,
                                LLVMDIArray Elements,
                                LLVMDIType VTableHolder,
                                LLVMMDNodePtr TemplateParms,
                                LLVMStringRef UniqueIdentifier) {
  return wrap(unwrapBuilder(Builder)-> createClassType(
                                unwrap(/*LLVMDIDescriptor*/ Scope),
                                unwrapStringRef(Name),
                                unwrap(/*LLVMDIFile*/ File),
                                /*unsigned*/ LineNumber,
                                /*uint64_t*/ SizeInBits,
                                /*uint64_t*/ AlignInBits,
                                /*uint64_t*/ OffsetInBits,
                                /*unsigned*/ Flags,
                                unwrap(/*LLVMDIType*/ DerivedFrom),
                                unwrap(/*LLVMDIArray*/ Elements),
                                unwrap(/*LLVMDIType*/ VTableHolder),
                                unwrapMDNodePtr(TemplateParms),
                                unwrapStringRef(UniqueIdentifier)));
}


/// createStructType - Create debugging information entry for a struct.
/// @param Scope        Scope in which this struct is defined.
/// @param Name         Struct name.
/// @param File         File where this member is defined.
/// @param LineNumber   Line number.
/// @param SizeInBits   Member size.
/// @param AlignInBits  Member alignment.
/// @param Flags        Flags to encode member attribute, e.g. private
/// @param Elements     Struct elements.
/// @param RunTimeLang  Optional parameter, Objective-C runtime version.
/// @param UniqueIdentifier A unique identifier for the struct.
LLVMDICompositeType DIBcreateStructType(LLVMDIBuilderRef Builder,
                                LLVMDIDescriptor Scope,
                                LLVMStringRef Name,
                                LLVMDIFile File,
                                unsigned LineNumber,
                                uint64_t SizeInBits,
                                uint64_t AlignInBits,
                                unsigned Flags,
                                LLVMDIType DerivedFrom,
                                LLVMDIArray Elements,
                                unsigned RunTimeLang,
                                LLVMDIType VTableHolder,
                                LLVMStringRef UniqueIdentifier) {
  return wrap(unwrapBuilder(Builder)-> createStructType(
                                unwrap(/*LLVMDIDescriptor*/ Scope),
                                unwrapStringRef(Name),
                                unwrap(/*LLVMDIFile*/ File),
                                /*unsigned*/ LineNumber,
                                /*uint64_t*/ SizeInBits,
                                /*uint64_t*/ AlignInBits,
                                /*unsigned*/ Flags,
                                unwrap(/*LLVMDIType*/ DerivedFrom),
                                unwrap(/*LLVMDIArray*/ Elements),
                                /*unsigned*/ RunTimeLang,
                                unwrap(/*LLVMDIType*/ VTableHolder),
                                unwrapStringRef(UniqueIdentifier)));
}


/// createUnionType - Create debugging information entry for an union.
/// @param Scope        Scope in which this union is defined.
/// @param Name         Union name.
/// @param File         File where this member is defined.
/// @param LineNumber   Line number.
/// @param SizeInBits   Member size.
/// @param AlignInBits  Member alignment.
/// @param Flags        Flags to encode member attribute, e.g. private
/// @param Elements     Union elements.
/// @param RunTimeLang  Optional parameter, Objective-C runtime version.
/// @param UniqueIdentifier A unique identifier for the union.
LLVMDICompositeType DIBcreateUnionType(LLVMDIBuilderRef Builder,
                                LLVMDIDescriptor Scope,
                                LLVMStringRef Name,
                                LLVMDIFile File,
                                unsigned LineNumber,
                                uint64_t SizeInBits,
                                uint64_t AlignInBits,
                                unsigned Flags,
                                LLVMDIArray Elements,
                                unsigned RunTimeLang,
                                LLVMStringRef UniqueIdentifier) {
  return wrap(unwrapBuilder(Builder)-> createUnionType(
                                unwrap(/*LLVMDIDescriptor*/ Scope),
                                unwrapStringRef(Name),
                                unwrap(/*LLVMDIFile*/ File),
                                /*unsigned*/ LineNumber,
                                /*uint64_t*/ SizeInBits,
                                /*uint64_t*/ AlignInBits,
                                /*unsigned*/ Flags,
                                unwrap(/*LLVMDIArray*/ Elements),
                                /*unsigned*/ RunTimeLang,
                                unwrapStringRef(UniqueIdentifier)));
}


/// createTemplateTypeParameter - Create debugging information for template
/// type parameter.
/// @param Scope        Scope in which this type is defined.
/// @param Name         Type parameter name.
/// @param Ty           Parameter type.
/// @param File         File where this type parameter is defined.
/// @param LineNo       Line number.
/// @param ColumnNo     Column Number.
LLVMDITemplateTypeParameter DIBcreateTemplateTypeParameter(LLVMDIBuilderRef Builder,
                                LLVMDIDescriptor Scope,
                                LLVMStringRef Name,
                                LLVMDIType Ty,
                                LLVMMDNodePtr File,
                                unsigned LineNo,
                                unsigned ColumnNo) {
  return wrap(unwrapBuilder(Builder)-> createTemplateTypeParameter(
                                unwrap(/*LLVMDIDescriptor*/ Scope),
                                unwrapStringRef(Name),
                                unwrap(/*LLVMDIType*/ Ty),
                                unwrapMDNodePtr(File),
                                /*unsigned*/ LineNo,
                                /*unsigned*/ ColumnNo));
}


/// createTemplateValueParameter - Create debugging information for template
/// value parameter.
/// @param Scope        Scope in which this type is defined.
/// @param Name         Value parameter name.
/// @param Ty           Parameter type.
/// @param Val          Constant parameter value.
/// @param File         File where this type parameter is defined.
/// @param LineNo       Line number.
/// @param ColumnNo     Column Number.
LLVMDITemplateValueParameter DIBcreateTemplateValueParameter(LLVMDIBuilderRef Builder,
                                LLVMDIDescriptor Scope,
                                LLVMStringRef Name,
                                LLVMDIType Ty,
                                LLVMConstantRef Val,
                                LLVMMDNodePtr File,
                                unsigned LineNo,
                                unsigned ColumnNo) {
  return wrap(unwrapBuilder(Builder)-> createTemplateValueParameter(
                                unwrap(/*LLVMDIDescriptor*/ Scope),
                                unwrapStringRef(Name),
                                unwrap(/*LLVMDIType*/ Ty),
                                unwrap(/*LLVMConstantRef*/ Val),
                                unwrapMDNodePtr(File),
                                /*unsigned*/ LineNo,
                                /*unsigned*/ ColumnNo));
}

/// \brief Create debugging information for a template template parameter.
/// @param Scope        Scope in which this type is defined.
/// @param Name         Value parameter name.
/// @param Ty           Parameter type.
/// @param Val          The fully qualified name of the template.
/// @param File         File where this type parameter is defined.
/// @param LineNo       Line number.
/// @param ColumnNo     Column Number.
LLVMDITemplateValueParameter DIBcreateTemplateTemplateParameter(LLVMDIBuilderRef Builder,
                                LLVMDIDescriptor Scope,
                                LLVMStringRef Name,
                                LLVMDIType Ty,
                                LLVMStringRef Val,
                                LLVMMDNodePtr File,
                                unsigned LineNo,
                                unsigned ColumnNo) {
  return wrap(unwrapBuilder(Builder)-> createTemplateTemplateParameter(
                                unwrap(/*LLVMDIDescriptor*/ Scope),
                                unwrapStringRef(Name),
                                unwrap(/*LLVMDIType*/ Ty),
                                unwrapStringRef(Val),
                                unwrapMDNodePtr(File),
                                /*unsigned*/ LineNo,
                                /*unsigned*/ ColumnNo));
}


/// \brief Create debugging information for a template parameter pack.
/// @param Scope        Scope in which this type is defined.
/// @param Name         Value parameter name.
/// @param Ty           Parameter type.
/// @param Val          An array of types in the pack.
/// @param File         File where this type parameter is defined.
/// @param LineNo       Line number.
/// @param ColumnNo     Column Number.
LLVMDITemplateValueParameter DIBcreateTemplateParameterPack(LLVMDIBuilderRef Builder,
                                LLVMDIDescriptor Scope,
                                LLVMStringRef Name,
                                LLVMDIType Ty,
                                LLVMDIArray Val,
                                LLVMMDNodePtr File,
                                unsigned LineNo,
                                unsigned ColumnNo) {
  return wrap(unwrapBuilder(Builder)-> createTemplateParameterPack(
                                unwrap(/*LLVMDIDescriptor*/ Scope),
                                unwrapStringRef(Name),
                                unwrap(/*LLVMDIType*/ Ty),
                                unwrap(/*LLVMDIArray*/ Val),
                                unwrapMDNodePtr(File),
                                /*unsigned*/ LineNo,
                                /*unsigned*/ ColumnNo));
}


/// createArrayType - Create debugging information entry for an array.
/// @param Size         Array size.
/// @param AlignInBits  Alignment.
/// @param Ty           Element type.
/// @param Subscripts   Subscripts.
LLVMDICompositeType DIBcreateArrayType(LLVMDIBuilderRef Builder,
                                uint64_t Size,
                                uint64_t AlignInBits,
                                LLVMDIType Ty,
                                LLVMDIArray Subscripts) {
  return wrap(unwrapBuilder(Builder)-> createArrayType(
                                /*uint64_t*/ Size,
                                /*uint64_t*/ AlignInBits,
                                unwrap(/*LLVMDIType*/ Ty),
                                unwrap(/*LLVMDIArray*/ Subscripts)));
}


/// createVectorType - Create debugging information entry for a vector type.
/// @param Size         Array size.
/// @param AlignInBits  Alignment.
/// @param Ty           Element type.
/// @param Subscripts   Subscripts.
LLVMDICompositeType DIBcreateVectorType(LLVMDIBuilderRef Builder,
                                uint64_t Size,
                                uint64_t AlignInBits,
                                LLVMDIType Ty,
                                LLVMDIArray Subscripts) {
  return wrap(unwrapBuilder(Builder)-> createVectorType(
                                /*uint64_t*/ Size,
                                /*uint64_t*/ AlignInBits,
                                unwrap(/*LLVMDIType*/ Ty),
                                unwrap(/*LLVMDIArray*/ Subscripts)));
}


/// createEnumerationType - Create debugging information entry for an
/// enumeration.
/// @param Scope          Scope in which this enumeration is defined.
/// @param Name           Union name.
/// @param File           File where this member is defined.
/// @param LineNumber     Line number.
/// @param SizeInBits     Member size.
/// @param AlignInBits    Member alignment.
/// @param Elements       Enumeration elements.
/// @param UnderlyingType Underlying type of a C++11/ObjC fixed enum.
/// @param UniqueIdentifier A unique identifier for the enum.
LLVMDICompositeType DIBcreateEnumerationType(LLVMDIBuilderRef Builder,
                                LLVMDIDescriptor Scope,
                                LLVMStringRef Name,
                                LLVMDIFile File,
                                unsigned LineNumber,
                                uint64_t SizeInBits,
                                uint64_t AlignInBits,
                                LLVMDIArray Elements,
                                LLVMDIType UnderlyingType,
                                LLVMStringRef UniqueIdentifier) {
  return wrap(unwrapBuilder(Builder)-> createEnumerationType(
                                unwrap(/*LLVMDIDescriptor*/ Scope),
                                unwrapStringRef(Name),
                                unwrap(/*LLVMDIFile*/ File),
                                /*unsigned*/ LineNumber,
                                /*uint64_t*/ SizeInBits,
                                /*uint64_t*/ AlignInBits,
                                unwrap(/*LLVMDIArray*/ Elements),
                                unwrap(/*LLVMDIType*/ UnderlyingType),
                                unwrapStringRef(UniqueIdentifier)));
}


/// createSubroutineType - Create subroutine type.
/// @param File           File in which this subroutine is defined.
/// @param ParameterTypes An array of subroutine parameter types. This
///                       includes return type at 0th index.
/// @param Flags           E.g.: LValueReference.
///                        These flags are used to emit dwarf attributes.
LLVMDICompositeType DIBcreateSubroutineType(LLVMDIBuilderRef Builder,
                                LLVMDIFile File,
                                LLVMDITypeArray ParameterTypes,
                                unsigned Flags) {
  return wrap(unwrapBuilder(Builder)-> createSubroutineType(
                                unwrap(/*LLVMDIFile*/ File),
                                unwrap(/*LLVMDITypeArray*/ ParameterTypes),
                                /*unsigned*/ Flags ));
}


/// createArtificialType - Create a new LLVMDIType with "artificial" flag set.
LLVMDIType DIBcreateArtificialType( LLVMDIBuilderRef Builder,
                                LLVMDIType Ty) {
  return wrap(unwrapBuilder(Builder)-> createArtificialType( unwrap(/*LLVMDIType*/ Ty)));
}


/// createObjectPointerType - Create a new LLVMDIType with the "object pointer"
/// flag set.
LLVMDIType DIBcreateObjectPointerType(LLVMDIBuilderRef Builder,
                                LLVMDIType Ty) {
  return wrap(unwrapBuilder(Builder)-> createObjectPointerType( unwrap(/*LLVMDIType*/ Ty)));
}


/// Create a permanent forward-declared type.
LLVMDICompositeType DIBcreateForwardDecl(LLVMDIBuilderRef Builder,
                                unsigned Tag,
                                LLVMStringRef Name,
                                LLVMDIDescriptor Scope,
                                LLVMDIFile F,
                                unsigned Line,
                                unsigned RuntimeLang,
                                uint64_t SizeInBits,
                                uint64_t AlignInBits,
                                LLVMStringRef UniqueIdentifier) {
  return wrap(unwrapBuilder(Builder)-> createForwardDecl(
                                /*unsigned*/ Tag,
                                unwrapStringRef(Name),
                                unwrap(/*LLVMDIDescriptor*/ Scope),
                                unwrap(/*LLVMDIFile*/ F),
                                /*unsigned*/ Line,
                                /*unsigned*/ RuntimeLang,
                                /*uint64_t*/ SizeInBits,
                                /*uint64_t*/ AlignInBits,
                                unwrapStringRef(UniqueIdentifier)));
}

/// createForwardDecl - Create a temporary forward-declared type.
LLVMDICompositeType DIBcreateReplaceableForwardDecl(LLVMDIBuilderRef Builder,
                                unsigned Tag,
                                LLVMStringRef Name,
                                LLVMDIDescriptor Scope,
                                LLVMDIFile F,
                                unsigned Line,
                                unsigned RuntimeLang,
                                uint64_t SizeInBits,
                                uint64_t AlignInBits,
                                LLVMStringRef UniqueIdentifier) {
  return wrap(unwrapBuilder(Builder)-> createReplaceableForwardDecl(
                                /*unsigned*/ Tag,
                                unwrapStringRef(Name),
                                unwrap(/*LLVMDIDescriptor*/ Scope),
                                unwrap(/*LLVMDIFile*/ F),
                                /*unsigned*/ Line,
                                /*unsigned*/ RuntimeLang,
                                /*uint64_t*/ SizeInBits,
                                /*uint64_t*/ AlignInBits,
                                unwrapStringRef(UniqueIdentifier)));
}

/// retainType - Retain DIType in a module even if it is not referenced
/// through debug info anchors.
void DIBretainType(LLVMDIBuilderRef Builder, LLVMDIType T) {
  return unwrapBuilder(Builder)-> retainType( unwrap(/*LLVMDIType*/ T));
}


/// createUnspecifiedParameter - Create unspecified type descriptor
/// for a subroutine type.
LLVMDIBasicType DIBcreateUnspecifiedParameter(LLVMDIBuilderRef Builder) {
  return wrap(unwrapBuilder(Builder)-> createUnspecifiedParameter());
}


/// getOrCreateArray - Get a DIArray, create one if required.
LLVMDIArray DIBgetOrCreateArray(LLVMDIBuilderRef Builder, 
                                LLVMArrayRefOfMetadataPtr *Elements) {
  return wrap(unwrapBuilder(Builder)-> getOrCreateArray
                (unwrapAOfM(/*LLVMArrayRefOfMetadataPtr*/ *Elements)));
}


/// getOrCreateSubrange - Create a descriptor for a value range.  This
/// implicitly uniques the values returned.
LLVMDISubrange DIBgetOrCreateSubrange(LLVMDIBuilderRef Builder,
                                int64_t Lo,
                                int64_t Count) {
  return wrap(unwrapBuilder(Builder)-> getOrCreateSubrange(
                                /*int64_t*/ Lo,
                                /*int64_t*/ Count));
}


/// \brief Create a new descriptor for the specified global.
/// @param Name        Name of the variable.
/// @param LinkageName Mangled variable name.
/// @param File        File where this variable is defined.
/// @param LineNo      Line number.
/// @param Ty          Variable Type.
/// @param isLocalToUnit Boolean flag indicate whether this variable is
///                      externally visible or not.
/// @param Val         llvm::Value of the variable.
LLVMDIGlobalVariable 
DIBcreateGlobalVariable
    (LLVMDIBuilderRef Builder,
     LLVMDIDescriptor Context,
     LLVMStringRef Name,
     LLVMStringRef LinkageName,
     LLVMDIFile File,
     unsigned LineNo,
     LLVMDITypeRef Ty,
     LLVMBool isLocalToUnit,
     LLVMConstantRef Val,
     LLVMMDNodePtr Decl) {
  return wrap(unwrapBuilder(Builder)-> createGlobalVariable(
                                unwrap(/*LLVMDIDescriptor*/ Context),
                                unwrapStringRef(Name),
                                unwrapStringRef(LinkageName),
                                unwrap(/*LLVMDIFile*/ File),
                                /*unsigned*/ LineNo,
                                unwrapDITypeRef(/*LLVMDITypeRef*/ Ty),
                                /*LLVMBool*/ isLocalToUnit,
                                unwrap(/*LLVMConstantRef*/ Val),
                                unwrapMDNodePtr(Decl)));
}

/// createTempGlobalVariableFwdDecl - Identical to createGlobalVariable
/// except that the resulting DbgNode is temporary and meant to be RAUWed.
LLVMDIGlobalVariable 
DIBcreateTempGlobalVariableFwdDecl
    (LLVMDIBuilderRef Builder,
     LLVMDIDescriptor Context,
     LLVMStringRef Name,
     LLVMStringRef LinkageName,
     LLVMDIFile File,
     unsigned LineNo,
     LLVMDITypeRef Ty,
     LLVMBool isLocalToUnit,
     LLVMConstantRef Val,
     LLVMMDNodePtr Decl) {
  return wrap(unwrapBuilder(Builder)-> createGlobalVariable(
                                unwrap(/*LLVMDIDescriptor*/ Context),
                                unwrapStringRef(Name),
                                unwrapStringRef(LinkageName),
                                unwrap(/*LLVMDIFile*/ File),
                                /*unsigned*/ LineNo,
                                unwrapDITypeRef(/*LLVMDITypeRef*/ Ty),
                                /*LLVMBool*/ isLocalToUnit,
                                unwrap(/*LLVMConstantRef*/ Val),
                                unwrapMDNodePtr(Decl)));
}

/// createLocalVariable - Create a new descriptor for the specified
/// local variable.
/// @param Tag         Dwarf TAG. Usually DW_TAG_auto_variable or
///                    DW_TAG_arg_variable.
/// @param Scope       Variable scope.
/// @param Name        Variable name.
/// @param File        File where this variable is defined.
/// @param LineNo      Line number.
/// @param Ty          Variable Type
/// @param AlwaysPreserve Boolean. Set to true if debug info for this
///                       variable should be preserved in optimized build.
/// @param Flags       Flags, e.g. artificial variable.
/// @param ArgNo       If this variable is an argument then this argument's
///                    number. 1 indicates 1st argument.
LLVMDIVariable DIBcreateLocalVariable(LLVMDIBuilderRef Builder,
                                unsigned Tag,
                                LLVMDIDescriptor Scope,
                                LLVMStringRef Name,
                                LLVMDIFile File,
                                unsigned LineNo,
                                LLVMDITypeRef Ty,
                                LLVMBool AlwaysPreserve,
                                unsigned Flags,
                                unsigned ArgNo) {
  return wrap(unwrapBuilder(Builder)-> createLocalVariable(
                                /*unsigned*/ Tag,
                                unwrap(/*LLVMDIDescriptor*/ Scope),
                                unwrapStringRef(Name),
                                unwrap(/*LLVMDIFile*/ File),
                                /*unsigned*/ LineNo,
                                unwrapDITypeRef(/*LLVMDITypeRef*/ Ty),
                                /*LLVMBool*/ AlwaysPreserve,
                                /*unsigned*/ Flags,
                                /*unsigned*/ ArgNo));
}


/// createExpression - Create a new descriptor for the specified
/// variable which has a complex address expression for its address.
/// @param Addr        An array of complex address operations.
LLVMDIExpression DIBcreateExpression(LLVMDIBuilderRef Builder,
                                LLVMArrayRefOfint64_t *Addr) {
  return wrap(unwrapBuilder(Builder)
         -> createExpression
              (unwrapAOfI64(/*LLVMArrayRefOfint64_t*/ *Addr)));
}

/// createPieceExpression - Create a descriptor to describe one part
/// of aggregate variable that is fragmented across multiple Values.
///
/// @param OffsetInBytes Offset of the piece in bytes.
/// @param SizeInBytes   Size of the piece in bytes.
LLVMDIExpression DIBcreatePieceExpression(LLVMDIBuilderRef Builder,
                                          unsigned OffsetInBytes,
                                          unsigned SizeInBytes) {
  return wrap(unwrapBuilder(Builder)
              -> createPieceExpression(OffsetInBytes, SizeInBytes));
}

/// createFunction - Create a new descriptor for the specified subprogram.
/// See comments in DISubprogram for descriptions of these fields.
/// @param Scope         Function scope.
/// @param Name          Function name.
/// @param LinkageName   Mangled function name.
/// @param File          File where this variable is defined.
/// @param LineNo        Line number.
/// @param Ty            Function type.
/// @param isLocalToUnit True if this function is not externally visible.
/// @param isDefinition  True if this is a function definition.
/// @param ScopeLine     Set to the beginning of the scope this starts
/// @param Flags         e.g. is this function prototyped or not.
///                      These flags are used to emit dwarf attributes.
/// @param isOptimized   True if optimization is ON.
/// @param Fn            llvm::Function pointer.
/// @param TParam        Function template parameters.
LLVMDISubprogram DIBcreateFunction( LLVMDIBuilderRef Builder,
/* ^'Tho overloaded, not renamed, because its overload 
   (DIBcreateFunctionFromScope is to be removed. */
                                LLVMDIDescriptor Scope,
                                LLVMStringRef Name,
                                LLVMStringRef LinkageName,
                                LLVMDIFile File,
                                unsigned LineNo,
                                LLVMDICompositeType Ty,
                                LLVMBool isLocalToUnit,
                                LLVMBool isDefinition,
                                unsigned ScopeLine,
                                unsigned Flags,
                                LLVMBool isOptimized,
                                LLVMValueRef Fn,
                                LLVMMDNodePtr TParam,
                                LLVMMDNodePtr Decl) {
  return wrap(unwrapBuilder(Builder)-> createFunction(
                                unwrap(/*LLVMDIDescriptor*/ Scope),
                                unwrapStringRef(Name),
                                unwrapStringRef(LinkageName),
                                unwrap(/*LLVMDIFile*/ File),
                                /*unsigned*/ LineNo,
                                unwrap(/*LLVMDICompositeType*/ Ty),
                                /*LLVMBool*/ isLocalToUnit,
                                /*LLVMBool*/ isDefinition,
                                /*unsigned*/ ScopeLine,
                                /*unsigned*/ Flags,
                                /*LLVMBool*/ isOptimized, 
                                llvm::unwrap<llvm::Function>(Fn),
                                unwrapMDNodePtr(TParam),
                                unwrapMDNodePtr(Decl)));
}


/// createTempFunctionFwdDecl - Identical to createFunction,
/// except that the resulting DbgNode is meant to be RAUWed.
LLVMDISubprogram DIBcreateTempFunctionFunctionFwdDecl( LLVMDIBuilderRef Builder,
                                LLVMDIDescriptor Scope,
                                LLVMStringRef Name,
                                LLVMStringRef LinkageName,
                                LLVMDIFile File,
                                unsigned LineNo,
                                LLVMDICompositeType Ty,
                                LLVMBool isLocalToUnit,
                                LLVMBool isDefinition,
                                unsigned ScopeLine,
                                unsigned Flags,
                                LLVMBool isOptimized,
                                LLVMValueRef Fn,
                                LLVMMDNodePtr TParam,
                                LLVMMDNodePtr Decl) {
  return wrap(unwrapBuilder(Builder)-> createTempFunctionFwdDecl(
                                unwrap(/*LLVMDIDescriptor*/ Scope),
                                unwrapStringRef(Name),
                                unwrapStringRef(LinkageName),
                                unwrap(/*LLVMDIFile*/ File),
                                /*unsigned*/ LineNo,
                                unwrap(/*LLVMDICompositeType*/ Ty),
                                /*LLVMBool*/ isLocalToUnit,
                                /*LLVMBool*/ isDefinition,
                                /*unsigned*/ ScopeLine,
                                /*unsigned*/ Flags,
                                /*LLVMBool*/ isOptimized, 
                                llvm::unwrap<llvm::Function>(Fn),
                                unwrapMDNodePtr(TParam),
                                unwrapMDNodePtr(Decl)));
}


/// FIXME: this is added for dragonegg. Once we update dragonegg
/// to call resolve function, this will be removed.
LLVMDISubprogram DIBcreateFunctionFromScope(LLVMDIBuilderRef Builder,
             /* ^Renamed to eliminate overload. */
                            LLVMDIScope Scope,
                            LLVMStringRef Name,
                            LLVMStringRef LinkageName,
                            LLVMDIFile File, 
                            unsigned LineNo,
                            LLVMDICompositeType Ty, 
                            LLVMBool isLocalToUnit,
                            LLVMBool isDefinition,
                            unsigned ScopeLine,
                            unsigned Flags,
                            LLVMBool isOptimized,
                            LLVMValueRef Fn,
                            LLVMMDNodePtr TParam,
                            LLVMMDNodePtr Decl) {
  return wrap(unwrapBuilder(Builder)-> createFunction(
                            unwrap(/*LLVMDIScope*/ Scope),
                            unwrapStringRef(Name),
                            unwrapStringRef(LinkageName),
                            unwrap(/*LLVMDIFile*/ File), 
                            /*unsigned*/ LineNo,
                            unwrap(/*LLVMDICompositeType*/ Ty), 
                            /*LLVMBool*/ isLocalToUnit,
                            /*LLVMBool*/ isDefinition,
                            /*unsigned*/ ScopeLine,
                            /*unsigned*/ Flags,
                            /*LLVMBool*/ isOptimized,
                            llvm::unwrap<llvm::Function>(Fn),
                            unwrapMDNodePtr(TParam),
                            unwrapMDNodePtr(Decl)));
}


/// createMethod - Create a new descriptor for the specified C++ method.
/// See comments in LLVMDISubprogram for descriptions of these fields.
/// @param Scope         Function scope.
/// @param Name          Function name.
/// @param LinkageName   Mangled function name.
/// @param File          File where this variable is defined.
/// @param LineNo        Line number.
/// @param Ty            Function type.
/// @param isLocalToUnit True if this function is not externally visible..
/// @param isDefinition  True if this is a function definition.
/// @param Virtuality    Attributes describing virtualness. e.g. pure
///                      virtual function.
/// @param VTableIndex   Index no of this method in virtual table.
/// @param VTableHolder  Type that holds vtable.
/// @param Flags         e.g. is this function prototyped or not.
///                      This flags are used to emit dwarf attributes.
/// @param isOptimized   True if optimization is ON.
/// @param Fn            llvm::Function pointer.
/// @param TParam        Function template parameters.
LLVMDISubprogram DIBcreateMethod(   LLVMDIBuilderRef Builder, 
                                LLVMDIDescriptor Scope,
                                LLVMStringRef Name,
                                LLVMStringRef LinkageName,
                                LLVMDIFile File,
                                unsigned LineNo,
                                LLVMDICompositeType Ty,
                                LLVMBool isLocalToUnit,
                                LLVMBool isDefinition,
                                unsigned Virtuality,
                                unsigned VTableIndex,
                                LLVMDIType VTableHolder,
                                unsigned Flags,
                                LLVMBool isOptimized,
                                LLVMValueRef Fn,
                                LLVMMDNodePtr TParam) {
  return wrap(unwrapBuilder(Builder)-> createMethod(
                                unwrap(/*LLVMDIDescriptor*/ Scope),
                                unwrapStringRef(Name),
                                unwrapStringRef(LinkageName),
                                unwrap(/*LLVMDIFile*/ File),
                                /*unsigned*/ LineNo,
                                unwrap(/*LLVMDICompositeType*/ Ty),
                                /*LLVMBool*/ isLocalToUnit,
                                /*LLVMBool*/ isDefinition,
                                /*unsigned*/ Virtuality,
                                /*unsigned*/ VTableIndex,
                                unwrap(/*LLVMDIType*/ VTableHolder),
                                /*unsigned*/ Flags,
                                /*LLVMBool*/ isOptimized,
                                llvm::unwrap<llvm::Function>(Fn),
                                unwrapMDNodePtr(TParam)));
}


/// createNameSpace - This creates new descriptor for a namespace
/// with the specified parent scope.
/// @param Scope       Namespace scope
/// @param Name        Name of this namespace
/// @param File        Source file
/// @param LineNo      Line number
LLVMDINameSpace DIBcreateNameSpace( LLVMDIBuilderRef Builder,
                                LLVMDIDescriptor Scope,
                                LLVMStringRef Name,
                                LLVMDIFile File,
                                unsigned LineNo) {
  return wrap(unwrapBuilder(Builder)-> createNameSpace(
                                unwrap(/*LLVMDIDescriptor*/ Scope),
                                unwrapStringRef(Name),
                                unwrap(/*LLVMDIFile*/ File),
                                /*unsigned*/ LineNo));
}



/// createLexicalBlockFile - This creates a descriptor for a lexical
/// block with a new file attached. This merely extends the existing
/// lexical block as it crosses a file.
/// @param Scope         Lexical block.
/// @param File          Source file.
/// @param Discriminator DWARF path discriminator value.
LLVMDILexicalBlockFile DIBcreateLexicalBlockFile(LLVMDIBuilderRef Builder,
                                LLVMDIDescriptor Scope,
                                LLVMDIFile File,
                                unsigned Discriminator) {
  return wrap(unwrapBuilder(Builder)-> createLexicalBlockFile(
                                unwrap(/*LLVMDIDescriptor*/ Scope),
                                unwrap(/*LLVMDIFile*/ File),
                                Discriminator));
}


/// createLexicalBlock - This creates a descriptor for a lexical block
/// with the specified parent context.
/// @param Scope         Parent lexical scope.
/// @param File          Source file
/// @param Line          Line number
/// @param Col           Column number
LLVMDILexicalBlock DIBcreateLexicalBlock(LLVMDIBuilderRef Builder,
                                LLVMDIDescriptor Scope,
                                LLVMDIFile File,
                                unsigned Line,
                                unsigned Col) {
  return wrap(unwrapBuilder(Builder)-> createLexicalBlock(
                                unwrap(/*LLVMDIDescriptor*/ Scope),
                                unwrap(/*LLVMDIFile*/ File),
                                /*unsigned*/ Line,
                                /*unsigned*/ Col));
}


/// \brief Create a descriptor for an imported module.
/// @param Context The scope this module is imported into
/// @param NS The namespace being imported here
/// @param Line Line number
LLVMDIImportedEntity DIBcreateImportedModuleFromNamespace(LLVMDIBuilderRef Builder,
                 /* ^Renamed to eliminate overload. */
                                LLVMDIScope Context,
                                LLVMDINameSpace NS,
                                unsigned Line) {
  return wrap(unwrapBuilder(Builder)-> createImportedModule(
                                unwrap(/*LLVMDIScope*/ Context),
                                unwrap(/*LLVMDINameSpace*/ NS),
                                /*unsigned*/ Line));
}


/// \brief Create a descriptor for an imported module.
/// @param Context The scope this module is imported into
/// @param NS An aliased namespace
/// @param Line Line number
LLVMDIImportedEntity DIBcreateImportedModuleFromImportedEntity(LLVMDIBuilderRef Builder,
                 /* ^Renamed to eliminate overload. */
                                LLVMDIScope Context,
                                LLVMDIImportedEntity NS,
                                unsigned Line) {
  return wrap(unwrapBuilder(Builder)-> createImportedModule(
                                unwrap(/*LLVMDIScope*/ Context),
                                unwrap(/*LLVMDIImportedEntity*/ NS),
                                /*unsigned*/ Line));
}


/// \brief Create a descriptor for an imported function.
/// @param Context The scope this module is imported into
/// @param Decl The declaration (or definition) of a function, type, or
///             variable
/// @param Line Line number
/// @param Name Decl name 
LLVMDIImportedEntity 
DIBcreateImportedDeclarationFromDecl(LLVMDIBuilderRef Builder,
                                LLVMDIScope Context,
                                LLVMDIDescriptor Decl,
                                unsigned Line,
                                LLVMStringRef Name) {
  return wrap(unwrapBuilder(Builder)-> createImportedDeclaration(
                                unwrap(/*LLVMDIScope*/ Context),
                                unwrap(/*LLVMDIDescriptor*/ Decl),
                                /*unsigned*/ Line,
                                unwrapStringRef(Name)));
}

/// \brief Create a descriptor for an imported function.
/// @param Context The scope this module is imported into
/// @param Decl The declaration (or definition) of a function, type, or
///             variable
/// @param Line Line number
/// @param Name Decl name 
LLVMDIImportedEntity 
DIBcreateImportedDeclarationFromImportedEntity(LLVMDIBuilderRef Builder,
                                LLVMDIScope Context,
                                LLVMDIImportedEntity NS,
                                unsigned Line,
                                LLVMStringRef Name) {
  return wrap(unwrapBuilder(Builder)-> createImportedDeclaration(
                                unwrap(/*LLVMDIScope*/ Context),
                                unwrap(/*LLVMDIImportedEntity*/ NS),
                                /*unsigned*/ Line,
                                unwrapStringRef(Name)));
}

/// insertDeclare - Insert a new llvm.dbg.declare intrinsic call.
/// @param Storage     llvm::Value of the variable
/// @param VarInfo     Variable's debug info descriptor.
/// @param Expr         A complex location expression.
/// @param InsertAtEnd Location for the new intrinsic.
 LLVMValueRef /*Instruction*/ DIBinsertDeclareAtEnd(LLVMDIBuilderRef Builder,
            /* ^Renamed to eliminate overload. */
                                LLVMValueRef Storage,
                                LLVMDIVariable VarInfo,
                                LLVMDIExpression Expr, 
                                LLVMBasicBlockRef InsertAtEnd) {
    return wrap(unwrapBuilder(Builder)-> insertDeclare(
                                llvm::unwrap(/*LLVMValueRef*/ Storage),
                                unwrap(/*LLVMDIVariable*/ VarInfo),
                                unwrap(/*LLVMDIExpression*/ Expr),
                                llvm::unwrap(/*LLVMBasicBlockRef*/ InsertAtEnd)));
}


/// insertDeclare - Insert a new llvm.dbg.declare intrinsic call.
/// @param Storage      llvm::Value of the variable
/// @param VarInfo      Variable's debug info descriptor.
/// @param Expr         A complex location expression.
/// @param InsertBefore Location for the new intrinsic.
LLVMValueRef /*Instruction*/ DIBinsertDeclareBefore(LLVMDIBuilderRef Builder,
            /* ^Renamed to eliminate overload. */
                                LLVMValueRef Storage,
                                LLVMDIVariable VarInfo,
                                LLVMDIExpression Expr, 
                                LLVMValueRef InsertBefore) {
    return wrap(unwrapBuilder(Builder)-> insertDeclare(
                                llvm::unwrap(/*LLVMValueRef*/ Storage),
                                unwrap(/*LLVMDIVariable*/ VarInfo),
                                unwrap(/*LLVMDIExpression*/ Expr),
                                llvm::unwrap<llvm::Instruction>(InsertBefore)));
}



/// insertDbgValueIntrinsic - Insert a new llvm.dbg.value intrinsic call.
/// @param Val          llvm::Value of the variable
/// @param Offset       Offset
/// @param VarInfo      Variable's debug info descriptor.
/// @param Expr         A complex location expression.
/// @param InsertAtEnd Location for the new intrinsic.
LLVMValueRef /*Instruction*/ DIBinsertDbgValueIntrinsicAtEnd(LLVMDIBuilderRef Builder,
            /* ^Renamed to eliminate overload. */
                                LLVMValueRef Val,
                                uint64_t Offset,
                                LLVMDIVariable VarInfo,
                                LLVMDIExpression Expr, 
                                LLVMBasicBlockRef InsertAtEnd) {
    return wrap(unwrapBuilder(Builder)-> insertDbgValueIntrinsic(
                                llvm::unwrap(/*LLVMValueRef*/ Val),
                                /*uint64_t*/ Offset,
                                unwrap(/*LLVMDIVariable*/ VarInfo),
                                unwrap(/*LLVMDIExpression*/ Expr),
                                llvm::unwrap(/*LLVMBasicBlockRef*/ InsertAtEnd)));
}


/// insertDbgValueIntrinsic - Insert a new llvm.dbg.value intrinsic call.
/// @param Val          llvm::Value of the variable
/// @param Offset       Offset
/// @param VarInfo      Variable's debug info descriptor.
/// @param Expr         A complex location expression.
/// @param InsertBefore Location for the new intrinsic.
LLVMValueRef /*Instruction*/ DIBinsertDbgValueIntrinsicBefore(LLVMDIBuilderRef Builder,
            /* ^Renamed to eliminate overload. */
                                LLVMValueRef Val,
                                uint64_t Offset,
                                LLVMDIVariable VarInfo,
                                LLVMDIExpression Expr, 
                                LLVMValueRef InsertBefore) {
    return wrap(unwrapBuilder(Builder)-> insertDbgValueIntrinsic(
                                llvm::unwrap(/*LLVMValueRef*/ Val),
                                /*uint64_t*/ Offset,
                                unwrap(/*LLVMDIVariable*/ VarInfo),
                                unwrap(/*LLVMDIExpression*/ Expr),
                                llvm::unwrap<llvm::Instruction>(InsertBefore)));
}

/// \brief Replace the vtable holder in the given composite type.
///
/// If this creates a self reference, it may orphan some unresolved cycles
/// in the operands of \c T, so \a DIBuilder needs to track that.
void DIBreplaceVTableHolder(LLVMDIBuilderRef Builder,
                         LLVMDICompositeType *T, 
                         LLVMDICompositeType VTableHolder) {
  // Replace pass-by-reference of T by copy-in-copy-out. 
  // Hope this works.  It is doubtful that *T will be aliased. 
  llvm::DICompositeType LT = unwrap(/*LLVMDICompositeType*/ *T);
  unwrapBuilder(Builder)->replaceVTableHolder(
                               LT,
                               unwrap(/*LLVMDICompositeType*/ VTableHolder));
  *T = wrap(LT);  
}

/// \brief Replace arrays on a composite type.
///
/// If \c T is resolved, but the arrays aren't -- which can happen if \c T
/// has a self-reference -- \a DIBuilder needs to track the array to
/// resolve cycles.
void DIBreplaceArrays(LLVMDIBuilderRef Builder,
                   LLVMDICompositeType *T, 
                   LLVMDIArray Elements,
                   LLVMDIArray TParems) {
  // Replace pass-by-reference of T by copy-in-copy-out. 
  // Hope this works.  It is doubtful that *T will be aliased. 
  llvm::DICompositeType LT= unwrap(/*LLVMDICompositeType*/ *T);
  unwrapBuilder(Builder)->replaceArrays(
                               LT,
                               unwrap(/*LLVMDIARRAY*/ Elements), 
                               unwrap(/*LLVMDIARRAY*/ TParems)); 
  *T = wrap(LT);  
} 

// This apparently was in bindings/go/llvm/DIBuilderBindings.h of an earlier
// llvm than 3.6.1  It is in DIBuilder because that is where the stuff needed
// by its implementation is found.  
//changed scope was *
LLVMValueRef DIBgetDebugLoc(unsigned Line, 
                            unsigned Col, 
                            LLVMDIDescriptor Scope) {
//  MDNode *S = unwrapDI<DIDescriptor>(*Scope);
//  DebugLoc loc = DebugLoc::get(Line,Col,S);

  llvm::DIDescriptor S = unwrap(/*LLVMDIDescriptor*/ Scope);
  llvm::DebugLoc loc = llvm::DebugLoc::get(Line,Col,S);
  llvm::LLVMContext &ctx = S->getContext();
  llvm::MDNode *L = loc.getAsMDNode(ctx);
  llvm::Value *V = llvm::MetadataAsValue::get(ctx,L);
  return wrap(V);
}

/// From DebugInfo.h: 
/// Replace all uses of debug info referenced by this descriptor.
void replaceAllUsesWith(LLVMDICompositeType Temp, LLVMDIDescriptor Final) {
  llvm::MDNode * FinalDbgPtr = reinterpret_cast<llvm::MDNode *>(Final); 
  llvm::MDNodeFwdDecl * TempDbgPtr 
    = reinterpret_cast<llvm::MDNodeFwdDecl *>(Temp); 
  // TODO: Get a runtime check on the type of Temp. 
  TempDbgPtr->replaceAllUsesWith(FinalDbgPtr);  
} 

//End M3DIBuilder.cpp 


