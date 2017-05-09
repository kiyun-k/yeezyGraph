; ModuleID = 'queue_test.c'
source_filename = "queue_test.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.12.0"

%struct.QueueId = type { %struct.Node*, %struct.Node*, i32 }
%struct.Node = type { i8*, %struct.Node* }

; Function Attrs: nounwind ssp uwtable
define i32 @main() #0 {
  %1 = alloca %struct.QueueId*, align 8
  %2 = alloca %struct.QueueId*, align 8
  %3 = alloca %struct.QueueId*, align 8
  %4 = call %struct.QueueId* (...) @initQueueId()
  store %struct.QueueId* %4, %struct.QueueId** %1, align 8
  %5 = call %struct.QueueId* (...) @initQueueId()
  store %struct.QueueId* %5, %struct.QueueId** %2, align 8
  %6 = load %struct.QueueId*, %struct.QueueId** %1, align 8
  %7 = load %struct.QueueId*, %struct.QueueId** %2, align 8
  %8 = bitcast %struct.QueueId* %7 to i8*
  call void @enqueue(%struct.QueueId* %6, i8* %8)
  %9 = load %struct.QueueId*, %struct.QueueId** %1, align 8
  %10 = call i8* @front(%struct.QueueId* %9)
  %11 = bitcast i8* %10 to %struct.QueueId*
  store %struct.QueueId* %11, %struct.QueueId** %3, align 8
  ret i32 0
}

declare %struct.QueueId* @initQueueId(...) #1

declare void @enqueue(%struct.QueueId*, i8*) #1

declare i8* @front(%struct.QueueId*) #1

attributes #0 = { nounwind ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{!"Apple LLVM version 8.1.0 (clang-802.0.38)"}
