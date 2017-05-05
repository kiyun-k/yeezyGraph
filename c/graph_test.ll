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
@.str.1 = private unnamed_addr constant [12 x i8] c"hello world\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"def\00", align 1
@.str.3 = private unnamed_addr constant [11 x i8] c"hello word\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"node name: %s\0A\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"fgh\00", align 1

; Function Attrs: nounwind ssp uwtable
define i32 @main() #0 {
  %1 = alloca %struct.graph*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca %struct.node*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca %struct.node*, align 8
  %7 = alloca %struct.node*, align 8
  %8 = alloca %struct.node*, align 8
  %9 = call %struct.graph* (...) @g_init()
  store %struct.graph* %9, %struct.graph** %1, align 8
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i8** %2, align 8
  %10 = load i8*, i8** %2, align 8
  %11 = call %struct.node* @n_init(i8* %10)
  store %struct.node* %11, %struct.node** %3, align 8
  %12 = load %struct.graph*, %struct.graph** %1, align 8
  %13 = load %struct.node*, %struct.node** %3, align 8
  call void @addNode(%struct.graph* %12, %struct.node* %13)
  store i32 4, i32* %4, align 4
  store i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i8** %5, align 8
  %14 = load %struct.node*, %struct.node** %3, align 8
  %15 = bitcast i32* %4 to i8*
  call void @set_data(%struct.node* %14, i8* %15)
  %16 = call %struct.node* @n_init(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i32 0))
  store %struct.node* %16, %struct.node** %6, align 8
  %17 = load %struct.node*, %struct.node** %3, align 8
  call void @set_data(%struct.node* %17, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i32 0, i32 0))
  %18 = load %struct.graph*, %struct.graph** %1, align 8
  %19 = call %struct.node* @getNode(%struct.graph* %18, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0))
  store %struct.node* %19, %struct.node** %7, align 8
  %20 = load %struct.node*, %struct.node** %7, align 8
  %21 = getelementptr inbounds %struct.node, %struct.node* %20, i32 0, i32 0
  %22 = load i8*, i8** %21, align 8
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i32 0, i32 0), i8* %22)
  %24 = load %struct.graph*, %struct.graph** %1, align 8
  %25 = load %struct.node*, %struct.node** %3, align 8
  call void @addNode(%struct.graph* %24, %struct.node* %25)
  %26 = load %struct.graph*, %struct.graph** %1, align 8
  %27 = load %struct.node*, %struct.node** %6, align 8
  call void @addNode(%struct.graph* %26, %struct.node* %27)
  %28 = load %struct.graph*, %struct.graph** %1, align 8
  %29 = call %struct.node* @getNode(%struct.graph* %28, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i32 0, i32 0))
  store %struct.node* %29, %struct.node** %8, align 8
  %30 = load %struct.graph*, %struct.graph** %1, align 8
  call void @printGraph(%struct.graph* %30)
  ret i32 0
}

declare %struct.graph* @g_init(...) #1

declare %struct.node* @n_init(i8*) #1

declare void @addNode(%struct.graph*, %struct.node*) #1

declare void @set_data(%struct.node*, i8*) #1

declare %struct.node* @getNode(%struct.graph*, i8*) #1

declare i32 @printf(i8*, ...) #1

declare void @printGraph(%struct.graph*) #1

attributes #0 = { nounwind ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{!"Apple LLVM version 8.1.0 (clang-802.0.38)"}
