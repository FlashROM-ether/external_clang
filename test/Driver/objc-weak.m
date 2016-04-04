// Check miscellaneous Objective-C options.

// RUN: %clang -target x86_64-apple-macosx -mmacosx-version-min=10.7 -S -### %s -fobjc-arc -fobjc-weak 2>&1 | FileCheck %s --check-prefix ARC-WEAK
// RUN: %clang -target x86_64-apple-macosx -mmacosx-version-min=10.7 -S -### %s -fno-objc-weak -fobjc-weak -fobjc-arc  2>&1 | FileCheck %s --check-prefix ARC-WEAK
// ARC-WEAK: -fobjc-arc
// ARC-WEAK: -fobjc-weak

// RUN: %clang -target x86_64-apple-macosx -mmacosx-version-min=10.7 -S -### %s -fobjc-arc -fno-objc-weak 2>&1 | FileCheck %s --check-prefix ARC-NO-WEAK
// RUN: %clang -target x86_64-apple-macosx -mmacosx-version-min=10.7 -S -### %s -fobjc-weak -fno-objc-weak -fobjc-arc  2>&1 | FileCheck %s --check-prefix ARC-NO-WEAK
// ARC-NO-WEAK: -fobjc-arc
// ARC-NO-WEAK: -fno-objc-weak

// RUN: %clang -target x86_64-apple-macosx -mmacosx-version-min=10.5 -S -### %s -fobjc-arc -fobjc-weak 2>&1 | FileCheck %s --check-prefix ARC-WEAK-UNSUPPORTED
// RUN: %clang -target x86_64-apple-macosx -mmacosx-version-min=10.5 -S -### %s -fno-objc-weak -fobjc-weak -fobjc-arc  2>&1 | FileCheck %s --check-prefix ARC-WEAK-UNSUPPORTED
// ARC-WEAK-UNSUPPORTED: error: -fobjc-weak is not supported on the current deployment target

// RUN: %clang -target x86_64-apple-macosx -mmacosx-version-min=10.7 -S -### %s -fobjc-weak 2>&1 | FileCheck %s --check-prefix MRC-WEAK
// RUN: %clang -target x86_64-apple-macosx -mmacosx-version-min=10.7 -S -### %s -fno-objc-weak -fobjc-weak 2>&1 | FileCheck %s --check-prefix MRC-WEAK
// MRC-WEAK: -fobjc-weak

// RUN: %clang -target x86_64-apple-macosx -mmacosx-version-min=10.7 -S -### %s -fno-objc-weak 2>&1 | FileCheck %s --check-prefix MRC-NO-WEAK
// RUN: %clang -target x86_64-apple-macosx -mmacosx-version-min=10.7 -S -### %s -fobjc-weak -fno-objc-weak 2>&1 | FileCheck %s --check-prefix MRC-NO-WEAK
// MRC-NO-WEAK: -fno-objc-weak

// RUN: %clang -target x86_64-apple-macosx -mmacosx-version-min=10.5 -S -### %s -fobjc-weak 2>&1 | FileCheck %s --check-prefix MRC-WEAK-UNSUPPORTED
// RUN: %clang -target x86_64-apple-macosx -mmacosx-version-min=10.5 -S -### %s -fno-objc-weak -fobjc-weak 2>&1 | FileCheck %s --check-prefix MRC-WEAK-UNSUPPORTED
// MRC-WEAK-UNSUPPORTED: error: -fobjc-weak is not supported on the current deployment target