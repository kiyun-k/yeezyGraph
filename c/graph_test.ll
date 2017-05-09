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
@.str.3 = private unnamed_addr constant [15 x i8] c"edge weight: \0A\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind ssp uwtable
define i32 @main() #0 {
  %1 = alloca %struct.graph*, align 8
  %2 = alloca %struct.node*, align 8
  %3 = alloca %struct.node*, align 8
  %4 = alloca %struct.node*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca %struct.List*, align 8
  %10 = alloca %struct.List*, align 8
  %11 = call %struct.graph* (...) @g_init()
  store %struct.graph* %11, %struct.graph** %1, align 8
  %12 = call %struct.node* @n_init(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0))
  store %struct.node* %12, %struct.node** %2, align 8
  %13 = call %struct.node* @n_init(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0))
  store %struct.node* %13, %struct.node** %3, align 8
  %14 = call %struct.node* @n_init(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i32 0))
  store %struct.node* %14, %struct.node** %4, align 8
  %15 = load %struct.graph*, %struct.graph** %1, align 8
  %16 = load %struct.node*, %struct.node** %2, align 8
  call void @addNode(%struct.graph* %15, %struct.node* %16)
  %17 = load %struct.graph*, %struct.graph** %1, align 8
  %18 = load %struct.node*, %struct.node** %3, align 8
  call void @addNode(%struct.graph* %17, %struct.node* %18)
  %19 = load %struct.graph*, %struct.graph** %1, align 8
  %20 = load %struct.node*, %struct.node** %4, align 8
  call void @addNode(%struct.graph* %19, %struct.node* %20)
  %21 = load %struct.graph*, %struct.graph** %1, align 8
  %22 = load %struct.node*, %struct.node** %2, align 8
  %23 = load %struct.node*, %struct.node** %2, align 8
  call void @addEdge(%struct.graph* %21, %struct.node* %22, %struct.node* %23, i32 2)
  %24 = load %struct.graph*, %struct.graph** %1, align 8
  %25 = load %struct.node*, %struct.node** %3, align 8
  %26 = load %struct.node*, %struct.node** %3, align 8
  call void @addEdge(%struct.graph* %24, %struct.node* %25, %struct.node* %26, i32 2)
  %27 = load %struct.graph*, %struct.graph** %1, align 8
  %28 = load %struct.node*, %struct.node** %2, align 8
  %29 = load %struct.node*, %struct.node** %4, align 8
  call void @addEdge(%struct.graph* %27, %struct.node* %28, %struct.node* %29, i32 4)
  %30 = load %struct.graph*, %struct.graph** %1, align 8
  %31 = load %struct.node*, %struct.node** %3, align 8
  %32 = load %struct.node*, %struct.node** %4, align 8
  call void @addEdge(%struct.graph* %30, %struct.node* %31, %struct.node* %32, i32 4)
  %33 = load %struct.graph*, %struct.graph** %1, align 8
  %34 = load %struct.node*, %struct.node** %2, align 8
  %35 = load %struct.node*, %struct.node** %3, align 8
  call void @addEdge(%struct.graph* %33, %struct.node* %34, %struct.node* %35, i32 6)
  store i32 3, i32* %5, align 4
  %36 = load %struct.node*, %struct.node** %2, align 8
  %37 = bitcast i32* %5 to i8*
  call void @set_data(%struct.node* %36, i8* %37)
  %38 = load %struct.node*, %struct.node** %2, align 8
  %39 = call i8* @get_data(%struct.node* %38)
  %40 = bitcast i8* %39 to i32*
  store i32* %40, i32** %6, align 8
  %41 = load i32*, i32** %6, align 8
  %42 = load i32, i32* %41, align 4
  store i32 %42, i32* %7, align 4
  %43 = load %struct.graph*, %struct.graph** %1, align 8
  %44 = load %struct.node*, %struct.node** %2, align 8
  %45 = load %struct.node*, %struct.node** %3, align 8
  %46 = call i32 @getWeight(%struct.graph* %43, %struct.node* %44, %struct.node* %45)
  store i32 %46, i32* %8, align 4
  %47 = load %struct.node*, %struct.node** %3, align 8
  %48 = call %struct.List* @get_inNodes(%struct.node* %47)
  store %struct.List* %48, %struct.List** %9, align 8
  %49 = load %struct.node*, %struct.node** %2, align 8
  %50 = call %struct.List* @get_outNodes(%struct.node* %49)
  store %struct.List* %50, %struct.List** %10, align 8
  %51 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i32 0, i32 0))
  %52 = load i32, i32* %8, align 4
  %53 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0), i32 %52)
  %54 = load %struct.List*, %struct.List** %9, align 8
  call void @print_list(%struct.List* %54)
  %55 = load %struct.List*, %struct.List** %10, align 8
  call void @print_list(%struct.List* %55)
  %56 = load %struct.graph*, %struct.graph** %1, align 8
  call void @printGraph(%struct.graph* %56)
  ret i32 0
}

declare %struct.graph* @g_init(...) #1

declare %struct.node* @n_init(i8*) #1

declare void @addNode(%struct.graph*, %struct.node*) #1

declare void @addEdge(%struct.graph*, %struct.node*, %struct.node*, i32) #1

declare void @set_data(%struct.node*, i8*) #1

declare i8* @get_data(%struct.node*) #1

declare i32 @getWeight(%struct.graph*, %struct.node*, %struct.node*) #1

declare %struct.List* @get_inNodes(%struct.node*) #1

declare %struct.List* @get_outNodes(%struct.node*) #1

declare i32 @printf(i8*, ...) #1

declare void @print_list(%struct.List*) #1

declare void @printGraph(%struct.graph*) #1

attributes #0 = { nounwind ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{!"Apple LLVM version 8.1.0 (clang-802.0.38)"}
