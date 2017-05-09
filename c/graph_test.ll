; ModuleID = 'graph_test.c'
source_filename = "graph_test.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.12.0"

%struct.graph = type { %struct.List*, i32 }
%struct.List = type { %struct.ListNode* }
%struct.ListNode = type { i8*, %struct.ListNode* }
%struct.node = type { i8*, i8, %struct.map*, %struct.map*, i8* }
%struct.map = type { i32, i32, i8**, i32* }

@.str = private unnamed_addr constant [4 x i8] c"abc\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"def\00", align 1

; Function Attrs: nounwind ssp uwtable
define i32 @main() #0 {
  %1 = alloca %struct.graph*, align 8
  %2 = alloca %struct.node*, align 8
  %3 = alloca %struct.node*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32*, align 8
  %6 = alloca i32, align 4
  %7 = call %struct.graph* (...) @g_init()
  store %struct.graph* %7, %struct.graph** %1, align 8
  %8 = call %struct.node* @n_init(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0))
  store %struct.node* %8, %struct.node** %2, align 8
  %9 = call %struct.node* @n_init(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0))
  store %struct.node* %9, %struct.node** %3, align 8
  %10 = load %struct.graph*, %struct.graph** %1, align 8
  %11 = load %struct.node*, %struct.node** %2, align 8
  call void @addNode(%struct.graph* %10, %struct.node* %11)
  %12 = load %struct.graph*, %struct.graph** %1, align 8
  %13 = load %struct.node*, %struct.node** %3, align 8
  call void @addNode(%struct.graph* %12, %struct.node* %13)
  %14 = load %struct.graph*, %struct.graph** %1, align 8
  %15 = load %struct.node*, %struct.node** %2, align 8
  %16 = load %struct.node*, %struct.node** %3, align 8
  call void @addEdge(%struct.graph* %14, %struct.node* %15, %struct.node* %16, i32 2)
  store i32 3, i32* %4, align 4
  %17 = load %struct.node*, %struct.node** %2, align 8
  %18 = bitcast i32* %4 to i8*
  call void @set_data(%struct.node* %17, i8* %18)
  %19 = load %struct.node*, %struct.node** %2, align 8
  %20 = call i8* @get_data(%struct.node* %19)
  %21 = bitcast i8* %20 to i32*
  store i32* %21, i32** %5, align 8
  %22 = load i32*, i32** %5, align 8
  %23 = load i32, i32* %22, align 4
  store i32 %23, i32* %6, align 4
  ret i32 0
}

declare %struct.graph* @g_init(...) #1

declare %struct.node* @n_init(i8*) #1

declare void @addNode(%struct.graph*, %struct.node*) #1

declare void @addEdge(%struct.graph*, %struct.node*, %struct.node*, i32) #1

declare void @set_data(%struct.node*, i8*) #1

declare i8* @get_data(%struct.node*) #1

attributes #0 = { nounwind ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{!"Apple LLVM version 8.1.0 (clang-802.0.38)"}
