; ModuleID = 'graph_test.c'
source_filename = "graph_test.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.12.0"

%struct.graph = type { %struct.List*, i32 }
%struct.List = type { %struct.ListNode*, i32 }
%struct.ListNode = type { i8*, %struct.ListNode* }
%struct.node = type { i8*, i8, %struct.map*, %struct.map*, i8* }
%struct.map = type { i32, i32, i8**, i32* }

@.str = private unnamed_addr constant [4 x i8] c"abc\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"def\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"fgh\00", align 1
@.str.3 = private unnamed_addr constant [8 x i8] c"error?\0A\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"%s\00", align 1

; Function Attrs: nounwind ssp uwtable
define i32 @main() #0 {
  %1 = alloca %struct.graph*, align 8
  %2 = alloca %struct.node*, align 8
  %3 = alloca %struct.node*, align 8
  %4 = alloca %struct.node*, align 8
  %5 = alloca %struct.List*, align 8
  %6 = alloca i8*, align 8
  %7 = call %struct.graph* (...) @g_init()
  store %struct.graph* %7, %struct.graph** %1, align 8
  %8 = call %struct.node* @n_init(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0))
  store %struct.node* %8, %struct.node** %2, align 8
  %9 = call %struct.node* @n_init(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0))
  store %struct.node* %9, %struct.node** %3, align 8
  %10 = call %struct.node* @n_init(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i32 0))
  store %struct.node* %10, %struct.node** %4, align 8
  %11 = load %struct.graph*, %struct.graph** %1, align 8
  %12 = load %struct.node*, %struct.node** %2, align 8
  call void @addNode(%struct.graph* %11, %struct.node* %12)
  %13 = load %struct.graph*, %struct.graph** %1, align 8
  %14 = load %struct.node*, %struct.node** %3, align 8
  call void @addNode(%struct.graph* %13, %struct.node* %14)
  %15 = load %struct.graph*, %struct.graph** %1, align 8
  %16 = load %struct.node*, %struct.node** %2, align 8
  %17 = load %struct.node*, %struct.node** %3, align 8
  call void @addEdge(%struct.graph* %15, %struct.node* %16, %struct.node* %17, i32 2)
  %18 = load %struct.node*, %struct.node** %3, align 8
  %19 = call %struct.List* @get_inNodes(%struct.node* %18)
  store %struct.List* %19, %struct.List** %5, align 8
  %20 = load %struct.List*, %struct.List** %5, align 8
  %21 = call i8* @l_get(%struct.List* %20, i32 1)
  store i8* %21, i8** %6, align 8
  %22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i32 0, i32 0))
  %23 = load i8*, i8** %6, align 8
  %24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0), i8* %23)
  ret i32 0
}

declare %struct.graph* @g_init(...) #1

declare %struct.node* @n_init(i8*) #1

declare void @addNode(%struct.graph*, %struct.node*) #1

declare void @addEdge(%struct.graph*, %struct.node*, %struct.node*, i32) #1

declare %struct.List* @get_inNodes(%struct.node*) #1

declare i8* @l_get(%struct.List*, i32) #1

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{!"Apple LLVM version 8.1.0 (clang-802.0.38)"}
